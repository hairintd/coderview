﻿$PBExportHeader$px_booleanserviceresult.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_BooleanServiceResult from nonvisualobject
    end type
end forward

global type px_BooleanServiceResult from nonvisualobject
end type

type variables
    px_ServiceResult serviceResult
    boolean value
end variables

on px_BooleanServiceResult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_BooleanServiceResult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

