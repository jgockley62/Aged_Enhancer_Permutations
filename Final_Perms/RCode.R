##Deena's Permutations
library("plotrix", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")

##Zscore Matrix
ZScore<-matrix(0,5,3)
colnames(ZScore)<-c("Enhancer","Core","OutsideCore")
row.names(ZScore)<-c("Eutheria","Theria","Mammalia","Amniote","OlderThanAmniote")
#####
setwd(dir="/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/EUTHERIA/")

temp = list.files(pattern="*.bed")
named.list <- lapply(temp, read.table)
longdf <- do.call(cbind, named.list)

EUTHERIA<-matrix(0,10000,3)
foo<-as.character(as.matrix(longdf[1,1:3]))
colnames(EUTHERIA)<-as.character(as.matrix(longdf[1,1:3]))
longdfV2 <- longdf[-1,]
colnames(longdfV2)<-as.character(as.matrix(longdf[1,]))

#Elements in peaks
temp<-as.matrix(longdfV2[,as.numeric(seq(from=1, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
EUTHERIA[,1]<-apply(tempV2,1,sum)

#Elements in Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=2, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
EUTHERIA[,2]<-apply(tempV2,1,sum)

#Elements Outside Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=3, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
EUTHERIA[,3]<-apply(tempV2,1,sum)

mean(EUTHERIA[,1])
#4768.823
sd(EUTHERIA[,1])
#179.7181
ZScore[1,1]<-(9715-mean(EUTHERIA[,1]))/sd(EUTHERIA[,1])

mean(EUTHERIA[,2])
#4357.535
sd(EUTHERIA[,2])
#167.1826
ZScore[1,2]<-(9642-mean(EUTHERIA[,2]))/sd(EUTHERIA[,2])

mean(EUTHERIA[,3])
#411.2878
sd(EUTHERIA[,3])
#37.87988
ZScore[1,3]<-(74-mean(EUTHERIA[,3]))/sd(EUTHERIA[,3])


#####
setwd(dir="/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/THERIA/")

temp = list.files(pattern="*.bed")
named.list <- lapply(temp, read.table)
longdf <- do.call(cbind, named.list)

THERIA<-matrix(0,10000,3)
foo<-as.character(as.matrix(longdf[1,1:3]))
colnames(THERIA)<-as.character(as.matrix(longdf[1,1:3]))
longdfV2 <- longdf[-1,]
colnames(longdfV2)<-as.character(as.matrix(longdf[1,]))

#Elements in peaks
temp<-as.matrix(longdfV2[,as.numeric(seq(from=1, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
THERIA[,1]<-apply(tempV2,1,sum)

#Elements in Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=2, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
THERIA[,2]<-apply(tempV2,1,sum)

#Elements Outside Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=3, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
THERIA[,3]<-apply(tempV2,1,sum)

mean(THERIA[,1])
#5159.325
sd(THERIA[,1])
#197.1506
ZScore[2,1]<-(16180-mean(THERIA[,1]))/sd(THERIA[,1])

mean(THERIA[,2])
#1440.649
sd(THERIA[,2])
#79.69033
ZScore[2,2]<-(11266-mean(THERIA[,2]))/sd(THERIA[,2])


mean(THERIA[,3])
#3718.676
sd(THERIA[,3])
#158.2776
ZScore[2,3]<-(4914-mean(THERIA[,3]))/sd(THERIA[,3])

)#####
setwd(dir="/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/MAMMALIA/")

temp = list.files(pattern="*.bed")
named.list <- lapply(temp, read.table)
longdf <- do.call(cbind, named.list)

MAMMALIA<-matrix(0,10000,3)
foo<-as.character(as.matrix(longdf[1,1:3]))
colnames(MAMMALIA)<-as.character(as.matrix(longdf[1,1:3]))
longdfV2 <- longdf[-1,]
colnames(longdfV2)<-as.character(as.matrix(longdf[1,]))

#Elements in peaks
temp<-as.matrix(longdfV2[,as.numeric(seq(from=1, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
MAMMALIA[,1]<-apply(tempV2,1,sum)

#Elements in Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=2, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
MAMMALIA[,2]<-apply(tempV2,1,sum)

#Elements Outside Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=3, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
MAMMALIA[,3]<-apply(tempV2,1,sum)

mean(MAMMALIA[,1])
#7077.066
sd(MAMMALIA[,1])
#238.0998
ZScore[3,1]<-(24304-mean(MAMMALIA[,1]))/sd(MAMMALIA[,1])

mean(MAMMALIA[,2])
#1637.561
sd(MAMMALIA[,2])
#83.66134
ZScore[3,2]<-(14197-mean(MAMMALIA[,2]))/sd(MAMMALIA[,2])


mean(MAMMALIA[,3])
#5439.505
sd(MAMMALIA[,3])
#201.7021
ZScore[3,3]<-(10107-mean(MAMMALIA[,3]))/sd(MAMMALIA[,3])


###
setwd(dir="/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/AMMNIOTA")

temp = list.files(pattern="*.bed")
named.list <- lapply(temp, read.table)
longdf <- do.call(cbind, named.list)

AMNI<-matrix(0,10000,3)
foo<-as.character(as.matrix(longdf[1,1:3]))
colnames(AMNI)<-as.character(as.matrix(longdf[1,1:3]))
longdfV2 <- longdf[-1,]
colnames(longdfV2)<-as.character(as.matrix(longdf[1,]))

#Elements in peaks
temp<-as.matrix(longdfV2[,as.numeric(seq(from=1, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
AMNI[,1]<-apply(tempV2,1,sum)

#Elements in Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=2, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
AMNI[,2]<-apply(tempV2,1,sum)

#Elements Outside Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=3, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
AMNI[,3]<-apply(tempV2,1,sum)

mean(AMNI[,1])
#5206.2
sd(AMNI[,1])
#207.4573
ZScore[4,1]<-(23202-mean(AMNI[,1]))/sd(AMNI[,1])


mean(AMNI[,2])
#1019.257
sd(AMNI[,2])
#64.49482
ZScore[4,2]<-(11582-mean(AMNI[,2]))/sd(AMNI[,2])


mean(AMNI[,3])
#4186.942
sd(AMNI[,3])
#181.4498
ZScore[4,3]<-(11620-mean(AMNI[,3]))/sd(AMNI[,3])


######OlderThan Amniote:
setwd(dir="/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/OlderThanAMNIOTA/")

temp = list.files(pattern="*.bed")
named.list <- lapply(temp, read.table)
longdf <- do.call(cbind, named.list)

OlderThanAm<-matrix(0,10000,3)
foo<-as.character(as.matrix(longdf[1,1:3]))
colnames(OlderThanAm)<-as.character(as.matrix(longdf[1,1:3]))
longdfV2 <- longdf[-1,]
colnames(longdfV2)<-as.character(as.matrix(longdf[1,]))

#Elements in peaks
temp<-as.matrix(longdfV2[,as.numeric(seq(from=1, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
OlderThanAm[,1]<-apply(tempV2,1,sum)

#Elements in Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=2, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
OlderThanAm[,2]<-apply(tempV2,1,sum)

#Elements Outside Cores
temp<-as.matrix(longdfV2[,as.numeric(seq(from=3, to=ncol(longdfV2), by=3))])
tempV2<-apply(temp,2,as.numeric)
OlderThanAm[,3]<-apply(tempV2,1,sum)


mean(OlderThanAm[,1])
#4674.743
sd(OlderThanAm[,1])
#204.3482
ZScore[5,1]<-(24127-mean(OlderThanAm[,1]))/sd(OlderThanAm[,1])

mean(OlderThanAm[,2])
#660.1878
sd(OlderThanAm[,2])
#49.91436
ZScore[5,2]<-(6601-mean(OlderThanAm[,2]))/sd(OlderThanAm[,2])


mean(OlderThanAm[,3])
#4014.556
sd(OlderThanAm[,3])
#185.7473
ZScore[5,3]<-(17526-mean(OlderThanAm[,3]))/sd(OlderThanAm[,3])

###
setwd("/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/")
setEPS()
postscript("Comp_Perms.eps")
par(mfrow=c(5,3), mar=c(2.5,3,1,.75))

###
EUTHERIA_Enh<-9715
EUTHERIA_Core<-9641
EUTHERIA_Outside<-EUTHERIA_Enh-EUTHERIA_Core

par(bty="n")
hist(as.numeric(EUTHERIA[,1]),  breaks=40, xlim=c(c(1000,10000)), col=rgb(125/255,86/255,163/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Enhancers")
abline(v=EUTHERIA_Enh, lty =4, lwd=3)

hist(EUTHERIA[,2], breaks=40, xlim=c(0,10000), col=rgb(125/255,86/255,163/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Cores")
abline(v=EUTHERIA_Core, lty =4, lwd=3)

hist(EUTHERIA[,3],breaks=60, xlim=c(0,1000), col=rgb(125/255,86/255,163/255), las =1, xlab="Phastcons Elements", main="Phastcons Outside Permuted Cores")
abline(v=EUTHERIA_Outside, lty =4, lwd=3)

###
THERIA_Enh<-16180
THERIA_Core<-11266
THERIA_Outside<-THERIA_Enh-THERIA_Core

par(bty="n")
hist(as.numeric(THERIA[,1]), xlim=c(c(2000,17000)), xaxs = "i", col=rgb(186/255,171/255,211/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Enhancers")
abline(v=THERIA_Enh, lty =4, lwd=3)

hist(THERIA[,2],breaks=10, xlim=c(0,12000), col=rgb(186/255,171/255,211/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Cores")
abline(v=THERIA_Core, lty =4, lwd=3)

hist(THERIA[,3],breaks=40, xlim=c(2000,6000), col=rgb(186/255,171/255,211/255), las =1, xlab="Phastcons Elements", main="Phastcons Outside Permuted Cores")
abline(v=THERIA_Outside, lty =4, lwd=3)

###
MAMMALIA_Enh<-24304
MAMMALIA_Core<-14197
MAMMALIA_Outside<-MAMMALIA_Enh-MAMMALIA_Core

par(bty="n")
hist(as.numeric(MAMMALIA[,1]), xlim=c(c(3000,25000)), xaxs = "i", col=rgb(247/255,148/255,32/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Enhancers")
abline(v=MAMMALIA_Enh, lty =4, lwd=3)

hist(MAMMALIA[,2],breaks=10, xlim=c(0,15000), col=rgb(247/255,148/255,32/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Cores")
abline(v=MAMMALIA_Core, lty =4, lwd=3)

hist(MAMMALIA[,3],breaks=40, xlim=c(4000,11000), col=rgb(247/255,148/255,32/255), las =1, xlab="Phastcons Elements", main="Phastcons Outside Permuted Cores")
abline(v=MAMMALIA_Outside, lty =4, lwd=3)
     
###
Amniote_Enh<-23202
Amniote_Core<-11582
Amniote_Outside<-Amniote_Enh-Amniote_Core

par(bty="n")
hist(as.numeric(AMNI[,1]), xlim=c(c(3000,25000)), col=rgb(109/255,190/255,68/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Enhancers")
abline(v=Amniote_Enh, lty =4, lwd=3)

hist(AMNI[,2],breaks=10, xlim=c(0,13000), col=rgb(109/255,190/255,68/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Cores")
abline(v=Amniote_Core, lty =4, lwd=3)

hist(AMNI[,3],breaks=40, xlim=c(0,13000), col=rgb(109/255,190/255,68/255), las =1, xlab="Phastcons Elements", main="Phastcons Outside Permuted Cores")
abline(v=Amniote_Outside, lty =4, lwd=3)

###
OlderThanA_Enh<-24127
OlderThanA_Core<-6601
OlderThanA_Outside<-OlderThanA_Enh-OlderThanA_Core

par(bty="n")
hist(as.numeric(OlderThanAm[,1]), xlim=c(0,25000), col=rgb(195/255,224/255,173/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Enhancers")
abline(v=OlderThanA_Enh, lty =4, lwd=3)

hist(OlderThanAm[,2],breaks=10, xlim=c(0,8000), col=rgb(195/255,224/255,173/255), las =1, xlab="Phastcons Elements", main="Phastcons In Permuted Cores")
abline(v=OlderThanA_Core, lty =4, lwd=3)

hist(OlderThanAm[,3],breaks=40, xlim=c(0,18000), col=rgb(195/255,224/255,173/255), las =1, xlab="Phastcons Elements", main="Phastcons Outside Permuted Cores")
abline(v=OlderThanA_Outside, lty =4, lwd=3)         

dev.off()

#Plot Z-scores
Sample_Cat<-c(5,4,3,2,1)
ZScore<-cbind(ZScore[,1:3],Sample_Cat)


setwd("/Users/Sazerac/Dropbox/DENNA_Shuf/Final_Perms/")
setEPS()
postscript("ZScore_OutsideCore_Perms.eps")
#Base Plot
plot(ZScore[,4],ZScore[,3], xlim=c(-3,6.5), type='n', xaxt='n', xlab="Age", ylab="Z-Score", main="Z-Scores of Observed Phastcons Outside of Enhancer Cores", las=1)
axis(4, at=trunc(ZScore[,3]), ticks=trunc(ZScore[,3]), lwd=2, las=1)

#Fit line
smoothingSpline = smooth.spline(ZScore[,4], ZScore[,3], spar=0.2)
lines(smoothingSpline, lwd=2)

#Text over data points
text(ZScore[1,4],ZScore[1,3], cex=3, label="Eutheria", font =2, col=rgb(125/255,86/255,163/255))
text(ZScore[2,4],ZScore[2,3], cex=3, label="Theria", font =2, col=rgb(186/255,171/255,211/255))
text(ZScore[3,4],ZScore[3,3], cex=3, label="Mammalia", font =2, col=rgb(247/255,148/255,32/255))
text(ZScore[4,4],ZScore[4,3], cex=3, label="Amniota", font =2, col=rgb(109/255,190/255,68/255))
text(ZScore[5,4],ZScore[5,3], cex=3, label="Older Than Amniota", font =2, col=rgb(195/255,224/255,173/255))

dev.off()






