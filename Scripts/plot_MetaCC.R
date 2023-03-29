####################write ggplot figure###############
library(ggplot2)
library(ggpubr)
library(ggforce)

theme_set(theme_bw()+theme(panel.spacing=grid::unit(0,"lines")))


# Short read metaHi-C dataset 
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1], each = 3)
Completeness = rep(c( "Moderately complete", "Substantially complete", "Near-complete"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(
           9 , 23 , 39,
           11 , 21 , 47,
           11 , 24 , 60,
           12 , 33 , 67,
           11 , 34 , 79)

#col = c("#023FA5" ,"#5465AB" ,"#7D87B9" ,"#A1A6C8" ,"#BEC1D4")[5:1]
col = c("#023FA5" ,"#7D87B9" ,"#BEC1D4")[3:1]
df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Moderately complete", "Substantially complete", "Near-complete"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR'  , 'VAMB')[5:1])


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c("Moderately complete", "Substantially complete", "Near-complete"))+
  labs(x = "Binning method", y = "Number of bins", 
       title = "Human gut short-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))

#ggsave("fig3a.eps", width = 6.3, height = 5, device = cairo_ps)


#####wastewater######
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1], each = 3)
Completeness = rep(c( "Moderately complete", "Substantially complete", "Near-complete"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(
           43 , 20 , 11,
           24 , 48 , 82,
           25 , 32 , 44 ,
           41 , 56 , 90,
           34 , 72 , 103)

col = c("#023FA5" ,"#7D87B9" ,"#BEC1D4")[3:1]
df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Moderately complete", "Substantially complete", "Near-complete"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR'  , 'VAMB')[5:1])


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c("Moderately complete", "Substantially complete", "Near-complete"))+
  labs(x = "Binning method", y = "Number of bins", 
       title = "Wastewater short-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))


#####cow fecal######
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR', 'VAMB')[5:1], each = 3)
Completeness = rep(c( "Moderately complete", "Substantially complete", "Near-complete"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(22 , 7 , 4,
           27 , 11 , 5,
           15 , 20 , 5 ,
           0 , 0 , 0,
           35 , 28 , 8)

col = c("#023FA5" ,"#7D87B9" ,"#BEC1D4")[3:1]
df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Moderately complete", "Substantially complete", "Near-complete"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1])


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c("Moderately complete", "Substantially complete", "Near-complete"))+
  labs(x = "Binning method", y = "Number of bins", 
       title = "Cow rumen long-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))


#####sheep gut######
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1], each = 3)
Completeness = rep(c( "Moderately complete", "Substantially complete", "Near-complete"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(94 , 94 , 190,
           105 , 102 , 228,
           51 , 83 , 267 ,
           54 , 55 , 99,
           130 , 162 , 417)

col = c("#023FA5" ,"#7D87B9" ,"#BEC1D4")[3:1]
df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Moderately complete", "Substantially complete", "Near-complete"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1])


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c("Moderately complete", "Substantially complete", "Near-complete"))+
  labs(x = "Binning method", y = "Number of bins", 
       title = "Sheep gut long-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))



####sheep gut pilon 
Rank = rep(c('Unpolished' , 'Polished')[2:1], each = 3)
Completeness = rep(c( "Moderately complete", "Substantially complete", "Near-complete"),times = 2)
###Number needs to be 4*5 matrix##
Number = c(
            130 , 162 , 417,
            131 , 153 , 416
           )

col = c("#023FA5" ,"#7D87B9" ,"#BEC1D4")[3:1]
df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Moderately complete", "Substantially complete", "Near-complete"))
df$Rank = factor(df$Rank , levels = c('Unpolished' , 'Polished')[2:1])


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.4)+
  scale_fill_manual(values = col , limits= c("Moderately complete", "Substantially complete", "Near-complete"))+
  labs(x = "", y = "Number of bins", 
       title = "Sheep gut long-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))




####MetaCC vs bin3C cow
Rank = rep(c('bin3C' , 'MetaCC'),each = 3)
Pipeline = rep(c('MC or miss in other' , 'SC in other' ,  'NC in both'),times = 2)
Number = c(1,0,4,
           2,2,4)

col = c("#8FBC94","#77AAAD","#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('MC or miss in other' , 'SC in other' ,  'NC in both'))
df$Rank = factor(df$Rank , levels = c('bin3C' , 'MetaCC'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.8)+
  scale_fill_manual(values = col,limits= c('MC or miss in other' , 'SC in other' ,  'NC in both'))+
  labs(x = "Hi-C-based binning methods", y = "Number of near-complete bins", title = "")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))



####MetaCC vs metator cow
Rank = rep(c('MetaTOR' , 'MetaCC'),each = 3)
Pipeline = rep(c('MC or miss in other' , 'SC in other' ,  'NC in both'),times = 2)
Number = c(0,3,2,
           6,0,2)

col = c("#8FBC94","#77AAAD","#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('MC or miss in other' , 'SC in other' ,  'NC in both'))
df$Rank = factor(df$Rank , levels = c('MetaTOR' , 'MetaCC'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.8)+
  scale_fill_manual(values = col,limits= c('MC or miss in other' , 'SC in other' ,  'NC in both'))+
  labs(x = "Hi-C-based binning methods", y = "Number of near-complete bins", title = "")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))



####MetaCC vs hicbin sheep
Rank = rep(c('HiCBin' , 'MetaCC'),each = 3)
Pipeline = rep(c('MC or miss in other' , 'SC in other' ,  'NC in both'),times = 2)
Number = c(18,0,81,
           316,20,81)

col = c("#8FBC94","#77AAAD","#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('MC or miss in other' , 'SC in other' ,  'NC in both'))
df$Rank = factor(df$Rank , levels = c('HiCBin' , 'MetaCC'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.8)+
  scale_fill_manual(values = col,limits= c('MC or miss in other' , 'SC in other' ,  'NC in both'))+
  labs(x = "Hi-C-based binning methods", y = "Number of near-complete bins", title = "")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))




####MetaCC vs bin3C sheep
Rank = rep(c('bin3C' , 'MetaCC'),each = 3)
Pipeline = rep(c('MC or miss in other' , 'SC in other' ,  'NC in both'),times = 2)
Number = c(47,3,218,
           171,28,218)

col = c("#8FBC94","#77AAAD","#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('MC or miss in other' , 'SC in other' ,  'NC in both'))
df$Rank = factor(df$Rank , levels = c('bin3C' , 'MetaCC'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.8)+
  scale_fill_manual(values = col,limits= c('MC or miss in other' , 'SC in other' ,  'NC in both'))+
  labs(x = "Hi-C-based binning methods", y = "Number of near-complete bins", title = "")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))




####MetaCC vs metator sheep
Rank = rep(c('MetaTOR' , 'MetaCC'),each = 3)
Pipeline = rep(c('MC or miss in other' , 'SC in other' ,  'NC in both'),times = 2)
Number = c(33,10,185,
           220,12,185)

col = c("#8FBC94","#77AAAD","#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('MC or miss in other' , 'SC in other' ,  'NC in both'))
df$Rank = factor(df$Rank , levels = c('MetaTOR' , 'MetaCC'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.8)+
  scale_fill_manual(values = col,limits= c('MC or miss in other' , 'SC in other' ,  'NC in both'))+
  labs(x = "Hi-C-based binning methods", y = "Number of near-complete bins", title = "")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))



#####known vs unknown cow fecal######
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1], each = 1)
Completeness = rep(c( "Known"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(
28,
33 , 
33 ,
0 ,
61 )


df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Known"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1])

col = c("#D2691E")
ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c("Known"))+
  labs(x = "Binning method", y = "Number of species", 
       title = "Cow rumen long-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))


#####sheep gut######
Rank = rep(c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR', 'VAMB')[5:1], each = 1)
Completeness = rep(c( "Known"),times = 5)
###Number needs to be 4*5 matrix##
Number = c(
110,
108 , 
103 ,
62 ,
176 )


df <- data.frame(Rank = Rank, Completeness = Completeness, Number = Number)
df$Completeness = factor(df$Completeness , levels=c("Known"))
df$Rank = factor(df$Rank , levels = c('MetaCC' , 'HiCBin' , 'bin3C' , 'MetaTOR' , 'VAMB')[5:1])

col = c("#D2691E")
ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Completeness)) + 
  geom_bar(stat = 'identity', position = 'stack', width = 0.6)+
  scale_fill_manual(values = col , limits= c( "Known"))+
  labs(x = "Binning method", y = "Number of species", 
       title = "Sheep gut long-read metaHi-C dataset")+
  scale_y_continuous(expand = expansion(mult = c(0, .1)))+
  coord_flip()+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 11),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 13,face = "bold"),
        axis.title.y = element_text(size = 13,face = "bold"),
        title = element_text(size = 14,face = "bold"),
        plot.title = element_text(hjust = 0.5))

