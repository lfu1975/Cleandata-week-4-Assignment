
---
title: "PA1"
output: html_document
---

## Reproducible research week2 project

### 1. Load file

read the activity dataset and check data structure


```r
activity <- read.csv("activity.csv")
head(activity)
```

```
##   steps       date interval
## 1    NA 2012-10-01        0
## 2    NA 2012-10-01        5
## 3    NA 2012-10-01       10
## 4    NA 2012-10-01       15
## 5    NA 2012-10-01       20
## 6    NA 2012-10-01       25
```

```r
str(activity)
```

```
## 'data.frame':	17568 obs. of  3 variables:
##  $ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...
```

### 2.Histogram of the total number of steps taken everyday

calculate the sum of steps grouped by date, and plot the histogram


```r
library(dplyr)
library(tidyr)
grp <- group_by(activity,date)
total <- summarize(grp,sum=sum(steps))%>%
        rename(steps="sum")
total <- filter(total,!is.na(steps)==TRUE)
hist(total$steps,col="red",breaks=20, main ="Histogram of Total Steps per Day", xlab="Steps", ylab="Frequency")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

```r
dev.copy(png,"totalstephistogram.png")
```

```
## png 
##   3
```

```r
dev.off()
```

```
## png 
##   2
```

