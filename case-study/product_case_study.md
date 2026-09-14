# Blinkit E-commerce Conversion Optimization

## Product Analytics & Conversion Optimization Case Study

> **Project type:** Self-directed Product Management / Product Analytics project  
> **Data:** Synthetic e-commerce event dataset created for portfolio analysis  
> **Focus:** Funnel optimization, product discovery, checkout conversion, prioritization, and experimentation

---

## 1. Executive Summary

This project investigates conversion friction across an e-commerce customer journey and translates the findings into actionable product opportunities.

The analysis focused on the following journey:

**App Open → Search → Product View → Add to Cart → Checkout → Payment → Purchase**

The synthetic dataset contains event-level activity from 5,000 unique users and 7,043 sessions.

The analysis identified two primary opportunity areas:

1. **Product discovery and selection**
2. **Checkout and purchase completion**

Based on the funnel analysis, I designed two product concepts:

- **SmartFind** — improve product discovery and selection
- **QuickBuy** — reduce checkout friction and simplify purchase completion

I then prioritized these opportunities using the **RICE framework** and designed an A/B testing roadmap to validate their impact.

### Product recommendation

**Prioritize QuickBuy first**, followed by SmartFind.

QuickBuy targets users who have already demonstrated stronger purchase intent by adding products to their cart, creating a more direct path toward completed purchases.

---

# 2. Business Problem

E-commerce growth is not only about acquiring more users. Improving the percentage of existing users who successfully complete a purchase can create significant incremental value.

The key product question for this analysis was:

> **Where are users dropping out of the shopping journey, and which product improvements should be prioritized to reduce that friction?**

The objective was therefore to:

- identify major funnel drop-offs
- understand potential friction points
- translate insights into product opportunities
- prioritize opportunities using RICE
- define experiments and success metrics

---

# 3. Data & Methodology

The analysis uses a **synthetic e-commerce event dataset** for portfolio purposes.

It should not be interpreted as actual internal Blinkit data or proprietary Blinkit performance.

### Analysis tools

- SQL
- DuckDB
- Python
- Pandas
- Excel
- Tableau / dashboard visualization
- GitHub

### Key events analyzed

| Event | Description |
|---|---|
| `app_open` | User opens the application |
| `search` | User performs a search |
| `product_view` | User views a product |
| `add_to_cart` | User adds a product to cart |
| `checkout_start` | User starts checkout |
| `payment_attempt` | User attempts payment |
| `purchase` | User completes a purchase |

The analysis primarily uses distinct users at each funnel stage.

---

# 4. Funnel Analysis

The overall funnel was:

| Funnel Stage | Users | Conversion from App Open |
|---|---:|---:|
| App Open | 5,000 | 100.00% |
| Search | 4,024 | 80.48% |
| Product View | 3,287 | 65.74% |
| Add to Cart | 2,072 | 41.44% |
| Checkout Start | 1,589 | 31.78% |
| Payment Attempt | 1,436 | 28.72% |
| Purchase | 1,234 | 24.68% |

Overall conversion from app open to purchase is:

**24.68%**

### Stage-to-stage conversion

| Funnel Transition | Conversion | Drop |
|---|---:|---:|
| Search → Product View | 81.68% | 18.32% |
| Product View → Add to Cart | 63.04% | 36.96% |
| Add to Cart → Checkout | 76.69% | 23.31% |
| Checkout → Purchase | 77.66% | 22.34% |

### Key observation

The largest observed stage-to-stage drop is:

> **Product View → Add to Cart: 36.96%**

This suggests that product selection may represent an important area of potential friction.

However, the event data alone cannot prove the exact cause of this drop.

---

# 5. Key Product Insights

## Insight 1 — Product selection represents a meaningful opportunity

The funnel shows:

- 4,024 users searched
- 3,287 reached a product view
- 2,072 added a product to cart

Search-to-product-view conversion is relatively stronger at **81.68%**, while product-view-to-cart conversion falls to **63.04%**.

### Product hypothesis

Users may be able to find products but still experience friction when deciding which product to purchase.

Potential causes could include:

- difficulty comparing products
- insufficient relevance of search results
- too much browsing
- difficulty finding preferred variants
- lack of convenient shortcuts for repeat purchases

These are **hypotheses requiring validation**, rather than conclusions directly proven by the dataset.

---

# 6. Opportunity 1 — SmartFind

## Problem

Users can reach product results but may experience friction when selecting the right product.

## Proposed solution

