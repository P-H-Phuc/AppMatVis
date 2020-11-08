#' [QUANTILES FUNCTION]

#' @description Calculate quantiles for distribuion
#' @example `quantile_fun("normal", c(0.25, 0.75), 0, 1)`

#' Default value quantiles of 25%th and 75%th

#' Function 

quantile_fun <- function(distribution, prob, param_1, param_2) {
  if(stringr::str_to_lower(distribution) == "beta") {
    quantile = qbeta(p = prob, shape1 = param_1, shape2 = param_2)
  } else {
  if(stringr::str_to_lower(distribution) == "exp") {
    quantile = qexp(prob, rate = param_1)
  } else {
    if(stringr::str_to_lower(distribution) == "normal") {
      quantile = qnorm(prob, param_1, param_2)
    } else {
      if(stringr::str_to_lower(distribution) == "uniform") {
        quantile = qunif(prob, param_1, param_2)
      } else{
        if(stringr::str_to_lower(distribution) == "gamma") {
          quantile = qgamma(prob, param_1, param_2)
        } else {
          if(stringr::str_to_lower(distribution) == "binomial") {
            quantile = qbinom(prob, param_1, param_2)
          } else {
            if(stringr::str_to_lower(distribution) == "poisson") {
              quantile = qpois(prob, param_1)
            } else {
              if(stringr::str_to_lower(distribution) == "chi_sq") {
                quantile = qchisq(prob, param_1)
              } else {
                if(stringr::str_to_lower(distribution) == "student_t") {
                  quantile = brms::qstudent_t(prob, param_1)
                }
              }
            }
          }
        }
      }
    }
  }
  }
  return(quantile)
}
