---
title: 'cm005: `dplyr` Exercise'
output:
    html_document:
        keep_md: true
---

**Optional, but recommended startup**:

Change the file output to both html and md _documents_ (not notebook).

# Intro to `dplyr` syntax

1. Load the `gapminder` and `tidyverse` packages. Hint: `suppressPackageStartupMessages()`!
    - This loads `dplyr`, too.
2. `knit` the document. 

```r
library(gapminder)
library(tidyverse)
```

```
## -- Attaching packages ----------------------------------------------------------------------------------------------------------- tidyverse 1.2.1 --
```

```
## <U+221A> ggplot2 3.0.0     <U+221A> purrr   0.2.5
## <U+221A> tibble  1.4.2     <U+221A> dplyr   0.7.6
## <U+221A> tidyr   0.8.1     <U+221A> stringr 1.3.1
## <U+221A> readr   1.1.1     <U+221A> forcats 0.3.0
```

```
## -- Conflicts -------------------------------------------------------------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

## `select()`

1. Make a data frame containing the columns `year`, `lifeExp`, `country` from the gapminder data, in that order.

```r
select(gapminder, year, lifeExp, country)
```

```
## # A tibble: 1,704 x 3
##     year lifeExp country    
##    <int>   <dbl> <fct>      
##  1  1952    28.8 Afghanistan
##  2  1957    30.3 Afghanistan
##  3  1962    32.0 Afghanistan
##  4  1967    34.0 Afghanistan
##  5  1972    36.1 Afghanistan
##  6  1977    38.4 Afghanistan
##  7  1982    39.9 Afghanistan
##  8  1987    40.8 Afghanistan
##  9  1992    41.7 Afghanistan
## 10  1997    41.8 Afghanistan
## # ... with 1,694 more rows
```
2. Select all variables, from `country` to `lifeExp`. 

```r
select(gapminder, country:lifeExp)
```

```
## # A tibble: 1,704 x 4
##    country     continent  year lifeExp
##    <fct>       <fct>     <int>   <dbl>
##  1 Afghanistan Asia       1952    28.8
##  2 Afghanistan Asia       1957    30.3
##  3 Afghanistan Asia       1962    32.0
##  4 Afghanistan Asia       1967    34.0
##  5 Afghanistan Asia       1972    36.1
##  6 Afghanistan Asia       1977    38.4
##  7 Afghanistan Asia       1982    39.9
##  8 Afghanistan Asia       1987    40.8
##  9 Afghanistan Asia       1992    41.7
## 10 Afghanistan Asia       1997    41.8
## # ... with 1,694 more rows
```
3. Select all variables, except `lifeExp`.

```r
select(gapminder, -lifeExp)
```

```
## # A tibble: 1,704 x 5
##    country     continent  year      pop gdpPercap
##    <fct>       <fct>     <int>    <int>     <dbl>
##  1 Afghanistan Asia       1952  8425333      779.
##  2 Afghanistan Asia       1957  9240934      821.
##  3 Afghanistan Asia       1962 10267083      853.
##  4 Afghanistan Asia       1967 11537966      836.
##  5 Afghanistan Asia       1972 13079460      740.
##  6 Afghanistan Asia       1977 14880372      786.
##  7 Afghanistan Asia       1982 12881816      978.
##  8 Afghanistan Asia       1987 13867957      852.
##  9 Afghanistan Asia       1992 16317921      649.
## 10 Afghanistan Asia       1997 22227415      635.
## # ... with 1,694 more rows
```
4. Put `continent` first. Hint: use the `everything()` function.

```r
select(gapminder, continent, everything())
```

```
## # A tibble: 1,704 x 6
##    continent country      year lifeExp      pop gdpPercap
##    <fct>     <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Asia      Afghanistan  1952    28.8  8425333      779.
##  2 Asia      Afghanistan  1957    30.3  9240934      821.
##  3 Asia      Afghanistan  1962    32.0 10267083      853.
##  4 Asia      Afghanistan  1967    34.0 11537966      836.
##  5 Asia      Afghanistan  1972    36.1 13079460      740.
##  6 Asia      Afghanistan  1977    38.4 14880372      786.
##  7 Asia      Afghanistan  1982    39.9 12881816      978.
##  8 Asia      Afghanistan  1987    40.8 13867957      852.
##  9 Asia      Afghanistan  1992    41.7 16317921      649.
## 10 Asia      Afghanistan  1997    41.8 22227415      635.
## # ... with 1,694 more rows
```

```r
?everything()
```

```
## Help on topic 'everything' was found in the following packages:
## 
##   Package               Library
##   dplyr                 /Library/Frameworks/R.framework/Versions/3.5/Resources/library
##   tidyselect            /Library/Frameworks/R.framework/Versions/3.5/Resources/library
## 
## 
## Using the first match ...
```
5. Rename `continent` to `cont`.

```r
rename(gapminder, cont=continent)
```

```
## # A tibble: 1,704 x 6
##    country     cont   year lifeExp      pop gdpPercap
##    <fct>       <fct> <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia   1952    28.8  8425333      779.
##  2 Afghanistan Asia   1957    30.3  9240934      821.
##  3 Afghanistan Asia   1962    32.0 10267083      853.
##  4 Afghanistan Asia   1967    34.0 11537966      836.
##  5 Afghanistan Asia   1972    36.1 13079460      740.
##  6 Afghanistan Asia   1977    38.4 14880372      786.
##  7 Afghanistan Asia   1982    39.9 12881816      978.
##  8 Afghanistan Asia   1987    40.8 13867957      852.
##  9 Afghanistan Asia   1992    41.7 16317921      649.
## 10 Afghanistan Asia   1997    41.8 22227415      635.
## # ... with 1,694 more rows
```
## `arrange()`

1. Order by year.

```r
arrange(gapminder, year)
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Albania     Europe     1952    55.2  1282697     1601.
##  3 Algeria     Africa     1952    43.1  9279525     2449.
##  4 Angola      Africa     1952    30.0  4232095     3521.
##  5 Argentina   Americas   1952    62.5 17876956     5911.
##  6 Australia   Oceania    1952    69.1  8691212    10040.
##  7 Austria     Europe     1952    66.8  6927772     6137.
##  8 Bahrain     Asia       1952    50.9   120447     9867.
##  9 Bangladesh  Asia       1952    37.5 46886859      684.
## 10 Belgium     Europe     1952    68    8730405     8343.
## # ... with 1,694 more rows
```
2. Order by year, in descending order.

```r
arrange(gapminder, desc(year))
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp       pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>     <int>     <dbl>
##  1 Afghanistan Asia       2007    43.8  31889923      975.
##  2 Albania     Europe     2007    76.4   3600523     5937.
##  3 Algeria     Africa     2007    72.3  33333216     6223.
##  4 Angola      Africa     2007    42.7  12420476     4797.
##  5 Argentina   Americas   2007    75.3  40301927    12779.
##  6 Australia   Oceania    2007    81.2  20434176    34435.
##  7 Austria     Europe     2007    79.8   8199783    36126.
##  8 Bahrain     Asia       2007    75.6    708573    29796.
##  9 Bangladesh  Asia       2007    64.1 150448339     1391.
## 10 Belgium     Europe     2007    79.4  10392226    33693.
## # ... with 1,694 more rows
```
3. Order by year, then by life expectancy.

```r
arrange(gapminder, year, lifeExp)
```

```
## # A tibble: 1,704 x 6
##    country       continent  year lifeExp     pop gdpPercap
##    <fct>         <fct>     <int>   <dbl>   <int>     <dbl>
##  1 Afghanistan   Asia       1952    28.8 8425333      779.
##  2 Gambia        Africa     1952    30    284320      485.
##  3 Angola        Africa     1952    30.0 4232095     3521.
##  4 Sierra Leone  Africa     1952    30.3 2143249      880.
##  5 Mozambique    Africa     1952    31.3 6446316      469.
##  6 Burkina Faso  Africa     1952    32.0 4469979      543.
##  7 Guinea-Bissau Africa     1952    32.5  580653      300.
##  8 Yemen, Rep.   Asia       1952    32.5 4963829      782.
##  9 Somalia       Africa     1952    33.0 2526994     1136.
## 10 Guinea        Africa     1952    33.6 2664249      510.
## # ... with 1,694 more rows
```
## Piping, `%>%`

Note: think of `%>%` as the word "then"!

1. Combine `select()` Task 1 with `arrange()` Task 3.

```r
task1_task3 <- gapminder %>%
  select(year, lifeExp, country) %>%
  arrange(year, lifeExp)
