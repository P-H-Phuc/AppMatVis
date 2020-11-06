#' [CONTENT TAB EXPLORE DISTRIBUTION ]
#' 

explore_distribution_tab <- tabItem(
  tabName = "explore_distribution",
  #' Title content
  strong("EXPLORE DISTRIBUTION", 
         style = "font-family: Bell MT; font-size: 18px; text-align: left;"),
  #' Layout
  fluidRow(
    box(title = div("Option of distribution", style = "font-family: Bell MT; color: steelblue;"),
        solidHeader = TRUE, status = "primary"
        )
  ),
  fluidRow()
  
)