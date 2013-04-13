#  R语言春季培训班 代码
=====================


# 第一个R会话
#-----------------------------

# 用数字1、2和4生成一个简单的数据集（用R的说法就是向量），将其命名为x：

x <- c(1,2,4)

# c是连接函数

q <- c(x,x,8)

# 访问元素
x[3]

#  提取子集
x <- c(1,2,4)
x[2:3]  

# 负索引
x[-3]

#  函数的调用
mean(x)
sd(x)

# 把计算结果保存起来
y <- mean(x)

# R的内置数据
data()

# 求均值
mean(Nile)

# 求标准差
sd(Nile)

#  画直方图
hist(Nile)

hist(Nile, breaks = 12)

# 退出
q()


# 关于包
#------------------------------

# 安装包
install.packages("ggplot2")

# 加载包
library(ggplot2)

# 当前加载包的情况
search()

# 当前加载包的情况
.path.package()

# 本地安装包的列表
.packages(all.available = TRUE)

#  关于向量
#------------------------

# 标量
x<-8

x <- c(5,12,13)
x

# 获取长度
length(x)

mode(x)

# 字符向量
y <- "abc"
y

length(y)

# 字符个数
nchar(y)

mode(y)

z <- c("abc","29 88")

length(z)

mode(z)

# 字符串拼接
u <- paste("abc","de","f")

# 循环补齐
x <- c(2,1)
y <- c(4,1,3,5)
x + y


# 筛选

y[y>2]

y[y*y > 10]

y[x<1.5]  # 出现了循环补齐现象

x[y>2]

# 使用seq()创建向量
seq(from=12,to=30,by=3)

x <- c(5,12,13)
1:length(x)
seq(x)

x <- NULL
1:length(x)
seq(x)

# 使用rep()重复向量常数
x <- rep(8,4)

rep(c(5,12,13),3)

rep(1:3,2)

# rep()函数还有一个参数each，与times参数不同的是，它指定x交替重复的次数
 rep(c(5,12,13),each=2)
 
# 关于矩阵
#-------------------------

# 创建矩阵
y<-matrix(c(1,2,3,4),nrow=2,ncol=2)

y<-matrix(c(1,2,3,4),nrow=2)

y[,2]

y[2]

#  另外一种创建矩阵
y<-matrix(nrow=2,ncol=2)
y[1,1]<-1
y[2,1]<-2
y[1,2]<-3
y[2,2]<-4

# 按行排列

m<-matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)

# 矩阵索引
z <- matrix(1:9,3)

z[2]

z[2,]

z[,2]

z[,2:3]

z[c(1,3),]

z[c(1,3),]<- matrix(1:6,nrow=2)

# 增加行或列
z <- rbind(z,c(9,7,8))
z <- cbind(z,1:4)

# 通过重新赋值来删除行
z <- z[1:3,]

# 列表
#-----------------------------

# 创建列表
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)

j <- list(name="Joe", salary=55000, union=T)

jalt <- list("Joe", 55000, T)

# 索引
j$sal

j[["salary"]]

j[[2]]
mode(j[[2]])

j[2] # 仍是列表
mode(j[2])

# 两个列表组成一个列表
v <- c(w, j) 

# 查看内部结构
str(v)

# 增加或删除列表元素
z <- list(a="abc",b=12)
z$c <- "sailing" # 增加元素
z[[4]] <- 28
z[5:7] <- c(FALSE,TRUE,TRUE)

z$b <- NULL # 删除元素

# 获得列表长度
length(j)

# 获取标签
names(j)

# unlist()返回的值是一个向量
ulj <- unlist(j)
ulj
class(ulj)

# 关于数据框
#---------------------------

# 创建
kids <- c("Jack","Jill")
ages <- c(12,10)
d <- data.frame(kids,ages,stringsAsFactors=FALSE)

is.data.frame(d)

# 查看内部结构
str(d)

data(cars)

# 查看数据的前几行
head(cars)

# 访问

cars[2,3]

cars[,2]
cars[,'dist']

cars[2]
cars['dist']

# 关于因子
#---------------------

x <- c(5,12,13,12)

# 转化成因子
xf <- factor(x)

# 查看有哪些水平
levels(xf) 

# 长度仍被定义为数据的长度，而不是水平的个数
length(xf)

# 实现定义水平
xff <- factor(x,levels=c(5,12,13,88))
xff[2] <- 88

# 不允许未经定义的水平
xff[2] <- 28


# 运算
#--------------------

x <- c(TRUE, FALSE, TRUE)
y <- c(TRUE, TRUE, FALSE)

x & y

x[1] && y[1]

x && y  # 只对每个向量的第一个元素求与

if (x[1] && y[1]) print("both TRUE")

if (x & y) print("both TRUE")



# 关于函数
#--------------

g <- function(x) {
 return(x+1)
}

g(2)

# 不同return, 函数体内部最后一行为返回值
foo <- function(x,y) {
 y <- y + 1
 x + y
}

foo(2,0)

#  if-slse
#-----------------------
if (r == 4) {
  x <- 1
} else {
  x <- 3
  y <- 4
}

if (r == 4) 
  x <- 1
  
x <- 2
y <- if(x == 2) x else x+1
y

x <- 3
y <- if(x == 2) x else x+1
y

# 如果不使用这一技巧, 代码会更复杂
if(x == 2) y <- x else y <- x+1

# 关于循环
#-----------------------

i <- 1
while (i <= 10) i <- i+4
i

i <- 1
while(TRUE) {  
  i <- i+4
   if (i > 10) break
}
i

i <- 1
repeat {  # again similar
  i <- i+4
   if (i > 10) break
}
i

# 代码格式化
#-----------------------

library(formatR)
help(package="formatR")



  