-module(geometry).
-export([test/0, area/1, perimeter/1]).

test() -> 
    12              = area({rectangle, 3, 4}),
    144             = area({square, 12}),
    3.14            = area({circle, 1}),
    6.0             = area({rtTriangle, 3, 4}),
    14              = perimeter({rectangle, 3, 4}),
    48              = perimeter({square, 12}),
    6.28            = perimeter({circle, 1}),
    12.0            = perimeter({rtTriangle, 3, 4}),
    test_worked.

perimeter({rectangle, Width, Height})  -> (Width + Height) * 2;
perimeter({square, Side})              -> Side * 4;
perimeter({circle, Radius})            -> 3.14 * Radius * 2;
perimeter({rtTriangle, R1, R2})        -> R1 + R2 + math:sqrt(R1 * R1 + R2 * R2).

area({rectangle, Width, Height})  -> Width * Height;
area({square, Side})              -> Side * Side;
area({circle, Radius})            -> 3.14 * Radius * Radius;
area({rtTriangle, R1, R2})        -> R1 * R2 * 0.5.
