#' [Content Tab Source Code]
#'
#'
source_code_tab <- tabItem(
  tabName = "source_code",
  h2(strong("SOURCE CODE"), style = "font-family: Bell MT; text-align: center"),
  h4(p(
    "This dashboard is created by ",
    a("Shiny", href = "https://shiny.rstudio.com"), " and ",
    a("Dashboard Shiny.", href = "https://rstudio.github.io/shinydashboard")
  )),
  h4(
    "The dashboard's full source code is publicly available in the GitHub repository ",
    a(strong("github.com/P-H-Phuc/ApplicationForBayesStat."),
      href = "https://github.com/P-H-Phuc/ApplicationForBayesStat"
    )
  )
)