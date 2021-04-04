df <- read.csv("01_ADS_Sample_1.csv", sep = ",", encoding = "UTF-8")
head(df)
round(cor(df[,2:5]), 3)

# TV, -0.183

df[, "YEAR"] <- as.numeric(substr(df[, 1], 1, 4))
head(df)

df_Y <- df %>% group_by(YEAR) %>% summarise(sum = sum(SALES_AMT))
S2019 <- df_Y[df_Y$YEAR == 2019, 2]
S2009 <- df_Y[df_Y$YEAR == 2009, 2]
round(((S2019 - S2009) / S2009) * 100, 3)

# 0.194

SS2019 <- df %>% filter(YEAR == 2019) %>% select(SALES_AMT)
SS2009 <- df %>% filter(YEAR == 2009) %>% select(SALES_AMT)

df_t <- t.test(x = SS2019, y = SS2009, var.equal = TRUE)
str(df_t)
round(df_t$p.value, 3)


ef <- read.csv("01_ADS_Sample_2.csv", sep = ",", encoding = "UTF-8")
head(ef)

library(data.table)
df <- fread("01_ADS_Sample_2.csv", sep = ",", encoding = "UTF-8",
            data.table = FALSE)
head(df)
df_r <- df %>% group_by(region) %>% summarise(n = n())
df_r["percent"] <- floor((df_r$n / sum(df_r$n)) * 100)
df_r

# 26

identical(na.omit(df[df$year == 2015, ]), df[df$year == 2015, ])
df_e <- na.omit(df[df$year == 2015, ])
df_e$ef_government <- as.numeric(df_e$ef_government)
df_e$ef_score <- as.numeric(df_e$ef_score)
df_e$ef_legal <- as.numeric(df_e$ef_legal)
df_e$ef_regulation <- as.numeric(df_e$ef_regulation)
df_e$ef_money <- as.numeric(df_e$ef_money)
df_e$ef_trade <- as.numeric(df_e$ef_trade)

df_e_lm <- lm(ef_score ~ ef_government + ef_legal + ef_regulation + ef_money + ef_trade,
   data = df_e)

df_e_lm_s <- summary(df_e_lm)
round(df_e_lm_s$coef[6,1], 3)

df_f <- df[df$year == 2016, 5:9]
df_f$ef_government <- as.numeric(df_f$ef_government)
df_f$ef_legal <- as.numeric(df_f$ef_legal)
df_f$ef_regulation <- as.numeric(df_f$ef_regulation)
df_f$ef_money <- as.numeric(df_f$ef_money)
df_f$ef_trade <- as.numeric(df_f$ef_trade)

df_f["hat"] <- predict(df_e_lm, newdata = df_f)
df_f["act"] <- as.numeric(df[df$year == 2016, 4])
round(sum(abs(df_f$act - df_f$hat)), 3)

head(df_f)
