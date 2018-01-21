# assignr 

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/coatless/assignr.svg)](https://travis-ci.org/coatless/assignr) 
[![Package-License](http://img.shields.io/badge/license-GPL%20(%3E=2)-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](http://www.r-pkg.org/badges/version/assignr)](https://cran.r-project.org/package=assignr)
[![Downloads](http://cranlogs.r-pkg.org/badges/assignr?color=brightgreen)](http://www.r-pkg.org/pkg/assignr)

Tools for creating homework assignments and solutions using [_RMarkdown_](http://rmarkdown.rstudio.com/).

## Motivation

Writing homework assignments for students in the age of [_RMarkdown_](http://rmarkdown.rstudio.com/) necessitates the creation
of _two_ separate documents -- `assign.Rmd` and `soln.Rmd`.
The goal of `assignr` is to create one document `main.Rmd` that can be broken
apart into the above two documents. Thus, there is no longer a need to 
_copy and paste_ between the `assign` and the `soln` documents as all of the
contents are together in one file.

![Example workflow with `assignr`](https://media.giphy.com/media/l2QEaOm8vqHYG2aNG/giphy.gif)

## Installation

`assignr` is only available via GitHub.

To install the package from GitHub, you can type:

```r
install.packages("devtools")

devtools::install_github("coatless/assignr")
```

## Usage

To use `assignr`, create an Rmd file named `WXYZ-main.Rmd`, where `WXYZ` 
could be `hw00`. Within the file, add to your code chunks one of the following
chunk options:

1. `solution = TRUE`
    - to mark a solution
2. `directions = TRUE` 
    - to indicate directions

When specifying text directions that should not appear in the solution file, use
the latter chunk option, and set the code chunk engine to `asis`, e.g.

````
```{asis name, directions = TRUE}
The goal of the following exercise is... 
```
````

Then, in _R_, run: 

```r
# Render output
assignr("hw00-main.Rmd")
```

Example Output:

```
hw00
├── hw00-assign
│   ├── hw00-assign.Rmd
│   ├── hw00-assign.html
│   ├── hw00-assign.pdf
│   └── hw00-assign.zip
└── hw00-soln
    ├── hw00-soln.Rmd
    ├── hw00-soln.html
    ├── hw00-soln.pdf
    └── hw00-soln.zip
```

Previews of what is contained in each file are shown next.

### Instructor Main

In the main file, denoted as `*-main.Rmd`, all content -- including solutions --
should be placed. As an example of contents, please see the `hw00-main.Rmd`
document that ships with the package.

```r
library("assignr")

file.show(get_example_filepath("hw00-main.Rmd"))
```

````
---
title: 'Homework X'
author: "Prof. Name"
date: 'Due: Friday, Month Day by 1:59 PM CDT'
output:
  html_document:
    theme: readable
    toc: yes
---

# Exercise 1 (Introductory `R`)

```{asis, directions = TRUE}
For this exercise, we will create a couple different vectors.
```

**(a)** Create two vectors `x0` and `x1`. Each should have a
length of 25 and store the following:

- `x0`: Each element should be the value `10`.
- `x1`: The first 25 cubed numbers, starting from `1.` (e.g. `1`, `8`, `27`, et cetera)

```{asis, solution = TRUE}
**Solution:**
```

```{r, solution = TRUE}
x0 = rep(10, 25)
x1 = (1:25) ^ 3
```
````

### Student Assignment

Within this section, the assignment rmarkdown file given to students is displayed.

````
---
title: 'Homework X'
author: "Prof. Name"
date: 'Due: Friday, Month Day by 1:59 PM CDT'
output:
  html_document:
    theme: readable
    toc: yes
---

# Exercise 1 (Introductory `R`)

For this exercise, we will create a couple different vectors.

**(a)** Create two vectors `x0` and `x1`. Each should have a
length of 25 and store the following:

- `x0`: Each element should be the value `10`.
- `x1`: The first 25 cubed numbers, starting from `1.` (e.g. `1`, `8`, `27`, et cetera)
````

![PDF Rendering of `hw00-assign.Rmd`](https://github.com/coatless/assignr/blob/master/docs/assignr-assign-pdf.png)

### Solutions 

Lastly, we have the assignment rmarkdown file that contains the solutions
and their respective output.

````
---
title: 'Homework X'
author: "Prof. Name"
date: 'Due: Friday, Month Day by 1:59 PM CDT'
output:
  html_document:
    theme: readable
    toc: yes
---

# Exercise 1 (Introductory `R`)


**(a)** Create two vectors `x0` and `x1`. Each should have a
length of 25 and store the following:

- `x0`: Each element should be the value `10`.
- `x1`: The first 25 cubed numbers, starting from `1.` (e.g. `1`, `8`, `27`, et cetera)

**Solution:**

```{r, solution = TRUE}
x0 = rep(10, 25)
x1 = (1:25) ^ 3
```
````

![PDF Rendering of `hw00-soln.Rmd`](https://github.com/coatless/assignr/blob/master/docs/assignr-soln-pdf.png)

## Authors

James Joseph Balamuta and David Dalpiaz

## License

GPL (>= 2)
