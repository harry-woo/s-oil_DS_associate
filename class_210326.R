dia <- read.csv("diamonds.csv")
head(dia)

# 다이아 가격이 900이상인 데이터 추출
dia_sub <- dia[dia$price >= 900, ]

# 추출된 데이터 중, 색상이 E, 투명도 VS1인 가격 평균 소수점 2째 자리 반올림
round(mean(dia_sub[dia_sub$color == "E" & dia_sub$clarity == "VS1", "price"]), 2)

# 세공수준, 투명도별 평균가격을 구하고 평균가격이 가장 높은 세공수준, 투명도 
dia_sub2 <- aggregate(data = dia_sub,
                      price ~ cut + clarity, FUN = "mean")
dia_sub2[which.max(dia_sub2$price), c("cut", "clarity") ]

dia %>% 
  filter(price >= 900 & color == "E" & clarity == "VS1") %>% 
  summarise(mean_price = mean(price)) %>% round(., 2)

dia %>% 
  filter(price >= 900) %>% 
  group_by(cut, clarity) %>% 
  order(price)



str(colnames(iris))
str(t(colnames(iris)))
str(t(t(colnames(iris))))

elec <- read.csv("elec_load.csv")
colnames(elec)
t(t(colnames(elec)))

ifelse(test = 1:4 >= 3, yes = "up!", no = "down!")



df <- read.csv("rating_ramyun.csv", stringsAsFactors = FALSE)
head(df)
df$kr <- ifelse(df$Country == "South Korea", yes = 1, no = 0)


df <- head(iris[, 1:4])
apply(X = df, MARGIN = 1, FUN = "sum")
apply(X = df, MARGIN = 2, FUN = "sum")

score <- read.csv("class_scores.csv")
head(score)

df_subject <- data.frame(mean = apply(X = score[, 5:9], MARGIN = 2, FUN = "mean"),
                         max = apply(X = score[, 5:9], MARGIN = 2, FUN = "max"),
                         min = apply(X = score[, 5:9], MARGIN = 2, FUN = "min"))
df_subject

score %>% 
  summarise(across(5:9, mean), n())


source("data_generator_join.R", encoding = "UTF-8")
head(df_room)
head(df_list)

library(dplyr)
left_join(x = df_list, y = df_room,
          by = c("member" = "name"))
inner_join(x = df_list, y = df_room,
          by = c("member" = "name"))



factor(letters[2:5])
as.character(factor(letters[2:5]))
factor(c(100, 400, 600, 200))
as.numeric(factor(c(100, 400, 600, 200)))
as.numeric(as.character(factor(c(100, 400, 600, 200))))

as.POSIXct("2021-03-26")
as.POSIXct("2021-03-26 11:11:11")
as.POSIXct("2021-03-26 11")
as.POSIXct("2021/03/26")

as.Date("2021-03-26")
as.Date("2021-03-26 11")
as.Date("2021-03-26 11:11:11")


time <- as.POSIXct("2021-03-26 11:11:11")
months(time)
months(time, abbreviate = TRUE)
weekdays(time)
weekdays(time, abbreviate = TRUE)
quarters(time)

strptime("2021년 3월 26일",
         format = "%Y년 %m월 %d일")


library("lubridate")
year(time)
month(time)
day(time)
wday(time)
wday(time, label = T)
wday(time, week_start = 1)
wday(time, week_start = 1, label = T)
str(ymd(20210326))
str(as.POSIXct("2021-03-26"))

mean(c(1:3, NA, 23))
mean(c(1:3, NA, 23), na.rm = T)

mean(c(1:3, "사과", 23))
mean(c(1:3, "사과", 23), na.rm = T)



set.seed(1228)
df <- data.frame(xx = 1:200,
                 yy = rnorm(n = 200, mean = 5, sd = 3))
head(df, 2)

df[order(df$yy), "yy"][1:3]
df[order(df$yy)[1:3], "yy"]

df[order(-df$yy), "yy"][1:3]
df[order(-df$yy)[1:3], "yy"]
df[order(df$yy, decreasing = TRUE), "yy"][1:3]

df[df$yy %in% df[order(df$yy), "yy"][1:3], ]

c("a", "b", "c", "d") == c("b", "d")
c("a", "b", "c", "d") %in% c("b", "d")



dia <- read.csv("diamonds.csv")
dia_1Q <- quantile(dia$price, probs = 0.25)
dia_3Q <- quantile(dia$price, probs = 0.75)

dia_3Q - dia_1Q
round(IQR(dia$price), 2)

nrow(dia[dia$price >= dia_1Q & dia$price <= dia_3Q, ])
sum(dia$price >= dia_1Q & dia$price <= dia_3Q)

dia %>% 
  ggplot(aes(x = price)) + geom_boxplot()


data("Orange")
head(Orange)

set.seed(125)
df <- as.matrix(Orange)
df[sample(1:(nrow(df) * ncol(df)), size = 20)] <- NA
df <- as.data.frame(df)
head(df, 3)

df[is.na(df$Tree),]
df[is.na(df$age),]
df[is.na(df$Tree) | is.na(df$age), ]
df[is.na(df$Tree) & is.na(df$age), ]

df <- as.data.frame(sapply(df, as.numeric))
df

mean(df$age)
mean(df$age, na.rm = TRUE)

df$age
df[is.na(df$age), "age"] = mean(df$age, na.rm = TRUE)
df[is.na(df$circumference), "circumference"] = mean(df$circumference, na.rm = TRUE)
head(df)


install.packages("data.table")
library(data.table)
df <- fread("iris_missing.csv", data.table = FALSE)
# fread에서 data.table로 읽기 싫으면 이렇게 지정하면 data.frame으로 불러옴
head(df, 2)


