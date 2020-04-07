﻿$PBExportHeader$px_operationrequest.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_OperationRequest from nonvisualobject
    end type
end forward

global type px_OperationRequest from nonvisualobject
end type

type variables
    string operation
    string requestId
end variables

on px_OperationRequest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_OperationRequest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

