-- ============================================================
-- BLINKIT E-COMMERCE CONVERSION OPTIMIZATION
-- Funnel, customer, product and experiment analysis
-- Dataset: Synthetic Blinkit-style quick-commerce events
-- ============================================================


-- ============================================================
-- 1. TABLE SCHEMA
-- ============================================================

CREATE TABLE blinkit_events (
    event_id BIGINT PRIMARY KEY,
    user_id BIGINT,
    session_id VARCHAR(50),
    timestamp TIMESTAMP,
    event_type VARCHAR(30),
    product_id BIGINT,
    category VARCHAR(100),
    price NUMERIC(10,2),
    quantity INT,
    device VARCHAR(20),
    is_new_user BOOLEAN,
    city VARCHAR(50)
);


-- ============================================================
-- 2. OVERALL FUNNEL
-- ============================================================

SELECT
    event_type,
    COUNT(DISTINCT user_id) AS unique_users,
    COUNT(DISTINCT session_id) AS sessions
FROM blinkit_events
GROUP BY event_type
ORDER BY
    CASE event_type
        WHEN 'app_open' THEN 1
        WHEN 'search' THEN 2
        WHEN 'product_view' THEN 3
        WHEN 'add_to_cart' THEN 4
        WHEN 'checkout_start' THEN 5
        WHEN 'payment_attempt' THEN 6
        WHEN 'purchase' THEN 7
    END;


-- ============================================================
-- 3. OVERALL CONVERSION RATE
-- ============================================================

SELECT
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        /
        NULLIF(
            COUNT(DISTINCT CASE
                WHEN event_type = 'app_open' THEN user_id
            END), 0
        ),
        2
    ) AS overall_conversion_rate
FROM blinkit_events;


-- ============================================================
-- 4. SEARCH → PRODUCT VIEW
-- Discovery funnel
-- ============================================================

WITH search_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'search'
),
product_view_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'product_view'
)

SELECT
    COUNT(*) AS search_users,
    COUNT(p.user_id) AS product_view_users,
    ROUND(
        100.0 * COUNT(p.user_id)
        / NULLIF(COUNT(*), 0),
        2
    ) AS search_to_product_view_rate
FROM search_users s
LEFT JOIN product_view_users p
    ON s.user_id = p.user_id;


-- ============================================================
-- 5. PRODUCT VIEW → ADD TO CART
-- ============================================================

WITH view_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'product_view'
),
cart_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'add_to_cart'
)

SELECT
    COUNT(*) AS product_view_users,
    COUNT(c.user_id) AS cart_users,
    ROUND(
        100.0 * COUNT(c.user_id)
        / NULLIF(COUNT(*), 0),
        2
    ) AS view_to_cart_rate
FROM view_users v
LEFT JOIN cart_users c
    ON v.user_id = c.user_id;


-- ============================================================
-- 6. CART → CHECKOUT
-- ============================================================

WITH cart_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'add_to_cart'
),
checkout_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'checkout_start'
)

SELECT
    COUNT(*) AS cart_users,
    COUNT(c.user_id) AS checkout_users,
    ROUND(
        100.0 * COUNT(c.user_id)
        / NULLIF(COUNT(*), 0),
        2
    ) AS cart_to_checkout_rate
FROM cart_users c
LEFT JOIN checkout_users ch
    ON c.user_id = ch.user_id;


-- ============================================================
-- 7. CHECKOUT → PURCHASE
-- Checkout friction
-- ============================================================

WITH checkout_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'checkout_start'
),
purchase_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'purchase'
)

SELECT
    COUNT(*) AS checkout_users,
    COUNT(p.user_id) AS purchasers,
    ROUND(
        100.0 * COUNT(p.user_id)
        / NULLIF(COUNT(*), 0),
        2
    ) AS checkout_to_purchase_rate
FROM checkout_users c
LEFT JOIN purchase_users p
    ON c.user_id = p.user_id;


-- ============================================================
-- 8. CART ABANDONMENT
-- ============================================================

WITH cart_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'add_to_cart'
),
purchase_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'purchase'
)

SELECT
    COUNT(*) AS cart_users,
    COUNT(p.user_id) AS purchasers,
    COUNT(*) - COUNT(p.user_id) AS abandoned_cart_users,
    ROUND(
        100.0 *
        (COUNT(*) - COUNT(p.user_id))
        / NULLIF(COUNT(*), 0),
        2
    ) AS cart_abandonment_rate
