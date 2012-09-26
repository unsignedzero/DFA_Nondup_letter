-- This is from Ravi's homework H2 Problem 2
-- We will assume the alphabet contains elements from {'a','b','c'}
-- The accept state is all strings that:
-- -- have different starting and ending characters
-- -- any two neighboring characters are not identical

-- Check elem inputs

h2 :: [Char] -> Bool
h2 [] = True
h2 (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = h2bb xs
  | x == 'c' = h2cc xs

h2aa :: [Char] -> Bool
h2aa [] = False
h2aa (x:xs)
  | x == 'a' = False
  | x == 'b' = h2ab xs
  | x == 'c' = h2ac xs

h2ab :: [Char] -> Bool
h2ab [] = True
h2ab (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = False
  | x == 'c' = h2ac xs

h2ac :: [Char] -> Bool
h2ac [] = True
h2ac (x:xs)
  | x == 'a' = h2aa xs
  | x == 'b' = h2ab xs
  | x == 'c' = False

h2ba :: [Char] -> Bool
h2ba [] = True
h2ba (x:xs)
  | x == 'a' = False
  | x == 'b' = h2bb xs
  | x == 'c' = h2bc xs

h2bb :: [Char] -> Bool
h2bb [] = False
h2bb (x:xs)
  | x == 'a' = h2ba xs
  | x == 'b' = False
  | x == 'c' = h2bc xs

h2bc :: [Char] -> Bool
h2bc [] = True
h2bc (x:xs)
  | x == 'a' = h2ba xs
  | x == 'b' = h2bb xs
  | x == 'c' = False

h2ca :: [Char] -> Bool
h2ca [] = True
h2ca (x:xs)
  | x == 'a' = False
  | x == 'b' = h2cb xs
  | x == 'c' = h2cc xs

h2cb :: [Char] -> Bool
h2cb [] = True
h2cb (x:xs)
  | x == 'a' = h2ca xs
  | x == 'b' = False
  | x == 'c' = h2cc xs

h2cc :: [Char] -> Bool
h2cc [] = False
h2cc (x:xs)
  | x == 'a' = h2ca xs
  | x == 'b' = h2cb xs
  | x == 'c' = False
