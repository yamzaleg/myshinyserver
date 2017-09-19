
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(plotly)

setwd('/home/tgrn510/www/shiny-server/mytest/shiny_test')
mygenes <- read.csv('gene_dist_head.tsv', header= TRUE, sep = "\t",fill = TRUE)
  autosomes<-c("1","2","3","4","5","6","7","8","9","10",
 "11","12","13","14","15","16","17","18","19","20","21","22")
 genes<- mygenes[ which(mygenes$chr %in% autosomes), ]
 genes$chr <- factor(genes$chr, levels = autosomes)
  
shinyServer(function(input,output) {

output$distPlot <- renderPlotly({   
p<-ggplot(data = genes) +
 geom_bar(mapping = aes(x = chr, fill = feature), width = 1)
 ggplotly(p)
  })
})

