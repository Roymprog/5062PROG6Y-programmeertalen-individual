module Puzzles where

-- 1) Returns length of a list using foldr
length :: [a] -> Int
length = foldr (\_ acc -> acc + 1) 0

-- 2) Returns whether True exists in list or not using foldr
or :: [Bool] -> Bool
or = foldr (\a acc -> a || acc) False

-- 3) Returns Boolean specifying whether element is in list or not using foldr
elem :: Eq a => a -> [a] -> Bool
elem e xs = foldr (\x acc -> e == x || acc) False xs

-- 4) Maps function to list using foldr
map :: (a -> b) -> [a] -> [b]
map f = foldr (\x acc -> f x : acc) []

-- 5) List concatenation using foldr
(++) :: [a] -> [a] -> [a]
(++) xs ys = foldr (\x acc -> x : acc ) ys xs

-- 6) Reverses list using foldr
reverse_foldr :: [a] -> [a]
reverse_foldr xs = foldr (\x acc -> acc Puzzles.++ [x]) [] xs

-- 7) Reverses list using foldl
reverse_foldl :: [a] -> [a]
reverse_foldl xs = foldl (\acc x -> x : acc) [] xs

-- -- 8) Defines !! using foldl
(!!) :: [a] -> Int -> a
(!!) [] _ = error "Can't get item from empty list"
(!!) xs i = foldl (\acc x -> if i == fst x then snd x else acc) (head xs) zipped
	where zipped = zip [0..] xs

-- 9) Returns whether list is a palindrome or not
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = ( xs == reverse_foldl xs )

-- 10) Returns infinite list of Fibonacci numbers in terms of scanl
fibinf :: [Integer]
fibinf = scanl (+) 0 (1:fibinf)

type List = (Int) -> Int

-- -- 11) Add element to list
-- addToList :: List -> Int -> List
-- addToList l x = l