#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
        dashboardPage(
                  dashboardHeader(title = 'Opioid Overdoses', titleWidth = 1000),
                  dashboardSidebar(tags$blockquote('Over 50,000 Americans had died
                                                  of drug overdoses in 2016,
                                                  the most ever recorded in the course of a year!
                                                   Source: CDC WONDER')),
                                   
                  dashboardBody(
                    fluidRow(
                      box(
                        #title = "State", status = "primary"   
                        width = 2,
                        selectInput("year", 
                                    label = "Year", 
                                    choices = years,
                                    selected = '2016')),
                      box(title ='Opioid Deaths per 100,000 Residents by Year', 
                          status = 'primary',
                          solidHeader = T,
                          plotlyOutput("Plot", height = 300, width=500),
                          width = 9)),
    
                      fluidRow(
                        box(
                          #title = "State", status = "primary"   
                          width = 2,
                          selectInput("state", 
                                      label = "State", 
                                      choices = state,
                                      selected = 'TN')),
                      fluidRow( 
                        box(title ='Number of Opioid Prescriptions', 
                            status = 'primary',
                            solidHeader = T,
                            plotOutput("Plot1", height = 300, width=500),
                            width = 9))
                      )
                    )
                  )
                  )