# Create Homework and Assignment Materials

Transforms an RMarkdown file into two separate files: `filename-assign`
and `filename-solutions`

## Usage

``` r
assignr(
  file,
  output_dir = NULL,
  output_format = c("html_document", "pdf_document"),
  assign_file = TRUE,
  soln_file = TRUE,
  zip_files = TRUE,
  render_files = TRUE
)
```

## Arguments

- file:

  Input `.Rmd` file with `-main.Rmd` in the filename.

- output_dir:

  Output directory. Defaults to name of prefix of filename.

- output_format:

  Output file type. Any
  [`rmarkdown::render()`](https://pkgs.rstudio.com/rmarkdown/reference/render.html)
  output format should work. Defaults to generating both an HTML and PDF
  output with `c("html_document", "pdf_document")`.

- assign_file:

  Generate Student Assignment Material. Default is `TRUE`.

- soln_file:

  Generate Solution Material. Default is `TRUE`.

- zip_files:

  Create a zip file containing the relevant materials. Default is
  `TRUE`.

- render_files:

  Create HTML and PDF output for each Rmd file. Default is `TRUE`.

## Value

The function will generate assignment files for students and solution
keys for instructors.

## Details

The `file` parameter *must* have the suffix `-main.Rmd`. The reason for
requiring this naming scheme is all work should be done in the "main"
document. By enforcing the naming requirement, we are prevent work from
being overridden.

## Folder structure

If `output_dir` is specified, then it will be used as the parent for two
folders: `*-assign` and `*-sol`, where `*` is given by the part
preceeding `-main.Rmd`. Inside the folders, there will be `html`, `pdf`,
and `Rmd` documents alongside a `zip` a folder containing all of the
documents.

## Examples

``` r
# Obtain an example file
hw00_file = get_example_filepath("hw00-main.Rmd")

if(interactive()) {
    file.show(hw00_file)
}

# Generate both PDF and HTML outputs for assign and solution.
assignr(hw00_file, "test")
#> Building hw00-assign files
#> Creating a zip file for hw00-assign
#> Building hw00-soln files
#> Creating a zip file for hw00-soln

# Generate only the assignment
assignr(hw00_file, "assignment-set", soln_file = FALSE)
#> Building hw00-assign files
#> Creating a zip file for hw00-assign

# Generate only the solution
assignr(hw00_file, "solution-set", assign_file = FALSE)
#> Building hw00-soln files
#> Creating a zip file for hw00-soln

# Create only HTML documents for both assignment and solution files.
assignr(hw00_file, "test-html", output_format = "html_document")
#> Building hw00-assign files
#> Creating a zip file for hw00-assign
#> Building hw00-soln files
#> Creating a zip file for hw00-soln
```
