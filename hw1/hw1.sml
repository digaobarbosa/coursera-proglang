fun is_older(x:int*int*int,y:int*int*int) = (*Compares dates*)
	(#1 x < #1 y) orelse ( #1 x = #1 y andalso #2 x < #2 y) orelse (#1 x = #1 y andalso #2 x = #2 y andalso #3 x < #3 y)
	

fun number_in_month(x:(int*int*int) list,el:int) = 
	if null x then
		0
	else
		if #2 (hd x) = el then
			1+ number_in_month(tl x,el)
		else
			number_in_month(tl x,el)

fun number_in_months(xs:(int*int*int) list,els:int list) = 
	if null els orelse null xs then
		0
	else
		number_in_month(xs,hd els) + number_in_months(xs,tl els)

fun dates_in_month(dates:(int*int*int) list,m:int) = 
	if null dates then 
		[]
	else
		if #2 (hd dates) = m then
			[(hd dates)]@dates_in_month(tl dates,m)
		else
			dates_in_month(tl dates,m)

fun dates_in_months(dates:(int*int*int) list,ms:int list) = 
	if null ms orelse null dates then
		[]
	else
		dates_in_month(dates, hd ms)@dates_in_months(dates, tl ms)

fun get_nth(ll:string list,x:int) = 
	if x = 1 then
		hd ll
	else
		get_nth(tl ll,x-1)
fun get_nthi(ll:int list,x:int) = 
	if x = 1 then
		hd ll
	else
		get_nthi(tl ll,x-1)

fun date_to_string(date:(int*int*int)) = 
	let val MONTHS = ["January","February","March","April","May","June","July","August","September","October","November","December"]
		val month = get_nth( MONTHS, (#2 date))
		val day = Int.toString (#3 date)
		val year = Int.toString (#1 date)
	in
		month^" "^day^", "^year
	end

fun number_before_reaching_sum(sum:int,ll:int list) = 
	let 
		val h = hd ll;
	in
		if h < sum then
			1 + number_before_reaching_sum(sum-h,tl ll)
		else
			0
	end	

fun what_month(day:int) =
	let 
		val MONTHS = [31,28,31,30,31,30,31,31,30,31,30,31]
	in
		number_before_reaching_sum (day, MONTHS)+1
	end

fun month_range(day1:int,day2:int) =
	if day1> day2 then
		[]
	else
		what_month(day1)::month_range(day1+1,day2)


fun oldest (dates:(int*int*int) list) = 
	if null dates then
		NONE
	else
		let 
			val h = hd dates;
			val old = oldest(tl dates)
		in
			if old=NONE orelse is_older(h,valOf old) then
				SOME h
			else
				old
		end

fun count(i:int,l:int list) = 
						if null l then 0
						else
							let val h = hd l
							in
								if h = i then
									1+count(i,tl l)
								else
									count(i,tl l)
							end

fun unique(ee:int list) = 
			if null ee then
				[]
			else
				let val e = hd ee
				in
					if count(e,tl ee) >0 then
						unique(tl ee)
					else
						e::unique(tl ee)
				end


fun number_in_months_challenge(xs:(int*int*int) list,els:int list) = 
	number_in_months(xs,unique(els))

fun dates_in_months_challenge(xs:(int*int*int) list,els:int list) = 
	dates_in_months(xs,unique(els))

fun leap_year(year:int) = 
		if not ((year mod 400 )=0) andalso ((year mod 100)=0) then
			false
		else if year mod 4 = 0 orelse year mod 400 = 0 then true
		else false

fun reasonable_date(date:(int*int*int)) = 
	let 
		val MONTHS = [31,28,31,30,31,30,31,31,30,31,30,31];
	in

		if #1 date >0 andalso #2 date <13 andalso #2 date >0 andalso #3 date >0 then
		(* February*)
			if #2 date = 2 then
				if leap_year(#1 date) then
					#3 date < 30 andalso #3 date >0
				else
					#3 date < 29 andalso #3 date >0
			else
				let val m_days = get_nthi(MONTHS, #2 date)
				in
					#3 date < (m_days+1)
				end

		else
			false
	end
	

