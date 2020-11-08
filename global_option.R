# GLOBAL OPTION ====
#' @description Global shared envirnoment control for all sessions with Shiny System
#' @export
#' # Options Control
#' General options
base::options(tab.width = 2) #' Tab width
base::options(graphics.record = TRUE) #' Graphic Record
base::options(scipen = 999) #' Disable science figure format, kind of 1.23e+1,....
base::options(digits = 4) #' Numeric Format
base::options(digits.secs = 0) #' Controls the maximum number of digits to print when formatting time values in seconds.
base::options(stringsAsFactors = FALSE) #' Manage String to Factor of R in data.frame

# PACKAGE MANAGE ====
#' Require Packages for project
#'
#' @description Character vector of requirement packages, manual handling
#' @value multiple call libary of packages
#' @example `require_packages()`
#' @export
#' Requirement Packages
require_packages <- function() {
  #' Package require
  pkgs <- c(
  "tidyverse", "Bolstad", "shiny", "gridExtra", "shinydashboard", "shinyWidgets",
  "kableExtra", "glue", "brms", "tibble"
  )
  #' return 
  return(pkgs)
}

#' Package Require
#'
#' @description Call bundle required packages in one place
#' @param disable_message_sucessful disable message of successful package running by each package
#' @param disable_message_startup disable first-run library
#' @value multiple call libary of packages
#' @example package_require()
#' @export
package_require <- function(list) {
  
  #' Loop
  for (i in 1:length(list)) {
    
    #' Library
    base::suppressPackageStartupMessages(base::require(package = list[i], character.only = TRUE, warn.conflicts = TRUE))
  }
}

#' Source Require packages
package_require(list = require_packages())










