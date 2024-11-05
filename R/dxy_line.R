#There are 4 populations/isolates named as 1, 2, 3, and 4. We will plot the dxy values between the 2 and other ones. 

#Combine the files with the dxy values of each pair of populations/isolates.
ID <- 2
for (i in 1:length(ID)){
  pop1 <- ID[i]
  ID2 <- as.character(c(1:4))
  ID2 <- ID2[ID2 != pop1]
  df<-read.csv("Pop2_1.csv", header = T)
  df<-data.frame(df[,1:5])
  for (j in 1:length(ID2)){
    pop2 <- ID2[j]
    dxy <- read.csv(paste("Pop",pop1,"_",pop2,".csv", sep=""), header = T)
    df <- cbind(df,pop2=dxy[,8])
    names(df)[names(df)=="pop2"] <- paste(pop2,sep="")
    for (k in 1:8){
      ch <- df[df[,1] == k,]
      write.table(ch,paste(pop1,"_Chr", k ,".txt",sep=""),sep="\t", row.names = F, col.names = T)
    }
  }
  write.table(df,paste(pop1,".txt",sep=""),sep="\t", row.names = F, col.names = T)
}

#Library packages:
library(ggplot2)
library(gridExtra)

#Assign the populations/isolates named to PopA and B.
PopA<-"2"
PopB<-c(1,3,4)

#Making a combined plot:
for (j in 1:8){
  dxy<-read.table(paste(PopA,"_Chr",j,".txt",sep = ""),header = T)
  loc<-dxy$start
  no<-length(loc)
  
  Fipop=data.frame()
  for (i in PopB){
    PopB2<-paste("X",i,sep = "")
    df=assign(paste("pop",i,sep = ""),data.frame(rep(i,each=no),loc,dxy[,PopB2]))
    Fipop=rbind(Fipop,df)
  }
  rm(i,df)
  
  names(Fipop)<-c("pop","loc","dxy")
  
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
                 axis.title.x = element_text(size = rel(1.2),color = "white"),
                 axis.title.y = element_text(size = rel(1.2)),
                 axis.text.y = element_text(size=rel(1.2),color="black"),
                 axis.text.x = element_text(size=rel(1.2),angle=90,hjust = 1,color="black"),
                 plot.margin=unit(x=c(top.mar,right.mar,bottom.mar,left.mar),units="inches"))
  assign(paste("Fig",j,sep = ""),ggplot(Fipop, aes(x=factor(loc), y=dxy, group=factor(pop), color=factor(pop))) + geom_line(aes(color=factor(pop)),linewidth=1) + scale_y_continuous(limits = c(0,1),breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1),label = c("0.0","0.2","0.4","0.6","0.8","1.0")) + mytheme)
}
grid.arrange(arrangeGrob(Fig1,Fig2,Fig3,Fig4,nrow=4),arrangeGrob(Fig5,Fig6,Fig7,Fig8,nrow=4),ncol=2,widths=c(4,4))

#Makeing a single plot.
PopA<-"2"
PopB<-"1"

for (j in 1:8){
  dxy<-read.table(paste(PopA,"_Chr",j,".txt",sep = ""),header = T)
  loc<-dxy$start
  no<-length(loc)
  
  Fipop=data.frame()
  for (i in PopB){
    PopB2<-paste("X",i,sep = "")
    df=assign(paste("pop",i,sep = ""),data.frame(rep(i,each=no),loc,dxy[,PopB2]))
    Fipop=rbind(Fipop,df)
  }
  rm(i,df)
  
  names(Fipop)<-c("pop","loc","dxy")
  
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
                 axis.title.x = element_text(size = rel(1.2),color = "white"),
                 axis.title.y = element_text(size = rel(1.2)),
                 axis.text.y = element_text(size=rel(1.2),color="black"),
                 axis.text.x = element_text(size=rel(1.2),angle=90,hjust = 1,color="black"),
                 plot.margin=unit(x=c(top.mar,right.mar,bottom.mar,left.mar),units="inches"))
  assign(paste("Fig",j,sep = ""),ggplot(Fipop, aes(x=factor(loc), y=dxy, group=factor(pop), color=factor(pop))) + geom_line(aes(color=factor(pop)),linewidth=1) + scale_y_continuous(limits = c(0,1),breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1),label = c("0.0","0.2","0.4","0.6","0.8","1.0")) + mytheme)
}
grid.arrange(arrangeGrob(Fig1,Fig2,Fig3,Fig4,nrow=4),arrangeGrob(Fig5,Fig6,Fig7,Fig8,nrow=4),ncol=2,widths=c(4,4))
