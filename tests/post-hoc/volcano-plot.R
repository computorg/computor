library("plotly")
library("sansSouci")  ## devtools::install_github("pneuvial/sanssouci@develop")

data(volcano, package = "sansSouci")
dataSets <- unique(volcano[["dataSet"]])
volcano[["logp"]] <- log10(volcano[["p.value"]])

ui <- fluidPage(
    titlePanel("Post hoc confidence bounds for volcano plots"),
    inputPanel(
        selectInput("dataSet", "Data set", choices = dataSets, selected = "bourgon"),
        numericInput("alpha", "Target confidence level:", 0.05, min = 0, max = 1)),
    fluidRow(
        column(8,
               wellPanel(plotlyOutput("plot"))),
        column(4,
               wellPanel(h2("Selected genes"),
                         h3("Confidence statement"),
                         textOutput("bound"),
                         h3("List"),
                         textOutput("selection")))
    )
)

server <- function(input, output, session) {
    
    volc <- reactive({ 
        dat <- volcano[which(volcano$dataSet == input$dataSet), ]
        subset(dat, (abs(meanDiff) > 0.3) | (p.value < 0.01))
    })
    
    output$plot <- renderPlotly({
        datly <- volc()
        rg <- range(datly$meanDiff)
        rg <- max(abs(rg))*c(-1,1)

        d <- event_data("plotly_selected")
        print(d)
        mm <- match(d$key, datly[["id"]])
        print(mm)
        selected <- numeric(nrow(datly))
        selected[mm] <- 1
        #table(selected)
        datly$selected <- factor(selected)
        
        library("ggplot2")
        p <- ggplot(datly, aes(x = meanDiff, y = -logp, 
                               colour = selected, key = id))
        p <- p + geom_point(alpha = 0.2)
        p <- p + xlim(range(datly$meanDiff))
        p <- p + ylim(c(0, max(-datly$logp)))
        ggplotly(p)  %>% 
            config(displayModeBar = F) %>%
            layout(dragmode = "select",
                   xaxis = list(range = rg))
    })
    
    output$bound <- renderText({
        datly <- volc()
        alpha <- input$alpha
        d <- event_data("plotly_selected")
        msg <- "Nothing to show here yet."
        if (is.null(d)) {
            ## TODO: default selection
            ## mm <- which(datly[["adjp"]] <= alpha)
        } else {
            str(d$key)
            mm <- match(d$key, datly[["id"]])
            if (!all(is.na(mm))) {
                Vbar <- posthocBySimes(datly[["p.value"]], mm, alpha)
                msg <- sprintf("At least %s true positives among %s selected genes", Vbar, nrow(d))
                fdp <- round(1 - Vbar/nrow(d), 2)
                msg <- sprintf("%s (FDP %s %s)", msg, ifelse(fdp==0, "=", "<="), fdp)
            }
        }
        # msg <- paste(msg, str(d), collapse = "\n")
        msg
    })
    
    output$selection <- renderText({
        datly <- volc()
        alpha <- input$alpha
        d <- event_data("plotly_selected")
        msg <- "Nothing to show here yet."
        if (!is.null(d)) {
            msg <- d$key
        }
        msg
    })

}
## TODO: 
## x select data set
## * export selected genes
## * multiple selection: exists since dec 17 in js, not in R yet
## * on click: afficher les termes du GO correspondants
shinyApp(ui, server)
