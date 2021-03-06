% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_carp.R, R/save.R
\name{plot.CARP}
\alias{plot.CARP}
\alias{saveviz}
\alias{saveviz.CARP}
\title{Visualize the results of Convex Clustering (\code{CARP})}
\usage{
\method{plot}{CARP}(
  x,
  ...,
  type = c("dendrogram", "path", "dynamic_path", "js", "interactive"),
  axis = c("PC1", "PC2"),
  dend.branch.width = 2,
  dend.labels.cex = 0.6,
  dend.ylab.cex = 1.2,
  percent,
  k,
  percent.seq = seq(0, 1, length.out = 21),
  max.nclust = 9,
  min.nclust = 1
)

saveviz(x, ...)

\method{saveviz}{CARP}(
  x,
  file.name,
  type = c("dendrogram", "path", "js"),
  dynamic = TRUE,
  axis = c("PC1", "PC2"),
  dend.branch.width = 2,
  dend.labels.cex = 0.6,
  percent,
  k,
  percent.seq = seq(from = 0, to = 1, by = 0.05),
  width = 8,
  height = 5,
  units = c("in", "cm", "mm", "px"),
  ...
)
}
\arguments{
\item{x}{An object of class \code{CARP} as returned by \code{\link{CARP}}}

\item{...}{Additional arguments, which are handled differently for different
values of \code{type}.\itemize{
\item When \code{type} is \code{"path"}, \code{"dynamic_path"},
      or \code{"interactive"}, the presence of
      unknown arguments triggers an error;
\item when \code{type == "dendrogram"}
      \code{...} is forwarded to \code{\link[stats]{plot.dendrogram}}; and
\item when \code{type == "js"}, \code{...} is forwarded to
      \code{\link[heatmaply]{heatmaply}}.
} See the documentation of the linked functions for details about
additional supported arguments. \code{saveviz} passes arguments
to the corresponding plot \code{type}.}

\item{type}{A string indicating the type of visualization to show (see details above).}

\item{axis}{A character vector of length two indicating which features or principal
components to use as the axes in the \code{type = "path"} visualization.
Currently only features like \code{"PC1"} or \code{"PC2"} (indicating
the first principal component projections) are supported.}

\item{dend.branch.width}{Branch width for dendrogram plots (ignored for
other plot types) - must be positive.}

\item{dend.labels.cex}{Label size for dendrogram plots (ignored for other plot
types) - must be positive.}

\item{dend.ylab.cex}{Y-axis size for dendrogram plots (ignored for other plot
types) - must be positive.}

\item{percent}{A number between 0 and 1, giving the regularization level (as
a fraction of the final regularization level used) at which to
assign clusters in the static (\code{type = "dendrogram"} or \code{type = "path"})
plots.}

\item{k}{An integer indicating the desired number of clusters to be displayed
in the static plots. If no \code{CARP} iteration with exactly this
many clusters is found, the first iterate with fewer than \code{k}
clusters is used.}

\item{percent.seq}{A grid of values of \code{percent} along which to generate
dynamic visualizations (if \code{dynamic == TRUE})}

\item{max.nclust}{a positive integer. The maximum number of clusters
to display in the interactive plot.}

\item{min.nclust}{a positive value. The minimum number of clusters to
display in the interactive plot.}

\item{file.name}{The name of the output file. The type of resulting image
is determined from the extension. If \code{dynamic = TRUE},
the extension is changed to \code{.gif} internally. If \code{type = "js"},
the extension is changed to \code{.html} internally.}

\item{dynamic}{Should the resulting animation be dynamic (animated) or not?
If \code{TRUE}, a dynamic visualization which varies along the
\code{CARP} solution path at a grid given by \code{percent.seq}
is produced (as a \code{GIF}). If \code{FALSE}, a fixed visualization
at a single solution (determined by either \code{percent} or \code{k}
if supplied) is produced.
Currently ignored when \code{type = "js"}.}

\item{width}{The width of the output, given in \code{unit}s}

\item{height}{The height of the output, given in \code{unit}s}

\item{units}{The unit in which \code{width} and \code{height} are specified}
}
\value{
The value of the return type depends on the \code{type} argument:\itemize{
  \item if \code{type = "dendrogram"}, \code{x} is returned invisibly;
  \item if \code{type = "path"}, an object of class \code{\link[ggplot2]{ggplot}}
        which can be plotted directly (by invoking its print method) or modified
        further by the user is returned;
  \item if \code{type = "dynamic_path"}, an object of class \code{\link[gganimate:gganimate-package]{gganim}}
        is returned, and many be further manipulated by the user or plotted directly;
  \item if \code{type = "interactive"}, a \code{\link[shiny]{shiny}} app which can be activated
        by invoking its print method.
} \code{saveviz.CARP} always returns \code{file.name} invisibly.
}
\description{
\code{plot.CARP} provides a range of ways to visualize the results of convex
clustering, including: \itemize{
\item A dendrogram, illustrating the nested cluster hierarchy inferred from
      the convex clustering solution path (\code{type = "dendrogram"});
\item A static path plot, showing the coalescence of the estimated cluster centroids
      at a fixed value of the regularization parameter is increased (\code{type = "path"});
\item A \code{\link[gganimate]{gganimate}} plot, showing the coalescence of the
      estimated cluster centroids as the regularization parameter is increased
      (\code{type = "dynamic_path"}); and
\item A \code{\link[shiny]{shiny}} app, which can display the clustering solutions
      as a "movie" or allow for interactive exploration (\code{type = "interactive"}).
}
}
\details{
The \code{\link{saveviz.CARP}} function provides a unified interface
         for exporting \code{CARP} visualizations to files. For all plots,
         at most one of \code{percent} and \code{k} may be supplied.
}
\examples{
\dontrun{
carp_fit <- CARP(presidential_speech)
plot(carp_fit, type='interactive')
}
}
