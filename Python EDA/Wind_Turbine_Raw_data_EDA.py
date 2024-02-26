# -*- coding: utf-8 -*-
"""
Created on Fri Nov 17 15:50:46 2023

@author: prave
"""

import pandas as pd
df = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Wind_turbine.csv")
df

df.head

df.dtypes

#Four moments of business decision

#First Moment of Buisness Decision

#Finding mean, median and mode

import pandas as pd

#Wind_speed
df.Wind_speed.mean()
df.Wind_speed.median()
df.Wind_speed.mode()

#Power
df.Power.mean()
df.Power.median()
df.Power.mode()

#Rotor_Speed
df.Rotor_Speed.mean()
df.Rotor_Speed.median()
df.Rotor_Speed.mode()

#Nacelle ambient temperature
df.Nacelle_ambient_temperature.mean()
df.Nacelle_ambient_temperature.median()
df.Nacelle_ambient_temperature.mode()

#Generator bearing temperature
df.Generator_bearing_temperature.mean()
df.Generator_bearing_temperature.median()
df.Generator_bearing_temperature.mode()

#Gear_oil_temperature
df.Gear_oil_temperature.mean()
df.Gear_oil_temperature.median()
df.Gear_oil_temperature.mode()

#Ambient_temperature
df.Ambient_temperature.mean()
df.Ambient_temperature.median()
df.Ambient_temperature.mode()

#Nacelle_temperature
df.Nacelle_temperature.mean()
df.Nacelle_temperature.median()
df.Nacelle_temperature.mode()

#Bearing_temperature
df.Bearing_temperature.mean()
df.Bearing_temperature.median()
df.Bearing_temperature.mode()

#Generator_speed
df.Generator_speed.mean()
df.Generator_speed.median()
df.Generator_speed.mode()

#Wheel_hub_temperature
df.Wheel_hub_temperature.mean()
df.Wheel_hub_temperature.median()
df.Wheel_hub_temperature.mode()

#Gear box inlet temperature
df.Gear_box_inlet_temperature.mean()
df.Gear_box_inlet_temperature.median()
df.Gear_box_inlet_temperature.mode()

#Second Moment of Business Decision
#Variance, Standard Deviation, Range

# variance
df.Power.var()
df.Rotor_Speed.var()
df.Nacelle_ambient_temperature.var()
df.Generator_bearing_temperature.var()
df.Gear_oil_temperature.var()
df.Ambient_temperature.var()
df.Nacelle_temperature.var()
df.Bearing_temperature.var()
df.Generator_speed.var()
df.Wheel_hub_temperature.var()
df.Gear_box_inlet_temperature.var()

# standard deviation
df.Power.std()
df.Rotor_Speed.std()
df.Nacelle_ambient_temperature.std()
df.Generator_bearing_temperature.std()
df.Gear_oil_temperature.std()
df.Ambient_temperature.std()
df.Nacelle_temperature.std()
df.Bearing_temperature.std()
df.Generator_speed.std()
df.Wheel_hub_temperature.std()
df.Gear_box_inlet_temperature.std()

#Range
wind_speed_range= max(df.Wind_speed) - min(df.Wind_speed)
wind_speed_range

Power_range= max(df.Power)- min(df.Power)
Power_range

Rotor_Speed_range= max(df.Rotor_Speed) - min(df.Rotor_Speed)
Rotor_Speed_range

Generator_speed_range= max(df.Generator_speed) - min(df.Generator_speed)
Generator_speed_range

Nacelle_ambient_temperature_range= max(df.Nacelle_ambient_temperature) - min(df.Nacelle_ambient_temperature)
Nacelle_ambient_temperature_range

Generator_bearing_temperature_range= max(df.Generator_bearing_temperature) - min(df.Generator_bearing_temperature)
Generator_bearing_temperature_range

Gear_oil_temperature_range= max(df.Gear_oil_temperature) - min(df.Gear_oil_temperature)
Gear_oil_temperature_range

Ambient_temperature_range= max(df.Ambient_temperature) - min(df.Ambient_temperature)
Ambient_temperature_range

Nacelle_temperature_range= max(df.Nacelle_temperature) - min(df.Nacelle_temperature)
Nacelle_temperature_range

