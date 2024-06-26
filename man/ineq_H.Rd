% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indices.R
\name{ineq_H}
\alias{ineq_H}
\title{ineq_H}
\usage{
ineq_H(age, dx, lx, ex, ax, check = TRUE, distribution_type = "rl")
}
\arguments{
\item{age}{numeric. vector of lower age bounds.}

\item{dx}{numeric. vector of the lifetable death distribution.}

\item{lx}{numeric. vector of the lifetable survivorship.}

\item{ex}{numeric. vector of remaining life expectancy.}

\item{ax}{numeric. vector of the average time spent in the age interval of those dying within the interval.}

\item{check}{logical. Shall we perform basic checks on input vectors? Default TRUE}

\item{distribution_type}{character. Either \code{"aad"} (age at death) or \code{"rl"} (remaining life)}
}
\description{
Calculate a lifetable column for the quantity \emph{H}, generally referred to as either the lifetable entropy Keyfitz (1977) or the elasticity of life expectancy Leser (1955).
}
\details{
All input vectors must be the same length. Also, we recommend using input data from a life table by single year of age with a highest age group of at least age 110. If your data have a lower upper age bound, consider extrapolation methods, for instance a parametric Kannisto model (implemented in \code{MortalityLaws::MortalityLaw}). If your data are abridged, consider first smoothing over age, and calculating a life table by single year of age (for instance by smoothing with a pclm model in package \code{ungroup} or with a penalized B-spline approach in package \code{MortalitySmooth}).
}
\examples{

data(LT)
# A vector containing the conditional H values
H = ineq_H(age=LT$Age,dx=LT$dx,lx=LT$lx,ex=LT$ex,ax=LT$ax)
# The H from birth
H[1]
# The H conditional upon survival to age 10
H[11]
}
\references{
\insertRef{keyfitz1977mortality}{LifeIneq}
\insertRef{leser1955variations}{LifeIneq}
}
\seealso{
\code{MortalityLaws::\link[MortalityLaws]{MortalityLaw}}

\code{ungroup::\link[ungroup]{pclm}}

\code{MortalitySmooth::\link[MortalitySmooth]{Mort1Dsmooth}}
}
