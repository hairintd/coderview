﻿$PBExportHeader$px_customserviceresult.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_CustomServiceResult from nonvisualobject
    end type
end forward

global type px_CustomServiceResult from nonvisualobject
end type

type variables
    px_ServiceResult serviceResult
end variables

on px_CustomServiceResult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_CustomServiceResult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

