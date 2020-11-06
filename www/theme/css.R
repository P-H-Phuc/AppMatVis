#' [--THEME FOR APPLICATION--]
#' @description set up theme for app

custom <- tags$style(HTML(
                          " /* main header */
                            .skin-blue .main-header .logo {
                              background-color: #008080;
                              font-family: Bell MT; font-size: 24px;
                              font-weight: bold; color: white;
                            }
                            .skin-blue .main-header .navbar {
                              background-color: #008080;
                            }
                            .skin-blue .main-header .logo:hover {
                              background-color: #008080;
                            }
                            /* body */
                            .content-wrapper, .right-side {
                              background-color: #DDDDDD;
                            }
                            /* main sidebar */
                            .skin-blue .main-sidebar {
                              background-color: #778899;
                            }
                            /* active selected tab in the sidebarmenu */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                              background-color: #2F4F4F;
                            }
                            /* other links in the sidebarmenu */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                              background-color: #708090;
                            }
                            /* other links in the sidebarmenu when hovered */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                                background-color: #696969;
                            }
                            /* toggle button when hovered  */
                            .skin-blue .main-header .navbar .sidebar-toggle:hover{
                              background-color: #696969;
                              }"
)
)