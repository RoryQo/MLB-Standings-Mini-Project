## ------------------------------------------------------------------
mlb = read.table("mlb_standings.csv", header = TRUE, sep = ",")


## ------------------------------------------------------------------
hist(mlb$scored, xlab = "Runs Scored")      # Runs scored
hist(mlb$allowed, xlab = "Runs Allowed")    # Runs allowed
hist(mlb$wins, breaks = 12, xlab = "Wins")  # Wins


## ------------------------------------------------------------------
plot(mlb$scored, mlb$wins, pch = 19, xlab = "Runs Scored", ylab = "Wins")        # Wins vs. runs scored
plot(mlb$allowed, mlb$wins, pch = 19, xlab = "Runs Allowed", ylab = "Wins")      # Wins vs. runs allowed
plot(mlb$scored, mlb$allowed, pch = 19, xlab = "Runs Scored", ylab = "Allowed")  # Wins vs. runs allowed


## ------------------------------------------------------------------
model = lm(wins ~ scored + allowed, data = mlb)


## ------------------------------------------------------------------
require(MASS)

# Predictions and residuals
mlb$pred = predict(model) # Predictions
mlb$residuals = residuals(model) # Residuals

# Standardized residuals
mlb$stand_res = residuals(model)/sigma(model) # Divide residual by residual standard error

# Studentized residuals
mlb$stud_res = stdres(model)

# Jackknife residuals
mlb$jackknife = rstudent(model)


## ------------------------------------------------------------------
mlb$pred = predict(model)
plot(mlb$pred, mlb$jackknife, pch = 19, xlab = "Predicted Wins", ylab = "Jackknife Residual")
abline(a=0, b=0)


## ------------------------------------------------------------------
qqnorm(mlb$jackknife, pch = 19)
qqline(mlb$jackknife)  # Puts the diagonal line on the plot


## ------------------------------------------------------------------
shapiro.test(mlb$jackknife)


## ------------------------------------------------------------------
mlb$cook = cooks.distance(model)
plot(mlb$cook, xlab = "Observation", ylab = "Cook's Distance", type = "h")
abline(a = 4/90, b = 0)


## ------------------------------------------------------------------
mlb$inf_pt = ifelse(mlb$cook > 4/90, 1, 0)
s = mlb[which(mlb$inf_pt == 0), ]
model2 = lm(wins ~ scored + allowed, data = s)
summary(model2)

