Facets of Wealth Inequality Visualized
================
Superb Bilby

## Goal of this Project

Our high level goal is to create an easily digestible website which
conveys the true scale of global wealth and income inequality.

## Repository Orgnization

-   `data`: This folder contains data needed for our analysis and
    visualization
-   `proposal`: This folder contains the rmarkdown and markdown of our
    proposal
-   `analysis`: This folder contains all the analysis and visualization
    files of our project

## Motivation and Questions

Global wealth and income inequality is at an all time high, however, the
magnitude of this inequality is difficult to fathom. Often, the uber
wealthy of society are worshiped for their resilience and innovation,
when in reality they should be scorned for their greed and malice. A
resource that helps people more easily digest the extreme wealth
disparity may shift people away from the deification of the world’s
oligarchs, and shift people toward the rally against such rapacious
behavior. We aim to answer the following questions in an attempt to
clarify the realities of wealth/income inequality, and deploy our
answers to a [Shiny](https://shiny.rstudio.com/) application for wider
accessibility:

### 1) Wealth Inequality

-   What can the wealth of a billionaire accomplish?
-   How many of our world’s poorest would it take to match the wealth of
    our world’s richest?
-   What are some ways we can begin to conceptualize how much money the
    wealthiest humans actually have?
-   Does anybody really need so much wealth?
-   What is the Industry/Geolocation distribution of billionaires

### 2) Wealth Mobility

-   Dividing income levels to 5 quantiles (0%-20%, 20%-40%, 40%-60,
    60%-80%, 80%-100%), can we visualize their mobility patterns in an
    interactive dashboard.

## Data

To answer these questions through visualization, we will be relying on
the following datasets:

### 1) Billionaire List

[The Forbes Billionaire’s
List](https://docs.google.com/spreadsheets/d/1JThOdF95e0NYoea5pCWd5UDXLmIGc1Fwj1aajDSYYhk/edit#gid=685599441).
The dataset provides information about billionaire’s networths, how old
they are, what industry they are in, their gender, and their location.

### 2) Wealth Mobility Dataset

[The Wealth Mobility
Dataset](https://github.com/fpfeffer/WealthMobility/blob/master/Data/2-wealth-structure.csv).
The dataset breaks down how wealth is divided up by their original and
destined quintiles and race. It also provides intra-quartile and
quintile breakdowns, such as information about the wealthiest quintile
within the poorest quintile.
