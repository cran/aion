# COERCION
#' @include AllGenerics.R AllClasses.R
NULL

# To RataDie ===================================================================
#' @export
#' @rdname as_fixed
#' @aliases as_fixed,numeric-method
setMethod(
  f = "as_fixed",
  signature = "numeric",
  definition = function(from) .RataDie(from)
)

# To data.frame ================================================================
#' @export
#' @method as.data.frame TimeSeries
as.data.frame.TimeSeries <- function(x, ..., calendar = NULL) {
  ## Fix dimnames (if needed)
  x <- fix_dimnames(x)
  ## Build a long data frame
  data.frame(
    time = time(x, calendar = calendar)[as.vector(slice.index(x, MARGIN = 1L))],
    series = dimnames(x)[[2L]][as.vector(slice.index(x, MARGIN = 2L))],
    variable = dimnames(x)[[3L]][as.vector(slice.index(x, MARGIN = 3L))],
    value = as.vector(x)
  )
}

#' @export
#' @describeIn as.data.frame Returns a long [`data.frame`] with the following columns:
#'  \describe{
#'   \item{`time`}{The sampling times. If `calendar` is not `NULL`, it is
#'   expressed in decimal years; otherwise, it is expressed in *rata die*.}
#'   \item{`series`}{The name of the time series.}
#'   \item{`variable`}{The name of the variables.}
#'   \item{`value`}{The observed value.}
#'  }
#' @aliases as.data.frame,TimeSeries-method
setMethod("as.data.frame", "TimeSeries", as.data.frame.TimeSeries)

#' @export
#' @method as.data.frame TimeIntervals
as.data.frame.TimeIntervals <- function(x, ..., calendar = NULL) {
  ## Build a data frame
  data.frame(
    label = labels(x),
    start = start(x, calendar = calendar),
    end = end(x, calendar = calendar)
  )
}

#' @export
#' @describeIn as.data.frame Returns a [`data.frame`] with the following columns:
#'  \describe{
#'   \item{`label`}{The name of the intervals.}
#'   \item{`start`}{The start time of the intervals. If `calendar` is not
#'   `NULL`, it is expressed in decimal years; otherwise, it is expressed in
#'   *rata die*.}
#'   \item{`end`}{The end time of the intervals. If `calendar` is not `NULL`, it
#'   is expressed in decimal years; otherwise, it is expressed in *rata die*.}
#'  }
#' @aliases as.data.frame,TimeIntervals-method
setMethod("as.data.frame", "TimeIntervals", as.data.frame.TimeIntervals)
