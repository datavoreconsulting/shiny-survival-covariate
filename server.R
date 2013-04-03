library(shiny)
library(survival)

myData = read.csv("PRTData.csv")
model = coxph(Surv(PRT,Censor) ~ Aphid*Starve, data = myData)

# Aphid effect with 'mean' starvation time

shinyServer(function(input, output) {

  output$plot_predicted <- renderPlot({ 
    nd = data.frame(Aphid=c("pea","bean"), Starve=input$starve)
    plot(survfit(model,newdata=nd),col=c(2,1),lwd=2,conf.int=F,xlim=c(0,720), xlab="Time (min)",ylab="Proportion Remaining in Patch")
    lines(survfit(model,newdata=nd),conf.int=T,col=c(2,1),lty=2,lwd=1.5)
    leg.txt=c("Bean Aphid","Pea Aphid")
    legend(500,1,leg.txt,lwd=2,col=c(1,2),bty="n")  
  })
  
  output$summary <- renderPrint({
    summary(model)
  })
  
  output$raw_data <- renderTable({
    myData
  }, include.rownames = FALSE)
    
})
  

            