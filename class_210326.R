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
