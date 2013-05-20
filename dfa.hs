-- This DFA was originally from Ravi's Homework set # 2 Problem 2
-- The problem was to create a DFA (not code it).
--
-- We will assume the alphabet contains letters from {'a','b','c'}
-- The accept state is all strings that:
-- -- have different starting and ending characters
-- -- any two neighboring characters are not identical
-- or the empty string
--
-- This is unlike a real DFA as we do not have a "dead" state but simply reject
-- the rest of the string in our current state.
--
-- Created 09-26-2012
-- Updated 05-20-2013
-- Version 1.1
-- Created by unsignedzero (David Tran)

-- Front End Call
h2 :: [Char] -> Bool
h2 [] = True
h2 (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = h2bb xs
  | x == 'c' = h2cc xs
  | otherwise = False

-- The important thing to remember is the first character seen in and the 
-- current character which is denoted by the function name. 

-- Back
h2aa :: [Char] -> Bool
h2aa [] = False
h2aa (x:xs)
  | x == 'a' = False
  | x == 'b' = h2ab xs
  | x == 'c' = h2ac xs
  | otherwise = False

h2ab :: [Char] -> Bool
h2ab [] = True
h2ab (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = False
  | x == 'c' = h2ac xs
  | otherwise = False

h2ac :: [Char] -> Bool
h2ac [] = True
h2ac (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = h2ab xs
  | x == 'c' = False
  | otherwise = False

h2ba :: [Char] -> Bool
h2ba [] = True
h2ba (x:xs)
  | x == 'a' = False
  | x == 'b' = h2bb xs
  | x == 'c' = h2bc xs
  | otherwise = False

h2bb :: [Char] -> Bool
h2bb [] = False
h2bb (x:xs)
  | x == 'a' = h2ba xs
  | x == 'b' = False
  | x == 'c' = h2bc xs
  | otherwise = False

h2bc :: [Char] -> Bool
h2bc [] = True
h2bc (x:xs)
  | x == 'a' = h2ba xs
  | x == 'b' = h2bb xs
  | x == 'c' = False
  | otherwise = False

h2ca :: [Char] -> Bool
h2ca [] = True
h2ca (x:xs)
  | x == 'a' = False
  | x == 'b' = h2cb xs
  | x == 'c' = h2cc xs
  | otherwise = False

h2cb :: [Char] -> Bool
h2cb [] = True
h2cb (x:xs)
  | x == 'a' = h2ca xs
  | x == 'b' = False
  | x == 'c' = h2cc xs
  | otherwise = False

h2cc :: [Char] -> Bool
h2cc [] = False
h2cc (x:xs)
  | x == 'a' = h2ca xs
  | x == 'b' = h2cb xs
  | x == 'c' = False
  | otherwise = False

-- Main Function
main :: IO()
main = do
  putStrLn "Starting DFA_NonDupLetter Program"
  putStrLn "Enter a string consisting of the letters a,b and c"
  input_line <- getLine
  putStrLn $ show $ h2 input_line