```
## `filter()`

1. Only take data with population greater than 100 million.

```r
greaterthan <- gapminder %>%
  filter(pop > 100000000)
```
2. Of those, only take data from Asia.

```r
select(gapminder, continent)
```

```
## # A tibble: 1,704 x 1
##    continent
##    <fct>    
##  1 Asia     
##  2 Asia     
##  3 Asia     
##  4 Asia     
##  5 Asia     
##  6 Asia     
##  7 Asia     
##  8 Asia     
##  9 Asia     
## 10 Asia     
## # ... with 1,694 more rows
```

```r
asia_greater_than <- gapminder %>%
  filter(pop > 100000000 & continent == "Asia")
```
## git stuff (Optional)

Knit, commit, push!

# Break/Challenge: metaprogramming

Here's an activity for you to do during the break, in case you're all caught up. It should help you understand metaprogramming a bit more.

Suppose you're the instructor of an R programming course. You write an assignment question to evaluate whether students can write an `if` statement, for which an answer to the question looks something like this:

```
my_commute <- 60
if (my_commute > 30) {
    print("That's a long commute!")
} else {
    print("That's a short commute.")
}
```

Your task is to use metaprogramming to check whether a response (like the one above) works and contains an `if` statement. You should roughly follow these steps, using [adv-r: expressions](https://adv-r.hadley.nz/expressions.html) as a resource (especially Section 18.1).

1. Wrap the above block of code in the `expr()` function from the `rlang` package.
2. Use the `eval()` function to execute the code, to see if the code runs.
3. Use the `as.character()` function to check whether this response contains an `if` statement.

# Relational/Comparison and Logical Operators in R

1. Find all entries of Canada and Algeria occuring in the '60s. 

```r
canada_algeria <- gapminder %>%
  filter((country == "Canada" | country == "Algeria") & year >= 1960 & year < 1970)
