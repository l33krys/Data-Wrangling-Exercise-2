# 0: Installed packages tidyr, dplyr, readxls to import xls file and wrangle data

library(tidyr)
library(dplyr)
library(readxl)
titanic_original <- read_excel("Documents/Data Science Intro/Data Wrangling/titanic_original.xls")

# 1: Port of embarkation

# Used replace() to replace all NA values in the embarked column as "S"
titanic_original$embarked <- replace(titanic_original$embarked, is.na(titanic_original$embarked), "S")
unique(titanic_original$embarked)

# 2: Age

# Used mean() to calculate the average age excluding NA values
mean(titanic_original$age, na.rm = TRUE)

# Used replace() and is.na to change all NA values to the overall mean
titanic_original$age <- replace(titanic_original$age, is.na(titanic_original$age), 29.88113)

# Checked average again to make sure it stayed the same
mean(titanic_original$age, na.rm = TRUE)

### 3: Lifeboat

# Used replace() and is.na to change all NA values to "None"
titanic_original$boat <- replace(titanic_original$boat, is.na(titanic_original$boat), "None")

# Looked at the unique values of the column to make sure all NA values now show as "None"
unique(titanic_original$boat)

# 4: Cabin

# Used mutate to add column "has_cabin_number" with the values from the cabin column
titanic_clean <- mutate(titanic_original, "has_cabin_number" = titanic_original$cabin)

# Used replace() and is.na to replace all NA values with 0
titanic_clean$has_cabin_number <- replace(titanic_clean$has_cabin_number, is.na(titanic_clean$has_cabin_number), 0)

# Used replace() to update anything that was not NA to a 1
titanic_clean$has_cabin_number <- replace(titanic_clean$has_cabin_number, titanic_clean$has_cabin_number != 0, 1)

### 5: Submit the project on Github