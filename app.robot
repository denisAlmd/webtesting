*** Settings ***
Resource        keywords.robot
Test Setup      abrir navegador
#Test Teardown   fechar navegador


*** Test Cases ***
Test case 1
    Acessar a aba Downloads                  #Opening Download page
    Check tTitle page                        #Check that the page title is "Download Windows Application | Challenger".

Test case 2
    Access Login Tab                         #Access the Login tab
    Check and Aceept Cookies                 #Check and Accept Cookies
    Input Login, Password and Submit form    #Enter Login, Password and Submit the login form
    Checks the credentials error message     #Checks that the message "Unable to login with provided credentials" is displayed on the screen