#d__Bacteria;p__Firmicutes;c__Bacilli;o__Erysipelotrichales;f__Erysipelotrichaceae;g__UBA636;s__UBA636 sp900321955




##########Yeast F-score ARI and NMI###########
Rank = rep(c('F-score' , 'ARI' , 'NMI') , each = 4)
Pipeline = rep(c('Raw' , 'HiCzin' , 'NormCC' , 'NormCC + Spurious contact removal'),times = 3)
Number = c(0.758,0.908,0.945,0.949,
           0.710,0.894,0.938,0.941,
           0.827,0.895,0.931,0.935)

#col = c('#8FBC94' , '#4FB0C6', "#4F86C6", "#527F76",'#8B0000','#CC9966')
col = c("#527F76", '#CC9966' , '#8B0000' ,'#4682B4')

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('Raw' , 'HiCzin' , 'NormCC' , 'NormCC + Spurious contact removal'))
df$Rank = factor(df$Rank , levels = c('F-score' , 'ARI' , 'NMI'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'dodge', width = 0.7)+
  scale_fill_manual(values = col,limits= c('Raw' , 'HiCzin' , 'NormCC' , 'NormCC + Spurious contact removal'))+
  coord_cartesian(ylim = c(0.6,0.975))+
  labs(x = "Clustering metrics", y = "Scores", title = "The synthetic yeast dataset")+
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text = element_text(size = 12),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"),
        title = element_text(size = 16,face = "bold"),
        plot.title = element_text(hjust = 0.5))


