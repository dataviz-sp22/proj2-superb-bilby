Facets of Wealth Inequality Visualized
================
Superb Bilby

## Goal of this Project

Our high level goal is to create an easily digestible website which
conveys the true scale of global wealth and income inequality.

## Motivation and Questions

An important component of Data Visualization is perspective. When there
is an extreme outlier in a data visualization, we do all kinds of data
visualization magic tricks to help keep everything in perspective. For
example, we log our axes so that everthing can fit on pane. We also
might facet our outliers so that they appear on adjacent panes and are
more visible because they are being compared to other outliers. These
methods of creating perspective are valuable and important, and we aim
to lean into these methods in this project, however, we also aim to lean
into the usefulness of not using these perspective tricks. For example,
if one were to create a bar graph showing a billionaire’s wealth, such
as Elon Musk’s wealth, next to the combined wealth of 100 randomly
sampled Americans, you would not be able to see the bar of the combined
wealth. It would not matter if that bar was 1 randomly sampled person in
America or 1000, it would still be one or two pixels in height, the
difference being indiscernible, which is the point of the visualization:
to express the sheer unimaginable and insurmountable magnitude of
extreme wealth.

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

**Codebook**

| variable        | class     | description                                          |
|:----------------|:----------|:-----------------------------------------------------|
| Name.and.Rank   | character | Full name                                            |
| Wealth..Million | character | Wealth in million                                    |
| Surname         | character | Surname                                              |
| World.Rank      | integer   | World rank according to wealth                       |
| Age             | integer   | Age                                                  |
| Wealth.Source   | character | Company name or                                      |
| Industry        | character | Industry of the wealth source                        |
| Gender          | character | Gender of the billionaire                            |
| State           | character | If this billionaire is from US, their hometown state |

**Data**

| Name.and.Rank   | Wealth..Millions. | Surname    | World.Rank | Age | Wealth.Source      | Industry              | Gender | State      |
|:----------------|:------------------|:-----------|-----------:|----:|:-------------------|:----------------------|:-------|:-----------|
| Jeff Bezos      | $113,000          | Bezos      |          1 |  56 | Amazon             | Technology            | M      | Washington |
| Bill Gates      | $98,000           | Gates      |          2 |  64 | Microsoft          | Technology            | M      | Washington |
| Warren Buffett  | $67,500           | Buffett    |          4 |  89 | Berkshire Hathaway | Finance & Investments | M      | Nebraska   |
| Larry Ellison   | $59,000           | Ellison    |          5 |  75 | software           | Technology            | M      | California |
| Mark Zuckerberg | $54,700           | Zuckerberg |          7 |  35 | Facebook           | Technology            | M      | California |
| Jim Walton      | $54,600           | Walton     |          8 |  71 | Walmart            | Fashion & Retail      | M      | Arkansas   |

### 2) Wealth Mobility Dataset

[The Wealth Mobility
Dataset](https://github.com/fpfeffer/WealthMobility/blob/master/Data/2-wealth-structure.csv).
The dataset breaks down how wealth is divided up by their original and
destined quintiles and race. It also provides intra-quartile and
quintile breakdowns, such as information about the wealthiest quintile
within the poorest quintile.

**Codebook**

| variable | class     | description                   |
|:---------|:----------|:------------------------------|
| white    | character | No if Black, Yes if No        |
| o        | character | Original quintile             |
| d        | character | Destined quintile             |
| w        | dummy     | 0 if this Black, 1 if White   |
| o        | integer   | Original quintile from 1 to 5 |
| d        | integer   | Destined quintile from 1 to 5 |

**Data**

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

<span style="color:red; font-weight: bold"> Micah Corning-Myers’ Tasks:
💃</span> <br> <span style="color:blue; font-weight: bold"> Jinfei Zhu’s
Tasks: 🕺 </span> <br> <span style="color:purple; font-weight: bold">
Both Team Member’s Tasks: 👯</span> <br>

#### Week 0: Brainstorming & Proposals (May 9 - May 15)

Proposal: Due Wed, May 11 Peer review: Due Fri, May 13

<ol>
<li style="color:purple; font-weight: bold">
👯 Offer up at least 1 preliminary idea for a project
</li>
<li style="color:purple; font-weight: bold">
👯 Collect at least one dataset for the project
</li>
<li style="color:blue; font-weight: bold">
🕺 Add the datasets to the repo and fork the project 1 template
</li>
<li style="color:red; font-weight: bold">
💃 Edit the template accordingly for project 2 and write up the proposal
</li>
<li style="color:blue; font-weight: bold">
🕺 Make substantive edits and make proposal presentation worthy
</li>
</ol>

#### Week 1: Reviews and Visualizations (May 16 - May 22)

Revised Proposal: Due Wed, May 18

<ol>
<li style="color:purple; font-weight: bold">
👯 Write peer feedbacks and identify/incorporate relevant peer feedback
</li>
<li style="color:purple; font-weight: bold">
👯 Data Cleaning & Tidying
</li>
<li style="color:red; font-weight: bold">
💃 Complete animated time series visualization
</li>
<li style="color:blue; font-weight: bold">
🕺 Complete Chloropleth Visualization
</li>
<li style="color:red; font-weight: bold">
💃 Complete Quintiles Static Visualization
</li>
<li style="color:blue; font-weight: bold">
🕺 Complete Interactive Visualization (user selects parameter)
</li>
</ol>

#### Week 2: Shiny, Write Up, Build Presentation (May 23 - May 29)

Project Draft for peer review: Due Wed, May 25

<ol>
<li style="color:red; font-weight: bold">
💃 Deploy Shiny App
</li>
<li style="color:blue; font-weight: bold">
🕺 Organize presentation relying on Shiny App
</li>
<li style="color:purple; font-weight: bold">
👯 Complete write up
</li>
<li style="color:purple; font-weight: bold">
👯 Practice presentation, give mutual feedback, bug hunt
</li>
</ol>

## Visualization plan

### 1) Wealth Inequality

-   How wealthy is each billionaire
    -   Visualize 1 million with a rice/house (or any emoji), and
        visualize each billionaire’s wealth is equal to how many
        rices/houses/other emojis
    -   Visualize how long it will take an average-income person to
        become billionaire, from top 10 according to GDP produced per
        capita.
-   See billionaire’s distribution interactive dashboard
    -   Bar Plot of Industries of billionaire
    -   Chloropleth of billionaires from US

### 2) Economic Mobility

-   Quintiles Static Visualization with dropdown bar to choose each
    quintile in an interactive dashboard.