Bearing_temperature_range= max(df.Bearing_temperature) - min(df.Bearing_temperature)
Bearing_temperature_range

Wheel_hub_temperature_range= max(df.Wheel_hub_temperature) - min(df.Wheel_hub_temperature)
Wheel_hub_temperature_range

Gear_box_inlet_temperature_range= max(df.Gear_box_inlet_temperature) - min(df.Gear_box_inlet_temperature)
Gear_box_inlet_temperature_range

#Third Moment of Business Decision

#Skewness, Kurtosis

#Skewness
df.Wind_speed.skew()
df.Power.skew()
df.Rotor_Speed.skew()
df.Generator_speed.skew()
df.Nacelle_ambient_temperature.skew()
df.Generator_bearing_temperature.skew()
df.Gear_oil_temperature.skew()
df.Ambient_temperature.skew()
df.Nacelle_temperature.skew()
df.Bearing_temperature.skew()
df.Wheel_hub_temperature.skew()
df.Gear_box_inlet_temperature.skew()

#Kurtosis
df.Wind_speed.kurt()
df.Power.kurt()
df.Rotor_Speed.kurt()
df.Generator_speed.kurt()
df.Nacelle_ambient_temperature.kurt()
df.Generator_bearing_temperature.kurt()
df.Gear_oil_temperature.kurt()
df.Ambient_temperature.kurt()
df.Nacelle_temperature.kurt()
df.Bearing_temperature.kurt()
df.Wheel_hub_temperature.kurt()
df.Gear_box_inlet_temperature.kurt()

#------------------------------------------------------------------------------

#identifying duplicates

duplicates = df.duplicated()

duplicates

#Count of null values
df.isna().sum()

# Outliers Count using Z score method

def count_outliers_zscore(df, columns):
    
    outlier_counts = {}

    for column in columns:
        # Calculate the mean and standard deviation
        mean_value = df[column].mean()
        std_dev = df[column].std()

        # Calculate the z-scores for each data point
        z_scores = (df[column] - mean_value) / std_dev

        # Count the outliers (absolute z-score > 3)
        outliers_count = len(df[abs(z_scores) > 3])

        # Store the count in the dictionary
        outlier_counts[column + '_outliers'] = outliers_count

    result = pd.DataFrame(list(outlier_counts.items()), columns=['Column', 'Outliers Count'])
    return result

columns = ['Wind_speed', 'Power', 'Nacelle_ambient_temperature', 'Generator_bearing_temperature',
           'Gear_oil_temperature', 'Ambient_temperature', 'Rotor_Speed', 'Nacelle_temperature',
           'Bearing_temperature', 'Generator_speed', 'Yaw_angle', 'Wind_direction',
           'Wheel_hub_temperature', 'Gear_box_inlet_temperature']

result = count_outliers_zscore(df, columns)

# Display the result
print(result)

#-------------------------------------------------------------------------------
#Univariate Analysis

#Bar_plot 
#(i)for Rotor_Speed Vs Generator_speed
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

plt.bar(df['Rotor_Speed'],df['Generator_speed'])

plt.show()

#(ii)for Wind_Speed Vs Rotor Speed

plt.bar(df['Wind_speed'],df['Rotor_Speed'])

plt.show()

#histogram
#(i)Histogram for Rotor Speed
import matplotlib.pyplot as plt
x = 'Rotor_Speed'
# Create the histogram
plt.hist(df[x], bins=10, color='pink', alpha=0.8) # 
# Add labels and title
plt.xlabel('Rotor_Speed')
plt.ylabel('Frequency')
plt.title('Histogram of ' + x)
# Display the histogram
plt.show()
#It is positively skewed OR right skewed
#Mean>Median>Mode

#(ii)Histogram for Wind_speed
import matplotlib.pyplot as plt
x = 'Wind_speed'
# Create the histogram
plt.hist(df[x], bins=10, color='pink', alpha=0.8) # 
# Add labels and title
plt.xlabel('Wind_speed')
plt.ylabel('Frequency')
plt.title('Histogram of ' + x)
# Display the histogram
plt.show()
#It is positively skewed OR right skewed
#Mean>Median>Mode

