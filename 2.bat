del 2-basic-methods.pdf
pandoc -t beamer --template=cos.beamer.tex --latex-engine=xelatex --toc -Vurl:1 -V theme:CambridgeUS -V colortheme:dolphin -V fontsize:10pt -V shorttitle:COS  2-basic-methods.md  -o 2-basic-methods.pdf
2-basic-methods.pdf