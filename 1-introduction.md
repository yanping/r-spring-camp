% R语言春令营（1）：导论
% \href{mailto:chen@yanping.me}{陈堰平}
% April 14, 2013

# 课程介绍

## 课程目标

在完成本课程学习后，学员将可以：

- 自行在各种平台上安装和使用R语言；
- 用R语言实现对各种常见数据的基本分析和绘图；
- 用R语言绘制符合论文发表要求的统计图形；
- 了解R语言的整体情况，可以根据自己的需求选择进一步学习的方向。

## 课程计划

- R语言简介和系统安装
- R语言基本语法
- R语言基本统计分析与绘图
- 简介R语言高级统计和绘图方法

## 讲师介绍

陈堰平

- 2007.9~ 2010.7，中国人民大学统计学院，数理统计专业，硕士
- 北京交通大学理学院，信息与计算科学，本科
- [统计之都](http://cos.name)理事会理事
- [中国R语言会议](http://cos.name/chinar/)理事会理事
- COS沙龙理事会理事
- 《R语言编程艺术》的主要译者

# R基本介绍和安装

## 什么是R?

> R是一个用于统计计算和图形的自由软件环境。

> R is a free software environment for statistical computing and graphics.

## R与数据分析

- 基本统计分析
- 多元统计分析
- 数据挖掘：分类、回归、聚类、推荐、关联规则
- 专业领域数据分析：社交网络、生命科学、行为分析、商业智能……
- 大数据分析：Hadoop、HANA、Bigmem
- 生物数据分析：Bioconductor

## R语言与数据可视化

- 基本图形系统：R软件中最基本的绘图系统，简单、易用，功能较弱，系统性不强，例如plot函数、hist函数等
- Lattic、grid、rgl等图形系统：由于R基本图形系统的不足，诞生了很多第三方的图形系统
- ggplot2
基于图形语法（ grammar of graphics），理论上可以画出所有的统计图形，而且语法简洁。但跟基本统计图形的使用有较大差异，有一定的学习难度。
- 自动文档：knitr

## 统计之都与R语言

- 主站有大量介绍R的文章
- 论坛上关于R的问题讨论的最多
- 创始人和主要管理员的贡献
- 翻译编写了大量关于R语言的书 <http://cos.name/books>
- R语言会议 <http://cos.name/chinar/>


## 如何安装

R的官方网站 <http://www.r-project.org/>  


\centering\includegraphics[height=0.6\textheight]{fig/cran.png}

## 开发环境

RStudio官方网站 <http://www.rstudio.com>

## 工作空间

- `getwd()`	显示当前的工作目录
- `setwd("D:/work")`或`setwd("D:\\work")`修改当前的工作目录为mydirectory
列出当前工作空间中的对象
- `rm(objectlist)`	移除（删除）一个或多个对象
- `help(options)`	显示可用选项的说明
- `options()`	显示或设置当前选项
- `history(N)`	显示最近使用过的N个命令（默认值为25）
- `savehistory("myfile")`	保存命令历史到文件myfile中（默认值为 .Rhistory）
- `loadhistory("myfile")`	载入一个命令历史文件（默认值 为 .Rhistory）

## 工作空间（续）

- `save.image("myfile")`	保存工作空间到文件myfile中（默认值为 .RData）
- `save(objectlist, file="myfile")`	保存指定对象到一个文件中
- `load("myfile")`读取一个工作空间到当前会话中（默认值为 .RData）
- `q()`	退出R。将会询问你是否保存工作空间

## 第一个R会话

见代码


## 获取帮助

- `help.start()`	打开帮助文档首页
- `help("foo")`或`?foo`	查看函数foo的帮助（引号可以省略）
- `help.search("foo")`或`??foo`	以foo为关键词搜索本地帮助文档
- `example("foo")`	函数foo的使用示例（引号可以省略）
- `RSiteSearch("foo")`	以foo为关键词搜索在线文档和邮件列表存档
- `apropos("foo", mode="function")`	列出名称中含有foo的所有可用函数
- `data()`	列出当前已加载包中所含的所有可用示例数据集
- `vignette()`	列出当前已安装包中所有可用的vignette文档
- `vignette("foo")`为主题foo显示指定的vignette文档
- `??`, `?`

## 参考资料

- [R菜鸟入门](http://dapengde.com/r4dummies/)
- [《153 分钟学会 R》](http://cran.r-project.org/doc/contrib/Liu-FAQ.pdf) 
- [R参考卡片](http://cran.r-project.org/doc/contrib/Liu-FAQ.pdf)
- R in a Nutshell
- ggplot2: Elegant Graphics for Data
- R Graphics Cookbook
- The Art of R Programming

# R语言基本语法

## 基本数据类型

### 数据类型

- 向量 vector
- 矩阵 matrix
- 数组 array
- 数据框 data frame
- 因子 factor
- 列表 list

### 向量


### 数组


### 矩阵


### 列表


### 数据框


### 因子







 



