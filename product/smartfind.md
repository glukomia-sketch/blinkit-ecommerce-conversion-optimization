# SmartFind — Product Discovery Improvement

## Problem

The synthetic funnel analysis shows that:

- 4,024 users performed a search
- 3,287 users reached a product view
- 2,072 users added an item to cart
- Search → Product View conversion: 81.68%
- Product View → Add to Cart conversion: 63.04%

This indicates an opportunity to reduce friction after users reach the product-selection stage.

> Note: The dataset is synthetic and does not represent proprietary Blinkit data. These findings are portfolio-analysis hypotheses.

## User Problem

Users may know what they want but still need to browse and compare products before deciding what to add to their cart.

### User need

> "I want to find the right product quickly without browsing through too many options."

## Proposed Solution

**SmartFind** is an improved product-discovery experience designed to help users identify relevant products faster.

### Key features

1. **Intent-aware ranking**
   - Prioritize products that best match the user's search intent.

2. **Quick filters and shortcuts**
   - Surface useful attributes such as size, type, or category for common searches.

3. **Relevant alternatives**
   - Recommend suitable alternatives when the preferred product is unavailable.

4. **Repeat-item suggestions**
   - Surface previously purchased or frequently selected products for repeat needs.

## Example

Instead of:

Search: `milk`

→ Long list of products

SmartFind could show:

- Full Cream
- Toned
- Low Fat
- 1 L
- 500 ml

followed by the most relevant products.

## Success Metrics

| Metric | Role |
|---|---|
| Search → Product View | Primary discovery KPI |
| Product View → Add to Cart | Primary downstream KPI |
| Search reformulation rate | Secondary |
| Time to relevant product | Secondary |
| Add-to-cart rate | Secondary |

## Product Hypothesis

> If SmartFind improves search relevance and reduces product-selection effort, then more users will progress from product view to cart.

## Experiment

Test SmartFind against the existing discovery experience using an A/B test.

**Control:** Existing search and product-ranking experience.

**Variant:** SmartFind with intent-aware ranking, shortcuts and relevant alternatives.

### Primary metric

Search → Product View conversion.

### Secondary metrics

- Product View → Add to Cart
- Search reformulation rate
- Time to relevant product

### Guardrail

Search response time should not materially worsen.
