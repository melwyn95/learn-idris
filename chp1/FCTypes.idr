StringOrInt : Bool -> Type
StringOrInt x = case x of
                  True => Int
                  False => String

getStringOrInt : (x: Bool) -> StringOrInt x
getStringOrInt x = case x of
                      True => 94
                      False => "Ninety Four"

valToString : (x: Bool) -> StringOrInt x -> String
valToString x val = case x of
                      True => cast val
                      False => val

valToStringWithHoles : (x: Bool) -> StringOrInt x -> String
valToStringWithHoles x val = case x of
                                True => ?xtrueType
                                False => ?xfalseType
