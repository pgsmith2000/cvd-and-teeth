Revisiting the Cross-Sectional Association Between Missing Teeth and
Cardiovascular Disease: BRFSS 2018
================
First created on Nov 7, 2019. Updated on Nov 10, 2019

  - [Stage 1: Data Preparation, Cleaning, and
    Reduction](#stage-1-data-preparation-cleaning-and-reduction)
  - [Stage 2: Example Descriptive
    Analysis](#stage-2-example-descriptive-analysis)
  - [Stage 3: Linear Regression](#stage-3-linear-regression)
  - [Stage 4: Logistic Regression (the Real
    Analysis)](#stage-4-logistic-regression-the-real-analysis)

The relationship between oral health and cardiovascular disease has been
an important area of research in the last decade. The objective of the
current study is to perform an analysis of BRFSS 2018 data based on the
previously published work of R. Constance Wiener and Usha Sambamoorthi
from 2010. **This analysis is meant to be an example of the data
analysis and R programming techniques required to perform both a
descriptive and regression analysis of publically available data.**

In their orignal 2010 analysis, Weiner and Sambamoorth evaluated the
association of cardiovascular disease and the number of missing teeth as
a risk indicator. In this analysis, the 2018 BRFSS data and initial
variables from that study will be used as the basis for demonstrating
the products and coding required for (1) an descriptive analysis and (2)
a regression analysis using R.

For more information about the original study check out the published
article at: <https://www.ncbi.nlm.nih.gov/pubmed/24624297>

### Stage 1: Data Preparation, Cleaning, and Reduction

The initial data set for the project was the 2018 BRFSS Survey Data, and
it was quite large. Before conducting any other analyses to be
demonstrated here (such as a desciptive analysis or regression
analysis), the data needed some additonal cleaning and reduction. The
final result was a data set of 52 variables (compared to the 275
variables in the total set). In addition, the number of records was
reduced from over 440,000 records to approximately 266,000 records. The
**[2018 BRFSS Codebook
CDC](https://www.cdc.gov/brfss/annual_data/2018/pdf/codebook18_llcp-v2-508.pdf)**
was a key tool in this process.

The three main products of this process included:

  - The Main **[Data Dictionary](output/Data_Dictionary.xlsx)**
  - A small **[Data Dictionary Supplement](output/data_dictionary.txt)**
  - The final **[BRFSS Reduced Data Set](output/BRFSS.csv)**

For the detailed coding and results, explore the **[Stage 1 Preparing,
Cleaning, and Reducing the Data](preparing-the-data.html).**

### Stage 2: Example Descriptive Analysis

The key product of this analysis is a complete Table 1 documenting the
frequency counts for each variable value (1) **overall** for all
participants, and broken down for those (2) with **cardiovascular
disease** and (3) with **no cardiovascular disease**. Histogram plots of
each variable are also provided. And of course this section contains the
detailed r-code that produces all of this. Chi-square analysis of all
variables were significant at the p\<0.001 level.

To see the detailed coding and results, explore the **[Stage 2
Descriptive Analysis](descriptive-analysis.html)**

### Stage 3: Linear Regression

A linear regression analysis is conducted here ONLY AS A DEMONSTRATION
OF METHODOLOGY AND CODING. Linear regression is typically most useful in
the case of continuous outcome data. However, in this study the outcome
variable is binomial: cardiovascular disease or no cardiovascular
disease. As a result the appropriate modeling technique for analyzing
the hypothesis and data in this study will be **Logistic Regression**.
The logistic regression will appear in Stage 4.

A linear regression analyis is provided for 3 models. In addition a
step-wise multiple regression was applied which retained everyone of the
variables. However, none of these models were very good. The full model
was best but only accounted for about 6% of the variance in the data. As
a result and log regression will follow.

For the detailed coding and results, explore the **[Stage 3 Linear
Regression](linear-regression.html).**

### Stage 4: Logistic Regression (the Real Analysis)

As stated above, the binomial nature of the outcome variable would
suggest that logistic regression is the most appropriate method to
analyze these data. In fact, every one of the variables in this study is
two-level (binomial) or a categorical variable with three or more levels
(multinomial). In this analysis, two logistic regression models were
constructed with the same parameters as Model1 and the Full Model used
in the logistical model. This model resulted in a series of Odds ratios
(with upper and lower limits).

For the detailed coding and results from this logistic regression,
explore the **[Stage 4 Logistic Regression](logistic-regression.html).**