canada_algeria_easier_written <- gapminder %>%
  filter(country %in% c("Canada", "Algeria"), year >= 1960, year < 1970)
```
2. Find all entries of Canada, and entries of Algeria occuring in the '60s. 

```r
canada_and_algeriaonly_condition <- gapminder %>%
  filter((country == "Canada") | (country == "Algeria" & year >= 1960 & year < 1970))
```
3. Find all entries _not_ including Canada and Algeria.

```r
no_canada_algeria <- gapminder %>%
  filter(!country %in% c("Canada", "Algeria"))
```

# Bonus Exercises

If there's time remaining, we'll practice with these three exercises. I'll give you 1 minute for each, then we'll go over the answer.

1. Take all countries in Europe that have a GDP per capita greater than 10000, and select all variables except `gdpPercap`. (Hint: use `-`).

```r
a <- gapminder %>%
  filter(gdpPercap > 10000) %>%
  select(-gdpPercap)
```
2. Take the first three columns, and extract the names.
Note: I'm assuming this is the names of the first thre columns of the above variable(bonus task 1 variable).

```r
a
```

```
## # A tibble: 392 x 5
##    country   continent  year lifeExp      pop
##    <fct>     <fct>     <int>   <dbl>    <int>
##  1 Argentina Americas   1977    68.5 26983828
##  2 Argentina Americas   1997    73.3 36203463
##  3 Argentina Americas   2007    75.3 40301927
##  4 Australia Oceania    1952    69.1  8691212
##  5 Australia Oceania    1957    70.3  9712569
##  6 Australia Oceania    1962    70.9 10794968
##  7 Australia Oceania    1967    71.1 11872264
##  8 Australia Oceania    1972    71.9 13177000
##  9 Australia Oceania    1977    73.5 14074100
## 10 Australia Oceania    1982    74.7 15184200
## # ... with 382 more rows
```

```r
select(a, country:year)
```

```
## # A tibble: 392 x 3
##    country   continent  year
##    <fct>     <fct>     <int>
##  1 Argentina Americas   1977
##  2 Argentina Americas   1997
##  3 Argentina Americas   2007
##  4 Australia Oceania    1952
##  5 Australia Oceania    1957
##  6 Australia Oceania    1962
##  7 Australia Oceania    1967
##  8 Australia Oceania    1972
##  9 Australia Oceania    1977
## 10 Australia Oceania    1982
## # ... with 382 more rows
```

```r
distinct(a, country, continent)
```

```
## # A tibble: 57 x 2
##    country   continent
##    <fct>     <fct>    
##  1 Argentina Americas 
##  2 Australia Oceania  
##  3 Austria   Europe   
##  4 Bahrain   Asia     
##  5 Belgium   Europe   
##  6 Botswana  Africa   
##  7 Bulgaria  Europe   
##  8 Canada    Americas 
##  9 Chile     Americas 
## 10 Croatia   Europe   
## # ... with 47 more rows
```

3. Of the `iris` data frame, take all columns that start with the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the following code: `?tidyselect::select_helpers`.
    - Exercise from [r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).

```r
iris_stuff <- select(iris, starts_with("Petal"))
```
