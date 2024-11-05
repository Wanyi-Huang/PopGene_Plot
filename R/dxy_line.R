library(ggplot2)
library(gridExtra)
PopA<-"4"
PopB<-c(5,3,8)
#Making combined plot
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

#Makeing single plot
PopA<-"4"
PopB<-"6"

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
