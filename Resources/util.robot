*** Settings ***
Resource  header_page.robot

*** Keywords ***
Exit
    Sleep  3 seconds
    header_page.Sign Out
    Close Browser
