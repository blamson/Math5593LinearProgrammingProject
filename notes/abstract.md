# Homework 21

## Project Goal

This project seeks to explore the statistical technique known as $(L_1)$, or **LASSO Regression**, from a linear programming perspective. This will be done by utilizing a simple toy dataset and performing LASSO regression using both the `statsmodels` library in Python and by writing an AMPL model using the `amplpy` API. The goal will be to show the equivalence of the two perspectives. By doing that we can verify the correctness of our implementation and confidently explore the differences required for the two approaches.

We're pursuing this as the topic for our project as it feels like the perfect overlap between statistics and linear programming. Being able to look at tools we have used for years from a fresh perspective is exciting, and we hope this project may help shed some light on regression for others in the class.

## Some Background

Regression at its core takes a set of points in (n)-dimensional space and attempts to fit a line, plane, or hyperplane through that space in a way that minimizes its overall distance from those points. That is usually referred to as minimizing the **residual sum of squares (RSS)**. LASSO, or *Least Absolute Shrinkage and Selection Operation*, is a special type of regression that includes a penalty for model complexity. It does this by shrinking unimportant variables down to 0 while still minimizing the RSS. So this method also functions as a **variable selection tool**!

Below is a comparison of the two using typical statistical notation:

$$
\text{Linear Regression:} \quad \min \sum (y_i - \hat{y}_i)^2
$$

$$
\text{LASSO Regression:} \quad 
\underbrace{\min \sum (y_i - \hat{y}_i)^2}_{\text{RSS}} 
+ 
\underbrace{\lambda \sum |\beta_i|}_{\text{Penalty}}
$$

Note that $(y)$ are the observed values, $(\hat{y})$ are the estimated values, $(\beta)$ are the regression coefficients, and $(\lambda)$ represents the penalty scalar. The penalty scalar dictates how strong we want the penalty to be, and is chosen by the user in the modeling step. Cross-validation in Python will be used to help find a suitable value of $(\lambda)$.

When translating this over to a linear programming methodology, the penalty instead becomes a constraint. An upper limit is given on the sum of the absolute values of the model coefficients. The objective function of this LP is simply the RSS portion from above.

$$
\min \sum (y_i - \hat{y}_i)^2
$$

$$
\text{subject to: } \sum_{j=1}^{p} |\beta_j| \le t
$$

It is worth noting that this is currently not in a proper form for linear programming due to the absolute value.

## The Dataset

For this project we'll be using the classic `mtcars` toy dataset. Below is a description of the table from the R documentation.

> **R Documentation**
> The data was extracted from the 1974 *Motor Trend* US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).

This table was chosen due to the small number of rows relative to the large number of variables. As LASSO is designed to penalize overly complex models, this dataset is perfect for showcasing the coefficient-shrinkage functionality.
