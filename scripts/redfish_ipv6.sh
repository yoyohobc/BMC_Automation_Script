#!/bin/bash
trap 'echo -e "\n$BASH_COMMAND"' DEBUG
curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Accounts

curl -g -6 patch http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Accounts/test -d '{"Enabled":true}'

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Accounts/ -d '{"UserName":"test","Password":"0penBmc1","RoleId":"ReadOnly","Enabled":true}' 

curl -g -6 delete http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Accounts/test

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/LDAP/Certificates

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Roles

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Roles/Administrator

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Roles/Operator

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Roles/ReadOnly

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/AccountService/Roles/NoAccess

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/CertificateService

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/CertificateService/Actions/CertificateService.GenerateCSR -d '{"Country":"TW","State":"Taiwan","OrganizationalUnit":"CSI","Organization":"FXN","City":"Taipei","CommonName":"test.com","CertificateCollection":{"@odata.id":"/redfish/v1/Managers/bmc/NetworkProtocol/HTTPS/Certificates"}}'

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/CertificateService/CertificateLocations

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Thermal

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Thermal#/Fans

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Thermal#/Temperatures

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Sensors

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Power

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Power#/Voltages



curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Thermal

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Thermal#/Fans

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Thermal#/Temperatures

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Sensors

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Power

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Power#/Voltages



curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/AccountService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/ActionInfo

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Assembly

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/AttributeRegistry

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Bios

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Certificate

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/CertificateLocations

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/CertificateService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Chassis

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/ComputerSystem

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Drive

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/EthernetInterface

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Event

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/EventDestination

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/EventService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/IPAddresses

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/JsonSchemaFile

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/LogEntry

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/LogService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Manager

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/ManagerAccount

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/ManagerNetworkProtocol

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Memory

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Message

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/MessageRegistry

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/MessageRegistryFile

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/MetricDefinition

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/MetricReport

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/MetricReportDefinition

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/PCIeDevice

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/PCIeFunction

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Power

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Privileges

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Processor

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Redundancy

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Resource

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Role

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Sensor

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/ServiceRoot

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Session

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/SessionService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Settings

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/SoftwareInventory

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Storage

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Task

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/TaskService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/TelemetryService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/Thermal

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/UpdateService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/VLanNetworkInterface

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/VirtualMedia

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/odata

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/redfish-error

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/redfish-payload-annotations

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/JsonSchemas/redfish-schema

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/SessionService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/SessionService/Sessions

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc#PowerState

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/EthernetInterfaces

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/EthernetInterfaces/eth1

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/EthernetInterfaces/eth1/VLANs

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/EthernetInterfaces/eth1/VLANs -d '{"VLANEnable":true}'

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/LogServices

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/LogServices/Journal

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/LogServices/Journal/Entries

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/NetworkProtocol

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/NetworkProtocol/https/Certificates

#curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/NetworkProtocol/https/Certificates/<ID>

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/Truststore/Certificates

curl -X DELETE -k http://192.169.100.19/redfish/v1/Managers/bmc/Truststore/Certificates

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Registries

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Registries/Base

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Registries/OpenBMC

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Registries/ResourceEvent

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Registries/TaskEvent

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system#PowerState

#curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Actions/ComputerSystem.Reset -d '{"ResetType":"off"}'
#
#sleep 30
#
curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Actions/ComputerSystem.Reset -d '{"ResetType":"On"}'
#
#sleep 500

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Bios

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/LogServices

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/LogServices/EventLog

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/LogServices/EventLog/Actions/LogService.ClearLog

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/LogServices/EventLog/Entries

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Memory

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Processors

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Storage

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Storage/1

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/PCIeDevices

#curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Systems/system/Storage/1/redfish/v1/Chassis/agoraV2AH/PCIeDevices/redfish/v1/Systems/{ComputerSystemId}/SimpleStorage	

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/UpdateService

curl -g -6 http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/UpdateService/FirmwareInventory

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/Actions/Manager.ResetToDefaults -d '{"ResetToDefaultsType":"ResetAll"}'

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/agoraV2AH/Actions/Chassis.Reset -d '{"ResetType":"PowerCycle"}'

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Chassis/mobo/Actions/Chassis.Reset -d '{"ResetType":"PowerCycle"}'

curl -g -6 post http://[2001:db8:0:1:1622:3bff:feaa:fa58]:80/redfish/v1/Managers/bmc/Actions/Manager.Reset -d '{"ResetType":"GracefulRestart"}'