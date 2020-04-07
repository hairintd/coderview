﻿$PBExportHeader$px_clienttypedto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_ClientTypeDTO from px_CustomServiceResult
    end type
end forward

    global type px_ClientTypeDTO from px_CustomServiceResult
end type

type variables
    string displayableName
    longlong id
    px_ServiceResult serviceResult
end variables

on px_ClientTypeDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_ClientTypeDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

