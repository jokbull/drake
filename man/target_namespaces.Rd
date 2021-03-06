% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache_namespaces.R
\name{target_namespaces}
\alias{target_namespaces}
\title{For drake caches,
list the \code{storr} cache namespaces
that store target-level information.}
\usage{
target_namespaces(default = storr::storr_environment()$default_namespace)
}
\arguments{
\item{default}{name of the default \code{storr} namespace}
}
\value{
A character vector of \code{storr} namespaces that store
target-level information.
}
\description{
Ordinary users do not need to worry about this function.
It is just another window into \code{drake}'s internals.
}
\examples{
target_namespaces()
}
\seealso{
\code{\link[=make]{make()}}
}