#(iii)Histogram for Wind_speed
import matplotlib.pyplot as plt
x = 'Wind_speed'
# Create the histogram
plt.hist(df[x], bins=10, color='pink', alpha=0.8) # 
# Add labels and title
plt.xlabel('Wind_speed')
plt.ylabel('Frequency')
plt.title('Histogram of ' + x)
# Display the histogram
plt.show()
#It is positively skewed OR right skewed
#Mean>Median>Mode

#Bivariate Analysis

#(1)Scatter plot for Failure_Status depending upon Wind_Power Vs Power
import pandas as pd
import matplotlib.pyplot as plt

df.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = df[df[category_column] == 'Failure']
category2_data = df[df[category_column] == 'No_failure']

# Create the scatter plot with different colors
plt.figure(figsize=(8, 7))
plt.scatter(category1_data['Wind_speed'], category1_data['Power'], color='blue', label='Failure', alpha=0.5)
plt.scatter(category2_data['Wind_speed'], category2_data['Power'], color='orange', label='No_failure', alpha=0.7)

# Add labels and title
plt.xlabel('X-axis label')
plt.ylabel('Y-axis label')
plt.title('Scatter Plot for Failure Status based on Wind Speed Vs Power')

# Display the scatter plot plt.
plt.show()

#(2)Scatter plot for Failure_Status depending upon Yaw Angle Vs Wind Direction
import pandas as pd
import matplotlib.pyplot as plt

df.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = df[df[category_column] == 'Failure']
category2_data = df[df[category_column] == 'No_failure']

# Create the scatter plot with different colors
plt.figure(figsize=(8, 7))
plt.scatter(category1_data['Yaw_angle'], category1_data['Wind_direction'], color='blue', label='Failure', alpha=0.5)
plt.scatter(category2_data['Yaw_angle'], category2_data['Wind_direction'], color='orange', label='No_failure', alpha=0.7)

# Add labels and title
plt.xlabel('X-axis label')
plt.ylabel('Y-axis label')
plt.title('Scatter Plot for Failure Status based on Yaw_angle Vs Wind_direction')

# Display the scatter plot plt.
plt.show()

#(3)Scatter plot for Temperatures depending upon Rotor Speed Vs Generator Speed
import pandas as pd
import matplotlib.pyplot as plt

df.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = df[df[category_column] == 'Failure']
category2_data = df[df[category_column] == 'No_failure']

# Create the scatter plot with different colors
plt.figure(figsize=(8, 7))
plt.scatter(category1_data['Yaw_angle'], category1_data['Wind_direction'], color='blue', label='Failure', alpha=0.5)
plt.scatter(category2_data['Yaw_angle'], category2_data['Wind_direction'], color='orange', label='No_failure', alpha=0.7)

# Add labels and title
plt.xlabel('X-axis label')
plt.ylabel('Y-axis label')
plt.title('Scatter Plot for Failure Status based on Yaw_angle Vs Wind_direction')

# Display the scatter plot plt.
plt.show()

#-------------------------------------------------------------------------------

#Correlation coefficient

#Correlation Coefficient for Wind_Speed and Power
correlation_coefficient = df['Wind_speed'].corr(df['Power'])
print(f"Pearson Correlation Coefficient: {correlation_coefficient}")

#Correlation Coefficient for Power and Wind_direction
correlation_coefficient = df['Power'].corr(df['Wind_direction'])
print(f"Pearson Correlation Coefficient: {correlation_coefficient}")

#Correlation Coefficient for Generator_speed and Wheel_hub_temperature
correlation_coefficient = df['Generator_speed'].corr(df['Wheel_hub_temperature'])
print(f"Pearson Correlation Coefficient: {correlation_coefficient}")

#Correlation Coefficient for Rotor_Speed and Bearing_temperature
correlation_coefficient = df['Rotor_Speed'].corr(df['Bearing_temperature'])
print(f"Pearson Correlation Coefficient: {correlation_coefficient}")

#-------------------------------------------------------------------------------

#Covariance Correlation coefficient

