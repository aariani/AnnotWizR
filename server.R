
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  # conditional panels for SNPs file input
  output$slider_kb<-renderUI({
    sliderInput("dist_kb", "Select distance from SNPs (Kb)",
                min=0, max=200, value=5)
  })
  output$slider_pval<-renderUI({
    sliderInput("pval_cutoff", "Select P value cut-off", 
                min=0, max=1, value = 0.05, step = 0.01)
    })
  
  })
