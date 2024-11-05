#Library package:
library(ggplot2)

#Read data:
dt <- read.table("windowed.SNP.pi.txt",sep="\t", header = T)

#C. hominis has a genome of approximately 9 Mb in eight chromosomes. Assign the lengths of each chromosome to LChr.
LChr <- c(866743,982620,1066810,1105361,1087727,1295560,1315942,1306564)

#Create a new data frame to plot the pi. The 500 represents the length of the sliding window.
dfm<-data.frame()
for (i in 1:8){
  Max<-LChr[i]
  ChrLoop<-seq(1, Max , by=500)
  df<-assign(paste("Chr",i,sep = ""),data.frame(rep(i),ChrLoop))
  df$ID<-paste(df[,1],df[,2],sep = "_")
  dfm<-rbind(dfm,df)
}
dfm$pos<-seq(1, length(dfm[,1])*500, by=500)
dt$ID<-paste(dt[,1],dt[,2],sep = "_")

vari<-merge(dfm,dt,by = "ID", sort=F, all=T)
vari[is.na(vari)] <- 0
vari<-vari[order(vari$pos),]
vari<-vari[,c(1,2,4,8,9)]
names(vari)<-c("ID","Chr","pos","variation","pi")

#Create a pi plot
p1<-ggplot(vari, aes(pos, pi))+geom_point(aes(y=pi,color=Chr))
p1<-p1+scale_x_continuous(limits = c(-1000, 9100001),breaks = c(440001, 1370001, 2410001, 3510001, 4610001,5800001,7090001,8400001),label = NULL)
p1<-p1+scale_y_continuous(limits = c(-0.00001,0.008),breaks = c(0,0.002,0.004,0.006,0.008),labels = c("0.000","0.002","0.004","0.006","0.008"))
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
               axis.line.x = element_line(color = "black"),
               #axis.title.x = element_text(size = rel(1.2),color = "white"),
               axis.title.y = element_text(size = rel(1.2)),
               axis.text.y = element_text(size=rel(1.2),color="black"),
               #axis.text.x = element_text(size=rel(1.2),color="white"),
               plot.margin=unit(x=c(top.mar,right.mar,bottom.mar,left.mar),units="inches"))
p1<-p1+mytheme
p1
