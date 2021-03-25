rm(list = ls())

list.files() # WD의 폴더 및 파일 목록 조회
list.files(pattern = "data")
list.files(path = "data")
list.files(pattern = "AWS",
           recursive = TRUE) # 하위 폴더까지 조회
list.files(pattern = "data",
           full.names = TRUE)

file_path <- list.files(pattern = "AWS",
                        recursive = TRUE)
file_path
file_path[2]
aws <- read.csv(file_path[2], sep = "#")
head(aws, 2)

# 파일 경로에는 상대경로와 절대경로가 있다.

bike <- read.csv("c:/Users/user/Documents/s-oil_DS_associate/bike.csv")
head(bike, 2)

listt <- list(aa = 1:3,
              bb = matrix(1:4, nrow = 2),
              cc = list(dd = data.frame(v1 = 2:4,
                                        v2 = 4:6),
                        ee = c("a", "b", "c")))
listt
listt[1]
listt[[1]]
listt["aa"]
listt[["aa"]]

names(listt)
str(listt)
listt$aa[c(1, 3)]
listt$cc$ee
listt

head(aws)

aws_2 <- aws[c("AWS_ID", "TA", "Wind", "TM", "X.")]
head(aws_2)

bbb <- function(){
  print("Rloha")
}
bbb()

eee <- function(x){
  x + 3
}
eee(1)

# 함수의 파라미터 기본값이 들어 있는 경우
fff <- function(x = 4){
  x * 5
}
fff()
fff(x = 10)

# > 대괄호: 색인, 추출
# > 중괄호 : 여러 줄의 코드를 묶는 용도
# > 소괄호 : 함수의 인자를 묶음, 연산의 우선순위 지정

library(ggplot2)
library(dplyr)

addmargins(table(diamonds$cut, diamonds$clarity))


diamonds %>% 
  ggplot(aes(x = cut, y = clarity)) +
  geom_point()

data(diamonds)
table(diamonds["cut"]) / sum(table(diamonds["cut"]))

prop.table(table(diamonds["cut"]))
prop.table(table(diamonds$cut,
                 diamonds$clarity), margin = 1)
prop.table(table(diamonds$cut,
                 diamonds$clarity), margin = 2)

data("airquality")
df <- airquality
head(df, 2)

unique(df$Month)
quantile(df$Wind)
quantile(df$Wind, probs = 0.99)
quantile(df$Wind, probs = c(0.05, 0.95))

summary(df)

length(3:6)
length(c("a", "b", "c"))
length(unique(df$Month))
table(df$Month)

?table

# aggregate(data = df, formula = y~x1 + x2, FUN = "fun_name")
aggregate(data = iris, Sepal.Length ~ Species, FUN = "mean")

elec <- read.csv("elec_load.csv")
head(elec, 2)
aggregate(data = elec, X20HR ~ YEAR + MONTH,
          FUN = "mean")

elec_a <- aggregate(data = elec, X12HR ~ YEAR, FUN = "mean")
elec_a

df <- data.frame(obs = 1:100,
                 nums = runif(100))
df[, "bin"] = cut(df$nums, breaks = seq(0, 1, by = 0.05))
head(df, 3)

set.seed(123)
df <- data.frame(obs = 1:20,
                 age = sample(1:100, size = 20))
df$class <- (df$age %/% 5) * 5
df$class <- paste0(df$class, "~", df$class + 5)
head(df)

for(number in 1:3){
  print(number)
}

for(number in c(1, 3, 9)){
  print(number)
}

for(num in 3:6){
  print(num * num)
}

df_1 <- data.frame(aa = c("a", "b", "c", "d"),
                   bb = 1:4)
df_1

for(num in 1:4){
  df_1[num, "new_column"] = num * 2
}
df_1

for(i in 2:5){
  print(i)
  Sys.sleep(1)
}

n <- 3
if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다")
}

n <- 5
if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다")
}

df_1 <- data.frame(aa = c("a", "b", "c", "d"),
                   bb = 1:4)

for(n in 1:4){
  if(n >= 3){
    print(df_1[n, "bb"])
  } else {
    print("응?")
  }
}


df_1 <- data.frame(aa = c("a", "b", "c", "d"),
                   bb = 1:4)
df_1[df_1$bb >= 3, ]
df_1[df_1$aa == "b", ]
df_1[df_1$aa != "b", ]
df_1[(df_1$bb > 1) & (df_1$bb <4), ]

