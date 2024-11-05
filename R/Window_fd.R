#Library packages:
library(ggplot2)

#Window_fd.csv is the result from Genomics_general (https://github.com/simonhmartin/genomics_general)
#Read data:
df <-read.csv("Window_fd.csv",header = T)
data <-df[,c(1:3,10)]

#Keep the data with fd values.
rowN<-which(data$fd > 0 & data$fd < 1 | data$fd == 1 | data$fd == 0 )
rowN1 <- c(1:length(data$fd))
rowN2 <- rowN1[! rowN1%in%rowN]
for (i in 1:length(rowN2)){
  O <- rowN2[i]
  data[O,"fd"]<- 0
}

#Create a new data frame to plot the dxy. The 10000 represents the length of the sliding window.
data$pos<-seq(1, length(data$fd)*10000, by=10000)

#Create a fd plot:
p1<-ggplot(data, aes(pos, fd))+geom_point(aes(y=fd,color=scaffold))

p1<-p1+labs(y="pi",x=NULL)

#Format the plot:
top.mar=0.2
right.mar=0.2
bottom.mar=0.2
left.mar=0.2
mytheme<-theme(panel.grid.major =element_blank(),
               panel.grid.minor = element_blank(),
               panel.background = element_blank(),
               panel.border = element_blank(),
               axis.line.y = element_line(color = "black"),
               axis.line.x = element_line(color = "white"),
               axis.title.y = element_text(size = rel(1.2)),
               #axis.title.x = element_text(size = rel(1.2),color = "white"),
               axis.text.y = element_text(size=rel(1.2),color="black"),
               #axis.text.x = element_text(size=rel(1.2),color="white"),
               plot.margin=unit(x=c(top.mar,right.mar,bottom.mar,left.mar),units="inches"))

p1<-p1+mytheme
p1
