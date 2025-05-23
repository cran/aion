% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/calendar-gregorian.R,
%   R/calendar-julian.R
\docType{methods}
\name{fixed}
\alias{fixed}
\alias{fixed-method}
\alias{fixed,numeric,missing,missing,GregorianCalendar-method}
\alias{fixed,numeric,numeric,numeric,GregorianCalendar-method}
\alias{fixed,numeric,missing,missing,JulianCalendar-method}
\alias{fixed,numeric,numeric,numeric,JulianCalendar-method}
\title{\emph{Rata Die} (Fixed Date)}
\usage{
fixed(year, month, day, calendar, ...)

\S4method{fixed}{numeric,missing,missing,GregorianCalendar}(year, calendar, scale = 1)

\S4method{fixed}{numeric,numeric,numeric,GregorianCalendar}(year, month, day, calendar)

\S4method{fixed}{numeric,missing,missing,JulianCalendar}(year, calendar, scale = 1)

\S4method{fixed}{numeric,numeric,numeric,JulianCalendar}(year, month, day, calendar)
}
\arguments{
\item{year}{A \code{\link{numeric}} vector of years. If \code{month} and \code{day} are missing,
decimal years are expected.}

\item{month}{A \code{\link{numeric}} vector of months.}

\item{day}{A \code{\link{numeric}} vector of days.}

\item{calendar}{A \code{\linkS4class{TimeScale}} object specifying the calendar of
\code{year}, \code{month} and \code{day} (see \code{\link[=calendar]{calendar()}}).}

\item{...}{Currently not used.}

\item{scale}{A length-one \code{\link{integer}} vector specifying the number of years
represented by one unit. It should be a power of 10 (i.e. 1000 means ka).}
}
\value{
A \code{\linkS4class{RataDie}} object.
}
\description{
\emph{Rata Die} (Fixed Date)
}
\details{
\emph{Rata die} are represented as the number of days since 01-01-01 (Gregorian),
with negative values for earlier dates.
}
\examples{
## R 1.0.0
(y <- fixed(year = 2000, month = 02, day = 29, calendar = CE()))
as_date(y, calendar = CE())
as_year(y, calendar = CE())

## Create a vector of years BP (Gregorian)
## (every two years starting from 2000 BP)
(years <- seq(from = 2000, by = -2, length.out = 10))
## Convert years to rata die
(rd <- fixed(years, calendar = BP()))
## Convert back to Gregorian years BP
as_year(rd, calendar = BP())

## More convenient
(rd <- fixed_from_BP(years))
fixed_to_BP(rd)
}
\references{
Reingold, E. M. and Dershowitz, N. (2018). \emph{Calendrical Calculations:
The Ultimate Edition}. Cambridge University Press.
\doi{10.1017/9781107415058}.
}
\seealso{
Other fixed date tools: 
\code{\link{arithmetic}},
\code{\link{as_date}()},
\code{\link{as_decimal}()},
\code{\link{as_fixed}()},
\code{\link{as_year}()},
\code{\link{fixed_gregorian}},
\code{\link{fixed_julian}},
\code{\link{format}()},
\code{\link{pretty}()}
}
\author{
N. Frerebeau
}
\concept{fixed date tools}
