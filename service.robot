*** Settings ***
Resource  ./commons.robot
Library  ./pythons/sdrMapping.py
Library  ./pythons/sdrAutoInput.py
Library  ./pythons/redfishAutoInput.py
Library  ./pythons/ipmi_autoinput.py
Variables  ./pythons/bmc_cpld_table.py

*** Keywords ***

SDR Auto Test
    sdrMapping.sdrTable_mapping
    sdrAutoInput.sdr_input_xlsx

Redfish Auto
    redfishAutoInput.redfish_autoinput

IPMI Automation
    ipmi_autoinput.ipmi_autoinput

GET CPLD VERSION
    ${bmc_cpld_ver}=  ssh.Execute Command  roux-fw-ver.sh | grep "BMC CPLD"
    ${mb_cpld_ver}=  ssh.Execute Command  roux-fw-ver.sh | grep "MB CPLD"
    [Return]  ${bmc_cpld_ver}  ${mb_cpld_ver}

UPDATE CPLD
    [Arguments]  ${cpld_table}
    SCP Open to BMC
    scp.Put File    /root/cpld/${cpld_table['fw']}  /mnt
    scp.Close Connection
    ${output}=  ssh.Execute Command  roux-firmware-update.sh ${cpld_table['type']} /mnt/${cpld_table['fw']}
    Log  ${output}
    Should Contain  ${output}  Success!
    [Return]  ${cpld_table['ver']}

CPLD UPDATE BMC
    SSH Login to BMC
    ${bmc_cpld_ver}  ${mb_cpld_ver}=  GET CPLD VERSION
    IF   """${bmc_cpld_map['up']['ver']}""" in """${bmc_cpld_ver}"""
        ${bmccpld_expect_ver}=  UPDATE CPLD  ${bmc_cpld_map['down']}
    ELSE
        ${bmccpld_expect_ver}=  UPDATE CPLD  ${bmc_cpld_map['up']}
    END
    IF   """${mb_cpld_map['up']['ver']}""" in """${mb_cpld_ver}"""
        ${mbcpld_expect_ver}=  UPDATE CPLD  ${mb_cpld_map['down']}
    ELSE
        ${mbcpld_expect_ver}=  UPDATE CPLD  ${mb_cpld_map['up']}
    END
    ${output}=  ssh.Execute Command  kudo.sh rst hotswap
    ssh.Close Connection
    Wait Until BMC Up
    SSH Login to BMC
    ${bmc_cpld_ver}  ${mb_cpld_ver}=  GET CPLD VERSION
    ssh.Close Connection
    Should Contain  ${bmc_cpld_ver}  ${bmccpld_expect_ver}
    Should Contain  ${mb_cpld_ver}  ${mbcpld_expect_ver}

Copy Sanity Scripts to OS
    SCP Open to OS
    FOR    ${ScriptName}    IN    @{SANITY_LIST}
        scp.Put File    ${SCRIPTS_PATH}/${ScriptName}.sh  ${bmc_dst_path}/
    END
    scp.Close Connection

Copy Scripts to BMC
    @{ScriptsList} =    Set Variable    ${SDRINFO}   ${THRESHOLD}   ${HEXDUMP}
    SCP Open to BMC
    FOR    ${ScriptName}    IN    @{ScriptsList}
        scp.Put File    ${SCRIPTS_PATH}/${ScriptName}.sh  ${bmc_dst_path}/
    END
    scp.Close Connection

Copy Scripts to OS
    SCP Open to OS
    scp.Put File    ${SCRIPTS_PATH}/${Configcheck}.sh  ${os_dst_path}/
    scp.Close Connection

Execute scripts on OS
    SSH Login to OS

    Execute script   ${Configcheck}   ${os_dst_path}

    ssh.Close Connection

Execute scripts on BMC
    @{ScriptsList} =    Set Variable    ${SDRINFO}   ${THRESHOLD}
    SSH Login to BMC

    Execute multiple scripts    @{ScriptsList}    scripts_path=${bmc_dst_path}
    Execute script   ${HEXDUMP}   ${bmc_dst_path}   is_output=${False}   is_format=${True}

    ssh.Close Connection

Execute sanity scripts on OS
    SSH Login to OS

    Execute multiple scripts    @{SANITY_LIST}    scripts_path=${bmc_dst_path}

    ssh.Close Connection

Get result from OS
    SCP Open to OS
    scp.Get File    ${os_dst_path}/${Configcheck}.txt  ${RESULT_PATH}
    scp.Close Connection

Get result from BMC
    @{FilesList} =    Set Variable    ${SDRINFO}.txt   ${THRESHOLD}.txt   ${HEXDUMP}result
    SCP Open to BMC

    FOR    ${File}    IN    @{FilesList}
        scp.Get File    ${bmc_dst_path}/${File}  ${RESULT_PATH}
    END

    scp.Close Connection

Get sanity result from OS
    SCP Open to OS

    FOR    ${File}    IN    @{SANITY_LIST}
        scp.Get File    ${bmc_dst_path}/${File}.txt  ${SANITY_PATH}
    END

    scp.Close Connection


NMAP BMC
    ${result} =     Run  nmap -p 22 ${BMC_HOST}
    Log    ${result}
    Should Contain  ${result}  open

Wait Until BMC Up
    Wait Until Keyword Succeeds
    ...   5 min  10 sec   NMAP BMC
