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
df <- read.excel("iris_xlsx.xlsx")
head(df, 2)


