# -*- coding: utf-8 -*-
"""
Created on Tue Nov  7 11:19:30 2023

@author: prave
"""

import pandas as pd
df = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Wind_turbine.csv")
df

df.head

df.dtypes

#identifying duplicates

duplicates = df.duplicated()

duplicates

#Removing duplicate

data = df.drop_duplicates() #Returns the dataframe with duplicate rows removed

#Finding Missing Values from the data where the duplicates has got removed
import pandas as pd
import numpy as np
data.isna().sum()

#Performing Mean Imputation
from sklearn.impute import SimpleImputer

#for Wind_Speed
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Wind_speed"] = pd.DataFrame(mean_imputer.fit_transform(data[["Wind_speed"]]))
data["Wind_speed"].isna().sum()

#for Power
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Power"] = pd.DataFrame(mean_imputer.fit_transform(data[["Power"]]))
data["Power"].isna().sum()

#for Nacelle_ambient_temperature
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Nacelle_ambient_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Nacelle_ambient_temperature"]]))
data["Nacelle_ambient_temperature"].isna().sum()

#for Nacelle_temperature
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Nacelle_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Nacelle_temperature"]]))
data["Nacelle_temperature"].isna().sum()

#for Generator_speed
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Generator_speed"] = pd.DataFrame(mean_imputer.fit_transform(data[["Generator_speed"]]))
df["Generator_speed"].isna().sum()

#for Yaw_angle
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Yaw_angle"] = pd.DataFrame(mean_imputer.fit_transform(data[["Yaw_angle"]]))
data["Yaw_angle"].isna().sum()

#for Gear_box_inlet_temperature
mean_imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
data["Gear_box_inlet_temperature"] = pd.DataFrame(mean_imputer.fit_transform(data[["Gear_box_inlet_temperature"]]))
data["Gear_box_inlet_temperature"].isna().sum()

data.isna().sum()

#Finding mean, median and mode

import pandas as pd

#Wind_speed
data.Wind_speed.mean()
data.Wind_speed.median()
data.Wind_speed.mode()

#Power
data.Power.mean()
data.Power.median()
data.Power.mode()

#Rotor_Speed
data.Rotor_Speed.mean()
data.Rotor_Speed.median()
data.Rotor_Speed.mode()

#Nacelle ambient temperature
data.Nacelle_ambient_temperature.mean()
data.Nacelle_ambient_temperature.median()
data.Nacelle_ambient_temperature.mode()

#Generator bearing temperature
data.Generator_bearing_temperature.mean()
data.Generator_bearing_temperature.median()
data.Generator_bearing_temperature.mode()

#Gear_oil_temperature
data.Gear_oil_temperature.mean()
data.Gear_oil_temperature.median()
data.Gear_oil_temperature.mode()

#Ambient_temperature
data.Ambient_temperature.mean()
data.Ambient_temperature.median()
data.Ambient_temperature.mode()

#Nacelle_temperature
data.Nacelle_temperature.mean()
data.Nacelle_temperature.median()
data.Nacelle_temperature.mode()

#Bearing_temperature
data.Bearing_temperature.mean()
data.Bearing_temperature.median()
data.Bearing_temperature.mode()

#Generator_speed
data.Generator_speed.mean()
data.Generator_speed.median()
data.Generator_speed.mode()

#Wheel_hub_temperature
data.Wheel_hub_temperature.mean()
data.Wheel_hub_temperature.median()
data.Wheel_hub_temperature.mode()

#Gear box inlet temperature
data.Gear_box_inlet_temperature.mean()
data.Gear_box_inlet_temperature.median()
data.Gear_box_inlet_temperature.mode()

# variance
data.Power.var()
data.Rotor_Speed.var()
data.Nacelle_ambient_temperature.var()
data.Generator_bearing_temperature.var()
data.Gear_oil_temperature.var()
data.Ambient_temperature.var()
data.Nacelle_temperature.var()
data.Bearing_temperature.var()
data.Generator_speed.var()
data.Wheel_hub_temperature.var()
data.Gear_box_inlet_temperature.var()

# standard deviation
data.Power.std()
data.Rotor_Speed.std()
data.Nacelle_ambient_temperature.std()
data.Generator_bearing_temperature.std()
data.Gear_oil_temperature.std()
data.Ambient_temperature.std()
data.Nacelle_temperature.std()
data.Bearing_temperature.std()
data.Generator_speed.std()
data.Wheel_hub_temperature.std()
data.Gear_box_inlet_temperature.std()

