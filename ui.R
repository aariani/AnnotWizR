# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# css function for waiting time
mycss <- "
#plot-container {
  position: relative;
}
#loading-spinner {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: -1;
  margin-top: -33px;  /* half of the spinner's height */
  margin-left: -33px; /* half of the spinner's width */
}
#plot.recalculating {
  z-index: -2;
}
"

shinyUI(fluidPage(
  # Application title
  titlePanel("AnnotWizR"),
  tags$hr(),
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("filetype", label="Select file type", choices = c("SNPs file"="snps",
                                                                     "Genomic windows"="window")),
      tags$hr(),
      fileInput("gff3_file", label="Select annotation file (GFF3)", accept = ".gff3"),
      tags$hr(),
      fileInput("file_in", label="Select input file", accept = ".csv"),
      # Conditional panels for SNPs file input
      conditionalPanel(condition="input.filetype=='snps'", uiOutput("slider_kb")),
      conditionalPanel(condition = "input.filetype=='snps'", uiOutput("slider_pval"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
