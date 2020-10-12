library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("Body Mass Index Calculator for Adults"),
    
    sidebarLayout(
        sidebarPanel( 
            
            helpText("Body Mass Index (BMI) is a measurement that is a ratio of your weight and height. It's a good way to gauge whether your weight is in healthy proportion to your height. In fact, knowing your BMI can help you determine any health risks you may face if it's outside of the healthy range. This application will calculate your BMI."),            
            br(),           
            sliderInput("ing_weight_kg",label = h4("What is your weight in kilograms?"),min = 30, max = 150,0), #, value = 70
            br(),
            sliderInput("int_height_cm",label = h4("What is your height in centimeters?"),min = 50, max = 300,0), #,value = 170
            br(),
            
            br(),   
            actionButton("FindBMI", label = "Calculate your BMI")    
            
            
        ),
        mainPanel
        (
            tabsetPanel
            (
                tabPanel("BMI Calculator",
                         p(h4("Hello!")),
                         textOutput("current_weight"),
                         textOutput("current_height"),
                         br(),
                         p(h4("Your BMI is:")), 
                         textOutput("BMI_result"),
                         p(h4("And your BMI classification is:")),
                         textOutput("status_indicator")
                ),
                tabPanel(
                    "Documentation",
                    p(h4("Body Mass Index Application")),
                    br(),
                    helpText("This application calculates the BMI of an adult more than 20 years old based on the weight and height."),
                    p(h3("Body Mass Index")),
                    helpText("BMI, formerly called the Quetelet index, is a measure for indicating nutritional status in adults. It is defined as a person's weight in kilograms divided by the square of the person's height in metres (kg/m2). To know more about BMI, go to this link: https://www.euro.who.int/en/health-topics/disease-prevention/nutrition/a-healthy-lifestyle/body-mass-index-bmi")
                )
            )
        )
    )
))