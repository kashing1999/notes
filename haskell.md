# Haskell Quicknotes

## Useful prelude functions
``` Haskell
head [1,2,3,4,5]
-- returns 1

tail [1,2,3,4,5]
-- returns [2,3,4,5]

[1,2,3,4,5] !! 2
-- returns 3 (haskell's indexing starts at 0)

take 3 [1,2,3,4,5]
-- returns [1,2,3]

drop 3 [1,2,3,4,5]
-- returns [4,5]

length [1,2,3,4,5]
-- returns 5

sum [1,2,3,4,5]
-- returns 15

product [1,2,3,4,5]
-- returns 120

[1,2,3] ++ [4,5]
-- returns [1,2,3,4,5]

reverse [1,2,3,4,5]
-- returns [5,4,3,2,1]

null [1,2,3,4,5]
-- returns false
null []
-- returns true

zip [1,2,3,4] ['a','b','c']
-- returns [(1,'a'), (2,'b'), (3,'c')]
```

## Functions
|Maths|Haskell|
|:---|:---|
|`f(x)`|`f x`|
|`f(x,y)`|`f x y`|
|`f(g(x))`|`f (g x)`|
|`f(x,g(y))`|`f x (g y)`|
|`f(x)g(y)`|`f x * g y`|
- Functions are assumed to have a higher priority than all other operators
- ``x `f` y`` is just syntatic sugar for `f x y`
- Function and argument names must begin with a lower-case letter
- By convention, list arguments usually have an s suffix on their names
- Types are mostly in capital
- `Int` is fixed-precison while `Integer` is arbitrary-precision
- `True` and `False` are capital, and are not treated like numbers
- Function is polymorphic ("of many forms") if its type contains one or more type variables: `length :: [a] -> Int`
- Function is overloaded if its type contains one or more class constraints `(+) :: Num a => a -> a -> a`

# Notes
- The underscore symbol `_` is a `wildcard` pattern
- Patterns are matched in order
- Patterns may not repeat variables (e.g.)
``` Haskell
b && b = b  -- invalid!
_ && _ = False
```

## Useful GHCi commands
|Command|Meaning|
|:---|:---|
|:load name|load script name|
|:reload|reload current script|
|:set editor name|set editor to name|
|:edit name|edit script name|
|:type expr|show type of expr|
|:?|show all commands|
|:quit|quit GHCi|