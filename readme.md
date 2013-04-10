文件列表

- `cos.beamer.tex` 模板文件
- `demo.md` 演示文件


编译命令为

```
pandoc -t beamer --template=cos.beamer.tex --latex-engine=xelatex -Vurl:1 -V theme:CambridgeUS -V colortheme:dolphin  -V shorttitle:COS  demo.md  -o demo.pdf
```

如果要添加目录

```
pandoc -t beamer --template=cos.beamer.tex --latex-engine=xelatex --toc -Vurl:1 -V theme:CambridgeUS -V colortheme:dolphin  -V shorttitle:COS  demo.md  -o demo.pdf
```