#Range
wind_speed_range= max(data.Wind_speed) - min(data.Wind_speed)
wind_speed_range

Power_range= max(data.Power)- min(data.Power)
Power_range

Rotor_Speed_range= max(data.Rotor_Speed) - min(data.Rotor_Speed)
Rotor_Speed_range

Generator_speed_range= max(data.Generator_speed) - min(data.Generator_speed)
Generator_speed_range

Nacelle_ambient_temperature_range= max(data.Nacelle_ambient_temperature) - min(data.Nacelle_ambient_temperature)
Nacelle_ambient_temperature_range

Generator_bearing_temperature_range= max(data.Generator_bearing_temperature) - min(data.Generator_bearing_temperature)
Generator_bearing_temperature_range

Gear_oil_temperature_range= max(data.Gear_oil_temperature) - min(data.Gear_oil_temperature)
Gear_oil_temperature_range

Ambient_temperature_range= max(data.Ambient_temperature) - min(data.Ambient_temperature)
Ambient_temperature_range

Nacelle_temperature_range= max(data.Nacelle_temperature) - min(data.Nacelle_temperature)
Nacelle_temperature_range

Bearing_temperature_range= max(data.Bearing_temperature) - min(data.Bearing_temperature)
Bearing_temperature_range

Wheel_hub_temperature_range= max(data.Wheel_hub_temperature) - min(data.Wheel_hub_temperature)
Wheel_hub_temperature_range

Gear_box_inlet_temperature_range= max(data.Gear_box_inlet_temperature) - min(data.Gear_box_inlet_temperature)
Gear_box_inlet_temperature_range

#Skewness
data.Wind_speed.skew()
data.Power.skew()
data.Rotor_Speed.skew()
data.Generator_speed.skew()
data.Nacelle_ambient_temperature.skew()
data.Generator_bearing_temperature.skew()
data.Gear_oil_temperature.skew()
data.Ambient_temperature.skew()
data.Nacelle_temperature.skew()
data.Bearing_temperature.skew()
data.Wheel_hub_temperature.skew()
data.Gear_box_inlet_temperature.skew()

#Kurtosis
data.Wind_speed.kurt()
data.Power.kurt()
data.Rotor_Speed.kurt()
data.Generator_speed.kurt()
data.Nacelle_ambient_temperature.kurt()
data.Generator_bearing_temperature.kurt()
data.Gear_oil_temperature.kurt()
data.Ambient_temperature.kurt()
data.Nacelle_temperature.kurt()
data.Bearing_temperature.kurt()
data.Wheel_hub_temperature.kurt()
data.Gear_box_inlet_temperature.kurt()

#Bar_plot 
#(i)for Rotor_Speed Vs Generator_speed
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

plt.bar(data['Rotor_Speed'],data['Generator_speed'])

plt.show()

#(ii)for Wind_Speed Vs Rotor Speed

plt.bar(data['Wind_speed'],data['Rotor_Speed'])

plt.show()

#histogram
#(i)Histogram for Rotor Speed
import matplotlib.pyplot as plt
x = 'Rotor_Speed'
# Create the histogram
plt.hist(data[x], bins=10, color='pink', alpha=0.8) # 
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
plt.hist(data[x], bins=10, color='pink', alpha=0.8) # 
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
plt.hist(data[x], bins=10, color='pink', alpha=0.8) # 
# Add labels and title
plt.xlabel('Wind_speed')
plt.ylabel('Frequency')
plt.title('Histogram of ' + x)
# Display the histogram
plt.show()
#It is positively skewed OR right skewed
#Mean>Median>Mode


#Scatter plot
import matplotlib.pyplot as plt

# Replace 'column_x' and 'column_y' with the actual column names from your DataFrame
column_x = 'Wind_speed'
column_y = 'Power'

plt.figure(figsize=(8, 6))  # Set the size of the plot (optional)
plt.scatter(data['Wind_speed'], data['Power'], color='orange', alpha=0.7)  # Create scatter plot
plt.xlabel('Wind_speed')  # Set the label for the X-axis
plt.ylabel('Power')  # Set the label for the Y-axis
plt.title('Scatter Plot')  # Set the title of the plot
plt.grid(True)  # Add gridlines (optional)
plt.show()  # Display the plot

#Scatter plot for Failure_Status depending upon Wind_Power Vs Power
import pandas as pd
import matplotlib.pyplot as plt

data.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = data[data[category_column] == 'Failure']
category2_data = data[data[category_column] == 'No_failure']

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


