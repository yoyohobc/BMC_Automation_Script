*** Settings ***
Resource  ./service.robot
Test Teardown   Close SCP and SSH
*** Test Cases ***
Run Sanity
    [Tags]  Run_Sanity
    Copy Sanity Scripts to OS
    Execute sanity scripts on OS
    Get sanity result from OS

Run BMC
    [Tags]  Run_BMC
    Copy Scripts to BMC
    Execute scripts on BMC
    Get result from BMC
    SDR Auto Test

Run OVSS
    [Tags]  Run_OVSS
    Copy Scripts to OS
    Execute scripts on OS
    Get result from OS

Run Redfish
    [Tags]  Run_Redfish
    Redfish Auto

Run IPMI
    [Tags]  Run_IPMI
    IPMI Automation

*** comment ***
Run CPLD
    [Tags]  Run_CPLD
    FOR    ${index}    IN RANGE    10
        CPLD UPDATE BMC
    END