% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache_ui.R
\name{cached}
\alias{cached}
\title{Enumerate cached targets or check if a target is cached.}
\usage{
cached(..., list = character(0), no_imported_objects = FALSE,
  path = getwd(), search = TRUE, cache = NULL,
  verbose = drake::default_verbose(), namespace = NULL, jobs = 1)
}
\arguments{
\item{...}{objects to load from the cache, as names (unquoted)
or character strings (quoted). Similar to \code{...} in
\code{\link{remove}(...)}.}

\item{list}{character vector naming objects to be loaded from the
cache. Similar to the \code{list} argument of \code{\link[=remove]{remove()}}.}

\item{no_imported_objects}{logical, applies only when
no targets are specified and a list of cached targets is returned.
If \code{no_imported_objects} is \code{TRUE}, then \code{cached()}
shows built targets (with commands) plus imported files,
ignoring imported objects. Otherwise, the full collection of
all cached objects will be listed. Since all your functions and
all their global variables are imported, the full list of
imported objects could get really cumbersome.}

\item{path}{Root directory of the drake project,
or if \code{search} is \code{TRUE}, either the
project root or a subdirectory of the project.
Ignored if a \code{cache} is supplied.}

\item{search}{logical. If \code{TRUE}, search parent directories
to find the nearest drake cache. Otherwise, look in the
current working directory only.
Ignored if a \code{cache} is supplied.}

\item{cache}{drake cache. See \code{\link[=new_cache]{new_cache()}}.
If supplied, \code{path} and \code{search} are ignored.}

\item{verbose}{logical or numeric, control printing to the console.
Use \code{pkgconfig} to set the default value of \code{verbose}
for your R session:
for example, \code{pkgconfig::set_config("drake::verbose" = 2)}.
\describe{
\item{0 or \code{FALSE}:}{print nothing.}
\item{1 or \code{TRUE}:}{print only targets to build.}
\item{2:}{in addition, print checks and cache info.}
\item{3:}{in addition, print any potentially missing items.}
\item{4:}{in addition, print imports. Full verbosity.}
}}

\item{namespace}{character scalar, name of the storr namespace
to use for listing objects}

\item{jobs}{number of jobs/workers for parallel processing}
}
\value{
Either a named logical indicating whether the given
targets or cached or a character vector listing all cached
items, depending on whether any targets are specified
}
\description{
Read/load a cached item with \code{\link[=readd]{readd()}}
or \code{\link[=loadd]{loadd()}}.
}
\examples{
\dontrun{
test_with_dir("Quarantine side effects.", {
load_mtcars_example() # Load drake's canonical example.
make(my_plan) # Run the project, build all the targets.
cached(list = 'reg1') # Is 'reg1' in the cache?
# List all the targets and imported files in the cache.
# Exclude R objects imported from your workspace.
cached(no_imported_objects = TRUE)
# List all targets and imports in the cache.
cached()
# Clean the main data.
clean()
# The targets and imports are gone.
cached()
# But there is still metadata.
build_times()
cached(namespace = "build_times")
# Clear that too.
clean(purge = TRUE)
cached(namespace = "build_times")
build_times()
})
}
}
\seealso{
\code{\link[=built]{built()}}, \code{\link[=imported]{imported()}},
\code{\link[=readd]{readd()}}, \code{\link[=loadd]{loadd()}},
\code{\link[=drake_plan]{drake_plan()}}, \code{\link[=make]{make()}}
}
