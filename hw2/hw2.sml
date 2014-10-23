(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color (Clubs,_) = Black
	| card_color (Spades,_) = Black
	| card_color (_,_) = Red

fun card_value (_,Num i) = i
	| card_value (_,Ace) = 11
	| card_value (_,_) = 10

fun remove_card (cs, c, e) = 
	case cs of
		[] => raise e
		| hd::tl => if hd=c then tl else hd::remove_card(tl,c,e)

fun all_same_color cs =
	let
		fun aux (ccolor,cs) = 
			case cs of
				[] => true
				| hd::tl => if card_color(hd) = ccolor then aux(ccolor,tl) else false
					
	in
		case cs of
			[] => true
			| hd::tl => aux(card_color(hd),tl)
	end

fun sum_cards(cs) = 
	let
		fun aux (cs,acc) = 
			case cs of
				[] => acc
				| hd::tl => aux(tl,acc+card_value(hd))
	in
		aux(cs,0)
	end

fun score (clist,goal) = 
	let
		val sum = sum_cards(clist)
		val same_color = all_same_color(clist)
		val prelim = if sum > goal then (sum-goal) * 3 else (goal-sum)
	in
		if same_color then prelim div 2 else prelim
	end
	
(*Missing code to check if score>goal*)
fun officiate(deck,moves,goal) = 
	let
		fun move(deck,moves,goal,hand) = 
			if sum_cards(hand)> goal 
			then score(hand,goal) 
			else case (moves,deck) of
				([],_) => score(hand,goal)
				| (_, []) => score(hand,goal)
				| (Draw::mtl,dh::dtl) => move(dtl,mtl,goal,dh::hand)
				| ((Discard c)::mtl,d_) => move(deck,mtl,goal,remove_card(hand,c,IllegalMove))
			

	in
		move(deck,moves,goal,[])
	end

(*)
fun score_challenge(clist,goal) = 
*)

		


(* put your solutions for problem 2 here *)

fun all_except_option (str,strList) =
	case (str,strList) of 
		(s,[]) => NONE
		| (s,h::xs) => if same_string(s,h) then SOME xs 
		else
			case all_except_option(s,xs) of
				NONE => NONE
				| SOME xx => SOME (h::xx)


fun get_substitutions1 (substitutions,str) = 
	case (substitutions,str) of
		([],_) => []
		| (x::xs,_) => 
		case all_except_option(str,x) of
			NONE => get_substitutions1(xs,str)
			| SOME strList => strList @ get_substitutions1(xs,str)

fun get_substitutions2 (substitutions,str) = 
	let
		fun aux(substitutions,str,acc) = 
			case (substitutions,str) of
			([],_) => acc
			| (x::xs,_) =>
			case all_except_option(str,x) of
				NONE => aux(xs,str,acc)
				| SOME ss => aux(xs,str,acc@ss)

	in
		aux(substitutions,str,[])
	end


fun similar_names ( substitutions,{first=f,middle=m,last=la}) = 
	let val options = get_substitutions2(substitutions, f);
		fun aux(opts,{first=f,middle=m,last=l}) = 
			case opts of
				[] => []
				| hd::tl => {first=hd,middle=m,last=l}::aux(tl,{first=f,middle=m,last=l})

	in
		{first=f,middle=m,last=la}::aux(options,{first=f,middle=m,last=la})
	end
	