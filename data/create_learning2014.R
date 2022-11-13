#Assignment 2  Eva Eskelinen, 12.11.2022 
# Reading the full data from learning2014 was a struggle and I'm still not sure if I did it correctly
# to read the data use: lrn <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
# I am not quite sure what the purpose of 'sep\t", header=TRUE' is in this function, but I guess it will be clearer at some point. This formula was from the exercise 2 sheet.

#The Process:

#Reading the data into R Studio
lrn <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
#Installing possible libraries that might be used
library(GGally)
library(ggplot2)
library(dplyr)
library(tidyverse)
# Combining questions of the data: Deep, surface and strategic questions
> deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
> surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
> strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
# Selecting columns related to deep learning, surface learning and strategic learning
  deep_columns <- select(lrn, one_of(deep_questions))
  lrn$deep <- rowMeans(deep_columns)
  surface_columns <- select(lrn, one_of(surface_questions))
  lrn$surf <- rowMeans(surface_columns)
  strategic_columns <- select(lrn, one_of(strategic_questions))
  lrn$stra <- rowMeans(strategic_columns)
# Combining wanted variables into one and renaming it
    keep_columns2 <- c( "gender", "Age", "Attitude", "deep", "stra", "surf", "Points")
> learning2015 <- keep_columns2
# Selecting wanted columns
> learning2015 <- select(lrn, one_of(keep_columns2))
> points <- filter(learning2015, Points > "0" )
> learning2015 <- points
# Checking the dimension of the dataset
    dim(learning2015)
    [1] 166  7
# Saving the data (Is there really no easier way?)
    write_csv("/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv")

#Reading data
    read_csv("/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv")
    Rows: 166 Columns: 7                                                                                    
    ── Column specification ─────────────────────────────────────────────
    Delimiter: ","
    chr (1): gender
    dbl (6): Age, Attitude, deep, stra, surf, Points
    
    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    # A tibble: 166 × 7
    gender   Age Attitude  deep  stra  surf Points
    <chr>  <dbl>    <dbl> <dbl> <dbl> <dbl>  <dbl>
      1 F         53       37  3.58  3.38  2.58     25
    2 M         55       31  2.92  2.75  3.17     12
    3 F         49       25  3.5   3.62  2.25     24
    4 M         53       35  3.5   3.12  2.25     10
    5 M         49       37  3.67  3.62  2.83     22
    6 F         38       38  4.75  3.62  2.42     21
    7 M         50       35  3.83  2.25  1.92     21
    8 F         37       29  3.25  4     2.83     31
    9 M         37       38  4.33  4.25  2.17     24
    10 F         42       21  4     3.5   3        26
    # … with 156 more rows
    # ℹ Use `print(n = ...)` to see more rows
    
#Making sure the structure is correct
    str("/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv")
    chr "/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv"
    head("/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv")
    [1] "/Users/evaeskelinen/Documents/GitHub/IODS/data/learning2015.csv"