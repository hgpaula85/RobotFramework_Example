*** Settings ***
Library     SeleniumLibrary    timeout=15
Resource    header_page.robot

*** Keywords ***
Exit
    Sleep  3 seconds
    header_page.Sign Out
    Close Browser

Wait and click element
    [Arguments]    ${item}

    Wait Until Element Is Visible  ${item}
    Click Element  ${item}

Wait and write into input element
    [Arguments]    ${item}    ${text}

    Wait Until Element Is Visible  ${item}
    Input Text  ${item}  ${text}  clear=True

Clear and write
    [Arguments]    ${item}    ${text}

    Wait Until Element Is Visible  ${item}
    Press Keys  ${item}  BACKSPACE  ${text}

Element Attribute Value Should Contain
    [Arguments]    ${locator}    ${attribute}    ${expected}

    ${act_attribute}  SeleniumLibrary.Get Element Attribute  ${locator}  ${attribute}
    Should Contain  ${act_attribute}  ${expected}  msg=Element "${locator}" attribute "${attribute}" should contain "${expected}"

Wait Until Elements Are Visible
    [Arguments]    @{lst_elements}  ${timeout}=15s

    FOR  ${element}  IN  @{lst_elements}
        Wait Until Element Is Visible  ${element}  ${timeout}
    END

Wait Until Elements Are Not Visible
    [Arguments]    @{lst_elements}    ${timeout}=15s

    FOR  ${element}  IN  @{lst_elements}
        Wait Until Element Is Not Visible  ${element}  ${timeout}
    END
