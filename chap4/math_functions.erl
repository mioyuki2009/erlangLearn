-module(math_functions).
-export([test/0, even/1, odd/1, filter/2, split1/1, split2/1]).

test() -> 
    io:format("~w~n",[math_functions:even(11)]),
    io:format("~w~n",[math_functions:even(16)]),
    io:format("~w~n",[math_functions:odd(11)]),
    io:format("~w~n",[math_functions:odd(16)]),
    Fun = fun(X) -> even(X) end,
    io:format("~w~n",[math_functions:filter(Fun,lists:seq(1,10))]),
    io:format("~w~n",[math_functions:split1(lists:seq(1,10))]),
    io:format("~w~n",[math_functions:split2(lists:seq(1,10))]).

even(I) when (I rem 2) =:= 0 -> true;
even(I) -> false.

odd(I) when (I rem 2) =:= 0 -> false;
odd(I) -> true.

filter(F, L) ->
    [X || X <- L, F(X) =:= true]. 

split1(L) -> 
    odd_and_even(L, [], []).

odd_and_even([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odd_and_even(T, [H|Odds], Evens);
        0 -> odd_and_even(T, Odds ,[H|Evens])
    end;
odd_and_even([], Odds, Evens)->
    {lists:reverse(Odds),lists:reverse(Evens)}.

split2(L) ->
    F1 = fun(X) -> even(X) end,
    F2 = fun(X) -> odd(X) end,
    Even = filter(F1,L),
    Odd = filter(F2,L),
    {Odd,Even}.