Namespace std.chronos

#Import "<std>"

Using std.time

Class Time Extension
	
	Private
	
	Const days:=New String[]( "Mon","Tue","Wed","Thu","Fri","Sat","Sun" )
	Const daysFull:=New String[]( "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday" )
	
	Const months:=New String[]( "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" )
	Const monthsFull:=New String[]( "January","February","March","April","May","June","July","August","September","October","November","December" )
	
	Public
	
	#rem monkeydoc Hours in 12 hour format (0-12)
	#end
	Property Hours12:Int()
		Return (Hours = 0 Or Hours = 12) ? 12 Else (Hours Mod 12)
	End
	
	#rem monkeydoc Whether it's AM or PM as string
	#end
	Method Suffix:String()
		Local ss:String
		If(Hours12 <= 11) Then ss="AM"
		If(Hours12 >= 12) Then ss="PM"
		Return ss	
	End

	#rem monkeydoc Returns shortened Week day as a string (1-7) (Sun-Mon)
	#end
	Method WeekDayAbbr:String(weekday:Int)
		Return days[ (weekday - 1) Mod 7 ]
	End
	
	#rem monkeydoc Returns full Week day as a string (1-7) (Sunday-Monday)
	#end
	Method WeekDayName:String(weekday:Int)
		Return daysFull[ (weekday - 1) Mod 7 ]
	End

	#rem monkeydoc Get current Month shortened as a string (1-12) (Jan-Dec)
	#end
	Method MonthAbbr:String(month:Int)
		Return months[ (month - 1) Mod 12 ]
	End
	
	#rem monkeydoc Returns full Month name as string (1-12) (January-December)
	#end
	Method MonthName:String(month:Int)
		Return monthsFull[ (month - 1) Mod 12 ]
	End
	
End Class

#rem monkeydoc Returns the current Time in '24 Hour' Format. (I.E 21:37:42)
#end
Function CurrentTime24:String()
	Return Time.Now().ToString().Slice(16)
End

#rem monkeydoc Returns the current Time in '12 Hour' Format. (I.E AM/PM)
#end
Function CurrentTime12:String()
	Local T:Time = Time.Now()
	Local MSTR:String = Cast<String>(T.Minutes)
	Local SSTR:String = Cast<String>(T.Seconds)
	Local M_STR:String = (Cast<String>(T.Minutes).Length > 1) ? MSTR Else "0" + MSTR
	Local S_STR:String = (Cast<String>(T.Seconds).Length > 1) ? SSTR Else "0" + SSTR
	Return ( T.Hours12+":"+M_STR+":"+S_STR+" "+T.Suffix() )
End

#rem monkeydoc Returns the current Date shortened.
#end
Function GetDateAbbr:String()
	Return Time.Now().ToString().Slice(0, 15)
End

#rem monkeydoc Returns the current Date.
#end
Function GetDateFull:String()
	Local T:Time = Time.Now()
	Return T.WeekDayName(T.WeekDay) + " " + T.Day + " " + T.MonthName(T.Month) + " " + T.Year
End