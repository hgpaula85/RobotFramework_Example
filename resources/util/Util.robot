*** Settings ***
Library    SeleniumLibrary    timeout=15
Library    String
Library    OperatingSystem
Library    Collections

Resource  ..${/}common_variables.robot

*** Keywords ***
# Setups ---------------------------------------------------------------------------------------------------------------
Start test
    Set Results Directory

    IF  '${browser}'=='edge'
        Open Browser  ${url}  ${browser}
    ELSE
        Open Browser  ${url}  ${browser}  options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")  service_log_path=/dev/null
    END

    Maximize Browser Window

    ${FIRST_NAME}  Generate Random String  10  [LOWER]
    ${LAST_NAME}  Generate Random String  12  [LOWER]
    ${ZIP_CODE}  Generate Random String  5  [NUMBERS]
    ${PHONE}  Generate Random String  10  [NUMBERS]

    Set Test Variable  ${FIRST_NAME}
    Set Test Variable  ${LAST_NAME}
    Set Test Variable  ${ZIP_CODE}
    Set Test Variable  ${PHONE}

Stop Test
    Close Browser

Set Results Directory
    [Documentation]    Set results directory for each test

    ${test_dir}  Set Variable  ${EMPTY}
    ${test_dir}  Get Substring  ${TEST_NAME}  0  end=4
    ${screenshot_dir}  Join Path  ${EXECDIR}  results  ${test_dir}
    Remove Directory  ${screenshot_dir}  recursive=True
    Set Screenshot Directory  ${screenshot_dir}
    Set Test Variable  ${screenshot_dir}
    Set Test Variable  ${SHORT_TEST_NAME}  ${test_dir}

    [Return]    ${screenshot_dir}

# General --------------------------------------------------------------------------------------------------------------
Wait and click element
    [Arguments]    ${item}

    Wait Until Element Is Visible  ${item}
    Click Element  ${item}

Wait and write into input element
    [Arguments]    ${item}    ${text}

    Wait Until Element Is Visible  ${item}
    Scroll Element Into View  ${item}
    Input Text  ${item}  ${text}  clear=True

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

Generate Random Email
    [Documentation]  Get two names from names list, creates a random domain and returns a random email

    File Should Exist  ${names_file}  msg=File with names is not available at \resources\variables\names.txt
    ${lst_names}  Get File  ${names_file}
    ${lst_names}  Split To Lines  ${lst_names}
    ${lst_sample}  Evaluate  random.sample(@{lst_names}, 2)  random
    ${length}  Evaluate  random.randint(4, 10)
    ${domain}  Generate Random String  ${length}  [LOWER]
    ${email}  Catenate  SEPARATOR=  ${lst_sample}[0]  .  ${lst_sample}[1]  @  ${domain}  .  com
    ${email}  Convert To Lower Case  ${email}

    [Return]  ${email}

Select random name
    File Should Exist  ${names_file}  msg=File with names is not available at \resources\variables\names.txt
    ${lst_names}  Get File  ${names_file}
    ${lst_names}  Split To Lines  ${lst_names}
    ${element}  Select random element from list  ${lst_names}

    [Return]    ${element}

Select random element from list
    [Arguments]    ${list}

    ${lst_sample}  Evaluate  random.sample(@{list}, 1)  random

    [Return]    ${lst_sample}[0]

Select Random From List by Label
    [Arguments]    ${list_locator}    ${remove_first}=${FALSE}

    ${lst_label}  Get List Items  ${list_locator}

    IF  ${remove_first}
        ${item}  Remove From List  ${lst_label}  0
    END

    ${label}  Select random element from list  ${lst_label}
    Select From List By Label  ${list_locator}  ${label}
