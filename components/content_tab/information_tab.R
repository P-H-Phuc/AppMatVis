#' [Content Tab Source Code]
#'
#'
source_code_tab <- tabItem(
  tabName = "source_code",
  h2(strong("About dashboard"), style = "font-family: Bell MT; text-align: center"),
  br(),
  h4(p(
    "This dashboard is created by ",
    a("Shiny", href = "https://shiny.rstudio.com"), " and ",
    a("Dashboard Shiny.", href = "https://rstudio.github.io/shinydashboard")
  )),
  h4(
    "The dashboard's full source code is publicly available in the GitHub repository ",
    a("AppMatVis.",
      href = "https://github.com/P-H-Phuc/AppMatVis"
    )
  ),
  br(),
  br(),
  h2(strong("About System"), style = "font-family: Bell MT; text-align: center"),
  br(),
  h4("The system name: ", Sys.info()[1]),
  h4("The OS release:", Sys.info()[2]),
  h4("The OS version:", Sys.info()[3]),
  h4("The device:", Sys.info()[4]),
  h4("The CPU type:", Sys.info()[5])
)