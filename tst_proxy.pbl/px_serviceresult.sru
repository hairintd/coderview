$PBExportHeader$px_serviceresult.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_ServiceResult from nonvisualobject
    end type
end forward

global type px_ServiceResult from nonvisualobject
end type

type variables
    string errorCode
    string errorMessage
    string exceptionStackTrace
    boolean hasInfo
    string infoCode
    string infoMessage
    longlong resultID
    boolean success
end variables

on px_ServiceResult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_ServiceResult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

