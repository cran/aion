## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(aion)
library(igraph)

## ----harris-------------------------------------------------------------------
## Harris 1997, fig. 12
harris <- data.frame(
  X = c(1, 1, 1, 2, 3, 4, 5, 6, 6, 7, 8),
  Y = c(2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9)
)

## ----create-------------------------------------------------------------------
## Create a graph object
g <- graph_create(harris, direction = "above", type = "stratigraphy")

## ----prune--------------------------------------------------------------------
## Remove redundant relations
g <- graph_prune(g)

## ----plot, fig.width=7, fig.height=7, fig.align='center'----------------------
plot(g, layout = layout_with_sugiyama)

## ----strati-------------------------------------------------------------------
## Seven time intervals expressed in years CE
int <- intervals(
  start = c(1, 2, 3, 6, 9, 13, 17),
  end = c(7, 4, 15, 14, 11, 18, 19),
  calendar = CE(),
  names = c("A", "B", "C", "D", "E", "F", "G")
)

## Create a stratigraphic graph
strati <- graph_create(int, type = "stratigraphy")

## Remove redundant relations
strati <- graph_prune(strati)

## ----interval-----------------------------------------------------------------
## Create an interval graph
inter <- graph_create(int, type = "interval")

## ----graphs, fig.width=7, fig.height=7, out.width='50%', fig.show='hold'------
## Stratigraphic graph
plot(strati, layout = layout_with_sugiyama)

## Interval graph
plot(inter)

