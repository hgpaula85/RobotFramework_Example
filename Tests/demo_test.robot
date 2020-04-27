*** Settings ***
Documentation  My first test, just login
Library     SeleniumLibrary

*** Variables ***


*** Test Cases ***
Open and close browser
    Open Browser    https://www.google.com/?gws_rd=ssl
    Close Browser