# A/B Testing Roadmap

## Objective

Validate whether SmartFind and QuickBuy improve conversion by reducing
discovery and checkout friction.

> Note: The analysis uses a synthetic portfolio dataset. The funnel
> observations and test assumptions are for case-study purposes and do not
> represent proprietary Blinkit data.

---

## Experiment 1: SmartFind

### Problem

The funnel shows a drop from Product View to Add to Cart, suggesting
potential product-selection or discovery friction.

### Hypothesis

If SmartFind improves search relevance and reduces product-selection effort,
then more users will add products to cart.

### Experiment Design

| Element | Control | Variant |
|---|---|---|
| Experience | Existing search/ranking | SmartFind |
| Users | Randomized eligible users | Randomized eligible users |
| Duration | Until sufficient sample size | Same |
| Allocation | 50% | 50% |

### KPIs

**Primary KPI**
- Product View → Add to Cart conversion

**Secondary KPIs**
- Search → Product View conversion
- Search reformulation rate
- Time to relevant product

**Guardrail**
- Search response time

### Decision Rule

Ship SmartFind if the variant improves the primary KPI without
materially worsening the guardrail metric.

---

## Experiment 2: QuickBuy

### Problem

The funnel shows drop-off between Cart, Checkout and Purchase,
suggesting potential checkout friction.

### Hypothesis

If QuickBuy reduces checkout effort and improves order-price clarity,
then more users who add products to cart will complete their purchase.

### Experiment Design

| Element | Control | Variant |
|---|---|---|
| Experience | Existing checkout flow | QuickBuy streamlined checkout |
| Users | Randomized eligible users | Randomized eligible users |
| Duration | Until sufficient sample size | Same |
| Allocation | 50% | 50% |

### KPIs

**Primary KPI**
- Cart → Purchase conversion

**Secondary KPIs**
- Checkout → Purchase conversion
- Checkout completion time
- Cart abandonment rate
- Average Order Value (AOV)

**Guardrails**
- Payment failure rate
- Cancellation/refund rate
- Final-price discrepancies

### Decision Rule

Ship QuickBuy if the variant improves the primary KPI while maintaining
acceptable payment, cancellation/refund and pricing guardrails.

---

## Prioritization

QuickBuy is tested first because it targets users with stronger purchase
intent and has a more direct path to completed orders.

SmartFind is tested second because it addresses discovery friction and may
improve downstream conversion.

---

## Measurement Principles

- Randomize eligible users between control and variant.
- Define the primary KPI before launching the experiment.
- Use secondary metrics to understand behavioral changes.
- Monitor guardrails to avoid improving conversion at the expense of
  customer experience or payment quality.
- Evaluate results using statistical significance and practical business
  impact before rollout.
