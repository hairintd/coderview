$PBExportHeader$px_exceptionalbusinessdaydto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_ExceptionalBusinessDayDTO from px_CustomServiceResult
    end type
end forward

    global type px_ExceptionalBusinessDayDTO from px_CustomServiceResult
end type

type variables
    string dayDate
    longlong id
    string spcCode
    string substituteDayName
    px_ServiceResult serviceResult
end variables

on px_ExceptionalBusinessDayDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_ExceptionalBusinessDayDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

