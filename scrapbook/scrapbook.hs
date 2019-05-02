import Data.List
import System.IO

n = a `div` (length xs)
    where
        a = 10
        xs = [1,2,3,4,5]

last_ xs = xs !! (length xs - 1)

safetail [] = []
safetail (x:xs) = xs

safetail_ xs = if (null xs) then [] else (tail xs)

safetail__ xs | null xs = []
              | otherwise = tail xs

or_ False False = False
or_ _ _ = True

factors n = [x | x <- [1..n-1], n `mod` x == 0]
prime n = factors n == [1, n]
primes n = [x | x <- [1..n], prime x]

pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

sorted xs = and [x <= y | (x,y) <- pairs xs]

pyths :: Int -> [(Int, Int, Int)]
pyths z = [(x, y, z) | x <- [1..z], y <- [1..z], x^2 + y^2 == z^2]

perfects :: Int -> [Int]
perfects x = [y | y <- [1..x] , y == sum (factors y)]

scalarProduct :: [Int] -> [Int] -> [Int]
scalarProduct xs ys = [x * y | (x, y) <- zip xs ys]

length_ :: [a] -> Int
length_ [] = 0
length_ (x:xs) = 1 + length_ xs

reverse_ :: [a] -> [a]
reverse_ [] = []
reverse_ (x:xs) = reverse_ xs ++ [x]

zip_ :: [a] -> [b] -> [(a,b)]
zip_ [] _ = []
zip_ _ [] = []
zip_ (x:xs) (y:ys) = (x, y) : zip_ xs ys

append_ :: [a] -> [a] -> [a]
append_ [] ys = ys
append_ (x:xs) ys = x : (append_ xs ys)

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
        where
                smaller = [a | a <- xs, a <= x]
                larger = [b | b <- xs, b > x]
        
and_ :: [Bool] -> Bool
and_ [] = True
and_ (x:xs) = x && and_ xs

concat_ :: [[a]] -> [a]
concat_ [] = []
concat_ (xs:xss) = xs ++ concat_ xss

replicate_ :: Int -> a -> [a]
replicate_ 0 a = []
replicate_ n a = a : replicate_ (n-1) a

select :: [a] -> Int -> a
select (x:xs) 0 = x
select (x:xs) n = select xs (n-1)

elem_ :: Eq a => a -> [a] -> Bool
elem_ y (x:xs) | y == x = True
               | xs == [] = False
               | otherwise = elem_ y xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x < y = x : (merge xs (y:ys))
                    | otherwise = y : (merge (x:xs) ys)

first_half xs = first_half_helper (length xs) (length xs) xs
        where
                first_half_helper c n (y:ys) | c < 2*n = y : first_half_helper c (n-1) ys
                                             | otherwise = []

second_half xs = drop (length (first_half xs)) xs

msort :: Ord a => [a] -> [a]
msort xs | length xs == 1 = xs
         | otherwise = merge (msort (first_half xs)) (msort (second_half xs))

filter_ f xs = [x | x <- xs, f x]

foldr_ :: (a -> b -> b) -> b -> [a] -> b
foldr_ f v [] = v
foldr_ f v (x:xs) = f x (foldr_ f v xs)


length2 :: [a] -> Int
length2 = foldr (\_ n -> 1 + n) 0

reverse2 :: [a] -> [a]
reverse2 = foldr (\x xs -> xs ++ [x]) []

map_filter f p xs = map f (filter p xs)
map_filter' f p xs = [f x | x <- xs, p x]

map_ f = foldr (\x xs -> (f x) : xs) []

filter2 p = foldr (\x xs -> if p x then x:xs else xs) []

type Pair a = (a, a)
mult :: Pair Int -> Int
mult (m, n) = m*n

copy :: a -> Pair a
copy x = (x, x)

safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)

-- data Expr = Val Int
--           | Add Expr Expr
--           | Mul Expr Expr
-- 
-- size :: Expr -> Int
-- size (Val n) = 1
-- size (Add x y) =  size x + size y
-- size (Mul x y) =  size x + size y
-- 
-- eval :: Expr -> Int
-- eval (Val n) = n
-- eval (Add x y) = eval x + eval y
-- eval (Mul x y) = eval x * eval y

data Tree a = Leaf a
            | Node (Tree a) a (Tree a)

-- Example:
t :: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))
q = Node (Leaf 1) 5 (Node (Leaf 6) 8 (Leaf 9))

-- Function that decides if a given value occurs in a binary tree:
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y)     = x == y
occurs x (Node l y r) = x == y
                        || occurs x l
                        || occurs x r

flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

treeSize (Leaf x) = 1
treeSize (Node l x r) = 1 + treeSize l + treeSize r

complete :: Tree a -> Bool
complete (Leaf x) = True
complete (Node l x r) = treeSize l == treeSize r && complete l && complete r

data Nat =  Zero | Succ Nat

add_ Zero n = n
add_ (Succ m) n = Succ (add_ m n)

mul_ Zero _ = Zero
mul_ (Succ m) n = add_ (mul_ m n) n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

init_ (x:[]) = x
init_ (x:xs) = init_ xs

