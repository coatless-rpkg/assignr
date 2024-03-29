% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignr.R
\name{assignr}
\alias{assignr}
\title{Create Homework and Assignment Materials}
\usage{
assignr(
  file,
  output_dir = NULL,
  output_format = c("html_document", "pdf_document"),
  assign_file = TRUE,
  soln_file = TRUE,
  zip_files = TRUE,
  render_files = TRUE
)
}
\arguments{
\item{file}{Input \code{.Rmd} file with \code{-main.Rmd} in the filename.}

\item{output_dir}{Output directory. Defaults to name of prefix of filename.}

\item{output_format}{Output file type.  Any \code{\link[rmarkdown:render]{rmarkdown::render()}} output
format should work.
Defaults to generating both an HTML and PDF output with
\code{c("html_document", "pdf_document")}.}

\item{assign_file}{Generate Student Assignment Material. Default is \code{TRUE}.}

\item{soln_file}{Generate Solution Material. Default is \code{TRUE}.}

\item{zip_files}{Create a zip file containing the relevant materials.
Default is \code{TRUE}.}

\item{render_files}{Create HTML and PDF output for each Rmd file.
Default is \code{TRUE}.}
}
\value{
The function will generate assignment files for students and
solution keys for instructors.
}
\description{
Transforms an RMarkdown file into two separate files: \code{filename-assign}
and \code{filename-solutions}
}
\details{
The \code{file} parameter \emph{must} have the suffix \code{-main.Rmd}. The reason for
requiring this naming scheme is all work should be done in the "main"
document. By enforcing the naming requirement, we are prevent work from
being overridden.
}
\section{Folder structure}{

If \code{output_dir} is specified, then it will be used as the parent
for two folders: \verb{*-assign} and \verb{*-sol}, where \code{*} is given by the part
preceeding \code{-main.Rmd}. Inside the folders, there will be \code{html}, \code{pdf},
and \code{Rmd} documents alongside a \code{zip} a folder containing all of the
documents.
}

\examples{
# Obtain an example file
hw00_file = get_example_filepath("hw00-main.Rmd")

if(interactive()) {
    file.show(hw00_file)
}

# Generate both PDF and HTML outputs for assign and solution.
assignr(hw00_file, "test")

# Generate only the assignment
assignr(hw00_file, "assignment-set", soln_file = FALSE)

# Generate only the solution
assignr(hw00_file, "solution-set", assign_file = FALSE)

# Create only HTML documents for both assignment and solution files.
assignr(hw00_file, "test-html", output_format = "html_document")

\dontshow{
# Clean up generated directories
unlink("test", recursive = TRUE)
unlink("assignment-set", recursive = TRUE)
unlink("solution-set", recursive = TRUE)
unlink("test-html", recursive = TRUE)
}
}
