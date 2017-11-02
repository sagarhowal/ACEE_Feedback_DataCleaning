#Importing File
feedback <- read.csv('feedback.csv', header = FALSE)

#---------------------Cleaning Data-----------------------------
#Renaming Columns
colnames(feedback) <- c("Name", "Email", "Content", "EaseOfUse", "CustomerSatisfaction", "OverallExperience", "Comment")

#Cleaning empty rows
feedback <- feedback[!(feedback$V1 == "" | is.na(feedback$V1)), ]

#Removing all the Rows that have sent .com links in their messages
feedback <- feedback[!grepl(".com", feedback$V7),]

#Removing all rows with .co.uk links
feedback <- feedback[!grepl(".co.uk", feedback$V7),]

#Removing all rows with .co.uk links
feedback <- feedback[!grepl(".co.uk", feedback$V7),]

#Removing all rows with non readable characters
feedback <- feedback[!grepl("Ð", feedback$V7),]

#Removing all rows with non readable characters
feedback <- feedback[!grepl("Ã", feedback$V7),]

#Removing all rows with non readable characters
feedback4 <- feedback[!grepl(is.numeric(feedback$V3)), feedback$V3,]
feedback <- feedback[!grepl("4431774", feedback$V3),]

#Converting the Data Types to Characters and then Back to Factors
#Don't know why, it just works.
feedback$V4 <- as.factor(feedback$V4)
feedback$V4 <- as.factor(feedback$V4)

#Check all columns
summary(feedback$V3)

#Create "Votes" Data Frame from Feedback Data Frame 
votes <- subset(feedback, select = c('Content', 'EaseOfUse', 'CustomerSatisfaction', 'OverallExperience'))

#Checking Votes dataframe
summary(votes)

#Cleaning the empty rows

votes <- votes[!(votes$Content == "" | is.na(votes$Content)), ]

#Check
head(votes)
#-----------------------------------------------------------------------


#Importing Libraries
library(ggplot2)
library(ggthemes)

#------------------------Get Ready for Plotting--------------------------
#GGPLOT2
ggplot(feedback, aes(x = Ease-of-Use)) + 
  theme_gdocs() +
  geom_bar() +
  labs(y = "Viewers",
       title = "Website Feedback")

ggplot(feedback, aes(x = Content), fill = Content) + 
  theme_gdocs() +
  geom_bar()

#Install themes (Unnecessary)
install.packages('ggthemes', dependencies = TRUE)


ggplot(votes, aes(x = Content), fill = Content) + 
  geom_bar(width = 0.5,) +
  scale_fill_manual(values = c( "#F2EFEA", "#7CC6FE", "#FC7753", "#5DFDCB")) +
  labs(y = "Viewers",
       title = "Website Feedback")



ggplot(votes, aes(x = EaseOfUse)) + 
  geom_bar(width = 0.5,) +
  scale_fill_manual(values = c("#F2EFEA", "#7CC6FE", "#FC7753", "#5DFDCB"))
  labs(y = "Viewers",
     title = "Website Feedback")

  ggplot(votes, aes(x = CustomerSatisfaction)) + 
    geom_bar(width = 0.5,) +
    scale_fill_manual(values = c("#F2EFEA", "#7CC6FE", "#FC7753", "#5DFDCB"))
  labs(y = "Viewers",
       title = "Website Feedback") 
#------------------------------------------------------------------------


