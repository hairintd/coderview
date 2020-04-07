$PBExportHeader$tst_excep.sra
$PBExportComments$Generated Application Object
forward
global type tst_excep from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type tst_excep from application
string appname = "tst_excep"
end type
global tst_excep tst_excep

on tst_excep.create
appname="tst_excep"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on tst_excep.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open( w_exception )
end event

