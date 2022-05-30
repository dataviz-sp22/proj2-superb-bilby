# Data

This folder contains data needed for our analysis and visualization


### 1) Billionaire List
[The Forbes Billionaire's List](https://docs.google.com/spreadsheets/d/1JThOdF95e0NYoea5pCWd5UDXLmIGc1Fwj1aajDSYYhk/edit#gid=685599441). The dataset provides information about billionaire's networths, how old they are, what industry they are in, their gender, and their location.  

**Codebook**

|variable |class     |description |
|:--------|:---------|:-----------|
|Name.and.Rank      |character    | Full name       |
|Wealth..Million    |character    | Wealth in million         |
|Surname            |character    | Surname         |
|World.Rank         |integer      | World rank according to wealth        |
|Age                |integer      | Age        |
|Wealth.Source      |character    | Company name or       |
|Industry           |character    | Industry of the wealth source         |
|Gender             |character    | Gender of the billionaire         |
|State              |character    | If this billionaire is from US, their hometown state       |


### 2) Wealth Mobility Dataset
[The Wealth Mobility Dataset](https://github.com/fpfeffer/WealthMobility/blob/master/Data/2-wealth-structure.csv). The dataset breaks down how wealth is divided up by their original and destined quintiles and race. It also provides intra-quartile and quintile breakdowns, such as information about the wealthiest quintile within the poorest quintile.

**Codebook**

|variable |class     |description |
|:--------|:---------|:-----------|
|white     |character   | No if Black, Yes if No       |
|o    |character | Original quintile         |
|d    |character | Destined quintile         |
|w    |dummy   | 0 if this Black, 1 if White      |
|o    |integer | Original quintile from 1 to 5        |
|d    |integer | Destined quintile from 1 to 5        |