**SmartFind** is a product discovery improvement focused on reducing the effort required to identify relevant products.

Potential capabilities include:

- intent-aware search ranking
- quick filters and shortcuts
- relevant product alternatives
- repeat-item suggestions
- improved relevance of search results

## Target journey

**Search → Product View → Add to Cart**

## Success metrics

### Primary KPI

**Product View → Add to Cart conversion**

### Secondary metrics

- Search → Product View conversion
- Search reformulation rate
- Time to relevant product
- Add-to-cart rate

### Guardrail

**Search response time**

The objective is not simply to increase clicks, but to help users reach relevant products without degrading the search experience.

---

# 7. Opportunity 2 — QuickBuy

## Problem

Users who have already added products to their cart have demonstrated stronger purchase intent.

The dataset shows:

- 2,072 cart users
- 1,589 checkout users
- 1,234 purchasers

Cart-to-checkout conversion is **76.69%**, while checkout-to-purchase conversion is **77.66%**.

This indicates an opportunity to investigate friction between cart and completed purchase.

## Proposed solution

**QuickBuy** is a streamlined checkout experience designed to reduce unnecessary effort between cart and purchase.

Potential improvements include:

- simplified checkout flow
- clear final order summary
- prominent purchase CTA
- saved preferences where appropriate
- improved visibility of final pricing

## Target journey

**Cart → Checkout → Payment → Purchase**

## Success metrics

### Primary KPI

**Cart → Purchase conversion**

### Secondary metrics

- Checkout → Purchase conversion
- Checkout completion time
- Cart abandonment
- Average Order Value (AOV)

### Guardrails

- Payment failure rate
- Cancellation/refund rate
- Final-price discrepancies

The goal is to improve conversion without creating negative downstream effects.

---

# 8. User Segmentation Insights

## New vs Returning Users

| User Type | Users | Purchasers | Conversion |
|---|---:|---:|---:|
| Returning User | 1,661 | 412 | 24.80% |
| New User | 5,000 | 886 | 17.72% |

Returning users show approximately a **7.1 percentage-point higher conversion rate** in this synthetic dataset.

### Product implication

This suggests that familiarity or prior experience may be associated with stronger conversion.

Potential areas for future investigation include:

- repeat purchasing
- personalized recommendations
- saved preferences
- onboarding friction for new users

This is a segmentation signal, not evidence of causality.

---

# 9. Device Insights

| Device | Users | Purchasers | Conversion |
|---|---:|---:|---:|
| Android | 3,330 | 741 | 22.25% |
| iOS | 2,076 | 422 | 20.33% |
| Web | 701 | 118 | 16.83% |

Web shows the lowest conversion rate in the synthetic dataset.

### Product implication

The result suggests a potential area for device-specific investigation.

Before prioritizing a web-specific solution, additional analysis would be required to determine whether the difference is driven by:

- funnel composition
- traffic source
- user intent
- device experience
- technical performance
- other confounding factors

---

# 10. Opportunity Prioritization

I used the **RICE framework**:

> **RICE = Reach × Impact × Confidence ÷ Effort**

The scores below are **portfolio assumptions**, not Blinkit internal estimates.

| Rank | Initiative | Area | Reach | Impact | Confidence | Effort | RICE |
|---|---|---|---:|---:|---:|---:|---:|
| 1 | QuickBuy | Checkout | 9 | 8 | 55% | 3 | 13.20 |
| 2 | SmartFind | Discovery | 8 | 7 | 60% | 3 | 11.20 |
| 3 | Cart Price Transparency | Cart | 7 | 6 | 45% | 2 | 9.45 |
| 4 | Search Shortcuts | Discovery | 6 | 5 | 50% | 2 | 7.50 |

## Why QuickBuy comes first

Although SmartFind addresses a larger discovery journey, QuickBuy was prioritized first because:

> **It targets users with stronger purchase intent and has a more direct path to completed orders.**

SmartFind is therefore the second priority.

---

# 11. Experimentation Roadmap

The product concepts should be validated through controlled experiments before being broadly launched.

---

## Experiment 1 — SmartFind

### Hypothesis

If search relevance and product-selection effort are improved, then more users will progress from product view to add to cart.

### Control

Existing search and ranking experience.

### Variant

SmartFind experience.

### Allocation

50% control / 50% variant among eligible randomized users.

### Primary KPI

**Product View → Add to Cart**

### Secondary metrics

- Search → Product View
- Search reformulation
- Time to relevant product

### Guardrail

Search response time.

### Decision rule

