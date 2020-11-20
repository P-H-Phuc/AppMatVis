#' [VISUALIZATION DISTRIBUTION]

#' load funtion `create_density()`
source("./custom_functions/create_density.R")

#' load function `quantile_fun()`
source("./custom_functions/quantile_fun.R")

plot_output <- function(n, distribution, param1, param2, x_from , x_to, prob) {
    #' Create data for plot
    x <- create_density(n , distribution, param1, param2, x_from , x_to)
    #' Create confidence interval
    interval <- quantile_fun(distribution, prob, param1, param2)
    #' As dataframe
    data <- tibble::tibble(pi = x$param_x, pdf = x$density)
    
    #' Generate plot requires `ggplot2 package`
    
  graphic <- ggplot(data = data, mapping = aes(x = pi, y = pdf, ymin = 0, ymax = pdf)) +
    # density
    geom_ribbon(size = 1, fill = "#008489", color = "black") +
    # confidence interval
    geom_ribbon(data = data %>% filter(pi >= interval[1] & pi <= interval[2]),
                  mapping = aes(x = pi, y = pdf), size = 1, fill = "#00A6AD", color = "black") + 
    geom_segment(aes(x = interval[1], y = max(x$density)/8,
                     xend = interval[2], yend = max(x$density)/8),
                 arrow = arrow(length = unit(0.3, "cm"), ends = "both", type = "closed"),
                 size = 1, color = "white") +
    annotate(geom = "label", label = glue::glue("{a}% confidence interval",
                                                a = round((prob[2] - prob[1])*100, 3)),
             x = x$quantiles[3], y = max(x$density)/5, size = 5) +
    labs(x = "Value",
         y = "Probability density") +
    theme_bw() + 
    theme(panel.grid = element_blank())
  
  return(graphic)

}





















