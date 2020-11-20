# SIMULATE DISTRIBUTION --------------------------------------------------
#'
#' @author `PhanHongPhuc`
#' @description Create pdf and calculation necessary value of distribution
#' @example run `create_density(1000, "normal", 0, 2, -4, 4)`
#'
#'
create_density <- function(n, distribution, param1, param2, x_from, x_to) {
  
  #' Function random generation for distribution
  #' `n` = number of observation
  #' `distribution` is distribution, may be one of "normal", "beta", "gamma", "binomial", 
  #' "uniform", "poisson", "chi_sq", "student_t", "exp"
  #' `params`  parameters of distribution, example: beta(a; b); exp(rate) normal(mean, sd) uniform(min, max),...
  #' `pi` value scale x axis
  distribution <- stringr::str_to_lower(distribution)
  pi <- seq(x_from, x_to, length.out = n)
  #' Stop if not
  stopifnot(schoolmath::is.positive(n), length(n) == 1, is.numeric(n),
            (distribution %in% c("normal", "beta", "gamma", "binomial", "uniform", 
                             "poisson", "chi - square", "student_t", "exponential")),
            (x_from < x_to)
  )
  #' Probability
  probability <-  c(0.05, 0.25, 0.5, 0.75, 0.95)
  #' Beta distribution
  if(distribution == "beta") {
    if(is.null(param1) | is.null(param2)) {
      stop("Beta distribution requires two shape parameters!")
    } else {
      if(param1 < 0 | param2 < 0) {
        stop("Beta distribution requires parameters must be greater than zero!")
      }
      a = param1
      b = param2
    }
    data = stats::dbeta(pi, a, b)
    quantiles = qbeta(p = probability,
                     a, b)
    mean = a / (a+b)
    var = (a*b) / ((a + b)^2 * (a + b + 1))
    mode = (a - 1) / (a + b + 2)
  }
  #' Exponential distribution
  else if(distribution == "exponential") {
    if(param1 <= 0) {
      stop("Parameter for exponential distribution must be greater than zero!")
    } else {
      rate = param1
      data = stats::dexp(pi, rate)
      quantiles = qexp(probability,
                       rate)
      mean = 1 / rate
      var = 1 / rate^2
      mode = 0
    }
  }
  #' Normal distribution
  else if(distribution == "normal") {
    if(is.null(param1) | is.null(param2)) {
      stop("Normal distribution requires a mean and std.deviation!")
    } else {
      mean = param1
      sd = param2
      if(sd <= 0) {
        stop("Std. deviation for normal distribution must be greater than zero!")
      }
      data = stats::dnorm(pi, mean, sd)
      quantiles = qnorm(p = probability,
                        mean, sd)
      mean = mean
      var = sd^2
      mode = mean
    }
  }
  #' Uniform distribution
  else if(distribution == "uniform") {
    if (is.null(param1) | is.null(param2)) {
      stop("Uniform distribution requires a minimum and a maximum!")
    } else {
      min = param1
      max = param2
      if (max <= min) {
        stop("Maximum must be greater than minimum!")
      }
      data = dunif(pi, min, max)
      quantiles = qunif(p = probability,
                        min, max)
      mean = (max + min) / 2
      var = (max - min)^2 / 12
      mode = max(data)
  }
  }
  #' Gamma distribution
  else if(distribution == "gamma") {
    if(is.null(param1) | is.null(param2)) {
      stop("Gamma distribution requires two parameters!")
    } else {
    if(param1 <= 0 | param2 <= 0) {
      stop("Gamma distribution requires shape and scale parameters must be positive!")
    } else {
      shape = param1
      rate = param2
      data = dgamma(pi, shape, rate)
      quantiles = qgamma(p = probability,
                         shape, rate)
      mean = shape / rate
      var = shape / rate^2
      mode = (shape - 1) / rate
    }
    }
  }
  #' Binomial distribution
  else if(distribution == "binomial") {
    if(is.null(param1) | is.null(param2)) {
      stop("Binomial requires number of trials and probability of success on each trail!")
    } else {
      if(param2 > 1 | param2 < 0) {
        stop("Probability of success has length from zero to one!")
      } 
      size = param1
      prob = param2
      data = dbinom(n, size, prob)
      quantiles = qbinom(p = probability,
                         size, prob)
      mean = size * prob
      var = size * prob * (1 - prob)
      mode = max(data, na.rm = TRUE)
    }
  }
  #' Poisson distribution
  else if(distribution == "poisson") {
    if(param1 < 0) {
      stop("Poisson distribution requires lamda non-negative!")
    } else {
      lambda = param1
      data = dpois(pi, lambda)
      quantiles = qpois(p = probability,
            lambda)
      mean = lambda
      var = lambda
      mode = max(data, na.rm = TRUE)
    }
  }
  #' Chi square distribbution
  else if(distribution == "chi - square") {
    if(param1 <= 0) {
      stop("Chi square distribution requires degrees of freedom non-negative")
    } else {
      df = param1
      data = dchisq(pi, df)
      quantiles = qchisq(p = probability,
                         df)
      mean = df
      var = 2 * df
      mode = max(data, na.rm = TRUE)
    }
  }
  #' Student distribution
  else if(distribution == "student_t") {
    if(is.null(param1)) {
      stop("Student distribution requires value of df, mu, sigma")
    } else {
      if(param1 <= 0 | param1 == 2) {
        stop("Degress of freedom must be greater than zero and must be difference 2!")
        } else{
          df = param1
          mu = 0
          sigma = df / (df - 2)
          data = brms::dstudent_t(pi, df, mu, sigma)
          quantiles = brms::qstudent_t(p = probabilty,
                                       df, mu, sigma)
          mean = mu
          var = sigma
          mode = 0
        }
      }
      
  }
  #' Name for quantiles
  names(quantiles) = paste0(probability*100, "%")
  #' Results
  results = list(name_distribution = distribution,
                 param_x = pi, density = data, 
                 mean = mean, var = var, sd = sqrt(var),
                 median = quantiles[3],mode = mode, quantiles = quantiles
                 )
  invisible(results)
}


