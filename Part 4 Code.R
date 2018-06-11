## R for data analysis
## Part 4

# basic statistics

# descriptive statistics
data(Salaries, package="car")
summary(Salaries)

library(psych)
describe (Salaries[c(3,4,6)])


# frequency tables
xtabs(~ rank, data=Salaries)
xtabs(~ rank + sex, data=Salaries)
tbl <- xtabs(~ rank + sex, data=Salaries)
prop.table(tbl)      # cell proportions
prop.table(tbl, 1)   # row proportions
prop.table(tbl, 2)   # column proportions
chisq.test(tbl)      # chisquare test

# correlation
options(digits=2)
cor(mtcars)


# t-tests
t.test(salary ~ sex, data=Salaries)


# ANOVA
fit <- aov(salary ~ rank, data=Salaries)
summary(fit)
TukeyHSD(fit)

fit <- aov(salary ~  yrs.since.phd +
             rank + sex + rank*sex, data=Salaries)
summary(fit)

library(car)
Anova(fit, type="III")

library(effects)
plot(effect("rank*sex"), fit)

# Multiple  Linear Regression
data(Prestige, package="car")
fit <- lm(prestige ~ education + income + women, 
          data=Prestige)
summary(fit)