#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ------------------------------------------------------------------------
#' [Dashboard Sidebar]
#' ------------------------------------------------------------------------

sidebar <- dashboardSidebar(
  #' Width sidebar
  width = 300,
  # add logo
  tags$li(class = "pull-left-image",
          tags$p(tags$img(src = "logo.png", alt = "logo", width = 280, height = "auto"),
                 style = "padding-right: 10px; padding-left: 10px")),
  #' Sidebar content
  sidebarMenu(
    #' Tab 1
    menuItem(text = strong("Explore distribution", style = "color: white, font-size: 22px"), 
             tabName = "explore_distribution", icon = icon(name = "snowflake")), 
    #' Tab 2
    menuItem(text = strong("Information", style = "color: white, font-size: 22px"), 
             tabName = "source_code", icon = icon("info"))
  )
)
