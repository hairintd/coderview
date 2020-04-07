$PBExportHeader$px_servicescheduledto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_ServiceScheduleDTO from px_CustomServiceResult
    end type
end forward

    global type px_ServiceScheduleDTO from px_CustomServiceResult
end type

type variables
    boolean active
    string agreementOperationCode
    string clientCode
    string dayOfWeekDisplayableName
    string dayOfWeekName
    longlong id
    long order
    string route
    string spcCode
    string startTime
    px_ServiceResult serviceResult
end variables

on px_ServiceScheduleDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_ServiceScheduleDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

