﻿$PBExportHeader$px_asyncserviceresult.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_AsyncServiceResult from px_ServiceResult
    end type
end forward

    global type px_AsyncServiceResult from px_ServiceResult
end type

type variables
    px_OperationRequest operationRequests[]
    string singleRequestId
    string errorCode
    string errorMessage
    string exceptionStackTrace
    boolean hasInfo
    string infoCode
    string infoMessage
    longlong resultID
    boolean success
end variables

on px_AsyncServiceResult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_AsyncServiceResult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

