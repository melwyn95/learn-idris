{-

-- Basic type & functions
> idris
     ____    __     _
    /  _/___/ /____(_)____
    / // __  / ___/ / ___/     Version 1.3.3-git:PRE
  _/ // /_/ / /  / (__  )      https://www.idris-lang.org/
 /___/\__,_/_/  /_/____/       Type :? for help

Idris is free software with ABSOLUTELY NO WARRANTY.
For details type :warranty.
Idris> 6 + 3 * 12
42 : Integer
Idris> 6.0 + 3 * 12
42.0 : Double
Idris> it
42.0 : Double
Idris> it * 2
84.0 : Double
Idris> :let x = 100
Idris> x
100 : Integer
Idris> :let y = 200.0
Idris> y
200.0 : Double
Idris> 6.0 + 3 * 12
42.0 : Double
Idris> 6 + 3 * 12
42 : Integer
Idris> Int(6 + 3 * 12)
builtin:Type mismatch between
        Type (Type of Int)
and
        _ -> _ (Is Int applied to too many arguments?)
Idris> the Int(6 + 3 * 12)
42 : Int
Idris> the Double (6 + 3 * 12)
42.0 : Double
Idris> the
the : (a : Type) -> a -> a

Idris> :let integerval = 6 * 6
Idris> :let doubleval = 1.0
Idris> cast integerval + doubleval
37.0 : Double
Idris> the Integer (cast 9.9)
9 : Integer
Idris> the Double (cast 4 + 4)
8.0 : Double
Idris> the Double (cast (4 + 4))
8.0 : Double

Idris> 'a'
'a' : Char
Idris> "Hello world!"
"Hello world!" : String
Idris> :t '\n'
'\n' : Char
Idris> :t "Hello world!\n"
"Hello world!\n" : String
Idris> "Hello world!\n"
"Hello world!\n" : String
Idris> "Hello world!\n\naaa"
"Hello world!\n\naaa" : String
Idris> length "Hello!"
6 : Nat
Idris> reverse "drawer"
"reward" : String
Idris> substr 6 5 "Hello world!"
"world" : String
Idris> "Hello" ++ " " ++ "World"
"Hello World" : String

Idris> length ("Hello" ++ " " ++ "World")
11 : Nat
Idris> True && False
False : Bool
Idris> True || False
True : Bool
Idris> 3 > 2
True : Bool
Idris> 100 == 99
False : Bool
Idris> 100 /= 99
True : Bool
Idris> :let word = "programming"
Idris> if length word > 10 then "What a long word!" else "Short word"
"What a long word!" : String
Idris>

-}
