# Blinkit E-commerce Conversion Optimization

## Product Analytics & Conversion Optimization Case Study

### Objective

Identify conversion bottlenecks across the e-commerce funnel and prioritize
product improvements to increase conversion and reduce cart abandonment.

> **Portfolio case study:** This project uses synthetic quick-commerce event
> data created for portfolio purposes. It is not proprietary Blinkit data.

---

## Business Problem

For a quick-commerce platform, users can drop off at multiple stages of the
journey:

**App Open → Search → Product View → Add to Cart → Checkout → Purchase**

The objective of this analysis was to identify where users were dropping off,
understand potential friction points, and translate those findings into
prioritized product opportunities.

---

## Key Findings

Analysis of the synthetic event dataset identified the following funnel:

| Funnel Stage | Users | Conversion from App Open |
|---|---:|---:|
| App Open | 5,000 | 100.00% |
| Search | 4,024 | 80.48% |
| Product View | 3,287 | 65.74% |
| Add to Cart | 2,072 | 41.44% |
| Checkout Start | 1,589 | 31.78% |
| Payment Attempt | 1,436 | 28.72% |
| Purchase | 1,234 | 24.68% |

### Main Opportunity Areas

**1. Product discovery / selection**

Search → Product View conversion was 81.68%, while Product View → Add to
Cart conversion was 63.04%.

This suggests a potential product-selection friction point: users are
finding products but a meaningful proportion do not proceed to add them to
cart.

**2. Checkout**

Cart → Checkout conversion was 76.69%, while Checkout → Purchase conversion
was 77.66%.

This indicates additional drop-off among users who have already demonstrated
purchase intent.

> These observations are hypotheses generated from synthetic portfolio data,
> not claims about actual Blinkit customer behavior.

---

## Product Recommendations

### SmartFind — Product Discovery

**Problem:** Users may spend additional effort searching, comparing, and
selecting products.

**Solution:** SmartFind is a discovery experience designed around:

- Intent-aware product ranking
- Quick filters and shortcuts
- Relevant alternatives
- Repeat-item suggestions

**Primary success metric:**

Product View → Add to Cart conversion

**Secondary metrics:**

- Search → Product View conversion
- Search reformulation rate
- Time to relevant product

---

### QuickBuy — Checkout Conversion

**Problem:** Users who have already added products to their cart may encounter
unnecessary checkout friction.

**Solution:** QuickBuy is a streamlined checkout experience focused on:

- Simplified checkout flow
- Clear final order summary
- Prominent purchase CTA
- Saved user preferences

**Primary success metric:**

Cart → Purchase conversion

**Secondary metrics:**

- Checkout → Purchase conversion
- Checkout completion time
- Cart abandonment rate
- Average Order Value (AOV)

---

## Prioritization

I used the **RICE framework** to prioritize potential product improvements.

**RICE = Reach × Impact × Confidence ÷ Effort**

| Rank | Initiative | RICE Score |
|---:|---|---:|
| 1 | QuickBuy | 13.20 |
| 2 | SmartFind | 11.20 |
| 3 | Cart Price Transparency | 9.45 |
| 4 | Search Shortcuts | 7.50 |

### Product Decision

**QuickBuy was prioritized first** because it targets users with stronger
purchase intent and has a more direct path to completed orders.

SmartFind was prioritized second because it addresses discovery friction and
may improve downstream conversion.

> RICE inputs are portfolio assumptions used to demonstrate product
> prioritization. They are not internal Blinkit estimates.

---

## A/B Testing Roadmap

### Experiment 1 — SmartFind

**Hypothesis:** Improving search relevance and reducing product-selection
effort will increase Product View → Add to Cart conversion.

**Control:** Existing search/ranking experience

**Variant:** SmartFind

**Primary KPI:** Product View → Add to Cart conversion

**Secondary KPIs:**

- Search → Product View conversion
- Search reformulation rate
- Time to relevant product

**Guardrail:** Search response time

---

### Experiment 2 — QuickBuy

**Hypothesis:** Reducing checkout effort and improving order-price clarity
will increase Cart → Purchase conversion.

**Control:** Existing checkout experience

**Variant:** QuickBuy

**Primary KPI:** Cart → Purchase conversion

**Secondary KPIs:**

- Checkout → Purchase conversion
- Checkout completion time
- Cart abandonment rate
- AOV

**Guardrails:**

- Payment failure rate
- Cancellation/refund rate
- Final-price discrepancies

---
Data Disclaimer

blinkit_events.csv is synthetic quick-commerce event data created for this
portfolio case study. It is not proprietary Blinkit data.

## Project Workflow

```text
Synthetic Event Data
        ↓
SQL Funnel Analysis
        ↓
Identify Conversion Bottlenecks
        ↓
Customer & Competitor Friction Analysis
        ↓
SmartFind + QuickBuy
        ↓
RICE Prioritization
        ↓
A/B Testing Roadmap
        ↓
Conversion & Business KPIs
