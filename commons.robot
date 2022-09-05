*** Settings ***
Resource  ./resource.robot
Library  SSHLibrary  WITH NAME  ssh
Library  SCPLibrary  WITH NAME  scp
Library  OperatingSystem

*** Keywords ***
SSH Login to OS
    ssh.Open Connection     ${OS_HOST}
    ssh.Login   ${OS_USER}    ${OS_PASSWORD}

SSH Login to BMC
    ssh.Open Connection     ${BMC_HOST}
    ssh.Login   ${BMC_USER}    ${BMC_PASSWORD}

SCP Open to OS
    scp.Open connection  ${OS_HOST}  username=${OS_USER}
    ...  password=${OS_PASSWORD}

SCP Open to BMC
    scp.Open connection  ${BMC_HOST}  username=${BMC_USER}
    ...  password=${BMC_PASSWORD}

BMC Execute Command
    [Arguments]  ${command}

    SSH Login to BMC
    ssh.Execute Command     ${command}
    ssh.Close Connection

OS Execute Command
    [Arguments]  ${command}

    SSH Login to OS
    ssh.Execute Command     ${command}
    ssh.Close Connection

Execute script
    [Arguments]  ${script_name}   ${script_path}   ${is_output}=${True}   ${is_format}=${False}

    IF    ${is_format}
        ssh.Execute Command     sed -i "s/\r//" ${script_path}/${script_name}.sh
    END

    ssh.Write     ${CHMOD_CMD} ${script_path}/${script_name}.sh

    IF    ${is_output}
        ssh.Execute Command     ${script_path}/${script_name}.sh > ${script_path}/${script_name}.txt
    ELSE
        ssh.Execute Command     ${script_path}/${script_name}.sh
    END

Execute multiple scripts
    [Arguments]  @{scripts_list}   ${scripts_path}
    FOR    ${script_name}    IN    @{scripts_list}
        Execute script   ${script_name}  ${scripts_path}
    END

Close SCP and SSH
    scp.Close Connection
    ssh.Close All Connections

