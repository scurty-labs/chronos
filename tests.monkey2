Namespace APPLICATION_CHRONOS

#Import "<std>"
#Import "chronos"

Using std..

Function Main()
	
	For Local i:Int = 1 Until 9
		Local t := New Time()
		Print t.WeekDayAbbr(i)
	End
	
	For Local i:Int = 1 Until 14
		Local t := New Time()
		Print t.MonthName(i)
	End
	
End