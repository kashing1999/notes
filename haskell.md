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

foldr (+) 0 [1,2,3,4]
-- folds list and performs operation from right, ex: 1+(2+(3+(4+0)))
-- returns 10

not . even [1,2,3,4]
-- composite function
-- returns all odd numbers

all even [1,2,3,4,5]
-- mass AND
-- returns False

any even [1,2,3,4,5]
-- mass OR
-- returns true

takeWhile (/= ' ') "abc def"
-- returns "abc"

dropWhile (== ' ') "   abc"
-- returns "abc"

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
- A function is called higher-order if it takes a function as an argument or returns a function as a result

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

## Data Types
### `Type`
``` Haskell
type Pair a = (a, a)
-- declaring new type
mult :: Pair Int -> Int
-- types can have parameters
mult (m,n) = m * n

type Pos = (Int, Int)
type Trans = Post -> Pos
-- nested type declaration
```
### `Data`
``` Haskell
data Bool =  False | True
-- declaring new data type with values
-- False and True are Bool's constructors
-- Type and constructor names must always begin with an upper-case letter

data Answer = Yes | No | Unknown

answers :: [Answer]
answers = [Yes, No, Unknown]

flip :: Answer -> Answer
flip Yes     =  No
flip No      =  Yes
flip Unknown =  Unknown
```
- constructors in a data declaration can have parameters
``` Haskell
data Shape = Circle Float
           | Rect Float Float

-- Circle and Rect can be viewed as functions that construct values of type Shape
Circle :: Float -> Shape
square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y
```
- data declarations themselves can also have parameters
``` Haskell
data Maybe a = Nothing | Just a

safedive :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv m n = Just (m `div` n)

safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)
```

## Recursive Types
``` Haskell
data Nat =  Zero | Succ Nat
-- Nat is a new type with constructors
-- Zero :: Nat and Succ :: Nat -> Nat
-- this is to mean Nat is either Zero, or of the form Succ n where n :: Nat

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

-- adding without conversion
add Zero n = n
add (Succ m) n = Succ (add m n)
```
- Note: `type` declarations cannot be recursive but `data` declarations can
- Another example:
``` Haskell
data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr

size :: Expr -> Int
size (Val n) = 1
size (Add x y) =  size x + size y
size (Mul x y) =  size x + size y

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y
```

## Binary Trees
``` Haskell
data Tree a = Leaf a
            | Node (Tree a) a (Tree a)

-- Example:
t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

-- Function that decides if a given value occurs in a binary tree:
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y)     = x == y
occurs x (Node l y r) = x == y
                      || occurs x l
                      || occurs x r

-- function that returns the list of all the values contained in a tree:
flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

-- better definition of occurs for Search Trees
occurs_ (Leaf y) = x == y
occurs x (Node l y r) | x == y = True
                      | x < y  = occurs x l
                      | x > y  = occurs x r
```