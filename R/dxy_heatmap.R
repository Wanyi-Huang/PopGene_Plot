
idF<-read.table("id.txt")
id<-idF[,1]

dxyData<-data.frame(id)
names(dxyData)[names(dxyData) == 'id'] <- "ID"
for (i in 1:length(id)){
  NameI <- id[i]
  id2<-idF[-i,]
  dxy.f<-data.frame()
  for (j in 1:length(id2)){
    NameII <- id2[j]
    file<-paste("Chom-",NameI,"-",NameII,".csv",sep = "")  
    df=assign(paste("dxy",NameI,"-",NameII,sep = ""),read.csv(file,header = T))
    dxy.m<-mean(df[,8])
    dxyid.f<-data.frame(NameII,dxy.m)
    names(dxyid.f)[names(dxyid.f) == 'dxy.m'] <- NameI
    names(dxyid.f)[names(dxyid.f) == 'NameII'] <- "ID"
    dxy.f<-rbind(dxyid.f,dxy.f)
  }
  dxyid.f<-data.frame(NameI,0)
  names(dxyid.f)[names(dxyid.f) == 'X0'] <- NameI
  names(dxyid.f)[names(dxyid.f) == 'NameI'] <- "ID"
  dxy.f<-rbind(dxyid.f,dxy.f)
  dxyData<-merge(dxyData,dxy.f,by="ID",sort=F)
}

rownames(dxyData)<-dxyData[,1]
dxyData<-dxyData[,-1]


library("pheatmap")
map<-dxyData
colors = colorRampPalette(c("skyblue3", "white","red2","red3"),bias=5)(10000)
pheatmap(map,display_numbers = TRUE, border_color= "black",cluster_rows = F,cluster_cols = F, fontsize=10,color=colors, treeheight_col=20, cellwidth = 20,cellheight = 20,filename="dxy-heatmap2.pdf")
