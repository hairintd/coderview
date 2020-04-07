﻿$PBExportHeader$w_exception.srw
forward
global type w_exception from window
end type
type st_2 from statictext within w_exception
end type
type ddlb_day from dropdownlistbox within w_exception
end type
type st_1 from statictext within w_exception
end type
type sle_spc from singlelineedit within w_exception
end type
type cb_save from commandbutton within w_exception
end type
type cb_update from commandbutton within w_exception
end type
type cb_delete from commandbutton within w_exception
end type
type cb_load from commandbutton within w_exception
end type
type dw_list from datawindow within w_exception
end type
end forward

global type w_exception from window
integer width = 4754
integer height = 2344
boolean titlebar = true
string title = "Тест"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
ddlb_day ddlb_day
st_1 st_1
sle_spc sle_spc
cb_save cb_save
cb_update cb_update
cb_delete cb_delete
cb_load cb_load
dw_list dw_list
end type
global w_exception w_exception

type variables
n_cst_proxy					io_proxy
end variables

on w_exception.create
this.st_2=create st_2
this.ddlb_day=create ddlb_day
this.st_1=create st_1
this.sle_spc=create sle_spc
this.cb_save=create cb_save
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_load=create cb_load
this.dw_list=create dw_list
this.Control[]={this.st_2,&
this.ddlb_day,&
this.st_1,&
this.sle_spc,&
this.cb_save,&
this.cb_update,&
this.cb_delete,&
this.cb_load,&
this.dw_list}
end on

on w_exception.destroy
destroy(this.st_2)
destroy(this.ddlb_day)
destroy(this.st_1)
destroy(this.sle_spc)
destroy(this.cb_save)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_load)
destroy(this.dw_list)
end on

event open;//С enum не работал, поэтому дни недели сделал через DropDownListBox
int li_ret

io_proxy = CREATE n_cst_proxy

li_ret = io_proxy.of_init('')

//MessageBox( '', String( li_ret ) )

sle_spc.SetFocus()
ddlb_day.SelectItem( 1 ) 

end event

type st_2 from statictext within w_exception
integer x = 837
integer y = 36
integer width = 201
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "День"
boolean focusrectangle = false
end type

type ddlb_day from dropdownlistbox within w_exception
integer x = 1033
integer y = 24
integer width = 1303
integer height = 812
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_exception
integer x = 41
integer y = 32
integer width = 288
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Код СПЦ"
boolean focusrectangle = false
end type

type sle_spc from singlelineedit within w_exception
integer x = 325
integer y = 16
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_save from commandbutton within w_exception
integer x = 2706
integer y = 360
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;Long			ll_id
String			ls_spccode, ls_substdayname
DateTime	ldt_daydate

ll_id					=	0
ls_spccode			=	sle_spc.Text
ls_substdayname	=	ddlb_day.Text
ldt_daydate			=	DateTime( Today() )
	
io_proxy.of_update( ll_id, ls_spccode, ls_substdayname, ldt_daydate )

end event

type cb_update from commandbutton within w_exception
integer x = 2706
integer y = 552
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update"
end type

event clicked;Long			ll_row, ll_id
String			ls_spccode, ls_substdayname
DateTime	ldt_daydate

ll_row = dw_list.GetRow()

If ( ll_row > 0 ) Then
	ll_id					=	dw_list.Object.Id[ll_row]
	ls_spccode			=	dw_list.Object.SpcCode[ll_row]
	ls_substdayname	=	dw_list.Object.SubstituteDayName[ll_row]
	ldt_daydate			=	dw_list.Object.DayDate[ll_row]
	
	io_proxy.of_update( ll_id, ls_spccode, ls_substdayname, ldt_daydate )
End If
end event

type cb_delete from commandbutton within w_exception
integer x = 2706
integer y = 744
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;Long		ll_row, ll_id

ll_row = dw_list.GetRow()

If ( ll_row > 0 ) Then
	ll_id	=	dw_list.Object.Id[ll_row]
	io_proxy.of_delete( ll_id )
End If
end event

type cb_load from commandbutton within w_exception
integer x = 2706
integer y = 168
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;Int				li_ret
String			ls_spccode, ls_csvdata

px_csvdto	lpx_csvdto

ls_spccode			=	sle_spc.Text

li_ret	=	io_proxy.of_load( ls_spccode, lpx_csvdto )

If ( li_ret = 0 ) Then
	//Так понимаю, что эту строку надо буден распарсить и поместить в DW
	ls_csvdata	=	lpx_csvdto.csvdata
Else
	MessageBox( 'Ошибка', 'Не удалось считать данные')
End If
end event

type dw_list from datawindow within w_exception
integer x = 27
integer y = 168
integer width = 2624
integer height = 1952
integer taborder = 10
string title = "none"
string dataobject = "d_subst_day"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

