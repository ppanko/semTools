% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measEq.R
\name{measEq.syntax}
\alias{measEq.syntax}
\title{Syntax for measurement equivalence}
\usage{
measEq.syntax(configural.model, ..., ID.fac = "std.lv",
  ID.cat = "Wu.Estabrook.2016", ID.thr = c(1L, 2L), group = NULL,
  group.equal = "", group.partial = "", longFacNames = list(),
  longIndNames = list(), long.equal = "", long.partial = "",
  auto = "all", warn = TRUE, debug = FALSE, return.fit = FALSE)
}
\arguments{
\item{configural.model}{A model with no measurement-invariance constraints
(i.e., representing only configural invariance), unless required for model
identification. \code{configural.model} can be either:
\itemize{
  \item lavaan \code{\link[lavaan]{model.syntax}} or a parameter table
        (as returned by \code{\link[lavaan]{parTable}}) specifying the
        configural model. Using this option, the user can also provide
        either raw \code{data} or summary statistics via \code{sample.cov}
        and (optionally) \code{sample.mean}. In order to include
        thresholds in the syntax, raw \code{data} must be provided.
        See \code{\link[lavaan]{lavaan}}.
  \item a fitted \code{\linkS4class{lavaan}} model (e.g., as returned by
        \code{\link[lavaan]{cfa}}) estimating the configural model
}}

\item{...}{Additional arguments (e.g., \code{data}, \code{ordered}, or
\code{parameterization}) passed to the \code{\link[lavaan]{lavaan}}
function. See also \code{\link[lavaan]{lavOptions}}.}

\item{ID.fac}{\code{character}. The method for identifying common-factor
variances and (if \code{meanstructure = TRUE}) means. Three methods are
available, which go by different names in the literature:
\itemize{
  \item Standardize the common factor (mean = 0, \emph{SD} = 1) by
        specifying any of: \code{"std.lv"}, \code{"unit.variance"},
        \code{"UV"}, \code{"fixed.factor"},
        \code{"fixed-factor"}
  \item Choose a reference indicator by specifying any of:
        \code{"auto.fix.first"}, \code{"unit.loading"}, \code{"UL"},
        \code{"marker"}, \code{"ref"},  \code{"ref.indicator"},
        \code{"reference.indicator"}, \code{"reference-indicator"},
        \code{"marker.variable"}, \code{"marker-variable"}
  \item Apply effects-code constraints to loadings and intercepts by
        specifying any of: \code{"FX"}, \code{"EC"}, \code{"effects"},
        \code{"effects.coding"}, \code{"effects-coding"},
        \code{"effects.code"}, \code{"effects-code"}
}
See Little et al. (2006) for details on all three methods.}

\item{ID.cat}{\code{character}. The method for identifying (residual)
variances and intercepts of latent item-responses underlying any
\code{ordered} indicators. Four methods are available:
\itemize{
  \item To follow Wu & Estabrook's (2016) guidelines (default), specify
        any of: \code{"Wu.Estabrook.2016"}, \code{"Wu.2016"},
        \code{"Wu.Estabrook"}, \code{"Wu"}, \code{"Wu2016"}.
  \item To use the default settings of M\emph{plus} and \code{lavaan},
        specify any of: \code{"default"}, \code{"Mplus"}, \code{"Muthen"}.
        Details provided in Millsap & Tein (2004).
  \item To use the constraints recommended by Millsap & Tein (2004; see
        also Liu et al., 2017)
        specify any of: \code{"millsap"}, \code{"millsap.2004"},
        \code{"millsap.tein.2004"}
  \item To use the default settings of LISREL, specify \code{"LISREL"}
        or \code{"Joreskog"}. Details provided in Millsap & Tein (2004).
}
See \strong{Details} and \strong{References} for more information.}

\item{ID.thr}{\code{integer}. Only relevant when
\code{ID.cat = "Millsap.Tein.2004"}. Used to indicate which thresholds
should be constrained for identification. The first integer indicates the
threshold used for all indicators, the second integer indicates the
additional threshold constrained for a reference indicator (ignored if
binary).}

\item{group}{optional \code{character} indicating the name of a grouping
variable. See \code{\link[lavaan]{cfa}}.}

\item{group.equal}{optional \code{character} vector indicating type(s) of
parameter to equate across groups. Ignored if \code{is.null(group)}.
See \code{\link[lavaan]{lavOptions}}.}

\item{group.partial}{optional \code{character} vector or a parameter table
indicating exceptions to \code{group.equal} (see
\code{\link[lavaan]{lavOptions}}). Any variables not appearing in the
\code{configural.model} will be ignored, and any parameter constraints
needed for identification (e.g., two thresholds per indicator when
\code{ID.cat = "Millsap"}) will be removed.}

\item{longFacNames}{optional named \code{list} of \code{character} vectors,
each indicating multiple factors in the model that are actually the same
construct measured repeatedly. See \strong{Details} and \strong{Examples}.}

\item{longIndNames}{optional named \code{list} of \code{character} vectors,
each indicating multiple indicators in the model that are actually the
same indicator measured repeatedly. See \strong{Details} and
\strong{Examples}.}

\item{long.equal}{optional \code{character} vector indicating type(s) of
parameter to equate across repeated measures. Ignored if no factors are
indicated as repeatedly measured in \code{longFacNames}.}

\item{long.partial}{optional \code{character} vector or a parameter table
indicating exceptions to \code{long.equal}. Any longitudinal variable
names not  appearing in \code{names(longFacNames)} or
\code{names(longIndNames)} will be ignored, and any parameter constraints
needed for identification will be removed.}

\item{auto}{Used to automatically included autocorrelated measurement errors
among repeatedly measured indicators in \code{longIndNames}. Specify a
single \code{integer} to set the maximum order (e.g., \code{auto = 1L}
indicates that an indicator's unique factors should only be correlated
between adjacently measured occasions). \code{auto = TRUE} or \code{"all"}
will specify residual covariances among all possible lags per repeatedly
measured indicator in \code{longIndNames}.}

\item{warn, debug}{\code{logical}. Passed to \code{\link[lavaan]{lavaan}}
and \code{\link[lavaan]{lavParseModelString}}.
See \code{\link[lavaan]{lavOptions}}.}

\item{return.fit}{\code{logical} indicating whether the generated syntax
should be fitted to the provided \code{data} (or summary statistics, if
provided via \code{sample.cov}). If \code{configural.model} is a fitted
lavaan model, the generated syntax will be fitted using the \code{update}
method (see \code{\linkS4class{lavaan}}), and \dots will be passed to
\code{\link[lavaan]{lavaan}}. If neither data nor a fitted lavaan model
were provided, this must be \code{FALSE}. If \code{TRUE}, the generated
\code{measEq.syntax} object will be included in the \code{lavaan} object's
\code{@external} slot, accessible by \code{fit@external$measEq.syntax}.}
}
\value{
By default, an object of class \code{\linkS4class{measEq.syntax}}.
  If \code{return.fit = TRUE}, a fitted \code{\link[lavaan]{lavaan}}
  model, with the \code{measEq.syntax} object stored in the
  \code{@external} slot, accessible by \code{fit@external$measEq.syntax}.
}
\description{
Automatically generates \code{lavaan} model syntax to specify a confirmatory
factor analysis (CFA) model with equality constraints imposed on
user-specified measurement (or structural) parameters. Optionally returns
the fitted model (if data are provided) representing some chosen level of
measurement equivalence/invariance across groups and/or repeated measures.
}
\details{
This function is a pedagogical and analytical tool to generate model syntax
representing some level of measurement equivalence/invariance across any
combination of multiple groups and/or repeated measures. Support is provided
for confirmatory factor analysis (CFA) models with simple or complex
structure (i.e., cross-loadings and correlated residuals are allowed).
For any complexities that exceed the limits of automation, this function is
intended to still be useful by providing a means to generate syntax that
users can easily edit to accommodate their unique situations.

Limited support is provided for bifactor models and higher-order constructs.
Because bifactor models have cross-loadings by definition, the option
\code{ID.fac = "effects.code"} is unavailable. \code{ID.fac = "UV"} is
recommended for bifactor models, but \code{ID.fac = "UL"} is available on
the condition that each factor has a unique first indicator in the
\code{configural.model}. In order to maintain generality, higher-order
factors may include a mix of manifest and latent indicators, but they must
therefore require \code{ID.fac = "UL"} to avoid complications with
differentiating lower-order vs. higher-order (or mixed-level) factors.
The keyword \code{"loadings"} in \code{group.equal} or \code{long.equal}
constrains factor loadings of all manifest indicators (including loadings on
higher-order factors that also have latent indicators), whereas the keyword
\code{"regressions"} constrains factor loadings of latent indicators. Users
can edit the model syntax manually to adjust constraints as necessary, or
clever use of the \code{group.partial} or \code{long.partial} arguments
could make it possible for users to still automated their model syntax.
The keyword \code{"intercepts"} constrains the intercepts of all manifest
indicators, and the keyword \code{"means"} constrains intercepts and means
of all latent common factors, regardless of whether they are latent
indicators of higher-order factors.  To test equivalence of lower-order and
higher-order intercepts/means in separate steps, the user can either
manually edit their generated syntax or conscientiously exploit the
\code{group.partial} or \code{long.partial} arguments as necessary.

\strong{\code{ID.fac}:} If the \code{configural.model} fixes any (e.g.,
the first) factor loadings, the generated syntax object will retain those
fixed values. This allows the user to retain additional constraints that
might be necessary (e.g., if there are only 1 or 2 indicators). Some methods
must be used in conjunction with other settings:
\itemize{
  \item \code{ID.cat = "Millsap"} requires \code{ID.fac = "UL"} and
        \code{parameterization = "theta"}.
  \item \code{ID.cat = "LISREL"} requires \code{parameterization = "theta"}.
  \item \code{ID.fac = "effects.code"} is unavailable when there are any
        cross-loadings.
}

\strong{\code{ID.cat}:} Wu & Estabrook (2016) recommended constraining
thresholds to equality first, and doing so should allow releasing any
identification constraints no longer needed. For each \code{ordered}
indicator, constraining one threshold to equality will allow the item's
intercepts to be estimated in all but the first group or repeated measure.
Constraining a second threshold (if applicable) will allow the item's
(residual) variance to be estimated in all but the first group or repeated
measure. For binary data, there is no independent test of threshold,
intercept, or residual-variance equality. Equivalence of thresholds must
also be assumed for three-category indicators. These guidelines provide the
least restrictive assumptions and tests, and are therefore the default.

The default setting in M\emph{plus} is similar to Wu & Estabrook (2016),
except that intercepts are always constrained to zero (so they are assumed
to be invariant without testing them). Millsap & Tein (2004) recommended
\code{parameterization = "theta"} and identified an item's residual variance
in all but the first group (or occasion; Liu et al., 2017) by constraining
its intercept to zero and one of its thresholds to equality. A second
threshold for the reference indicator (so \code{ID.fac = "UL"}) is used to
identify the common-factor means in all but the first group/occasion. The
LISREL software fixes the first threshold to zero and (if applicable) the
second threshold to 1, and assumes any remaining thresholds to be equal
across groups / repeated measures; thus, the intercepts are always
identified, and residual variances (\code{parameterization = "theta"}) are
identified except for binary data, when they are all fixed to one.

\strong{Repeated Measures:} If each repeatedly measured factor is measured
by the same indicators (specified in the same order in the
\code{configural.model}) on each occasion, without any cross-loadings, the
user can let \code{longIndNames} be automatically generated. Generic names
for the repeatedly measured indicators are created using the name of the
repeatedly measured factors (i.e., \code{names(longFacNames)}) and the
number of indicators. So the repeatedly measured first indicator
(\code{"ind"}) of a longitudinal construct called "factor" would be
generated as \code{"._factor_ind.1"}.

The same types of parameter can be specified for \code{long.equal} as for
\code{group.equal} (see \code{\link[lavaan]{lavOptions}} for a list), except
for \code{"residual.covariances"} or \code{"lv.covariances"}. Instead, users
can constrain \emph{auto}covariances using keywords \code{"resid.autocov"}
or \code{"lv.autocov"}. Note that \code{group.equal = "lv.covariances"} or
\code{group.equal = "residual.covariances"} will constrain any
autocovariances across groups, along with any other covariances the user
specified in the \code{configural.model}. Note also that autocovariances
cannot be specified as exceptions in \code{long.partial}, so anything more
complex than the \code{auto} argument automatically provides should instead
be manually specified in the \code{configural.model}.

When users set \code{orthogonal=TRUE} in the \code{configural.model} (e.g.,
in bifactor models of repeatedly measured constructs), autocovariances of
each repeatedly measured factor will still be freely estimated in the
generated syntax.

\strong{Missing Data:} If users wish to utilize the \code{\link{auxiliary}}
function to automatically include auxiliary variables in conjunction with
\code{missing = "FIML"}, they should first generate the hypothesized-model
syntax, then submit that syntax as the model to \code{auxiliary()}.
If users utilized \code{\link{runMI}} to fit their \code{configural.model}
to multiply imputed data, that model can also be passed to the
\code{configural.model} argument, and if \code{return.fit = TRUE}, the
generated model will be fitted to the multiple imputations.
}
\examples{
mod.cat <- ' FU1 =~ u1 + u2 + u3 + u4
             FU2 =~ u5 + u6 + u7 + u8 '
## the 2 factors are actually the same factor (FU) measured twice
longFacNames <- list(FU = c("FU1","FU2"))

## configural model: no constraints across groups or repeated measures
syntax.config <- measEq.syntax(configural.model = mod.cat, data = datCat,
                               ordered = paste0("u", 1:8),
                               parameterization = "theta",
                               ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                               group = "g", longFacNames = longFacNames)
## print lavaan syntax to the Console
cat(as.character(syntax.config))
## print a summary of model features
summary(syntax.config)

## threshold invariance
syntax.thresh <- measEq.syntax(configural.model = mod.cat, data = datCat,
                               ordered = paste0("u", 1:8),
                               parameterization = "theta",
                               ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                               group = "g", group.equal = "thresholds",
                               longFacNames = longFacNames,
                               long.equal = "thresholds")
## notice that constraining 4 thresholds allows intercepts and residual
## variances to be freely estimated in all but the first group & occasion
cat(as.character(syntax.thresh))
## print a summary of model features
summary(syntax.thresh)


## Fit a model to the data either in a subsequent step:
mod.config <- as.character(syntax.config)
fit.config <- cfa(mod.config, data = datCat, group = "g",
                  ordered = paste0("u", 1:8), parameterization = "theta")
## or in a single step:
fit.thresh <- measEq.syntax(configural.model = mod.cat, data = datCat,
                            ordered = paste0("u", 1:8),
                            parameterization = "theta",
                            ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                            group = "g", group.equal = "thresholds",
                            longFacNames = longFacNames,
                            long.equal = "thresholds", return.fit = TRUE)

## compare their fit to test threshold invariance
anova(fit.config, fit.thresh)


\dontrun{

## compare several invariance models
test.seq <- c("thresholds","loadings","intercepts","means","residuals")
meq.list <- list()
for (i in 0:length(test.seq)) {
  if (i == 0L) {
    meq.label <- "configural"
    group.equal <- ""
    long.equal <- ""
  } else {
    meq.label <- test.seq[i]
    group.equal <- test.seq[1:i]
    long.equal <- test.seq[1:i]
  }
  meq.list[[meq.label]] <- measEq.syntax(configural.model = mod.cat,
                                         data = datCat,
                                         ordered = paste0("u", 1:8),
                                         parameterization = "theta",
                                         ID.fac = "std.lv",
                                         ID.cat = "Wu.Estabrook.2016",
                                         group = "g",
                                         group.equal = group.equal,
                                         longFacNames = longFacNames,
                                         long.equal = long.equal,
                                         return.fit = TRUE)
}

compareFit(meq.list)

}
}
\references{
Little, T. D., Slegers, D. W., & Card, N. A. (2006). A non-arbitrary
  method of identifying and scaling latent variables in SEM and MACS models.
  \emph{Structural Equation Modeling, 13}(1), 59--72.
  doi:10.1207/s15328007sem1301_3

  Liu, Y., Millsap, R. E., West, S. G., Tein, J.-Y., Tanaka, R., & Grimm,
  K. J. (2017). Testing measurement invariance in longitudinal data with
  ordered-categorical measures. \emph{Psychological Methods, 22}(3),
  486--506. doi:10.1037/met0000075

  Millsap, R. E., & Tein, J.-Y. (2004). Assessing factorial invariance in
  ordered-categorical measures. \emph{Multivariate Behavioral Research, 39}(3),
  479--515. doi:10.1207/S15327906MBR3903_4

  Wu, H., & Estabrook, R. (2016). Identification of confirmatory factor
  analysis models of different levels of invariance for ordered categorical
  outcomes. \emph{Psychometrika, 81}(4), 1014--1045.
  doi:10.1007/s11336-016-9506-0
}
\seealso{
\code{\link{compareFit}}
}
\author{
Terrence D. Jorgensen (University of Amsterdam;
  \email{TJorgensen314@gmail.com})
}
