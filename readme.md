## 文件列表

- `cos.beamer.tex` 模板文件
- `demo.md` 演示文件


## 编译命令为

```
pandoc -t beamer --template=cos.beamer.tex --latex-engine=xelatex -Vurl:1 -V theme:CambridgeUS -V colortheme:dolphin  -V shorttitle:COS  demo.md  -o demo.pdf
```

## 如果要添加目录

```
pandoc -t beamer --template=cos.beamer.tex --latex-engine=xelatex --toc -Vurl:1 -V theme:CambridgeUS -V colortheme:dolphin  -V shorttitle:COS  demo.md  -o demo.pdf
```

## beamer主题

beamer的[theme matrix](http://www.hartwork.org/beamer-theme-matrix/)，可以很容易的看到各个theme的式样。纵坐标是主题，横坐标是颜色主题。