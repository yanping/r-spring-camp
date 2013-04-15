#  R语言春季培训班 代码
=====================

# 键盘读入

x <- scan()

y <- readline()

# 指定一个提示语字符串作为参数
inits <- readline("type your initials: ")

mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
mydata <- edit(mydata)

# 显示到屏幕
#-------------
x <- 1:3
print(x^2)

cat(x,"abc","de\n")
cat(x,"abc","de\n",sep="")
cat(x,"abc","de\n",sep="\n")

# 读文件
#---------------
z <- scan("z1.txt")
z <- read.table("tab.txt",header=TRUE)

# 由于字符和数值混杂，不能用scan()
zz <- scan("tab.txt")

# 用网址做参数
uci <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
uci <- paste(uci,"echocardiogram/echocardiogram.data",sep="")
ecc <- read.csv(uci)

## 从Excel中读取

# 第一行包含变量名
# 名为mysheet的sheet有数据

library(RODBC)
channel <- odbcConnectExcel("c:/myexel.xls")
mydata <- sqlFetch(channel, "mysheet")
odbcClose(channel) 

# RODBC例子
# 从数据库中把两张表导出到R中

library(RODBC)
myconn <-odbcConnect("mydsn", uid="Rob", pwd="aardvark")
crimedat <- sqlFetch(myconn, Crime)
pundat <- sqlQuery(myconn, "select * from Punishment")
close(myconn) 


# to SPSS
library(foreign)
write.foreign(mydata, "c:/mydata.txt", "c:/mydata.sps",   package="SPSS") 

# to SAS
library(foreign)
write.foreign(mydata, "c:/mydata.txt", "c:/mydata.sas",   package="SAS") 

# to Stata binary format
library(foreign)
write.dta(mydata, "c:/mydata.dta") 

# 缺失值
#---------------
# 测试是否为缺失
is.na(x) 
y <- c(1,2,3,NA)
is.na(y) 

# v1变量取99是缺失
# 选出v1为99的行，把v1重编码为NA
mydata[mydata$v1==99,"v1"] <- NA 


x <- c(1,2,NA,3)
mean(x) # 返回 NA
mean(x, na.rm=TRUE) 

# 对缺失的处理
a <- c(2,3,NA)
b <-c(NA,4,1)
dd <- data.frame(a,b)

na.omit(dd)

complete.cases(dd)

# 数据合并

d1 <- data.frame(id=c(1,2,3),A=c(2,3,4))
d2 <- data.frame(id=c(2,3,4),B=c(1,5,6))
merge(d1,d2,by= "id")
merge(d1,d2,by= "id",all=T)

# 创建新变量
#----------------

mydata <- data.frame(x1=c(1,2,3),x2=c(-1,3,4))

mydata$sum <- mydata$x1 + mydata$x2
mydata$mean <- (mydata$x1 + mydata$x2)/2

# 删除变量
mydata$sum <- NULL
mydata$mean <- NULL

# 绑定数据集
attach(mydata)
mydata$sum <- x1 + x2
mydata$mean <- (x1 + x2)/2
detach(mydata)

# 用transform()函数
mydata <- transform( mydata,
sum = x1 + x2,
mean = (x1 + x2)/2
) 

# 创建2个年龄组
mydata$agecat <- ifelse(mydata$age > 70,
c("older"), c("younger"))

# 另一个例子：创建3个年龄组
attach(mydata)
mydata$agecat[age > 75] <- "Elder"
mydata$agecat[age > 45 & age <= 75] <- "Middle Aged"
mydata$agecat[age <= 45] <- "Young"
detach(mydata) 

# 给变量重命名
fix(mydata)
names(mydata) <- c("age", "ses") 

# 累积求和
x <- c(12,5,13)
cumsum(x)

# 累积乘积
cumprod(x)

# 最大值最小值
z <- matrix(c(1,5,6,2,3,2),nrow = 3)
min(z[,1],z[,2])
pmin(z[,1],z[,2])

# apply函数系列
#---------------

z <- matrix(1:6,ncol=2)
apply(z,2,mean)

ages <- c(25,26,55,37,21,42)
affils <- c("R","D","D","R","U","D")
tapply(ages,affils,mean)

d <- data.frame(list(gender=c("M","M","F","M","F","F"),
age=c(47,59,21,32,33,24),income=c(55000,88000,32450,76500,123000,45650)))
d$over25 <- ifelse(d$age > 25,1,0)
tapply(d$income,list(d$gender,d$over25),mean)

lapply(list(1:3,25:29),median)

sapply(list(1:3,25:29),median)

d <- data.frame(kids=c("jill","jack"), age=c(12,10), stringsAsFactors=FALSE)

dl <- lapply(d,sort)
ds <- sapply(d,sort)

# 数据汇总

df <- data.frame(group=c('a','a','a','b','b'),value=c(10,20,30,100,200))
aggregate(value ~ group, df, sum)

# 第二个问题 请看 http://cos.name/cn/topic/109777
df <- data.frame(  id = c(1,1,1,2,2,2),
                 year = c(1997,1998,1999,1997,1998,1999),
                  var = c(1,2,3,4,5,6))
meanById <- aggregate(var ~ id, df, mean)

result <- df$var - meanById$var[df$id]

# 上题的第二种解法
library(plyr)
result <- ddply(df,"id",transform,meanById=mean(var))

#  第三个问题  http://cos.name/cn/topic/109385
df <- data.frame(X=c('a','a','a','b','b'),Y=c(10,20,30,100,200))
df$Z <- unlist(by(df$Y,df$X,cumsum))

