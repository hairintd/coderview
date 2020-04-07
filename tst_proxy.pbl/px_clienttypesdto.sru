$PBExportHeader$px_clienttypesdto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_ClientTypesDTO from px_CustomServiceResult
    end type
end forward

    global type px_ClientTypesDTO from px_CustomServiceResult
end type

type variables
    px_ClientTypeDTO clientTypeDTOS[]
    px_ServiceResult serviceResult
end variables

on px_ClientTypesDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_ClientTypesDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

