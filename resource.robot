*** Variables ***
${Redfish_Host}   2001:db8:0:1:1622:3bff:feaa:fba4
${OS_HOST}    192.169.100.12
${OS_USER}    root
${OS_PASSWORD}   0vss
${BMC_HOST}   192.169.100.23
${BMC_USER}   root
${BMC_PASSWORD}   0penBmc
${bmc_dst_path}   ~
${os_dst_path}   /tmp
${RESULT_PATH}   ${CURDIR}/results
${SANITY_PATH}   ${CURDIR}/sanity
${PYTHONS_PATH}   ${CURDIR}/pythons
${SCRIPTS_PATH}   ${CURDIR}/scripts
${CHMOD_CMD}   chmod +x
${SPEC_PATH}    ${PYTHONS_PATH}/Astoria BMC Firmware Features_V2AH_20220808.xlsx
${XLSX_MODEL}   ${PYTHONS_PATH}/Astoria-SIT-TestPlan_BMCQA_x08_PVT_20220808.xlsx
#script name
@{SANITY_LIST}    fru   mc_info   sel_elist   sensor_list_all
${SDRINFO}   sdrinfo
${THRESHOLD}   threshold
${HEXDUMP}   hexdump
${Configcheck}   OVSS_Configcheck
${SENSOR_LIST_TXT}   sensorlistall.txt
${IPMI_CMDS}   IPMI_Cmds
${REDFISH_IPV6}   redfish_ipv6
