Understanding PCA with Shiny Web App
========================================================
author: Archel Taneka
date: October 20, 2021
autosize: true

Introduction
========================================================
PCA or Principal Component Analysis is a useful technique, allowing you to reduce the number of dimensions in the data,
making it better to visualize the features in the dataset with so-called "principal components". It enables you to see the overall "shape" of the data and identify which data points are similar to each other and which are different.

Principal Components
========================================================
- The first principal component always has the most substantial variance in the data, meaning that almost all data points can be explained by the first principal component. This is because PCA utilizes linear transformation that fits the dataset to a new coordinate system in such a way that the most significant variance is found on the first coordinate.

- Where your initial variables are strongly correlated with one another, you will be able to approximate most of the complexity in your dataset with just a few principal components, and as you add more principal components, you summarize more and more of the original dataset.

Eigenvalues & Eigenvectors
========================================================
- Simply put, an eigenvector is a direction, such as "vertical" or "45 degrees", while an eigenvalue is a number telling you how much variance there is in the data in that direction.

- Thus, <b> The eigenvector with the highest eigenvalue is the first principal component. </b>

- The number of eigenvalues and eigenvectors that exits is equal to the number of dimensions the data set has. For example if we have two variables (two-dimensional dataset), that means we end up with two eigenvectors and eigenvalues.

Dataset
========================================================
We will use the `mtcars` dataset from R. This dataset consists of data on 32 models of car, taken from an American motoring magazine (1974 Motor Trend magazine). For each car, you have 11 features, and They are as follows:
- `mpg` : Fuel consumption (Miles per (US) gallon)
- `cyl` : Number of cylinders
- `disp` : Displacement (cu.in.) a.k.a the combined volume of the engine's cylinders
- `hp` : Gross horsepower
- `drat` : Rear axle ratio --> Describes how a turn of the drive shaft corresponds to a turn of the wheels
- `wt` : Weight (1000 lbs)
- `qsec` : 1/4 mile time
- `vs` : Engine block --> denotes whether the vehicle's engine is shaped like a "V", or is a more common straight shape.
- `am` : Transmission --> 0 for automatic and 1 for manual
- `gear` : Number of forward gears
- `carb` : Number of carburetors

Data Preparation & Preprocessing
========================================================
- There is no need to load the dataset since you can call it directly by typing `mtcars` in the console.
- Fit the PCA: `mtcars.pca <- prcomp(mtcars[,c(1:input$num_of_pca,10,11)], center = TRUE,scale. = TRUE)`. I only use numerical values features, because PCA can only work with numerical values. Therefore, I excluded `vs` and `am` from the PCA fit. There is also an additional data preprocessing by rescaling and recentering the data.
- Now we can plot the PCA with `ggbiplot(mtcars.pca, labels=rownames(mtcars), ellipse=TRUE, groups=mtcars.country)`

The Shiny Web App
========================================================
It is easier to explain how and what the PCA does to the dataset by showing the Shiny Web App itself.

This is the result of PCA with seven number of components. If you recall from the previous slides, "as you add more components, you summarize more and more of the original dataset". Thus, it appears the same as we use the whole seven columns (features) to summarize the dataset.

<img src='./pitch_presentation-figure/pca-7.PNG'>

The Shiny Web App (cont.)
========================================================
Now, I set the number of principal components to four. It appears that it does a better job at summarizing the data. The "standardized PC1" has the biggest explained variance (68.0%) compared to the previous example (62.8%)

<img src='./pitch_presentation-figure/pca-4.PNG'>

The Shiny Web App (cont.)
========================================================
What if the number of principal components is very small? As expected, it's getting worse as the number of principal components approaches one. This is the same as only using 1 feature to summarize the dataset.

<img src='./pitch_presentation-figure/pca-2.PNG'>


Summary
========================================================
1. PCA (Principal Component Analysis) is one of the dimensional reduction technique.
2. It utilizes "principal components" to explain the most variance on the data.
3. The principal components can be calculated with eigenvalues and eigenvectors.
4. As you add more principal components, you summarize more and more of the original dataset.
