﻿$PBExportHeader$n_cst_proxy.sru
forward
global type n_cst_proxy from nonvisualobject
end type
end forward

global type n_cst_proxy from nonvisualobject
end type
global n_cst_proxy n_cst_proxy

type variables
SoapConnection 							conn 
px_routereferencesfacadeservice		ws_acc

px_csvdto									ws_csv

px_serviceresult 							sRes
px_serviceresult 							sRes1
px_exceptionalbusinessdaydto 			in0

px_serviceresult 							DRes

end variables
forward prototypes
public function integer of_init (string as_inifile)
public function integer of_update (long al_id, string as_spccode, string as_substdaydate, datetime adt_daydate)
public function integer of_delete (long al_id)
public function integer of_load (string as_spccode, ref px_csvdto as_csvdto)
end prototypes

public function integer of_init (string as_inifile);Long		ll_retval


conn = CREATE SoapConnection
//Conn.SetOptions("SoapLog=~"c:\error.log~"")

ll_retval = Conn.CreateInstance( ws_acc, 'px_routereferencesfacadeservice', 'd:\src125\RouteReferencesService.wsdl' )

if ll_retval = 0 then 
	return 1
else
	return -1
end if	
end function

public function integer of_update (long al_id, string as_spccode, string as_substdaydate, datetime adt_daydate);Int				li_ret

sRes1 		= Create px_serviceresult
sRes 			= Create px_serviceresult
in0 			= Create px_exceptionalbusinessdaydto

If ( al_id = 0 ) Then SetNull( al_id )

Try
	sRes1.hasinfo 	= True
	sRes1.success 	= True
	sRes1.resultid 	= 0
	sRes1.errormessage = "OK"
	
	in0.id = al_id
	in0.daydate = String( adt_daydate )
	in0.spccode = as_spccode
	in0.substitutedayname = as_substdaydate
	in0.serviceresult = sRes1
	
	sRes = ws_acc.SaveOrUpdateExceptionalBusinessDay( in0 ) 
	
	If ( Not dRes.Success ) Then
		MessageBox( sRes.ErrorMessage, dRes.ErrorCode )
		li_ret = -1
	Else
		MessageBox( '', 'Удаление записи прошло успешно' )
		li_ret = 0
	End If
	
Catch ( SoapException E )
   	MessageBox ( 'Error', 'Cannot invoke Web service: ' + E.Text )   
		li_ret = -1
End Try

Return li_ret
end function

public function integer of_delete (long al_id);Int		li_ret

Try
	dRes = ws_acc.deleteExceptionalBusinessDay( al_id ) 
	
	If ( Not dRes.Success ) Then
		MessageBox( dRes.ErrorMessage, dRes.ErrorCode )
		li_ret = -1
	Else
		MessageBox( '', 'Удаление записи прошло успешно' )
		li_ret = 0
	End If
	
Catch ( SoapException E )
   	MessageBox ( 'Error', 'Cannot invoke Web service: ' + E.Text )   
	li_ret = -1
End Try

Return li_ret
end function

public function integer of_load (string as_spccode, ref px_csvdto as_csvdto);Int		li_ret

Try
	ws_csv = ws_acc.loadAllExceptionalBusinessDaysBySpcCode( as_spccode ) 
	as_csvdto	=	ws_csv
	li_ret	=	0
Catch ( SoapException E )
   	MessageBox ( 'Error', 'Cannot invoke Web service: ' + E.Text )   
	li_ret	=	-1
End Try

Return li_ret


end function

on n_cst_proxy.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_proxy.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

