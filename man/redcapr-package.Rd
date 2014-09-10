\name{capr-package}
\alias{capr-package}
\alias{capr}
\docType{package}
\title{
Interact with your REDCap project through the API
}
\description{
Some very basic functions (wrappers) for exporting and importing through the 
REDCap API. It can pull data, dictionaries, and event structures. It can 
also push data. 
}
\details{
\tabular{ll}{
Package: \tab capr\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2014-09-03\cr
License: \tab MIT + file LICENSE\cr
}
The functions in the package require the URL to your REDCap project, a token for your project, and a security certificate. It then uses the \code{RCurl} 
package to submit an HTML post to the REDCap server. If exporting from REDCap,
a large character string is returned. The \code{friendify()} function converts 
this to a data frame. You can also import data to your project using the 
\code{post_rc()} function, which converts your data frame to a large character
string that is then submitted as an HTML post. Shout out to github user 
\code{etb} for posting a gist on how to do this.
}
\author{
Isaac Jenkins

Maintainer: Isaac Jenkins <icj@email.arizona.edu>
}
\references{
REDCap API Documentation

https://github.com/etb/my-R-code/blob/master/R-pull-and-push-from-and-to-REDCap.R
}

\keyword{ package }
