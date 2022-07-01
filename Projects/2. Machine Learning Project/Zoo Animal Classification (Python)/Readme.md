# Zoo Animal Classification (Machine Learning)
#### Tools: Python 3.10.2, Jupyter Notebook
## Problem Statement : 
Predict the Classification of the Animals, Based upon the Variables.
## Dataset Reference : 
https://www.kaggle.com/datasets/uciml/zoo-animal-classification
## Description : 
There are 16 Variables that describes the features of the Animals.


![](https://github.com/xavierina12/Data-Analytics/blob/main/Projects/2.%20Machine%20Learning%20Project/Zoo%20Animal%20Classification%20(Python)/Images/Dataset%20Attributes.png)

## Tasks
### Task 1: Data Exploration
* Import the libraries: NumPy, Pandas, Matplotlib and Seaborn  
* Load the dataset using pandas.
* Explore the dataframe using the shape, info() functions.
* **Data Cleansing:** Check the null values and replace it.
* **Data Wrangling:** Merge the columns using groupby 
* **Descriptive Statistics:**
    * describe() is used to find the descriptive statistics
    * corr() is used to find the correlation
    * cov() is used to find the covariance
* **Data Visualization:** Data can be easily visualized using matplotlib and seaborn libraries

### Task 2: Build the Model
* Select the features and target values
* Apply the train test split method
* Select a few classification models like DecisionTreeClassifier(), RandomForestClassifier(), SVC(kernel='linear'), GaussianNB(), GradientBoostingClassifier() from sklearn
* **Build the model:** model.fit(x_train,y_train)
* **Evaluate the model:** model.score(x_test,y_test)
*  **Predict the values** model.predict(x_test)
* Scores for the models selected for Zoo Animal Dataset

![](https://github.com/xavierina12/Data-Analytics/blob/main/Projects/2.%20Machine%20Learning%20Project/Zoo%20Animal%20Classification%20(Python)/Images/Visuals.png)

### Task 3: Model Selection
* Select the model that has the best accuracy and less time.
* The model selected for the Zoo Dataset is **DecisionTreeClassifier()**
* **Accuracy:** 100%
* Print the Classification Report
* Plot the Confusion Matrix
* Plot Decision Tree 


## Conclusion
**MODEL SELECTED:** DecisionTreeClassifier()
### Advantages and Disadvantages of the DecisionTreeClassifier model:
**Advantages:**
* No considerable impact of missing values.
* Easy to explain to non-technical team members.
* Easy visualization
* Automatic Feature selection: Irrelevant features won’t affect decision trees.

**Disadvantages:**
* Prone to overfitting. Good performance on the training data, poor generalization to new data.
* Sensitive to data. If data changes slightly, the outcomes can change to a very large extent.
* Higher time required to train decision trees of large datasets.

### Applications:
Identifying buyers for products, finding strategy that can maximize the profit, finding strategy for cost minimization, which features are most important to attract and retain customers (is it the frequency of shopping, is it the frequent discounts, is it the product mix), fault diagnosis in machines (keep measuring pressure, vibrations and other measures and predict before a fault occurs) and many other applications.

The Best Machine learning models for the Zoo dataset are **DecisionTreeClassifier, RandomForestClassifier, SVC and GradientBoostingClassifier.**

### [View Code](https://github.com/xavierina12/Data-Analytics/blob/main/Projects/2.%20Machine%20Learning%20Project/Zoo%20Animal%20Classification%20(Python)/Zoo%20Animal%20Classification.ipynb)
### [View Report](https://github.com/xavierina12/Data-Analytics/blob/main/Projects/2.%20Machine%20Learning%20Project/Zoo%20Animal%20Classification%20(Python)/Report.pdf) 



