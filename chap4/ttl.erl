-module(ttl).
-export([test/0, tuple_to_list/1, my_time_func/1, my_date_string/0]).

test() -> 
    io:format("~w~n",[ttl:tuple_to_list({a,b,c})]),
    io:format("~w~n",[my_time_func(my_date_string())]),
    io:format("~s",[ttl:my_date_string()]).

tuple_to_list(T) ->
    [element(X, T) || X <- lists:seq(1, tuple_size(T))].

my_time_func(F) -> 
    X1 = erlang:now(),
    fun(X) -> F(X) end,
    X2 = erlang:now(),
    [element(N,X2)-element(N,X1) || N <- lists:seq(1,3)].

my_date_string()->
    X = erlang:date(),
    X1 = integer_to_list(element(1,X)),
    X2 = integer_to_list(element(2,X)),
    X3 = integer_to_list(element(3,X)),
    T = erlang:time(),
    T1 = integer_to_list(element(1,T)),
    T2 = integer_to_list(element(2,T)),
    T3 = integer_to_list(element(3,T)),
    "year:" ++ X1 ++ " month:" ++ X2 ++" day:"++X3++
    " hour:"++ T1 ++ " minutes:"++T2 ++ " seconds:" ++ T3.