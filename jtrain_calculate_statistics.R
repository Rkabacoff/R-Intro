# read saved R binary data frame

load("data/jtrain.rdata")

# summary statistics
summary(jtrain)

# descriptive statistics
library(Hmisc)
describe(jtrain)

library(Hmisc)
describe(jtrain) # notice what happens when two packages have same function name

# t-test
t.test(re78~train, data=jtrain)

# anova
aovfit <- aov(re78~train, data=jtrain)
summary(aovfit)

# linear regression
linfit <- lm(re78~train, data=jtrain)
summary(linfit)