﻿$PBExportHeader$px_routedto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_RouteDTO from px_CustomServiceResult
    end type
end forward

    global type px_RouteDTO from px_CustomServiceResult
end type

type variables
    longlong id
    string number
    string spcCode
    string startTime
    px_ServiceResult serviceResult
end variables

on px_RouteDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_RouteDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

