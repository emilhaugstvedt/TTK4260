# MLR on housing data in unscrambler

## Correlation matrix: Are the correlations as expected?

Yes, the correlations are as expected. Here are some examples:

- The amount of crime is negativly correlated with the average number of rooms per house. 
- The NOX concentration is positivly correlated with the proportion of non-retail business per acres.
- The distance form five Boston employment centers are negativly correlated with the amount of industry in the area.

![Correlation matrix.](Figures/CorrelationMatrix.png)

## Multiple linear regression (MLR):

### ANOVA table:
The ANOVA (Analysis Of Variance) table shows many different massures when it comes to the variance of each variable and between the different variables in the data set. Performed on a regular data set, this table tells how the different variables contribute to the total variance of the data set. And if its the withiin variance of each variable that is the most important or the variance between the mean of the groups. 

The first column is the SS (Squared Sum) this column consists of different sums of squares describing the variability between different parts of the data. The first row, called model, is the squared sum over the within variance of all different variables. The error row is the squares sum over the mean of the different variables. The last row, asjusted total, is the sum of the above two. 

The second column is the degrees of freedom.

The third column is the MSE, this is the squared sum divided by the degrees of freedom. This tells how much the variables varys on average. 

The fourth column is the F-ratio. This is a measure of how much of the variance of the model that is caused by variance within each variable compared to the variance between the mean of the different variables. This also exists for each variable and is here a measure of how much variance each variable contributed with compared to the variance between the mean of the different variables. The value in this column is F-distributed.

The fifth column is the p-value. This value is extracted from the F-distributon table. This value gives the probability of that what we hace measured here can happen if all variables has the same mean. In other words: if the variance between differnt the mean of the different variables are big compared to the internal variance of each variable the probability of the variables having the same mean is big. On the other side, if the variables has small variance between the differnt means and big internal variance, the probability for them having the same mean is bigger. This is somewhat explained by the below drawing :)

![tegning](Figures/Tegning.jpeg)

For the ANOVA table in the MLR the variance is described after the influence of the different thetas (multipliers corresponding to the different variables). Thus the F-ratio of each variable is an indication on how much the variance of the variable is used in the MLR. This is beacause the F-ratio is the squared sum within the variable divided by the squared sum over the different variables. Thus a high F-ratio indicates that the variable is important to the MLR. 

This can also be seen in the p-value. In this case the value of the p-value is somewhat a probability for the theta of a variable actually being 0 or the variance of the variable not being important at all. Thus one can conclude that the varinace for the AGE, DIS and RAM all are important for this model. As seen later this also corresponds with them having a higher weighting.

By lastly taking a look at the F-ratio for the whole model this has a value of 174. Thus the variance within the different variables are much more influential than the variance between the mean of the different groups. This also gives a p-value of 0. Thus we can conclude that the model we have made almost certainly explains a pattern between some of the variables and the price.


### Predicted vs. reference:
