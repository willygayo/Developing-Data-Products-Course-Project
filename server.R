library(shiny)

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    observe({
        input$FindBMI
        values$bmi <- isolate({
            
            input$ing_weight_kg/(input$int_height_cm/100 * input$int_height_cm/100)
        })
    })
    
    
    # Display your current values
    output$current_height <- renderText({
        input$FindBMI
        paste("Your height is: ", isolate(input$int_height_cm))
    })
    
    output$current_weight <- renderText({
        input$FindBMI
        paste("Your weight is: ", isolate(input$ing_weight_kg))
    })
    
    output$status_indicator <- renderText({
        
        if(input$FindBMI == 0) ""
        else {
            
            if (values$bmi < 18.5)
            {
                values$status_indicator = "Underweight"
            }
            else if (values$bmi < 24.9)
            {
                values$status_indicator="Normal weight"
            }
            else if (values$bmi < 29.9)
            {
                values$status_indicator="Pre-obesity"
            }
            else if (values$bmi < 34.9)
            {
                values$status_indicator="Obese Class I"
            }else if (values$bmi < 39.9)
            {
                values$status_indicator="Obese Class II"
            }
            else
            {
                values$status_indicator="Obese Class III"
            }
            
            paste(values$status_indicator, ". This classification is applicable to adult more than 20 years old according to World Health Organization.")
        }
    })

    output$BMI_result <- renderText({
        if(input$FindBMI == 0) ""
        else
            paste(values$bmi)
    })
})