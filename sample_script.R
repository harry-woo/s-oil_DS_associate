rm(list = ls())

1 + 1; 2 + 2
2 * 3 + 4

3 ^ 3

5 %/% 2  # 5를 2로 나눈 나머지지
# 5 %/% 2
# 주석(comment)
# 주석처리 단축키는 컨쉬C

#### 1. 시작하기 ####

#### 2. 기본문법 ####

# 알파벳 3개 이상 입력하면 자동완성 활성화됨

df <- iris

# install.packages("beepr")
# 패키지 설치 후에는 주석처리 권장
library(beepr)
beep(11)
beepr::beep(11)

# install.packages("data.table")
# install.packages("tidyverse")

getwd() # Get working directory address
?getwd

# https://github.com/encaion/s_oil_ProDS_Asso_R

aws <- read.delim("AWS_sample.txt", 
                  sep = "#",
                  stringsAsFactors = FALSE)
head(aws)

df <- read.csv("bike.csv")
head(df, 2)

library(data.table)
df <- fread("bike.csv")
head(df, 2)

# install.packages("readxl")
library(readxl)
df <- read_excel("iris_xlsx.xlsx")
head(df, 2)

write.csv(df, "write_csv_basic.csv",
          row.names = FALSE)

library("readr")
write_tsv(df, "write_tsv.txt")

# install.packages("xlsx")
# install.packages("rJava")
library(rJava)
library(xlsx)
write.xlsx(df, "write_xlsx.xlsx")

# install.packages("writexl")

123345567
400 ^ 3
0.003 ^ 3
"abc"
'abc'
"abc'aaa"
'abc'aaa''

TRUE
FALSE
TRUE + FALSE
TRUE + TRUE
TRUE + FALSE + TRUE

c(1, 2, 3)
c(1, 3, "a")
aa <- c(2, 4, 6)
aa
aa[1]
aa[c(1, 3)]
aa[2] = "kkk"
aa
bb = aa
bb

matrix(c(1, 2, 3, 4))
matrix(c(1, 2, 3, 4), nrow = 2)
matrix(c(1, 2, 3, 4), ncol = 2)
matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)
mat <- matrix(c(1, 2, 3, 4), nrow = 2)
mat[1, ]
mat[, 1]
mat[1, 2]

# install.packages("imager")
library(imager)
img <- load.image("sample_cat_image.jpg")
img[1:3, 1:3, 1, 1]
plot(img)

img[,,, 1] <- 1 - img[,,, 1]
plot(img)

img[,,, 2] <- 1 - img[,,, 2]
img[,,, 3] <- 1 - img[,,, 3]
plot(img)

data.frame(aa = c(1, 2, 3),
           bb = c("a", "b", "c"))
data.frame(aa = c(1, 2, 3),
           bb = c("a", "b"))
df <- data.frame(aa = c(1, 2, 3),
                 bb = c("a", "b", "c"))
df
df$aa
df[, "aa"]
df[, 1]

30 + 50
30 - 50
30 * 50
30 / 50
10 > 20
10 < 20
10 >= 20
10 <= 20
10 >= 10
10 <= 10
10 == 10

"감자" == "고구마"
"감자" != "고구마"

abs(-3)

round(24.51, 1)
round(24.51, -1)

floor(24.9)
ceiling(24.9)

1:5
1.5:5
1.5:6
1.5:1.5
1.5:2.6

seq(1, 3)
seq(1, 3, 2)
seq(1, 3, 1.2)
seq(from = 1, to = 3, legnth.out = 8)

rep(1:3, 5)
rep("안녕", 5)

rep(1:3, 4)
rep(4, 1:3)
rep(x = 1:3, times = 4)
rep(times = 4, x = 1:3)

aws <- read.csv("AWS_sample.txt", sep = "#")
head(aws)
tail(aws)
head(aws, 2)
str(aws)
summary(aws)
nrow(aws)
ncol(aws)
colnames(aws)

head(aws)

AA <- aws[,c("TM", "Wind")]

library(dplyr)
BB <- aws %>% 
  select("TM", "Wind")

CC <- subset(aws, select = c("TM", "Wind"))

identical(AA, BB)
identical(BB, CC)

colnames(aws)[c(2, 4)]

aws[2, ]
aws[125, ]
aws[3:10, ]
aws[c(2, 135, 3:10), ]

aws[, 1]
aws[, 3]
aws[, c(1, 3)]
aws[, c("AWS_ID", "TA")]
colnames(aws)

aws[c(1, 3), "Wind"]
aws[c(2, 4), c("Wind", "AWS_ID")]
aws[1:3, -5]
aws[1:3, -c(2, 4)]
