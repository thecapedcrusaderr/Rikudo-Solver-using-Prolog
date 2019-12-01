abso(X,Y):- X>=0, Y is X, !.
abso(X,Y):- X<0, Y is (-1*X).



rikudo(Size,List,Result):- find_min(List,(X,Y,Z)), 
				 (
			       	  ZZ is Z+1,check_memberVal((A,B,ZZ),List) -> (TEMP = [(A,B,ZZ)|[]], 					                        				  procedure((A,B,ZZ),Size,List,TEMP,Result2),Result = Result2)  ; 
				  (TEMP = [(X,Y,Z)|[]], procedure((X,Y,Z),Size,List,TEMP,Result2),Result = [(0,0,-10)|Result2])
				 ).
%% check_earlist(61,List,Prefill) :- length(List,LEN),writeln(LEN), ((LEN =< 0) -> (Prefill=[(-4,4,1)]) ; (Prefill = List)).
%% check_earlist(91,List,Prefill) :- length(List,LEN),writeln(LEN), ((LEN =< 0) -> (Prefill=[(-5,5,1)]) ; (Prefill = List)).

procedure(MIN,Size,List,Result,Result2):- length(Result,LEN),(not(LEN >= Size-1) -> (
generate_nbr(MIN,Size,NBR),generate_poss(NBR,Poss),check_member(Poss,List),not(check_member(Poss,Result)),procedure(Poss,Size,List,[Poss|Result],Result2), ! ) ; (Result2= Result)).
procedure(MIN,Size,List,Result,Result2):- length(Result,LEN), (not(LEN >= Size-1)->(
generate_nbr(MIN,Size,NBR),generate_poss(NBR,Poss),not(check_member(Poss,List)),not(check_memberCod(NBR,List)),not(check_memberVal(Poss,List)),
not(check_member(Poss,Result)),not(check_memberCod(Poss,Result)),not(check_memberVal(Poss,Result)),procedure(Poss,Size,List,[Poss|Result],Result2)) ; (Result2=Result)).

generate_nbr((X,Y,V),Size,(Z,T,V)):- Size is 7,  (Z is X-2, T is Y,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0); 
				    	          Z is X-1, T is Y+1,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0);			   					     		  Z is X-1, T is Y-1,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0);
				     		  Z is X+2, T is Y,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y+1,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y-1,abso(Z,A),abso(T,B),B=<1,A+B =< 2,(Z,T)\==(0,0)).


generate_nbr((X,Y,V),Size,(Z,T,V)):- Size is 19, (Z is X-2, T is Y,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0); 
				    	          Z is X-1, T is Y+1,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0);			   					     		  Z is X-1, T is Y-1,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0);
				     		  Z is X+2, T is Y,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y+1,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y-1,abso(Z,A),abso(T,B),B=<2,A+B =< 4,(Z,T)\==(0,0)).


generate_nbr((X,Y,V),Size,(Z,T,V)):- Size is 61, (Z is X-2, T is Y,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0); 
				    	          Z is X-1, T is Y+1,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0);			   					     		  Z is X-1, T is Y-1,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0);
				     		  Z is X+2, T is Y,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y+1,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y-1,abso(Z,A),abso(T,B),B=<4,A+B =< 8,(Z,T)\==(0,0)).

generate_nbr((X,Y,V),Size,(Z,T,V)):- Size is 37, (Z is X-2, T is Y,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0); 
				     		  Z is X-1, T is Y+1,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0);			   					    		  Z is X-1, T is Y-1,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0);
				     		  Z is X+2, T is Y,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y+1,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y-1,abso(Z,A),abso(T,B),B=<3,A+B =< 6,(Z,T)\==(0,0)).

generate_nbr((X,Y,V),Size,(Z,T,V)):- Size is 91, (Z is X-2, T is Y,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0); 
				     		  Z is X-1, T is Y+1,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0);			   					     		  Z is X-1, T is Y-1,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0);
				     		  Z is X+2, T is Y,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y+1,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0);
				     		  Z is X+1, T is Y-1,abso(Z,A),abso(T,B),B=<5,A+B =< 10,(Z,T)\==(0,0)).


%% generate_link((X,Y,Z),[],_).
generate_link((X,Y,Z),[(X,Y,U,V)|Tail],(U,V,Z+1), Tail).
generate_link((X,Y,Z),[(U,V,X,Y)|Tail],(U,V,Z+1), Tail).
generate_link((X,Y,Z),[(U,V,W,T)|Tail],(A,B,Z+1), [(U,V,W,T)|TailNew]):- generate_link((X,Y,Z),Tail,(A,B,_), TailNew). 


generate_poss((X,Y,Z),(X,Y,W)):- W is Z+1.

check_member((X,Y,Z),[(X,Y,Z)|Tail]) :- !.
check_member((X,Y,Z),[(A,B,C)|Tail]) :- check_member((X,Y,Z),Tail).
	
check_memberCod((X,Y,_),[(X,Y,_)|Tail]):- !.
check_memberCod((X,Y,_),[(A,B,_)|Tail]):- check_memberCod((X,Y,_),Tail).

check_memberVal((_,_,Z),[(_,_,Z)|Tail]):- !.
check_memberVal((_,_,Z),[(_,_,A)|Tail]):- check_memberVal((_,_,Z),Tail).

min_support([],Current_min,Current_min).
min_support([(A,B,C)|Tail],(X,Y,Z),MIN):- C<Z,min_support(Tail,(A,B,C),MIN), !.
min_support([(A,B,C)|Tail],(X,Y,Z),MIN):- C>Z,min_support(Tail,(X,Y,Z),MIN).
 
find_min([],(-1,-1,1)):- !. 
find_min([(X,Y,Z)],(X,Y,Z)):- !.
find_min([(X,Y,Z),(A,B,C)|Tail],MIN):- min_support([(A,B,C)|Tail],(X,Y,Z),MIN).

