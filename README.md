# MLB-Standings-Mini-Project

## Table of Contents

- [Overview](#overview)
- [Data Exploration](#data-exploration)
  - [Reading in Data](#reading-in-data)
  - [Visualizing Distributions](#visualizing-distributions)
  - [Scatterplots of Variables](#scatterplots-of-variables)
- [Model Fitting](#model-fitting)
  - [Linear Regression Model](#linear-regression-model)
  - [Predictions and Residuals](#predictions-and-residuals)
  - [Residual Analysis](#residual-analysis)
  - [Shapiro-Wilk Test](#shapiro-wilk-test)
  - [Cook's Distance and Leverage Points](#cooks-distance-and-leverage-points)
  - [Model Refinement](#model-refinement)
- [Conclusion](#conclusion)
- [Requirements](#requirements)
- [Usage](#usage)

## Overview

This repository contains a comprehensive analysis of Major League Baseball (MLB) standings using a dataset that includes runs scored, runs allowed, and wins from the years 2019 to 2022. The primary aim is to predict the number of wins for an MLB team based on the runs scored and runs allowed. This analysis thoroughly checks model assumptions, assesses residuals, and identifies leverage points to ensure the robustness and accuracy of the linear regression model.

## Data Exploration

### Reading in Data

The MLB standings data is read from a CSV file.

### Visualizing Distributions

Histograms are created to visualize the distribution of key variables, such as runs scored, runs allowed, and wins.

### Scatterplots of Variables

Scatterplots are generated to explore relationships between runs scored, runs allowed, and wins.

## Model Fitting

### Linear Regression Model

A linear regression model is fitted to predict the number of wins based on runs scored and runs allowed.

### Predictions and Residuals

The model's predictions and various types of residuals (standardized, studentized, and jackknife) are calculated.

### Residual Analysis

Residual plots and normal probability plots are created to assess model assumptions, including normality and homoscedasticity.

### Shapiro-Wilk Test

A Shapiro-Wilk test is conducted to check for normality of jackknife residuals.

### Cook's Distance and Leverage Points

Cook's distance values are calculated and plotted to identify influential points and assess leverage in the dataset.

<img src="https://github.com/RoryQo/MLB-Standings-Mini-Project/blob/main/Graph1.jpg?raw=true" alt="MLB Standings Analysis" width="400"/>


### Model Refinement

Influential points are removed, and the model is refitted using the remaining data to improve accuracy and robustness.

```{r}
mlb$inf_pt = ifelse(mlb$cook > 4/90, 1, 0)
s = mlb[which(mlb$inf_pt == 0), ]
model2 = lm(wins ~ scored + allowed, data = s)
summary(model2)
```

## Conclusion

This analysis provides insights into the relationships between runs scored, runs allowed, and wins in MLB standings. It thoroughly checks model assumptions and addresses leverage points, making it a solid foundation for further predictive modeling or in-depth analysis.

## Requirements

- R
- MASS package (for statistical functions)

## Usage

To run this analysis, ensure you have R installed and the `MASS` package available. Place the `mlb_standings.csv` file in your working directory and follow the outlined steps in your R environment.

---