#Covariance Correlation coefficient for Wind Speed and Power
covariance = df['Wind_speed'].cov(df['Power'])
print(f"Covariance between Wind_speed and Power: {covariance}")

#Covariance Correlation coefficient for Power and Wind_direction
covariance = df['Power'].cov(df['Wind_direction'])
print(f"Covariance between Power and Wind_direction: {covariance}")

#Covariance Correlation coefficient for Generator_speed and Wheel_hub_temperature
covariance = df['Generator_speed'].cov(df['Wheel_hub_temperature'])
print(f"Covariance between Generator_speed and Wheel_hub_temperature: {covariance}")

#Covariance Correlation coefficient for Rotor_Speed and Bearing_temperature
covariance = df['Rotor_Speed'].cov(df['Bearing_temperature'])
print(f"Covariance between Rotor_Speed and Bearing_temperature: {covariance}")

#-------------------------------------------------------------------------------

#Multivariate Analysis

import seaborn as sns
#correlation
correlation_metrics = df.corr()
fig = plt.figure(figsize=(14,9))
sns.heatmap(correlation_metrics, vmax = 0.9, square = True) 
plt.show()
print(correlation_metrics)

#After Preprocessing

##Loading the same data into another dataframe to do the datacleaning and data preprocessing methods.
import pandas as pd
import numpy as np

data = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Wind_turbine.csv")

#MEAN IMPUTATION

from sklearn.impute import SimpleImputer

#Mean imputing wind_speed column
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')# we are imputing the missing 
                            #values present in the wind speed column with strategy mean.
data["Wind_speed"] = pd.DataFrame(mean_imputer.fit_transform(data[["Wind_speed"]]))#then we transform
                            # the missing values with mean using fit_transform.
data["Wind_speed"].isna().sum()# there are no missing values present.

#Mean imputing Power column
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Power"] = pd.DataFrame(mean_imputer.fit_transform(data[["Power"]]))
data["Power"].isna().sum()
#Mean imputing Nacelle_ambient_temperature
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Nacelle_ambient_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Nacelle_ambient_temperature"]]))
data["Nacelle_ambient_temperature"].isna().sum()
#Mean imputing Nacelle_temperature
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Nacelle_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Nacelle_temperature"]]))
data["Nacelle_temperature"].isna().sum()
#Mean imputing Generator_speed
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Generator_speed"] = pd.DataFrame(mean_imputer.fit_transform(data[["Generator_speed"]]))
data["Generator_speed"].isna().sum()
#Mean imputing Yaw_angle
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Yaw_angle"] = pd.DataFrame(mean_imputer.fit_transform(data[["Yaw_angle"]]))
data["Yaw_angle"].isna().sum()
#Mean imputing Gear_box_inlet_temperature 
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Gear_box_inlet_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Gear_box_inlet_temperature"]]))
data["Gear_box_inlet_temperature"].isna().sum()


#NULL COUNT FOR CLEANED DATA
data.isna().sum() 

##OUTLIER TREATMENT
###Outlier treatment using IQR method
##Outlier treatment using IQR method
#for wind speed
from feature_engine.outliers import Winsorizer
# we are using the model with IQR method
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Wind_speed'])
data['Wind_speed'] = winsor_iqr.fit_transform(data[['Wind_speed']])
# the outliers present in wind_speed column are replaced with upper limit and lower limit.

#for power
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Power'])
data['Power'] = winsor_iqr.fit_transform(data[['Power']])

#for Nacelle ambient temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Nacelle_ambient_temperature'])
data['Nacelle_ambient_temperature'] = winsor_iqr.fit_transform(data[['Nacelle_ambient_temperature']])

#for Generator_bearing_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Generator_bearing_temperature'])
data['Generator_bearing_temperature'] = winsor_iqr.fit_transform(data[['Generator_bearing_temperature']])

#for Gear_oil_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Gear_oil_temperature'])
data['Gear_oil_temperature'] = winsor_iqr.fit_transform(data[['Gear_oil_temperature']])

#for Ambient_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Ambient_temperature'])
data['Ambient_temperature'] = winsor_iqr.fit_transform(data[['Ambient_temperature']])

#for Rotor_Speed
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Rotor_Speed'])
data['Rotor_Speed'] = winsor_iqr.fit_transform(data[['Rotor_Speed']])