na_cnt <- function(x){
  sum(is.na(x))
}

apply(X = df, MARGIN = 2, FUN = "na_cnt")
# apply(X = df, MARGIN = 2, FUN = function(x){sum(is.na(x))})

install.packages("nortest")
library("nortest")
set.seed(123)
z <- rnorm(100)
pearson.test(z)
shapiro.test(z)


result <- pearson.test(z)
result$p.value
result$statistic
round(result$p.value, 1)

cor(x = c(1, 2, 4, 5),
    y = c(2, 2, 3, 4))
cor.test(x = c(1, 2, 4, 5),
         y = c(2, 2, 3, 3))

bike <- read.csv("bike.csv")
cor_mat <- bike[, 2:9]
cor(cor_mat)


# install.packages("corrplot")
library(corrplot)
corrplot(cor_mat)


var.test(bike$temp, bike$atemp)
# 대립가설 채택 -> 두 변수의 분산이 다르다
var(bike$temp)
var(bike$atemp)

bartlett.test(data = bike,
              casual ~ season)

# Season별 Casual의 분산 구하기
aggregate(data = bike, casual ~ season, FUN = "var")
var_by_sn <- aggregate(data = bike, casual ~ season, FUN = "var")

# Season별 count 분산 확인 후, 분산이 큰 두 계절 확인
two_sn <- var_by_sn[order(-var_by_sn$casual), "season"][1:2]

# 등분산 검정 실시
var.test(data = bike[bike$season %in% two_sn,],
         count ~ season)

var.test(bike[bike$season == 2, "count"],
         bike[bike$season == 3, "count"])


df <- read.csv("diabetes.csv")
head(df, 2)

df2 <- df[df$Glucose >= 40, ]
df2$g126 <- ifelse(df2$Glucose >= 126, 1, 0)
table(df2$Glucose >= 126, df2$g126)

chisq.test(table(df2[, c("g126", "Outcome")]))
table(df2[, c("g126", "Outcome")])
# 귀무가설 기각, 두 집단은 독립이 아니다.

set.seed(123)
t.test(x = rnorm(300), mu = 0) # mu는 모평균

set.seed(123)
nums <- rnorm(200)
t.test(nums, mu = 0)
# 귀무가설 기각 못해. 같은 것이나 다름 없다.

t.test(nums, mu = 0.1)
t.test(nums, mu = 0.2)

bike <- read.csv("bike.csv")
head(bike)

bike$year <- year(as.POSIXct(bike$datetime))
bike$month <- month(as.POSIXct(bike$datetime))

bike2 <- bike[bike$year == 2012 & bike$month == 1, ]
bike2_t  <- t.test(bike2$casual, bike2$registered, paired = TRUE)
round(bike2_t$statistic, 1)
round(bike2_t$p.value, 1)

t.test(bike2$registered, bike2$casual, paired = TRUE)
# paired는 대응표본, var.equal은 등분산/이분산


summary(aov(casual ~ season, data = bike))
summary(aov(casual ~ as.character(season), data = bike))
# 귀무가설 채택, 다른 놈이 하나라도 있다.

TukeyHSD(aov(casual ~ as.character(season), data = bike),
         which = "as.character(season)")



dia <- read.csv("diamonds.csv")
mod <- aov(data = dia, price ~ color)
summary(mod)

TukeyHSD(mod, which = "color")

df <- data.frame(x = 1:10, y = sample(1:10, 10))

df %>% 
  ggplot(aes(x = x, y = y)) +
  geom_col()




lm1 <- lm(Petal.Length ~ Petal.Width, data = iris)
lm2 <- lm(Petal.Length ~., data = iris[, 3:4])
lm3 <- lm(Petal.Length ~ . -Species, data = iris)
lm4 <- lm(Petal.Length ~. -Species - 1, data = iris)


mod1 <- lm(Sepal.Length ~ Sepal.Width, data = iris)
summary(mod1)

mod2 <- lm(Petal.Length ~ Petal.Width, data = iris)
summary(mod2)

# install.packages("fastDummies")
library(fastDummies)
df <- read.csv("diamonds.csv")
df_dum1 <- dummy_cols(df[, c("price", "cut")],
                             select_columns = "cut")
df_dum2 <- dummy_cols(df[, c("price", "cut")],
                      select_columns = "cut",
                      remove_first_dummy = TRUE)
df_dum3 <- dummy_cols(df[, c("price", "cut")],
                      select_columns = "cut",
                      remove_first_dummy = TRUE,
                      remove_selected_columns = TRUE) #권장

head(df_dum1)
head(df_dum2)
head(df_dum3)


dia <- read.csv("diamonds.csv")
dia_dum <- dummy_cols(dia, select_columns = "cut",
                      remove_first_dummy = TRUE,
                      remove_selected_columns = TRUE)
dia_dum_tr <- dia_dum[1:50000, ]
dia_dum_te <- dia_dum[50001:nrow(dia_dum),]
mod <- lm(price ~ ., data = dia_dum_tr)
summary(mod)
vif(mod)
pred <- predict(mod, newdata = dia_dum_te)
head(pred)

install.packages("Metrics")
library(Metrics)

rmse(actual = dia_dum_te$price,
     predicted = pred)

df <- iris
df$Species <- ifelse(df$Species == "virginica", 1, 0)
mod <- glm(Species ~ ., data = df, family = "binomial")
summary(mod)

pred <- predict(mod, newdata = df, type = "response")
ifelse(pred >= 0.5, 1, 0)
pred_class <- ifelse(pred > 0.5, 1, 0)
table(df$Species, pred_class)
accuracy(actual = df$Species, predicted = pred_class)
auc(actual = df$Species, predicted = pred)
round(exp(mod$coefficients), 3)

