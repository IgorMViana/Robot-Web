*** Settings ***
Documentation     Resource file to walkdog automation
Library           Browser


*** Keywords ***
Open Walkdog's page
    New Browser    chromium    false
    New Page    https://walkdog.vercel.app
