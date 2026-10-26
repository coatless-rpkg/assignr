# Retrieve example file path

Obtains the file path for the example Rmd in the package.

## Usage

``` r
get_example_filepath(x)
```

## Arguments

- x:

  A `character` containing the name of the example Rmd.

## Value

File path to the example file that ships with the package.

## Details

The following example files ship with the package:

- hw00-main.Rmd

## Examples

``` r
get_example_filepath("hw00-main.Rmd")
#> [1] "/home/runner/work/_temp/Library/assignr/example_rmd/hw00-main.Rmd"
```
