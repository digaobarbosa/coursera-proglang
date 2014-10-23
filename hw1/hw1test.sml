(*hw1test.sml*)
(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1 = is_older((1,2,3),(2,3,4)) = true
val test12 = is_older((1,2,3),(1,2,3)) = false
val test13 = is_older((2014,10,1),(2014,10,2)) = true
val test14 = is_older((2014,10,2),(2014,10,2)) = false
val test1_1 = is_older((1957,1,1),(1961,2,28)) = true

val test2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test15 = number_in_month([(2012,2,28),(2013,2,1)],2) = 2
val test16 = number_in_month([(2012,3,28),(2013,3,1)],2) = 0


val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test17 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test18 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2011,5,28),(2011,6,28)],[3,4]) = 2


val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test19 = dates_in_month([(2012,2,28),(2013,12,1),(2014,2,1)],2) = [(2012,2,28),(2014,2,1)]
val test20 = dates_in_month([(2012,2,28),(2013,12,1),(2014,1,1)],2) = [(2012,2,28)]
val test21 = dates_in_month([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]

val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test22 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = [(2012,2,28)]
val test23 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = []

val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7_1 = date_to_string((1986, 3, 23)) = "March 23, 1986"

val test8 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3

val test9_1 = what_month(1) = 1
val test9_2 = what_month(3) = 1
val test9_3 = what_month(32) = 2
val test9 = what_month(70) = 3

val test10 = month_range(31, 34) = [1,2,2,2]
val test10_1 = month_range(31, 38) = [1,2,2,2,2,2,2,2]
val test10_2 = month_range(1, 5) = [1,1,1,1,1]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_1 = oldest([(2012,2,28),(2011,3,31),(1980,4,28)]) = SOME (1980,4,28)
val test11_2 = oldest([(2012,2,28),(2000,3,31),(2011,4,28)]) = SOME (2000,3,31)


val ctest3 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val ctest17 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val ctest18 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2011,5,28),(2011,6,28)],[3,4]) = 2
val ctest18 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2011,5,28),(2011,6,28)],[3,4,3,3,3]) = 2