#Scatter plot for Failure_Status depending upon Yaw Angle Vs Wind Direction
import pandas as pd
import matplotlib.pyplot as plt

data.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = data[data[category_column] == 'Failure']
category2_data = data[data[category_column] == 'No_failure']

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


#Scatter plot for Temperatures depending upon Rotor Speed Vs Generator Speed
import pandas as pd
import matplotlib.pyplot as plt

data.dtypes
# Choosen the two variables you want to compare
# here we have taken x_variable = 'Wind_speed' 
# here we have taken y_variable = 'Power' 

category_column = 'Failure_status'  # Column specifying the category or group

# Separate data points by category
category1_data = data[data[category_column] == 'Failure']
category2_data = data[data[category_column] == 'No_failure']

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

# Create scatter plot with different temperature as a category
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Wind_turbine.csv")

df.dtypes
# Choose the two variables you want to compare
x_variable = 'Rotor_Speed'
y_variable = 'Generator_speed'

category_column = [ 'Nacelle_ambient_temperature' ,'Generator_bearing_temperature','Bearing_temperature'] # Column specifying the category or group

category_colors = {
    'Nacelle_ambient_temperature': 'red',
    'Generator_bearing_temperature': 'blue',
    'Bearing_temperature': 'green'
}

plt.figure(figsize=(8, 6))
for category, color in category_colors.items():
    category_data = data[data[category_column] == category]
    plt.scatter(category_data[x_variable], category_data[y_variable], label=category, color=color, alpha=0.7)

# Add labels and title
plt.xlabel('X-axis label')
plt.ylabel('Y-axis label')
plt.title('Scatter Plot')
plt.legend() # Add a legend
plt.show() # Display the scatter plot


import pandas as pd
import matplotlib.pyplot as plt

df2 = pd.read_csv(r"C:\Users\prave\Downloads\100Records.csv")

df2.info()

plt.scatter(x = df2['Rotor_Speed'], y = df2['Nacelle_ambient_temperature']) 

plt.scatter(x = df2['Rotor_Speed'], y = df2['Generator_bearing_temperature'], color = 'green')

plt.scatter(x = df2['Rotor_Speed'], y = df2['Bearing_temperature)'], color = 'yellow')


# Define the upper and lower bounds for outliers (#Wind_direction AND Wind_speed)
import pandas as pd
import seaborn as sns

df = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Wind_turbine.csv")
df.dtypes

sns.boxplot(df.Wind_speed)

IQR = df['Wind_speed'].quantile(0.75) - df['Wind_speed'].quantile(0.25)
print(IQR)

lower_limit = df['Wind_speed'].quantile(0.25) - (IQR * 1.5)
print(lower_limit)

upper_limit = df['Wind_speed'].quantile(0.75) + (IQR * 1.5)
print(upper_limit)

import pandas as pd
import seaborn as sns

sns.boxplot(df.Wind_direction)

IQR = df['Wind_direction'].quantile(0.75) - df['Wind_direction'].quantile(0.25)
print(IQR)

lower_limit = df['Wind_direction'].quantile(0.25) - (IQR * 1.5)
print(lower_limit)

upper_limit = df['Wind_direction'].quantile(0.75) + (IQR * 1.5)
print(upper_limit)

#Using Standardization

import pandas as pd
import numpy as np

data = pd.read_csv(r"C:\Users\prave\Desktop\Data Analytics\Project Wind Turbine\Data Sets\Standardization.csv")

a = data.describe()

### Standardization
from sklearn.preprocessing import StandardScaler

# Initialise the Scaler
scaler = StandardScaler()

# To scale data
df = scaler.fit_transform(data)
# Convert the array back to a dataframe
dataset = pd.DataFrame(df)
res = dataset.describe()
print(dataset)

#In the context of standardization, values greater than 1 or less than 0 are not necessarily considered outliers. Standardization transforms your data in such a way that the mean is 0 and the standard deviation is 1. Values greater than 1 or less than -1 indicate that the data point is more than one standard deviation away from the mean.

#For most of our data after standardization falls between -2 and 2, a value of 4 or -4 and exceeding that could be considered an outlier because it's more than 2 standard deviations away from the mean.


#Python to SQL Connection
import pandas as pd
from sqlalchemy import create_engine
import mysql.connector

#Database credentials and information
db_config ={
       "user": "user3",
       "password" : "user3",
       "database" : "windturbine"
}

#Create a connection 
conn = mysql.connector.connect(**db_config)