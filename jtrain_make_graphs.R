# read saved R binary data frame

load("jtrain_all.rdata")

# scatter plot
plot(jtrain$educ, jtrain$re78)

# frequency table
race_tab <- table(jtrain$race)
race_tab

# barplot
barplot(race_tab)

# cross tabulation
race_train_tab <- table(jtrain$race, jtrain$train)
race_train_tab

# stacked bar plot
barplot(race_train_tab,
        legend=rownames(race_train_tab))

# grouped bar plot
# stacked bar plot
barplot(race_train_tab, beside=TRUE,
        legend=rownames(race_train_tab))

# histogram
hist(jtrain$re78)
hist(jtrain$re78, breaks=50, col="red", xlab="Income in $1000",
     main = "Income Distribution in 1978")

# boxplot
boxplot(re78 ~ train, data=jtrain)

# create boxplot and save
png(file="boxplot.png")
boxplot(re78 ~ race, data=jtrain)
dev.off()

## What can be done if you go beyond R base graphics
library(ggplot2)
library(scales)
library(ggthemes)

## a better scatter plot
p <- ggplot(data=jtrain, aes(x=educ, y=re78*1000)) +
  geom_jitter(alpha=0.3) +
  geom_smooth(method="lm") +
  scale_y_continuous(labels=dollar) +
  facet_wrap(~train) +
  labs(x="Education in Years",
       y="",
       title="Income in 1978 by Education",
       subtitle="Across job training status") 

p

p + theme_bw()

p + theme_fivethirtyeight()
  
p + theme_minimal()


# save graph
ggsave(filename="scatterplot.svg")

# a better bar chart
p <- ggplot(data=jtrain, aes(x=train, y=re78*1000, fill=race)) +
  geom_bar(position="dodge", stat="summary", fun.y="mean") +
  labs(x="", y="", title="Mean Income in 1978", 
       subtitle="By training status and race", 
       caption="Data Source: Manolis Kaparakis",
       fill="Race") +
  scale_y_continuous(labels=dollar) +
  scale_fill_brewer(palette="Set1") 
p