#for Nacelle_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Nacelle_temperature'])
data['Nacelle_temperature'] = winsor_iqr.fit_transform(data[['Nacelle_temperature']])

#for Bearing_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Bearing_temperature'])
data['Bearing_temperature'] = winsor_iqr.fit_transform(data[['Bearing_temperature']])

#for Generator_speed
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Generator_speed'])
data['Generator_speed'] = winsor_iqr.fit_transform(data[['Generator_speed']])

#for Yaw_angle
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Yaw_angle'])
data['Yaw_angle'] = winsor_iqr.fit_transform(data[['Yaw_angle']])

#for Wind_direction
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Wind_direction'])
data['Wind_direction'] = winsor_iqr.fit_transform(data[['Wind_direction']])

#for Gear_box_inlet_temperature
winsor_iqr = Winsorizer(capping_method = 'iqr', # iqr method is for replacing boundaries in place of outliers.
                          tail = 'both', # both tails means looking for outliers on both sides.
                          fold = 1.5, # fold value is used to multiply IQR to calculate max or min allowed values.
                          variables = ['Gear_box_inlet_temperature'])
data['Gear_box_inlet_temperature'] = winsor_iqr.fit_transform(data[['Gear_box_inlet_temperature']])

###OUTLIERS COUNT AFTER FOR CLEANED DATA
###using iqr method 
#for wind speed
IQR = data['Wind_speed'].quantile(0.75) - data['Wind_speed'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Wind_speed'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Wind_speed'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Wind_speed'] < lower_limit) | (data['Wind_speed'] > upper_limit)])
outliers_count

#for power
IQR = data['Power'].quantile(0.75) - data['Power'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Power'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Power'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Power'] < lower_limit) | (data['Power'] > upper_limit)])
outliers_count

#for nacelle ambient temperature
IQR = data['Nacelle_ambient_temperature'].quantile(0.75) - data['Nacelle_ambient_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Nacelle_ambient_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Nacelle_ambient_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Nacelle_ambient_temperature'] < lower_limit) | (data['Nacelle_ambient_temperature'] > upper_limit)])
outliers_count

#for Generator bearing temperature
IQR = data['Generator_bearing_temperature'].quantile(0.75) - data['Generator_bearing_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Generator_bearing_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Generator_bearing_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Generator_bearing_temperature'] < lower_limit) | (data['Generator_bearing_temperature'] > upper_limit)])
outliers_count

#for gear oil temperature
IQR = data['Gear_oil_temperature'].quantile(0.75) - data['Gear_oil_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Gear_oil_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Gear_oil_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Gear_oil_temperature'] < lower_limit) | (data['Gear_oil_temperature'] > upper_limit)])
outliers_count

#for ambient temperature
IQR = data['Ambient_temperature'].quantile(0.75) - data['Ambient_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Ambient_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Ambient_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Ambient_temperature'] < lower_limit) | (data['Ambient_temperature'] > upper_limit)])
outliers_count

#for rotor speed
IQR = data['Rotor_Speed'].quantile(0.75) - data['Rotor_Speed'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Rotor_Speed'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Rotor_Speed'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Rotor_Speed'] < lower_limit) | (data['Rotor_Speed'] > upper_limit)])
outliers_count

#for nacelle temperature
IQR = data['Nacelle_temperature'].quantile(0.75) - data['Nacelle_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Nacelle_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Nacelle_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Nacelle_temperature'] < lower_limit) | (data['Nacelle_temperature'] > upper_limit)])
outliers_count

#for bearing temperature
IQR = data['Bearing_temperature'].quantile(0.75) - data['Bearing_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Bearing_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Bearing_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Bearing_temperature'] < lower_limit) | (data['Bearing_temperature'] > upper_limit)])
outliers_count

