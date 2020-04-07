$PBExportHeader$px_csvdto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_CsvDTO from nonvisualobject
    end type
end forward

global type px_CsvDTO from nonvisualobject
end type

type variables
    string csvData
    px_ServiceResult serviceResult
end variables

on px_CsvDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_CsvDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

