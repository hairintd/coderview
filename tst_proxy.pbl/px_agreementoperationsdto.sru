$PBExportHeader$px_agreementoperationsdto.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type px_AgreementOperationsDTO from px_CustomServiceResult
    end type
end forward

    global type px_AgreementOperationsDTO from px_CustomServiceResult
end type

type variables
    px_AgreementOperationDTO agreementOperationDTOS[]
    px_ServiceResult serviceResult
end variables

on px_AgreementOperationsDTO.create
call super::create
TriggerEvent( this, "constructor" )
end on

on px_AgreementOperationsDTO.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

