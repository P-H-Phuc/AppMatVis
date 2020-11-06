library(shiny)
library(shinydashboard)
shinyApp(
  ui = dashboardPage(
    dashboardHeader(
      title = tags$a(tags$img(src='./www/logo.jpg', 50, 50), "title"), 
      titleWidth = 300,
      tags$li(class = "dropdown",
              tags$p(h4("Time: ", textOutput("current_time", container = span),
                        style = "color: white; font-size: 20px")))
    ),
    dashboardSidebar(
      width = 300,
      
      #' Sidebar content
      sidebarMenu(
        #' Item 1
        menuItem(strong("Explore distribution", style = "color: white"), tabName = "dashboard", icon = icon(name = "snowflake")), 
        #' Item 2
        menuItem(strong("Source code", style = "color: white"), tabName = "code", icon = icon("code"))
      )),
    dashboardBody(
      tags$head(source("./www/theme/css.R")),
      tabItems(
        #' Content tab 2
        tabItem(
          tabName = "code",
          h2(strong("SOURCE CODE"), style = "font-family: Bell MT;"),
          h4(p(
            "This dashboard is created by ",
            a(strong("Shiny"), href = "https://shiny.rstudio.com"), " and ",
            a(strong("Dashboard Shiny."), href = "https://rstudio.github.io/shinydashboard")
          )),
          h4("The dashboard's full source code is publicly available in the GitHub repository",
             a(strong("github.com/P-H-Phuc/ApplicationForBayesStat."),
             href = "https://github.com/P-H-Phuc/ApplicationForBayesStat"))),
        # tab 1
        tabItem(tabName = "dashboard",
                div("EXPLORE DISTRIBUTION", 
                    style = "font-family: Bell MT; 
                    text-align: left; font-size: 24px; font-weight: bold"),
                fluidRow(
                  box(title = div("Option of distribution", 
                                  style = "font-family: Bell MT; color: white; 
                                  font-weight: bold; font-size: 22px"),
                      width = 4, height = 400, status = "primary", solidHeader = TRUE,
                      sliderInput("slider", "Threshold:", 0, 100, post = " %", 50),
                      sliderInput("slider", "Threshold:", 0, 200, post = " %", 50)),
                ),
                fluidRow(
                  box(title = "plot2", width = 4, height = 100)
                  )
                )
                )
    )),
  server = function(input, output) { 
    output$current_time = renderText({
      invalidateLater(as.integer(1000))
      format(Sys.time())}
    )
    }
)
