(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_2 = only_capitals ["A123","Basd","Casd","DEAS","deas"] = ["A123","Basd","Casd","DEAS"]
val test1_3 = only_capitals ["a","b","c"] = []




val test2 = longest_string1 ["A","bc","C"] = "bc"
val test2_1 = longest_string1 ["A","bc","Cabra"] = "Cabra"
val test2_3 = longest_string1 ["A","bc","cb"] = "bc"

val test3 = longest_string2 ["A","bc","C"] = "bc"
val test3_1 = longest_string2 ["A","bc","Cabra"] = "Cabra"
val test3_3 = longest_string2 ["A","bc","cb"] = "cb"

val test4 = longest_string3 ["A","bc","C"] = "bc"
val test4_1 = longest_string3 ["A","bc","Cabra"] = "Cabra"
val test4_3 = longest_string3 ["A","bc","cb"] = "bc"

val test5 = longest_string4 ["A","bc","C"] = "bc"
val test5_1 = longest_string4 ["A","bc","Cabra"] = "Cabra"
val test5_3 = longest_string4 ["A","bc","cb"] = "cb"




(*)
val test4a= longest_string3 ["A","bc","C"] = "bc"

val test4b= longest_string4 ["A","B","C"] = "C"
*)
val test51 = longest_capitalized ["A","bc","C"] = "A";
val test51_1 = longest_capitalized ["A","bc","Cab"] = "Cab";
val test51_2 = longest_capitalized ["a","bc","ab"] = "";
val test51_3 = longest_capitalized ["a","Abc","Aab"] = "Abc";

val test6 = rev_string "abc" = "cba";
val test6_1 = rev_string "" = "";
val test6_2 = rev_string "123" = "321";

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_1 = first_answer (fn x => if x > 10 then SOME x else NONE) [1,2,3,4,5] =0 handle _ => true
val test7_2 = first_answer (fn x => if x > 4 then SOME x else NONE) [1,2,3,4,5] =5


val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_1 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]

val test9a = count_wildcards Wildcard = 1
val test9a_1 = count_wildcards (TupleP [Wildcard,Variable "a",Wildcard,Variable "b"]) = 2


val test9b = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_1 = count_wild_and_variable_lengths (Variable("abc")) = 3
val test9a_2 = count_wild_and_variable_lengths (TupleP [Wildcard,Variable "a",Wildcard,Variable "b2"]) = 5

val test9c = count_some_var ("x", Variable("x")) = 1;

val test9c1 = count_some_var ("x", (TupleP [Wildcard,Variable "a",Wildcard,Variable "b2"])) = 0;
val test9c2 = count_some_var ("a", (TupleP [Wildcard,Variable "a",Wildcard,Variable "b2"])) = 1;

val test10 = check_pat (Variable("x")) = true
val test10_1 = check_pat (TupleP [Variable "y", Variable("x")]) = true
val test10_2 = check_pat (TupleP [Variable "y", Variable("y")]) = false

val test11 = match (Const(1), UnitP) = NONE
val test11_1 = match (Const 1 , Variable "a") = SOME [("a",Const 1)]
val test11_2 = match (Constructor ("name",Const 12) , ConstructorP ("name",Variable "x")) = SOME [("x",Const 12)]
val test11_3 = match (Constructor ("name",Tuple [Const 1, Tuple [Const 1,Const 2]]) , ConstructorP ("name",TupleP [Variable "x",Variable "y"])) =
	SOME [("y",Tuple [Const 1,Const 2]),("x",Const 1)]
val test11_4 = match (Unit , UnitP) = SOME []
val test11_5 = match (Const 1 , UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []
val test12_2 = first_match (Const 12) [Variable "a"] = SOME [("a", Const 12)]
val test12_1 = first_match (Const 12) [UnitP,Variable "a"] = SOME [("a", Const 12)]


