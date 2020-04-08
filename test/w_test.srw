$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type sle_spccode from singlelineedit within w_test
end type
type cb_save from commandbutton within w_test
end type
type cb_del from commandbutton within w_test
end type
type cb_ins from commandbutton within w_test
end type
type dw_ex from datawindow within w_test
end type
type cb_conn from commandbutton within w_test
end type
end forward

global type w_test from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Тестовая работа"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Asterisk!"
boolean center = true
sle_spccode sle_spccode
cb_save cb_save
cb_del cb_del
cb_ins cb_ins
dw_ex dw_ex
cb_conn cb_conn
end type
global w_test w_test

type variables
constant string is_service = "sberroutereferencesservice"

sberroutereferencesservice n_serv

tns1__csvdto  								p_csvdto
tns1__serviceresult 						p_result
tns1__ExceptionalBusinessDayDTO		p_except

end variables

forward prototypes
public function integer f_save (long row)
public function integer f_deleterow (integer row)
end prototypes

public function integer f_save (long row);string ls_res
// Коды возврата 0 - успешно,
// -1 -ошибка вызова сервиса, требует доп обработки, но не в тест задании
// 1 - не успех, ошибка возвращаемая сервисом
if dw_ex.Getitemstatus(row, 0, Primary!) = NotModified! then return 0;

p_except.id = dw_ex.Getitemnumber(row, 'id')
p_except.spcCode = dw_ex.GetitemString(row, 'spcCode')
p_except.daydate = string(dw_ex.GetitemDate(row, 'daydate'), 'dd.mm.yyyy')
p_except.substituteDayName = upper(string(today(),'dddd'))

// Дёргаю сервис
Setpointer(HourGlass!)
try
	p_result = n_serv.saveOrUpdateExceptionalBusinessDay(p_except);
catch (SoaPException e1)
	ls_res = e1.Getmessage();
	if len (ls_res)  = 0 then ls_res = e1.GetdetailMessage();
	Setpointer(Arrow!)
	MessageBox('Ошибка!', ls_res)
	return -1;
end try
Setpointer(Arrow!)
// Обрабатываю результат
if p_result.success then
	dw_ex.Setitem(row, 'id', p_result.resultID)
else
		MessageBox('Ошибка!', p_result.errorMessage)
		return 1;
end if	
return 0;
end function

public function integer f_deleterow (integer row);long ll_id
string ls_res
// Коды возврата 0 - успешно,
// -1 -ошибка вызова сервиса, требует доп обработки, но не в тест задании
// 1 - не успех, ошибка возвращаемая сервисом

ll_id= dw_ex.Getitemnumber(row, 'id')
Setpointer(HourGlass!)
// Дёргаю сервис
try
	p_result = n_serv.deleteExceptionalBusinessDay(ll_id);
catch (SoaPException e1)
	ls_res = e1.Getmessage();
	if len (ls_res)  = 0 then ls_res = e1.GetdetailMessage();
	Setpointer(Arrow!)
	MessageBox('Ошибка!', ls_res)
	return -1;
end try
Setpointer(Arrow!)
// Обрабатываю результат
if p_result.success then
	dw_ex.Setitem(row, 'id', p_result.resultID)
else
		MessageBox('Ошибка!', p_result.errorMessage)
		return 1;
end if

return 0;


end function

on w_test.create
this.sle_spccode=create sle_spccode
this.cb_save=create cb_save
this.cb_del=create cb_del
this.cb_ins=create cb_ins
this.dw_ex=create dw_ex
this.cb_conn=create cb_conn
this.Control[]={this.sle_spccode,&
this.cb_save,&
this.cb_del,&
this.cb_ins,&
this.dw_ex,&
this.cb_conn}
end on

on w_test.destroy
destroy(this.sle_spccode)
destroy(this.cb_save)
destroy(this.cb_del)
destroy(this.cb_ins)
destroy(this.dw_ex)
destroy(this.cb_conn)
end on

event open;long ll_res

soapconnection conn

conn = create soapconnection
ll_res = conn.createinstance(n_serv, is_service )
if ll_res <> 0 then 
	messagebox('Ошибка!', 'Работа с сервисом невозможна. Ошибка: ' + string (ll_res))
	close (this)
	destroy (test)
end if 
end event

event resize;this.width=3922
this.height = 1544
end event

event closequery;long ll_row
if ll_row>0 and ll_row <= dw_ex.Rowcount() then f_Save(ll_row)
end event

event close;GarbageCollect ()
destroy (test)
end event

type sle_spccode from singlelineedit within w_test
integer x = 64
integer y = 20
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type cb_save from commandbutton within w_test
integer x = 3397
integer y = 16
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;long ll_row
integer li_res


ll_row = dw_ex.Getrow()
if ll_row>0 and ll_row <= dw_ex.Rowcount() then li_res = f_Save(ll_row)
end event

type cb_del from commandbutton within w_test
integer x = 2135
integer y = 16
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Delete"
end type

event clicked;long ll_row
integer li_res = -1


ll_row = dw_ex.Getrow()
if ll_row>0 and ll_row <= dw_ex.Rowcount() then li_res = f_deleterow(ll_row)
if li_res=0 then li_res= dw_ex.DeleteRow (ll_row)
if li_res <> 1 then MessageBox('Ошибка!', 'Ошибка работы интерфейса.')
end event

type cb_ins from commandbutton within w_test
integer x = 1687
integer y = 16
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add row"
end type

event clicked;dw_ex.object.spccode.initial = sle_spccode.text
dw_ex.insertrow(0)
end event

type dw_ex from datawindow within w_test
event save ( )
event delete_row ( )
integer x = 59
integer y = 152
integer width = 3739
integer height = 1188
integer taborder = 20
string title = "none"
string dataobject = "dw_test"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event delete_row();long row

end event

event rowfocuschanging;if currentrow>0 and currentrow <= dw_ex.Rowcount() then F_save(currentrow) else return 0;

end event

type cb_conn from commandbutton within w_test
integer x = 480
integer y = 16
integer width = 288
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Select"
end type

event clicked;long ll_res, ll_null
string  ls_res




if len(sle_spccode.text) = 0 then return;

Setpointer(HourGlass!)
	
// Дёргаю сервис
try
	p_csvdto = n_serv.loadAllExceptionalBusinessDaysBySpcCode(sle_spccode.text);
catch (SoaPException e2)
	ls_res = e2.Getmessage();
	if len (ls_res)  = 0 then 	ls_res = e2.GetdetailMessage();
	MessageBox('Ошибка!', ls_res)
	return
end try
Setpointer(Arrow!)

// Обрабатываю результат. Тут сделал так, что гружу только одну строку. 
// чтобы обработать прешедешее, мне надо посмотреть на него хотя бы в дебаггере. Исхожу из:

//// Стуктура для передачи записей в CSV формате
//public class CsvDTO {
//	/** Результат выполнения метода */
//	ServiceResult serviceResult;
//	/** Строка с записями справочника в CSV формате (разделитель запятая) */
//	String csvData;
//

if not p_result.success then 		
	MessageBox('Ошибка!', p_result.errorMessage)
else
	ll_res = dw_ex.Importstring(CSV!, p_csvdto.csvData, ',')
	if ll_res<0 then Messagebox('Ошибка!', 'Ошибка импорта данных ! Код ошибки: '+ string(ll_res))
end if	







end event