Ship if the primary KPI shows a meaningful improvement without material deterioration in the guardrail metric.

---

# 12. Experiment 2 — QuickBuy

### Hypothesis

If checkout effort is reduced and final order information is made clearer, then more cart users will complete purchases.

### Control

Existing checkout experience.

### Variant

Streamlined QuickBuy experience.

### Allocation

50% control / 50% variant among eligible randomized users.

### Primary KPI

**Cart → Purchase**

### Secondary metrics

- Checkout → Purchase
- Checkout completion time
- Cart abandonment
- AOV

### Guardrails

- Payment failure
- Cancellation/refund
- Final-price discrepancies

### Decision rule

Ship if the primary KPI improves while guardrail metrics remain within acceptable limits.

---

# 13. Measurement Principles

The experiments should follow several measurement principles:

1. Randomize eligible users between control and treatment.
2. Define the primary KPI before running the experiment.
3. Avoid changing the primary KPI after seeing results.
4. Track secondary metrics to understand behavioral changes.
5. Use guardrails to detect unintended negative effects.
6. Evaluate both statistical significance and practical business impact.
7. Run the experiment for sufficient sample size and duration.

---

# 14. Product Decision

Based on the current synthetic funnel analysis and RICE prioritization:

### Priority 1 — QuickBuy

Focus on reducing friction between cart and completed purchase.

**Why:** Stronger purchase intent and a direct connection to completed orders.

### Priority 2 — SmartFind

Improve product discovery and selection.

**Why:** The Product View → Add to Cart transition represents the largest observed stage-to-stage drop.

### Future opportunities

Additional opportunities include:

- Cart price transparency
- Search shortcuts
- Personalized repeat purchasing
- New-user experience improvements
- Device-specific funnel investigation

These should be investigated further before committing engineering resources.

---

# 15. Limitations

This project has several important limitations.

### Synthetic data

The dataset is synthetic and does not represent actual proprietary Blinkit customer data.

### Observational analysis

The funnel analysis identifies where users drop off but does not establish why they drop off.

### No causal inference

Differences across user types, devices, or categories should not be interpreted as causal relationships.

### No qualitative research

User interviews, usability testing, customer support data, and session recordings were not available.

### RICE assumptions

Reach, Impact, Confidence, and Effort scores are portfolio assumptions used to demonstrate prioritization methodology.

### Experiment results

The A/B testing roadmap describes proposed experiments. It does not claim that SmartFind or QuickBuy has already generated an observed uplift.

---

# 16. Expected Business Impact

The objective of the proposed product changes is to improve the conversion funnel rather than optimize a single metric in isolation.

Potential business outcomes include:

- Higher product selection efficiency
- Higher add-to-cart conversion
- Lower cart abandonment
- Higher checkout completion
- Higher purchase conversion
- Potential improvement in AOV
- Better overall shopping experience

The actual impact should be determined through controlled experimentation rather than assumed in advance.

---

# 17. Final Product Narrative

The overall product thinking can be summarized as:

> **I started by analyzing the e-commerce funnel to identify where users were dropping off. The largest observed stage-to-stage drop occurred between product view and add to cart, while checkout represented another meaningful opportunity. I translated these friction points into two product concepts — SmartFind for discovery and QuickBuy for checkout. I then used RICE to prioritize the opportunities and recommended QuickBuy as the first experiment because it targets users with stronger purchase intent and has a more direct path to completed orders. Finally, I defined A/B tests with primary KPIs, secondary metrics, guardrails, and decision criteria to validate the product hypotheses.**

---

## Project Artifacts

| Artifact | Purpose |
|---|---|
| `sql/analysis_queries.sql` | Funnel and product analytics queries |
| `product/smartfind.md` | SmartFind product proposal |
| `product/quickbuy.md` | QuickBuy product proposal |
| `prioritization/RICE_prioritization.xlsx` | RICE scoring and rationale |
| `experimentation/ab_testing_roadmap.md` | Experiment design |
| `dashboard/index.html` | Executive product analytics dashboard |
| `case-study/product_case_study.md` | End-to-end product case study |

---

## Conclusion

This project demonstrates an end-to-end product analytics workflow:

**Data → Funnel Analysis → Customer Friction → Product Opportunities → Prioritization → Experimentation → Product Decision**

The key takeaway is not simply that conversion is 24.68%.

The more important product insight is:

> **Use behavioral data to identify friction, convert that friction into testable product hypotheses, prioritize based on expected value and effort, and validate the solution experimentally before scaling it.**
