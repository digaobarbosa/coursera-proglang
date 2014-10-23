(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

val only_capitals =	List.filter (fn x => Char.isUpper(String.sub(x,0)))

val longest_string1 = foldl (fn (x,acc) => if String.size x > String.size acc then x else acc ) "" 

val longest_string2 = foldl (fn (x,acc) => if String.size x >= String.size acc then x else acc ) "" 

fun longest_string_helper f slist = 
	foldl (fn (x, acc) => if f(String.size x, String.size acc) then x else acc) "" slist

val longest_string3 = longest_string_helper (fn (x,y)=> x>y)
val longest_string4 = longest_string_helper (fn (x,y)=> x>=y)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o List.rev o String.explode;

fun first_answer f alist =
	case alist of
		[] => raise NoAnswer
		| h::t => case f(h) of 
			NONE => first_answer f t 
			| SOME v => v

fun all_answers f alist =
	let 
		fun aux (alist,acc) =
			case alist of
				[] => SOME acc
				| h::tl => case f(h) of
					NONE => NONE
					| SOME v => aux(tl, acc@v)
	in
		aux(alist,[])
	end
	

val count_wildcards = g (fn () => 1) (fn x => 0)

val count_wild_and_variable_lengths = g (fn () => 1) (fn x => String.size x)

fun count_some_var (name, p) =
	g (fn () => 0) (fn x => if x=name then 1 else 0) p

fun check_pat p = 
	let
		fun aux p = 
			case p of
			    Wildcard          => []
			  | Variable x        => [x]
			  | TupleP ps         => List.foldl (fn (p,acc) => (aux p) @ acc) [] ps
			  | ConstructorP(_,p) => aux p
			  | _                 => []
		
		fun is_unique [] = true
			| is_unique (x::xs) = (not (List.exists (fn a => (a=x)) xs)) andalso is_unique xs
	in
		is_unique (aux p)
	end


fun match (svalue:valu,spat:pattern) = 
	let
		fun tuple_p ((pi,vi),acc) = 
			case (match(vi,pi),acc) of
				(SOME i,SOME j) => SOME (i@j)
				| _ => NONE
	in
		case (spat,svalue) of
		(Wildcard,_) => SOME []
		| (Variable v,c) => SOME [(v,c)]
		| (UnitP,Unit) => SOME []
		| (ConstP i, Const j) => if i=j then SOME [] else NONE
		| (TupleP p,Tuple va) => 
		if (List.length p)=(List.length va) then
			List.foldl tuple_p (SOME []) (ListPair.zip(p,va))
		else
			NONE
		| (ConstructorP (pn,pv),Constructor (vn,vv)) => if pn=vn then match(vv,pv) else NONE
		| _ => NONE
	end
	
		
fun first_match value pat_lst = 
	SOME (first_answer (fn p => match(value,p)) pat_lst) handle NoAnswer => NONE





