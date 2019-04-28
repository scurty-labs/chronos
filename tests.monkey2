Namespace APPLICATION_CHRONOS

#Import "<std>"
#Import "chronos"

Using std..

Function Main()
	
	Local t := New Time()
	Print t.WeekDayAbbr(0)
	
	For Local i:Int = 0 Until 9
		Local t := New Time()
		Print t.WeekDayAbbr(i)
	End
	
	For Local i:Int = 0 Until 14
		Local t := New Time()
		Print t.MonthName(i)
	End
	
	
End