########Fraction of host by different number of viruses#########

df<-data.frame(group=c('infected by one virus' , 'infected by two viruses', 'infected by three viruses'),
               value=c(25,35,45))
df$group = as.vector(df$group)

ggplot(df,aes(x="",y=value,fill=group))+
  geom_bar(stat="identity")+
  coord_polar("y",start=1) + 
  geom_text(aes(y=
                  c(0,cumsum(value)[-length(value)]),
                label=percent(value/100)),size=5)+
  theme_minimal()+
  theme(axis.title=element_blank(),
        axis.ticks=element_blank(),
        axis.text = element_blank(),
        legend.title = element_blank())+
  scale_fill_manual(values=c("darkgreen","orange","deepskyblue"))




##Sheep gut
Rank = rep(c('Oscillospirales' , 'Christensenellales', 'Bacteroidales', 'Lachnospirales' , 'RF39'),each = 3)
Pipeline = rep(c('Siphoviridae', 'Myoviridae' , 'Podoviridae'),times = 5)
#Number = c(36 , 7 , 1 , 
#          30 , 5 , 1, 
#           21, 3 , 3, 
#           8, 0, 1, 
#           53, 12 ,0 )

Number = c(3 , 0 , 0 , 
           3 , 0 , 0 , 
           4, 0 , 2, 
           1, 0, 1, 
           9, 3 ,0 )

col = c('#8FBC94' , '#4FB0C6', '#D2B48C' , "#6E7783")

df <- data.frame(Rank = Rank, Pipeline = Pipeline, Number = Number)
df$Pipeline = factor(df$Pipeline , levels=c('Siphoviridae' , 'Myoviridae' , 'Podoviridae' , 'Herpesviridae'))
df$Rank = factor(df$Rank , levels = c('Oscillospirales' , 'Christensenellales', 'Bacteroidales', 'Lachnospirales' , 'RF39'))


ggplot(data = df, mapping = aes(x = Rank, y = Number, fill = Pipeline)) + 
  geom_bar(stat = 'identity', position = 'stack')+
  scale_fill_manual(name="Phage family", values = col,limits= c('Siphoviridae' , 'Myoviridae' ,  'Podoviridae' , 'Herpesviridae'))+
  labs(x = "Order of MAGs", y = "Number of phage contigs found in MAGs", title = "The sheep gut long-read metaHiC dataset")+
  theme(
    legend.title=element_text(size = 14),
    legend.text = element_text(size = 12, face = "italic"),
    panel.grid.major = element_blank(),   #不显示网格线
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(size = 12 , vjust=0.6, angle = 12 , face = "italic"),
    axis.text.y = element_text(size = 12),
    axis.title.x = element_text(size = 14,face = "bold"),
    axis.title.y = element_text(size = 14,face = "bold"),
    title = element_text(size = 16,face = "bold"),
    plot.title = element_text(hjust = 0.5))

ggsave("host_virus_sheep.eps", width = 9, height = 6, device = cairo_ps)


x = c(87/1000, 389/1000 , 3826/1000 , 11966/1000 , 61887/1000 , 5601/1000)
y = c(sqrt(13/60) , sqrt(15) , sqrt(104) , sqrt(33) , sqrt(6751))

plot(x , y , xlab = 'The number of annotated contigs/1000', ylab = 'The root of the consumed time (min)')


x = c(496050/10000, 389/1000 , 3826/1000 , 11966/1000 , 240525/1000 , 191305/1000)
y = c(13 , 22 , 150 , 54 , 15 , 4)
plot(x , y , xlab = 'The number of contigs/1000', ylab = 'Time consuming (s)')


#####Draw the number of contigs from each species in the synthetic yeast dataset###
contig_prop = data.frame('Number of Contigs' = c(1942, 729, 500, 570,1224,532,260,162,190,178,96,130,16),
                         'Species' = c('S.kudriavzevii','S.cerevisiae','S.bayanus','L.kluyveri','S.paradoxus',
                                       'S.mikatae','N.castellii','K.lactis','S.stipitis',
                                       'L.waltii','A.gossypii','K.wickerhamii','P.pastoris'))

ggplot(data = contig_prop, aes(x = Species, y = Number.of.Contigs )) + 
  geom_bar(stat = "identity", position='dodge' , width = 0.9,fill = 'steelblue') +    
  labs(x = "Species", y = "Number of assembled contigs", title = " ") +
  theme(axis.text.x = element_text(size = 11.5 , hjust=1, angle = 45 , face = "italic"),
        axis.text.y = element_text(size = 11.5),
        panel.grid.major = element_blank(),   #不显示网格线
        panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 14,face = "bold"),
        axis.title.y = element_text(size = 14,face = "bold"))
#geom_text(aes(label = Number.of.Contigs , x = Species, y = Number.of.Contigs+30 ))