FROM cart_users c
LEFT JOIN purchase_users p
    ON c.user_id = p.user_id;


-- ============================================================
-- 9. CHECKOUT ABANDONMENT
-- ============================================================

WITH checkout_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'checkout_start'
),
purchase_users AS (
    SELECT DISTINCT user_id
    FROM blinkit_events
    WHERE event_type = 'purchase'
)

SELECT
    COUNT(*) AS checkout_users,
    COUNT(p.user_id) AS purchasers,
    COUNT(*) - COUNT(p.user_id) AS abandoned_checkout_users,
    ROUND(
        100.0 *
        (COUNT(*) - COUNT(p.user_id))
        / NULLIF(COUNT(*), 0),
        2
    ) AS checkout_abandonment_rate
FROM checkout_users c
LEFT JOIN purchase_users p
    ON c.user_id = p.user_id;


-- ============================================================
-- 10. NEW VS RETURNING USERS
-- ============================================================

SELECT
    CASE
        WHEN is_new_user = TRUE THEN 'New User'
        ELSE 'Returning User'
    END AS user_type,
    COUNT(DISTINCT user_id) AS users,
    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS purchasers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        /
        NULLIF(COUNT(DISTINCT user_id), 0),
        2
    ) AS conversion_rate
FROM blinkit_events
GROUP BY
    CASE
        WHEN is_new_user = TRUE THEN 'New User'
        ELSE 'Returning User'
    END;


-- ============================================================
-- 11. DEVICE-LEVEL CONVERSION
-- ============================================================

SELECT
    device,
    COUNT(DISTINCT user_id) AS users,
    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS purchasers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        /
        NULLIF(COUNT(DISTINCT user_id), 0),
        2
    ) AS conversion_rate
FROM blinkit_events
GROUP BY device
ORDER BY conversion_rate DESC;


-- ============================================================
-- 12. CATEGORY-LEVEL PERFORMANCE
-- ============================================================

SELECT
    category,
    COUNT(DISTINCT user_id) AS users,
    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS purchasers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        /
        NULLIF(COUNT(DISTINCT user_id), 0),
        2
    ) AS conversion_rate,
    ROUND(
        SUM(
            CASE
                WHEN event_type = 'purchase'
                THEN price * quantity
                ELSE 0
            END
        ),
        2
    ) AS revenue
FROM blinkit_events
GROUP BY category
ORDER BY revenue DESC;


-- ============================================================
-- 13. REVENUE
-- ============================================================

SELECT
    ROUND(
        SUM(price * quantity),
        2
    ) AS total_revenue
FROM blinkit_events
WHERE event_type = 'purchase';


-- ============================================================
-- 14. AVERAGE ORDER VALUE (AOV)
-- ============================================================

WITH order_values AS (
    SELECT
        session_id,
        SUM(price * quantity) AS order_value
    FROM blinkit_events
    WHERE event_type = 'purchase'
    GROUP BY session_id
)

SELECT
    ROUND(
        AVG(order_value),
        2
    ) AS average_order_value
FROM order_values;


-- ============================================================
-- 15. CITY-LEVEL CONVERSION
-- ============================================================

SELECT
    city,
    COUNT(DISTINCT user_id) AS users,
    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase' THEN user_id
    END) AS purchasers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase' THEN user_id
        END)
        /
        NULLIF(COUNT(DISTINCT user_id), 0),
        2
    ) AS conversion_rate
FROM blinkit_events
GROUP BY city
ORDER BY conversion_rate DESC;


-- ============================================================
-- 16. PURCHASE PERFORMANCE BY PRODUCT CATEGORY
-- ============================================================

SELECT
    category,
    COUNT(*) AS purchase_events,
    SUM(quantity) AS units_sold,
    ROUND(
        SUM(price * quantity),
        2
    ) AS revenue
FROM blinkit_events
WHERE event_type = 'purchase'
GROUP BY category
ORDER BY revenue DESC;


-- ============================================================
-- 17. EXPERIMENT KPI TEMPLATE
-- Used for SmartFind / QuickBuy A/B testing
-- ============================================================

SELECT
    device,
    COUNT(DISTINCT user_id) AS exposed_users,

    COUNT(DISTINCT CASE
        WHEN event_type = 'purchase'
        THEN user_id
    END) AS purchasers,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN event_type = 'purchase'
            THEN user_id
        END)
        /
        NULLIF(COUNT(DISTINCT user_id), 0),
        2
    ) AS conversion_rate

FROM blinkit_events
GROUP BY device
ORDER BY device;
