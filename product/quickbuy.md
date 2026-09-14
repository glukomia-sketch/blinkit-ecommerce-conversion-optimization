# QuickBuy — Checkout Conversion Improvement

## Problem

The synthetic funnel analysis shows:

- 2,072 users added an item to cart
- 1,589 users started checkout
- 1,234 users completed a purchase
- Cart → Checkout conversion: 76.69%
- Checkout → Purchase conversion: 77.66%

This indicates meaningful drop-off after users have already demonstrated purchase intent.

> Note: The dataset is synthetic and does not represent proprietary Blinkit data. These findings are portfolio-analysis hypotheses.

## User Problem

Users who have already selected their products may still encounter unnecessary friction before completing their order.

### User need

> "I've already decided what I want. I want to complete my order quickly and with confidence."

## Proposed Solution

**QuickBuy** is a streamlined checkout experience designed to reduce unnecessary steps between cart and completed purchase.

### Key features

1. **Streamlined checkout**
   - Reduce unnecessary interaction steps for returning or known-item purchases.

2. **Clear final order summary**
   - Make item total, delivery charges and final payable amount easy to understand.

3. **Prominent purchase CTA**
   - Make the next action obvious and easy to complete.

4. **Saved preferences**
   - Use previously selected delivery and payment preferences where appropriate.

## Target Journey

Cart → Checkout → Payment → Purchase

QuickBuy aims to reduce friction across this journey without compromising transparency or user control.

## Success Metrics

| Metric | Role |
|---|---|
| Cart → Purchase conversion | Primary KPI |
| Checkout → Purchase conversion | Primary downstream KPI |
| Cart abandonment rate | Secondary |
| Checkout completion time | Secondary |
| Average Order Value (AOV) | Secondary |

## Product Hypothesis

> If QuickBuy reduces unnecessary checkout effort and improves price and order clarity, then more users who add products to their cart will complete their purchase.

## Experiment

Test QuickBuy against the existing checkout experience using an A/B test.

**Control:** Existing checkout flow.

**Variant:** Streamlined QuickBuy checkout.

### Primary metric

Cart → Purchase conversion.

### Secondary metrics

- Checkout → Purchase conversion
- Checkout completion time
- Cart abandonment rate
- AOV

### Guardrails

- Payment failure rate should not increase.
- Order cancellation/refund rate should not materially worsen.
- Users should continue to see clear final pricing before purchase.