#for generator speed
IQR = data['Generator_speed'].quantile(0.75) - data['Generator_speed'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Generator_speed'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Generator_speed'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Generator_speed'] < lower_limit) | (data['Generator_speed'] > upper_limit)])
outliers_count

#for yaw angle
IQR = data['Yaw_angle'].quantile(0.75) - data['Yaw_angle'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Yaw_angle'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Yaw_angle'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Yaw_angle'] < lower_limit) | (data['Yaw_angle'] > upper_limit)])
outliers_count

#for wind direction
IQR = data['Wind_direction'].quantile(0.75) - data['Wind_direction'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Wind_direction'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Wind_direction'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Wind_direction'] < lower_limit) | (data['Wind_direction'] > upper_limit)])
outliers_count

#for wheel hub temperature
IQR = data['Wheel_hub_temperature'].quantile(0.75) - data['Wheel_hub_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Wheel_hub_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Wheel_hub_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Wheel_hub_temperature'] < lower_limit) | (data['Wheel_hub_temperature'] > upper_limit)])
outliers_count

#for gear box inlet temperature
IQR = data['Gear_box_inlet_temperature'].quantile(0.75) - data['Gear_box_inlet_temperature'].quantile(0.25)
# Define lower and upper bounds
lower_limit = data['Gear_box_inlet_temperature'].quantile(0.25) - 1.5 * IQR
upper_limit = data['Gear_box_inlet_temperature'].quantile(0.75) + 1.5 * IQR

# Count outliers
outliers_count = len(data[(data['Gear_box_inlet_temperature'] < lower_limit) | (data['Gear_box_inlet_temperature'] > upper_limit)])
outliers_count

###EXPLORATORY DATA ANALYSIS
#Measures of central tendency-first moment business decision
#first moment for wind speed
data.Wind_speed.mean()
data.Wind_speed.median()
data.Wind_speed.mode()
#first moment for power
data.Power.mean()
data.Power.median()
data.Power.mode()
#first moment for Nacelle_ambient_temperature
data.Nacelle_ambient_temperature.mean()
data.Nacelle_ambient_temperature.median()
data.Nacelle_ambient_temperature.mode()
# first moment for Generator_bearing_temperature
data.Generator_bearing_temperature.mean()
data.Generator_bearing_temperature.median()
data.Generator_bearing_temperature.mode()
#For Gear_oil_temperature
data.Gear_oil_temperature.mean()
data.Gear_oil_temperature.median()
data.Gear_oil_temperature.mode()
#For Ambient_temperature
data.Ambient_temperature.mean()
data.Ambient_temperature.median()
data.Ambient_temperature.mode()
#For Rotor_Speed
data.Rotor_Speed.mean()
data.Rotor_Speed.median()
data.Rotor_Speed.mode()
#For Nacelle_temperature
data.Nacelle_temperature.mean()
data.Nacelle_temperature.median()
data.Nacelle_temperature.mode()
#for Bearing_temperature
data.Bearing_temperature.mean()
data.Bearing_temperature.median()
data.Bearing_temperature.mode()
#for Generator_speed
data.Generator_speed.mean()
data.Generator_speed.median()
data.Generator_speed.mode()
#for Yaw_angle
data.Yaw_angle.mean()
data.Yaw_angle.median()
data.Yaw_angle.mode()
#for Wind_direction
data.Wind_direction.mean()
data.Wind_direction.median()
data.Wind_direction.mode()
#for Wheel_hub_temperature
data.Wheel_hub_temperature.mean()
data.Wheel_hub_temperature.median()
data.Wheel_hub_temperature.mode()
#for Gear_box_inlet_temperature
data.Gear_box_inlet_temperature.mean()
data.Gear_box_inlet_temperature.median()
data.Gear_box_inlet_temperature.mode()