paste("a", "b", "c", sep = "-")
paste(c("a", "b", "c"), sep = "-")
paste(c("a", "b", "c"), collapse = "-")
paste0("a", "b", "c")
paste0(c("a", "b", "c"))

substr("abcdef", start = 2, stop = 4)

df <- iris
df[, "Species_sub"] <-  substr(df$Species, 1, 3)
head(df, 2)
unique(df$Species_sub)
unique(df[, c("Species", "Species_sub")])
table(df$Species, df$Species_sub)

paste0("file_", 1:4, ".csv")
paste0("file_", sprintf(fmt = "%02d", 1:4), ".csv")
?sprintf

for(n_file in 1:4){
  print(paste0("file_", n_file, ".csv"))
}

for(n_file in 1:4){
  print(paste0("file_", sprintf(fmt = "%02d", n_file), ".csv"))
}


bike <- read.csv("bike.csv")
for(season in unique(bike$season)){
  bike_sub = bike[bike$season == season, ]
  write.csv(bike_sub, 
            paste0("bike_season_", season, ".csv"),
            row.names = FALSE)
}
file_list <- list.files(pattern = "bike_season")
file_list

bike_bind <- data.frame()
for(file_path in file_list){
  bike_sub <- read.csv(file_path)
  print(nrow(bike_sub))
  bike_bind <- rbind(bike_bind, bike_sub)
  print(paste0("bind: ", nrow(bike_bind)))
}

aa <- 1234
bb <- "test"
cc <- TRUE
dd <- NA

class(aa)
class(bb)
class(cc)
class(dd)

is.numeric(aa)
is.character(bb)
is.logical(cc)
is.na(dd)
is.na(cc)

as.character(aa)
as.numeric(bb)
as.numeric("123")

as.character(cc)
as.numeric(cc)

as.character(dd)
as.numeric(dd)


gsub(pattern = ",", replacement = "", "1,234.456")
num = gsub(pattern = ",", replacement = "", "1,234.456")
as.numeric(num)

as.numeric(gsub(pattern = "[^0-9.]",
                replacement = "", "1,234.456원"))

dia <- read.csv("diamonds.csv")
head(dia, 2)
dia_tbl <- table(dia$color, dia$clarity)
dia_tbl

df_dia_tbl <- as.data.frame(dia_tbl)
head(df_dia_tbl)

colnames(df_dia_tbl) <- c("color", "clarity", "count")

max(df_dia_tbl$count); min(df_dia_tbl$count)
quantile(df_dia_tbl$count, probs = c(0, 1)) # quantile을 활용해 mix max 구하기

df_dia_tbl[df_dia_tbl$count == min(df_dia_tbl$count), ]

library(dplyr)
df_dia_tbl %>% filter(count == (min(df_dia_tbl$count) | max(df_dia_tbl$count)))


df_min <- df_dia_tbl[df_dia_tbl$count == min(df_dia_tbl$count), ]
df_max <- df_dia_tbl[df_dia_tbl$count == max(df_dia_tbl$count), ]

df_dia_tbl[which.min(df_dia_tbl$count), 2:3]
which.max(df_dia_tbl$count)

df_minmax <- rbind(df_min, df_max)
df_minmax


# install.packages("reshape2")
library("reshape2")

elec_melt <- melt(data = elec,
                  id.vars = colnames(elec)[1:3])
head(elec_melt)

colnames(elec_melt)[4:5] <- c("HOUR", "LOAD")

for(i in 1:nrow(elec_melt)){
  elec_melt[i, "HOUR_new"] = as.numeric(gsub(pattern = "[^0-9.]", 
                                             replacement = "", elec_melt[i, 4]))  
}

unique(elec_melt$HOUR)
unique(elec_melt$HOUR_new)
table(elec_melt$HOUR, elec_melt$HOUR_new)
xtabs(~ HOUR + HOUR_new, data = elec_melt)

class(elec_melt$HOUR_new)

elec_agg <- aggregate(data = elec_melt,
                      LOAD ~ YEAR + MONTH, FUN = "mean")
elec_cast <- dcast(data = elec_melt,
                   formula = YEAR ~ MONTH,
                   value.var = "LOAD",
                   fun.aggregate = mean)

elec_melt %>% 
  group_by(YEAR, MONTH) %>% 
  summarise(mean_LOAD = mean(LOAD))
