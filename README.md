Facets of Wealth Inequality Visualized
================
Superb Bilby

## Introduction

An important component of Data Visualization is perspective. When there
is an extreme outlier in a data visualization, we do all kinds of data
visualization magic tricks to help keep everything in perspective. For
example, we log our axes so that everything can fit on a single pane. We
also might facet our outliers so that they appear on adjacent panes and
are more visible because they are being compared to other outliers. For
example, consider the below graph:

![](README_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Here, we have a few differing levels of wealth. One shows the U.S.
Median Household wealth, which is about $121,700. The other two are the
University of Chicago Endowment and Jeff Bezos’ wealth, which is about
8.6 billion and 132.8 billion dollars, respectively. Thanks to the
logging of the axes, we are able to accurately assess what the exact
values of each of the categories are. These methods of creating
perspective are valuable and important, and we aim to lean into these
methods in this project, however, we also aim to lean into the
usefulness of not using these perspective tricks.

A shortcoming of the above graph is that it does a poor job of
highlighting the differences between the three observations. Jeff Bezos’
wealth is a little over 15 times the size of UChicago’s, but the bars
are misleadingly similar in size, as is the nature of logged axes.
Perhaps even more shocking in the context of this visualization is that
Bezos’ wealth is well over 1 million times as large the average American
household’s wealth, but Jeff Bezos’ bar is only about 2.5 times as
large. On the other hand, if we were not to incorporate a logged axis
and if one were to instead create another bar graph showing a
billionaire’s wealth, such as Elon Musk’s wealth, next to the combined
wealth of 100 randomly sampled Americans, you would not be able to see
the bar of even the combined wealth of all those Americans if it were
next to Elon Musk’s wealth in the visualization. It would not matter if
that bar was 1 randomly sampled person in America or 1000, it would
still be one or two pixels in height, the difference being
indiscernible, which is the point of some of the visualizations we aim
to create, which is: to express the sheer unimaginable and
insurmountable magnitude of extreme wealth.

Global wealth and income inequality is at an all time high, however, the
magnitude of this inequality is difficult to fathom. Often, the uber
wealthy of society are worshiped for their resilience and innovation,
when in reality it might do some good to scorn them for their greed and
malice. A resource that helps people more easily digest the extreme
wealth disparity may shift people away from the deification of the
world’s oligarchs, and shift people toward the rally against such
rapacious behavior. We aim to answer the following questions in an
attempt to clarify the realities of wealth/income inequality, and deploy
our answers to a Shiny application for wider accessibility: Our high
level goal is to create an easily digestible application which conveys
the true scale of global wealth and income inequality.

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

-   Dividing United States income levels to 5 quantiles (0%-20%,
    20%-40%, 40%-60, 60%-80%, 80%-100%), can we visualize their mobility
    patterns in an interactive dashboard.

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
