﻿$PBExportHeader$px_agreementoperationdto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_AgreementOperationDTO from px_CustomServiceResult
    end type
end forward

    global type px_AgreementOperationDTO from px_CustomServiceResult
end type

type variables
    string displayableName
    string operationCode
    px_ServiceResult serviceResult
end variables

on px_AgreementOperationDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_AgreementOperationDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

