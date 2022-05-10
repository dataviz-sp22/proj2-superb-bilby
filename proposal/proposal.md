Facets of Wealth Inequality Visualized
================
Superb Bilby

## Goal of this Project

Our high level goal is to create an easily digestible website which
conveys the true scale of global wealth and income inequality.

## Motivation and Questions

Global wealth and income inequality is at an all time high, however, the
magnitude of this inequality is difficult to fathom. Often, the uber
wealthy of society are worshiped for their resilience and innovation,
when in reality they should be scorned for their greed and malice. A
resource that helps people more easily digest the extreme wealth
disparity may shift people away from the deification of the world’s
oligarchs, and shift people toward the rally against such rapacious
behavior. We aim to answer the following questions in an attempt to
clarify the realities of wealth/income inequality:

What can the wealth of a billionaire accomplish? How many of our world’s
poorest would it take to match the wealth of our world’s richest? What
are some ways we can begin to conceptualize how much money the
wealthiest humans actually have? Does anybody really need so much
wealth?

To answer these questions through visualization, we will be relying on
the following datasets:

1)  [The Forbes Billionaire’s
    List](https://docs.google.com/spreadsheets/d/1JThOdF95e0NYoea5pCWd5UDXLmIGc1Fwj1aajDSYYhk/edit#gid=685599441).
    The dataset provides information about billionaire’s networths, how
    old they are, what industry they are in, their gender, and their
    location.

| Name.and.Rank   | Wealth..Millions. | Surname    | World.Rank | Age | Wealth.Source      | Industry              | Gender | State      |
|:----------------|:------------------|:-----------|-----------:|----:|:-------------------|:----------------------|:-------|:-----------|
| Jeff Bezos      | $113,000          | Bezos      |          1 |  56 | Amazon             | Technology            | M      | Washington |
| Bill Gates      | $98,000           | Gates      |          2 |  64 | Microsoft          | Technology            | M      | Washington |
| Warren Buffett  | $67,500           | Buffett    |          4 |  89 | Berkshire Hathaway | Finance & Investments | M      | Nebraska   |
| Larry Ellison   | $59,000           | Ellison    |          5 |  75 | software           | Technology            | M      | California |
| Mark Zuckerberg | $54,700           | Zuckerberg |          7 |  35 | Facebook           | Technology            | M      | California |
| Jim Walton      | $54,600           | Walton     |          8 |  71 | Walmart            | Fashion & Retail      | M      | Arkansas   |

2)  [The Wealth Mobility
    Dataset](https://github.com/fpfeffer/WealthMobility/blob/master/Data/2-wealth-structure.csv).
    The dataset breaks down how wealth is divided up by quintiles,
    quartiles, and race. It also provides intra-quartile and quintile
    breakdowns, such as information about the wealthiest quintile within
    the poorest quintile.

| white | o               | d                |   w | origin | destination |        n |
|:------|:----------------|:-----------------|----:|-------:|------------:|---------:|
| No    | Lowest Quintile | Lowest Quintile  |   0 |      1 |           1 | 2735.642 |
| No    | Lowest Quintile | Quintile 2       |   0 |      1 |           2 | 1939.874 |
| No    | Lowest Quintile | Quintile 3       |   0 |      1 |           3 | 1101.515 |
| No    | Lowest Quintile | Quintile 4       |   0 |      1 |           4 |  368.519 |
| No    | Lowest Quintile | Highest Quintile |   0 |      1 |           5 |  112.436 |
| No    | Quintile 2      | Lowest Quintile  |   0 |      2 |           1 | 1196.467 |

## Weekly Plan of Attack

Below is the delineation of our plan to get our project complete on
time.

<span style="color:red; font-weight: bold"> Micah Corning-Myers’ Tasks
</span> <br> <span style="color:blue; font-weight: bold"> Jinfei Zhu’s
Tasks </span> <br> <span style="color:purple; font-weight: bold"> Both
Team Member’s Tasks </span> <br>

#### Week 0: Brainstorming & Proposals

<ol>
<li style="color:purple; font-weight: bold">
Offer up at least 1 preliminary idea for a project
</li>
<li style="color:purple; font-weight: bold">
Collect at least one dataset for the project
</li>
<li style="color:blue; font-weight: bold">
Add the datasets to the repo and fork the project 1 template
</li>
<li style="color:red; font-weight: bold">
Edit the template accordingly for project 2 and write up the proposal
</li>
<li style="color:blue; font-weight: bold">
Make substantive edits and make proposal presentation worthy
</li>
</ol>

#### Week 1: Reviews and Visualizations

<ol>
<li style="color:purple; font-weight: bold">
Write peer feedbacks and identify/incorporate relevant peer feedback
</li>
<li style="color:purple; font-weight: bold">
Data Cleaning & Tidying
</li>
<li style="color:red; font-weight: bold">
Complete animated time series visualization
</li>
<li style="color:blue; font-weight: bold">
Complete Chloropleth Visualization
</li>
<li style="color:red; font-weight: bold">
Complete Quintiles Static Visualization
</li>
<li style="color:blue; font-weight: bold">
Complete Interactive Visualization (user selects parameter)
</li>
</ol>

#### Week 2: Shiny, Write Up, Build Presentation

<ol>
<li style="color:red; font-weight: bold">
Deploy Shiny App
</li>
<li style="color:blue; font-weight: bold">
Organize presentation relying on Shiny App
</li>
<li style="color:purple; font-weight: bold">
Complete write up
</li>
<li style="color:purple; font-weight: bold">
Practice presentation, give mutual feedback, bug hunt
</li>
</ol>

## Questions

The two questions you want to answer.

## Analysis plan

A plan for answering each of the questions including the variables
involved, variables to be created (if any), external data to be merged
in (if any).
