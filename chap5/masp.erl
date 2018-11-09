-module(masp).
-export([test/0, map_search_pred/2]).

% 关于（1）中的json和map的转换，有点不科学，可以查看http://benfalk.com/blog/2014/10/07/erlangs-maps-to-json-not-found/

test() -> 
    F = #{a=>1,b=>2,c=>3},
    Pred = fun(X1,X2) -> X1=:=b,X2=:=2 end,
    io:format("~w~n",[map_search_pred(F,Pred)]).

map_search_pred(Map, Pred) -> 
    find_list(maps:to_list(Map),Pred).

find_list([H|T],Pred) ->
    case Pred(element(1,H),element(2,H)) of
        true -> H;
        false -> find_list(T,Pred)
    end;
find_list([],Pred) -> [].