data Op = Add | Sub | Mul | Div

apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

valid :: Op -> Int -> Int -> Bool
valid Add x y = x <= y
valid Sub x y = x > y
valid Mul x y = x <= y && x /= 1 && y /= 1
valid Div x y = x `mod` y == 0 && y /= 1

data Expr = Val Int | App Op Expr Expr

eval :: Expr -> [Int]
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l, y <- eval r, valid o x y]

choices :: [a] -> [[a]]
choices xs = foldr (\ys ls -> permutations ys ++ ls) [] yss
    where yss = subsequences xs

values :: Expr -> [Int]
values (Val n) = [n]
values (App _ l r) = values l ++ values r

solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choices ns)
                  && eval e == [n]

split xs = init $ tail $ zip (inits xs) (tails xs)

exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls, rs) <- split ns
              , l        <- exprs ls
              , r        <- exprs rs
              , e        <- combine l r]

combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- [Add, Sub, Mul, Div]]

solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns
                    , e   <- exprs ns'
                    , eval e == [n]]

type Result = (Expr, Int)
results :: [Int] -> [Result]

results [] = []
results [n] = [(Val n, n) | n > 0]
results ns = [res | (ls, rs) <- split ns
                  , lx       <- results ls
                  , ry       <- results rs
                  , res      <- combine' lx ry]

combine' :: Result -> Result -> [Result]
combine' (l, x) (r, y) = [(App o l r, apply o x y) 
                       | o <- [Add, Sub, Mul, Div]
                       , valid o x y]

solutions' :: [Int] -> Int -> [Expr]
solutions' ns n = [e | ns'    <- choices ns
                     , (e, m) <- results ns'
                     , m == n]

getLine' :: IO String
getLine' = do
                x <- getChar
                if (x == '\n') then
                        return []
                else
                        do
                                xs <- getLine'
                                return (x:xs)

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do
                        putChar x
                        putStr xs

putStrLn' :: String -> IO ()
putStrLn' xs = do
                putStr' xs
                putChar '\n'

strlen' :: IO ()
strlen' = do
                putStr "Enter a String: "
                xs <- getLine
                putStr "Number of chars: "
                putStrLn $ show $ length xs

hangman :: IO ()
hangman = do
                do
                        putStrLn "Think of a word"
                        word <- sgetLine
                        putStrLn "Try to guess it: "
                        play word

sgetLine :: IO String
sgetLine = do
                x <- getChar
                if x == '\n' then
                        do
                                x <- getCh
                                return []
                else
                        do
                                putChar '-'
                                xs <- sgetLine
                                return (x:xs)

getCh :: IO Char
getCh = do 
                hSetEcho stdin False
                x <- getChar
                hSetEcho stdin True
                return x

play :: String -> IO ()
play word = do
                putStr "? "
                guess <-getLine
                if guess == word then
                        putStrLn "You got it!"
                else
                        do
                                putStrLn (match word guess)
                                play word

match :: String -> String -> String
match xs ys = [if elem x ys then x else '-' | x <- xs]
        
nim :: IO ()
nim = nim_helper [5, 4, 3, 2, 1]

nim_helper :: [Int] -> IO ()
nim_helper board = do
                        if win board then
                                do
                                        putStrLn "Winner!"
                        else
                                do
                                        printBoard board
                                        putStrLn "Which row to remove stars from?"
                                        row <- getInt
                                        putStrLn "How many stars to remove?"
                                        stars <- getInt
                                        let current_board_row = board !! (row - 1)
                                        if stars > current_board_row then
                                                do
                                                        putStrLn "Invalid move! Trying to remove too many stars"
                                                        nim_helper board
                                        else
                                                do
                                                        nim_helper (replaceAtIndex (row - 1) (current_board_row - stars) board)

win :: [Int] -> Bool
win xs = and [x == 0 | x <- xs]

printBoard :: [Int] -> IO ()
printBoard  (x:xs) = do
                        printRow x
                        putStrLn ""
                        if xs == [] then
                                return ()
                        else
                                printBoard (xs)

printRow :: Int -> IO ()
printRow x = do
                if (x == 0) then
                        return ()
                else
                        do
                                putStr "* "
                                printRow (x-1)

getInt :: IO Int          
getInt = do  
        s <- getLine
        return (read s)

replaceAtIndex n item ls = a ++ (item:b) where (a, (_:b)) = splitAt n ls

primes' :: [Int]
primes' = seive [2..]
seive :: [Int] -> [Int]
seive (p:xs) = p : seive [x | x <- xs, x `mod` p /= 0]

fibs :: [Integer]
fibs = [fib n | n <- [0..]]

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

data Answer = Yes | No | Unknown
answers :: [Answer]
answers = reverse [Unknown, No, Yes]

flip' Yes = No
flip' No = Yes
flip' Unknown = Unknown

show' Yes = putStrLn "Yes"
show' No = putStrLn "No"
show' Unknown = putStrLn "Unknown"

show_answer_list (x:xs) = do
                                show' x
                                if null xs then
                                        return ()
                                else
                                        show_answer_list xs