#Measures of dispersion-Second moment business decision
#for wind_speed
data.Wind_speed.var()
data.Wind_speed.std()
range=max(data.Wind_speed)-min(data.Wind_speed)
range
min(data.Wind_speed)
max(data.Wind_speed)
#for power
data.Power.var()
data.Power.std()
range = max(data.Power)-min(data.Power)
range
min(data.Power)
max(data.Power)
#for Nacelle_ambient_temperature
data.Nacelle_ambient_temperature.var() 
data.Nacelle_ambient_temperature.std()
range = max(data.Nacelle_ambient_temperature)-min(data.Nacelle_ambient_temperature)
range
min(data.Nacelle_ambient_temperature)
max(data.Nacelle_ambient_temperature)
# for Generator_bearing_temperature
data.Generator_bearing_temperature.var()
data.Generator_bearing_temperature.std()
range = max(data.Generator_bearing_temperature)-min(data.Generator_bearing_temperature)
range
min(data.Generator_bearing_temperature)
max(data.Generator_bearing_temperature)
#for Gear_oil_temperature
data.Gear_oil_temperature.var()
data.Gear_oil_temperature.std()
range = max(data.Gear_oil_temperature)-min(data.Gear_oil_temperature)
range
min(data.Gear_oil_temperature)
max(data.Gear_oil_temperature)
#for Ambient_temperature
data.Ambient_temperature.var()
data.Ambient_temperature.std()
range = max(data.Ambient_temperature)-min(data.Ambient_temperature)
range
min(data.Ambient_temperature)
max(data.Ambient_temperature)
#rotor speed
data.Rotor_Speed.var()
data.Rotor_Speed.std()
range = max(data.Rotor_Speed)-min(data.Rotor_Speed)
range
min(data.Rotor_Speed)
max(data.Rotor_Speed)
#Nacelle_temperature
data.Nacelle_temperature.var()
data.Nacelle_temperature.std()
range = max(data.Nacelle_temperature)-min(data.Nacelle_temperature)
range
min(data.Nacelle_temperature)
max(data.Nacelle_temperature)
#Bearing_temperature
data.Bearing_temperature.var()
data.Bearing_temperature.std()
range = max(data.Bearing_temperature)-min(data.Bearing_temperature)
range
min(data.Bearing_temperature)
max(data.Bearing_temperature)
#Generator_speed
data.Generator_speed.var()
data.Generator_speed.std()
range = max(data.Generator_speed)-min(data.Generator_speed)
range
min(data.Generator_speed)
max(data.Generator_speed)
#Yaw_angle
data.Yaw_angle.var()
data.Yaw_angle.std()
range = max(data.Yaw_angle)-min(data.Yaw_angle)
range
min(data.Yaw_angle)
max(data.Yaw_angle)
#Wind_direction
data.Wind_direction.var()
data.Wind_direction.std()
range = max(data.Wind_direction)-min(data.Wind_direction)
range
min(data.Wind_direction)
max(data.Wind_direction)
#Wheel_hub_temperature
data.Wheel_hub_temperature.var()
data.Wheel_hub_temperature.std()
range = max(data.Wheel_hub_temperature)-min(data.Wheel_hub_temperature)
range
min(data.Wheel_hub_temperature)
max(data.Wheel_hub_temperature)
#Gear_box_inlet_temperature
data.Gear_box_inlet_temperature.var()
data.Gear_box_inlet_temperature.std()
range = max(data.Gear_box_inlet_temperature)-min(data.Gear_box_inlet_temperature)
range
min(data.Gear_box_inlet_temperature)
max(data.Gear_box_inlet_temperature)

#Third moment business decision
data.Wind_speed.skew()
data.Power.skew()
data.Nacelle_ambient_temperature.skew()
data.Generator_bearing_temperature.skew()
data.Gear_oil_temperature.skew()
data.Ambient_temperature.skew()
data.Rotor_Speed.skew()
data.Nacelle_temperature.skew()
data.Bearing_temperature.skew()
data.Generator_speed.skew()
data.Yaw_angle.skew()
data.Wind_direction.skew()
data.Wheel_hub_temperature.skew()
data.Gear_box_inlet_temperature.skew()


#Fourth moment business decision
data.Wind_speed.kurt()
data.Power.kurt()
data.Nacelle_ambient_temperature.kurt()
data.Generator_bearing_temperature.kurt()
data.Gear_oil_temperature.kurt()
data.Ambient_temperature.kurt()
data.Rotor_Speed.kurt()
data.Nacelle_temperature.kurt()
data.Bearing_temperature.kurt()
data.Generator_speed.kurt()
data.Yaw_angle.kurt()
data.Wind_direction.kurt()
data.Wheel_hub_temperature.kurt()
data.Gear_box_inlet_temperature.kurt()



###########TRANSFORMATION FOR CLEANED DATA
#Importing the necessary libraries
import scipy.stats as stats
import pylab

