% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/graph.R
\docType{methods}
\name{as_graph}
\alias{as_graph}
\alias{as_graph-method}
\alias{as_graph,TimeIntervals-method}
\title{Interval Graph}
\usage{
as_graph(object, ...)

\S4method{as_graph}{TimeIntervals}(object, aggregate = TRUE, ...)
}
\arguments{
\item{object}{A \code{\linkS4class{TimeIntervals}} object.}

\item{...}{Currently not used.}

\item{aggregate}{A \code{\link{logical}} scalar: should disjoint intervals referring to
the same event be aggregated?}
}
\value{
An \pkg{igraph} graph object.
}
\description{
Interval Graph
}
\details{
An interval graph is the graph showing intersecting intervals on a line.
As time is linear and not circular, an interval graph contains no cycles
with more than three edges and no shortcuts.
}
\examples{
\dontrun{
## Seven intervals
int <- intervals(
  start = c(1, 2, 3, 6, 9, 13, 17),
  end = c(7, 4, 15, 14, 11, 18, 19),
  calendar = CE(),
  names = c("A", "B", "C", "D", "E", "F", "G")
)

## Do the intervals overlap?
overlap(int) > 0

## Interval graph
g <- as_graph(int)
plot(g)
}
}
\seealso{
Other chronological reasoning tools: 
\code{\link{overlap}()}
}
\author{
N. Frerebeau
}
\concept{chronological reasoning tools}
