
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# increase input file size
options(shiny.maxRequestSize=-1)

library(shiny)
library(rtracklayer)
library(GenomicRanges)

source('helper.R')

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
  gff3_genes = reactive({
    f = input$gff3_file
    f=import.gff(as.character(f$datapath))
    genes = subset(f, f$type=='gene')
    genes
  })
  
  data_res = reactive({
    if (input$file_in=='snp'){
      sign_file = input$file_in
      snps = get_SNP_range(sign_file$datapath)
      snps
    }
    else{
      window_file = input$file_in
      bins =get_Windows_range(window_file$datapath)
    }
  })
  
  
  })