# Checking whether Wind_speed is normally distributed
stats.probplot(data.Wind_speed, dist = "norm", plot = pylab)

# Transformation to make wind speed variable normal
stats.probplot(np.sqrt(data.Wind_speed), dist = "norm", plot = pylab)
data['Wind_speed'] = np.sqrt(data['Wind_speed'])

# Checking whether Gear_oil_temperature is normally distributed
stats.probplot(data.Gear_oil_temperature, dist = "norm", plot = pylab)

# Transformation to make wind Gear_oil_temperature variable normal
stats.probplot(np.log(data.Gear_oil_temperature), dist = "norm", plot = pylab)
data['Gear_oil_temperature'] = np.log(data['Gear_oil_temperature'])

# Checking whether Rotor_speed is normally distributed
stats.probplot(data.Rotor_Speed, dist = "norm", plot = pylab)

# Transformation to make Rotor Speed variable normal
stats.probplot(np.sqrt(data.Rotor_Speed), dist = "norm", plot = pylab)
data['Rotor_Speed'] = np.sqrt(data['Rotor_Speed'])

# Checking whether Gear_box_inlet_temperature is normally distributed
stats.probplot(data.Wind_speed, dist = "norm", plot = pylab)

# Transformation to make Gear_box_inlet_temperature variable normal
stats.probplot(np.sqrt(data.Gear_box_inlet_temperature), dist = "norm", plot = pylab)
data['Gear_box_inlet_temperature'] = np.sqrt(data['Gear_box_inlet_temperature'])




#########Nxt graphical representation(univariate,bivariate,mutlivariate)
#Add correlation coefficient before multivariate

#Scatter plot
#Scatter plot for Failure_Status depending upon Wind_Power Vs Power
import pandas as pd
import matplotlib.pyplot as plt

df.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = df[df[category_column] == 'Failure']
category2_data = df[df[category_column] == 'No_failure']

# Create the scatter plot with different colors
plt.figure(figsize=(8, 7))
plt.scatter(category1_data['Wind_speed'], category1_data['Power'], color='blue', label='Failure', alpha=0.5)
plt.scatter(category2_data['Wind_speed'], category2_data['Power'], color='orange', label='No_failure', alpha=0.7)

# Add labels and title
plt.xlabel('X-axis label')
plt.ylabel('Y-axis label')
plt.title('Scatter Plot for Failure Status based on Wind Speed Vs Power')

# Display the scatter plot plt.
plt.show()



###########CORRELATION COEFFICIENT
# Access the correlation coefficient between two specific columns 
#Wind_speed and Power
correlation_coefficient = data['Wind_speed'].corr(data['Power'])
print(correlation_coefficient)
correlation_coefficient

#Power and Wind_direction
correlation_coefficient = data['Power'].corr(data['Wind_direction'])
print(correlation_coefficient)
correlation_coefficient

#Generator_speed and Wheel_hub_temperature
correlation_coefficient = data['Generator_speed'].corr(data['Wheel_hub_temperature'])
print(correlation_coefficient)
correlation_coefficient

#Bearing_temperature and Rotor_Speed
correlation_coefficient = data['Bearing_temperature'].corr(data['Rotor_Speed'])
print(correlation_coefficient)
correlation_coefficient

###############COVARIANCE Correlation Coefficent
#Wind_speed and Power
covariance = data['Wind_speed'].cov(data['Power'])
print(covariance)
covariance

#Power and Wind_direction
covariance = data['Power'].cov(data['Wind_direction'])
print(covariance)
covariance

#Generator_speed and Wheel_hub_temperature
covariance = data['Generator_speed'].cov(data['Wheel_hub_temperature'])
print(covariance)
covariance

#Rotor_speed and Bearing temperature
covariance = data['Rotor_Speed'].cov(data['Bearing_temperature'])
print(covariance)
covariance

#Multivariate Analysis

import seaborn as sns
#correlation
correlation_metrics = data.corr()
fig = plt.figure(figsize=(14,9))
sns.heatmap(correlation_metrics, vmax = 0.9, square = True) 
plt.show()
print(correlation_metrics)

