# Linux-capable RISC-V CPU for IOb-SoC
**WIP** Abstract

## Use a LaTeX Template for your thesis or Uni report
This Latex template was originally a fork but has suffered many alterations to better suit my thesis document requirements. Since I wrote this thesis to describe a computer engineering master's project, I think this template is better suited for engineering students.

### TeX Live
Download the latest version of TeX Live from [here](https://www.tug.org/texlive/).
Or if you use a Debian-based distro, you can do `sudo apt install texlive-full`, which is more accessible and less prone to errors.
The software takes up a little bit of space in the disk. Make sure you have 10 GB available.

### Text Editor
You can use the Text editor of your choice. I use [VS Code](https://code.visualstudio.com/). You can easily compile the tex-files, and you get good support with autocompletion for references or bibliography.

### Compile the tex-file
Suppose you are using a Unix Operating System. In that case, I recommend using the developed Makefile and typing `make` in the projects directory. The Makefile will build the *.pdf* file and take care of the references and glossary.

Alternatively, you can use [LaTeX-Workshop-Extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) on VS Code. However, this last method does not compile the references or the glossary. You must run the command `biber thesis.tex` to compile the references. To compile the glossary, you need to run `makeglossaries thesis.tex`. Do not forget to recompile the Latex code after executing the previous commands.

## LaTeX Template structure
There's one main file called `thesis.tex` which can be found in the root folder. This file includes all the other files needed for the whole template. The content is splitted up into files which can be found in the folder `chapters`.

The chapters are included like this:

```tex
\input{chapters/chapter1}
\input{chapters/chapter2}
\input{chapters/chapter3}
\input{chapters/chapter4}
```

### Settings
All settings are located under the `settings`-folder.

The settings will be included with these commands in the `thesis.tex`-file:

```tex
\input{settings/bibliography.tex}
\input{settings/graphics.tex}
```

### Images
All images are located under the `images`-folder. Because of the settings (`settings/graphics.tex`) we do not need the whole file path when we load an image into the content. You can just write the name of the image.

Example:

```tex
\includegraphics{sample}
```

The 'real' image is located under `images/` and has the full file name `sample.jpeg`. You can easily change the default images path in the `settings/graphics.tex`-file.

**Add image with caption**
The following code shows how to include an image in a `figure` environment. The image has a width of 100% of the page. If you want another width just change it, e.g. 300px.
The caption of the image in the `[]` is the text that will be shown in the list of figures after the table of contents. The text in the `{}` is shown as title under the image.
With the label-text you can refer the image in the text with: `\autoref{fig:imageYouCanReferTo} shows that...`.

```
\begin{figure}[h]
    \includegraphics[width=\textwidth, height=\textheight,keepaspectratio]{sample}
    \caption[Beispielbild (Abbildungsverzeichnis)]{Beispielbild}
    \label{fig:imageYouCanReferTo}
\end{figure}
```

If you have a smaller image and you want to center it, you can set it up with the `centering`-command:

```
\begin{figure}[h]
    \centering
    ...
```

## KomaScript
The template uses the `KomaScript`-bundle. [Need more information?](https://www.ctan.org/pkg/koma-script?lang=de)

## Literature
Big point for a thesis: how to handle the required literature and how to include cites into the thesis?

As you can see (`settings/bibliography.tex`) the template uses the package `biblatex`. In the settings file you need to include your resource files.

```tex
\bibliography{sources/literature.bib}
```

As you can see in the example above we have already a literature file in the `sources`-folder with the following entry:

```
@online{iob_soc,
    author    = "IObundle Lda",
    title     = "IOb-SoC",
    url       = "https://github.com/IObundle/iob-soc",
    edition      = "V0.6",
    keywords  = "iob-soc,riscv"
}
```

The sources will be divided either in "Online"-sources or "Literature"-sources.

This can be configured in the `thesis.tex`-file:

```tex
\printbibliography[heading=subbibliography, type=online, title={Online}]
\printbibliography[heading=subbibliography, type=book, title={Literatur}]
```

### Cites and footnotes
How to use the sources in my content?

You need to know the keyword of your defined source of the `.bib`-file (in the example this is `iob_soc`). Then write the following syntax to create a footnote in your thesis:

**Normal citation**

```tex
\cite{iob_soc}
```

**Citation as footnote**

```tex
\footcite{iob_soc}
```

**Normal footnote**
If you want to add a normal footnote to add some further information:

```tex
\footnote{This is some additional information}
```

## Listings
The listing package already contains some programming languages styles that can be used in your styling.
You will find the settings of the listings under `settings/listings.tex`.

```tex
\begin{lstlisting}[language=bash, caption={Compile Latex code.}]
make
\end{lstlisting}
```

**Inline listing**

```tex
\lstinline[language=make]{make}
```

## Colors

You can define the colors in the `settings/colors.tex`-file.

```tex
\definecolor{vscodegreen}{HTML}{66BB6A}
```

Use colors in the text:

```tex
\textcolor{vscodegreen}{Lorem ipsum dolor}
```
