```haskell
λ 5 + 7
λ "ahmed"
λ [42,13,21]
λ sort [42,13,21]
λ sort "ahmed"
λ (30, "ahmed")
λ [42,13,21]
λ (1,"hats",23/35)
λ ("Shaggy","Daphnie","Velma")
λ fst (28,"chirs")
λ let x = 4 in x * x
λ let x = 8 * 10 in x + x
λ let villain = (28,"chirs") in fst villain
λ 'a' : []
λ ['a']
λ 1 : []
λ 'a' : 'b' : [] -- It takes two values, some value and a list, and constructs a new list out of them. We call it 'cons' for short.
λ ['a','b']
λ 'a' : 'b' : [] == ['a','b']
λ True
λ ['a','b','c'] == "abc"
λ map (+1) [1..5]
λ map (*99) [1..10]
λ map (/5) [13,24,52,42]
λ filter (>5) [62,3,25,7,1,9]
λ (1,"George")
λ 1 : [2,3]
λ let square x = x * x in square 10
λ let add1 x = x + 1 in add1 5
λ let second x = snd x in second (3,4)
λ let square x = x * x in map square [1..10]
λ let add1 x = x + 1 in map add1 [1,5,7]
λ let take5s = filter (==5) in take5s [1,5,2,5,3,5]
λ let take5s = filter (==5) in map take5s [[1,5],[5],[1,1]]
λ toUpper 'a'
λ map toUpper "Chris"
λ let (a,b) = (10,12) in a * 2
λ let (a,b) = (10,12) in b * 2
λ let (a:b:c:[]) = "xyz" in a
λ let (a:_:_:_) = "xyz" in a
λ let (a:b:c:d) = "xyz" in d
λ let (a:(b:(c:d))) = "xyz" in d
λ let (a:_) = "xyz" in a
λ let (a:b) = "xyz" in b
λ let (_, a:_) = (10, "abc") in a
λ let _:_:x:_ = "abcd" in x
λ let [a,b,c] = "cat" in (a,b,c)
λ let abc@(a,b,c) = (10,20,30) in (abc,a,b,c)
```

1. In `'a' : []`, `:` is really just another function, just clever looking.
2. Pretty functions like this are written like `(:)` when you talk about them.
3. A list of characters `['a','b']` can just be written `"ab"`. Much easier!


```haskell
5 * (-3)
λ True && False
λ False || True
λ not False
λ not (True && True)
λ 1 == 0
λ 5 /= 4
λ succ 8
λ succ 'a'
λ min 9 10
λ min 3.4 3.2
max 100 101
λ succ 9 + max 5 4 + 1
λ (succ 9) + (max 5 4) + 1
λ div 10 2
λ 10 `div` 2
λ doubleMe x = x + x
λ doubleMe 10
λ doubleMe 2.2
λ :l baby
λ doubleUs x y = doubleMe x + doubleMe y
```

Function application (calling a function by putting a space after it and then typing out the parameters) has the highest precedence of them all. What that means for us is that these two statements are equivalent.

The difference between Haskell's if statement and if statements in imperative languages is that the else part is mandatory in Haskell.


```haskell
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
λ conanO'Brien = "It's a-me, Conan O'Brien!"
```

Functions can't begin with uppercase letters.

When a function doesn't take any parameters, we usually say it's a definition (or a name).

## An intro to lists

```hs
λ let lostNumbers = [4,8,15,16,23,42]
λ [1,2,3,4] ++ [9,10,11,12]
λ "hello" ++ " " ++ "world"
λ ['w','o'] ++ ['o','t']
```

When you put together two lists (even if you append a singleton list to a list, for instance: `[1,2,3] ++ [4])`, internally, Haskell has to walk through the whole list on the left side of ++. That's not a problem when dealing with lists that aren't too big. But putting something at the end of a list that's fifty million entries long is going to take a while. However, putting something at the beginning of a list using the `:` operator (also called the cons operator) is instantaneous.

```hs
λ 'A':" SMALL CAT"
λ "A" ++ " SMALL CAT"
```

Notice how `:` takes a number and a list of numbers or a character and a list of characters, whereas `++` takes two lists. Even if you're adding an element to the end of a list with `++,` you have to surround it with square brackets so it becomes a list.

`[1,2,3]` is actually just syntactic sugar for `1:2:3:[]`. `[]` is an empty list. If we prepend 3 to it, it becomes `[3]`. If we prepend 2 to that, it becomes `[2,3]`, and so on.

```hs
λ "Steve Buscemi" !! 6
λ [9.4,33.2,96.2,11.2,23.25] !! 1
λ let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
λ [3,2,1] > [2,1,0]

λ [3,2,1] > [2,1,1]
True

λ [3,2,1] > [2,1,1000] -- !?

True

λ head [5,4,3,2,1]  -- 5
λ tail [5,4,3,2,1]  -- [4,3,2,1]
λ last [5,4,3,2,1]  -- 1
λ init [5,4,3,2,1]
[5,4,3,2]

λ head []
*** Exception: Prelude.head: empty list

λ length [5,4,3,2,1]

λ null [1,2,3]
False

λ null []
True

λ reverse [5,4,3,2,1]

λ take 3 [5,4,3,2,1]
[5,4,3]

λ 3 `take` [5,4,3,2,1]
[5,4,3]

```

`init` takes a list and returns everything except its last element.

`null` checks if a list is empty. If it is, it returns `True`, otherwise it returns `False`. Use this function instead of `xs == []` (if you have a list called xs)

```hs
λ take 0 [1,2]
[]

λ take 5 [1,2]
[1,2]

λ drop 3 [8,4,2,1,5,6]
[1,5,6]

λ drop 100 [1,2,3,4]
[]


λ minimum [8,4,2,1,5,6]
1

λ maximum [1,9,2,3,4]
9

λ sum [5,2,1,6,3,2,5,7]
31

λ product [6,2,1,2]
24

λ product [1,2,5,6,7,9,2,0]
0

```

`elem` takes a thing and a list of things and tells us if that thing is an element of the list. It's usually called as an infix function because it's easier to read that way.

```hs
λ 4 `elem` [3,4,5,6]
True

```

## Texas ranges


```hs
λ [1..20]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20

λ ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

λ ['K'..'Z']
"KLMNOPQRSTUVWXYZ"

λ [2,4..20]
[2,4,6,8,10,12,14,16,18,20]

λ [3,6..20]
[3,6,9,12,15,18]
```

To make a list with all the numbers from 20 to 1, you can't just do `[20..1]`, you have to do `[20,19..1]`.

```hs
λ [20,19..1]
[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2

λ [0.1, 0.3 .. 1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

```

You can also use ranges to make infinite lists by just not specifying an upper limit.

```hs
λ take 10 [13,26..]
[13,26,39,52,65,78,91,104,117,130]
]
```


`cycle` takes a list and cycles it into an infinite list. If you just try to display the result, it will go on forever so you have to slice it off somewhere.

```hs
λ take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]

λ take 12 (cycle "Vay ")
"Vay Vay Vay "
```


`repeat` takes an element and produces an infinite list of just that element. It's like cycling a list with only one element.

```hs
λ take 3 (repeat 5)
[5,5,5]

λ take 3 (repeat [])
[[],[],[]]

λ take 3 (repeat [3])
[[3],[3],[3]]

λ take 3 (repeat (1,'a') )
[(1,'a'),(1,'a'),(1,'a')]

λ replicate 3 10
[10,10,10]

λ 3 `replicate` 10
[10,10,10]
```

## List comprehension

```hs
λ [x*x | x <- [1..10]]
[1,4,9,16,25,36,49,64,81,100]

λ [x*x | x <- [1..10], x*x >= 20]
[25,36,49,64,81,100]

λ [ x | x <- [50..100], x `mod` 7 == 0]
[56,63,70,77,84,91,98]

λ boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

λ boomBangs [7..13]
["BOOM!","BOOM!","BANG!","BANG!"]

λ [ x | x <- [0..100], even x, x `mod` 3 == 0 ]
[0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96]


λ let nouns = ["koc", "aslan", "boga", "kartal"]
λ let adjectives = ["oturan", "ucan", "korkak", "yuzen"]
λ [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["oturan koc","oturan aslan","oturan boga","oturan kartal","ucan koc","ucan aslan","ucan boga","ucan kartal","korkak koc","korkak aslan","korkak boga","korkak kartal","yuzen koc","yuzen aslan","yuzen boga","yuzen kartal"]
λ random [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

```


I know! Let's write our own version of `length`! We'll call it `length'`.

```hs
λ length' xs = sum [1 | _ <- xs]
λ length' [x | x <- [0..100], even x, x `mod` 3 == 0]
17

λ removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
λ removeNonUppercase "Hahaha! Ahahaha!"
"HA"

λ removeUppercase st = [ c | c <- st, not (c `elem` ['A'..'Z'])]
λ removeUppercase "Hahaha! Ahahaha!"
"ahaha! hahaha!"

```

## Tuples

```hs
ghci> fst (8,11)
8

ghci> fst ("Wow", False)
"Wow"

ghci> snd (8,11)
11

ghci> snd ("Wow", False)
False

ghci> zip [1,2,3,4,5] [5,5,5,5,5]
[(1,5),(2,5),(3,5),(4,5),(5,5)]

ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]


ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
[(5,"im"),(3,"a"),(2,"turtle")]

```

The longer list simply gets cut off to match the length of the shorter one.

Because Haskell is lazy, we can zip finite lists with infinite lists:

```hs
ghci> zip [1..] ["apple", "orange", "cherry", "mango"]
```

Here's a problem that combines tuples and list comprehensions: which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24? First, let's try generating all triangles with sides equal to or smaller than 10:



```hs
λ let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
λ let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
λ let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
λ rightTriangles'
[(6,8,10)]
```


## Types

```hs
λ :t "Ahmed"
"Ahmed" :: [Char]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r
```


## Type Classes

```
Prelude> :t (==)
(==) :: Eq a => a -> a -> Bool
```

Interesting. We see a new thing here, the `=>` symbol. Everything before the `=>` symbol is called a class constraint.
We can read the previous type declaration like this: **the equality function takes any two values that are of the same type and returns a `Bool`**.
**The type of those two values must be a member of the `Eq` class** (this was the class constraint).

The `Eq` typeclass *provides an interface for testing for equality*. Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class. **All standard Haskell types except for IO and functions are a part of the Eq typeclass.**

The `elem` function has a type of `(Eq a) => a -> [a] -> Bool` because it uses == over a list to check whether some value we're looking for is in it.



```hs
Prelude> :t elem
elem :: (Foldable t, Eq a) => a -> t a -> Bool
```

`Ord` is for types that have an ordering.

```hs
Prelude> :t (>)
(>) :: Ord a => a -> a -> Bool
```

All the types we covered so far except for functions are part of Ord. Ord covers all the standard comparing functions such as `>`, `<`, `>=` and `<=`. The compare function takes two `Ord` members of the same type and returns an ordering. Ordering is a type that can be `GT`, `LT` or `EQ`, meaning greater than, lesser than and equal, respectively.

```hs
Prelude> :t GT
GT :: Ordering
Prelude> :t LT
LT :: Ordering
Prelude> :t EQ
EQ :: Ordering

Prelude> "Abrakadabra" < "Zebra"
True

Prelude> compare "ada" "fortran"
LT

Prelude> "ada" `compare` "fortran"
LT

```

### Show

```hs
Prelude> :t show
show :: Show a => a -> String

Prelude> show 3
"3"

Prelude> show (1/5)
"0.2"
```

### Read

`Read` is sort of the opposite typeclass of `Show`. The read function takes a string and returns a type which is a member of Read.


```hs
Prelude> read "True" || False
True

Prelude> read "8.2" + 3.8
12.0

Prelude> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]
```

```hs
Prelude> :t read
read :: Read a => String -> a
```

See? It returns a type that's part of `Read` but if we don't try to use it in some way later, it has no way of knowing which type. That's why we can use explicit **type annotations**. Type annotations are a way of explicitly saying what the type of an expression should be. We do that by adding `::` at the end of the expression and then specifying a type. Observe:

```hs
Prelude> read "5" :: Int
5

Prelude> read "5" :: Float
5.0

Prelude> read "5" :: Double
5.0

Prelude> read "[1,2,3,4]" :: [Int]
[1,2,3,4]

Prelude> read "[1,2,3,4]" :: [Float]
[1.0,2.0,3.0,4.0]

Prelude> read "(3, 'a')" :: (Int, Char)
(3,'a')

Prelude> read "(3, \"a\")" :: (Int, String)
(3,"a")

```


### Enum
Enum members are sequentially ordered types — they can be enumerated. The main advantage of the Enum typeclass is that we can use its types in list ranges. They also have defined successors and predecesors, which you can get with the `succ` and `pred` functions. Types in this class: `()`, `Bool`, `Char`, `Ordering`, `Int`, `Integer`, `Float` and Double.


```hs
Prelude> ['a'..'h']
"abcdefgh"

Prelude> :t ['a'..'h']
['a'..'h'] :: [Char]

Prelude> ['a'..'h'] :: String
"abcdefgh"

Prelude> :t (['a'..'h'] :: String)
(['a'..'h'] :: String) :: String

```

### Bounded

`Bounded` members have an upper and a lower bound.


```hs
Prelude> minBound :: Int
-9223372036854775808

Prelude> minBound :: Char
'\NUL'

Prelude> minBound :: Bool
False

Prelude> maxBound :: Bool
True

Prelude> maxBound :: Char
'\1114111'

Prelude> maxBound :: Int
9223372036854775807

Prelude> :t minBound
minBound :: Bounded a => a

Prelude> maxBound :: (Bool, Int, Char)
(True,9223372036854775807,'\1114111')

```

## Num

- Int
- Integer
- Float
- Double


```hs
Prelude> 20 :: Int
20
Prelude> 20 :: Integer
20
Prelude> 20 :: Float
20.0
Prelude> 20 :: Double
20.0
```

```hs
Prelude> :t (*)
(*) :: Num a => a -> a -> a

Prelude> :t (-)
(-) :: Num a => a -> a -> a

Prelude> :t (/)
(/) :: Fractional a => a -> a -> a

Prelude> :t (+)
(+) :: Num a => a -> a -> a
```

It takes two numbers of the same type and returns a number of that type. That's why `(5 :: Int) * (6 :: Integer)` will result in a type error whereas `5 * (6 :: Integer)` will work just fine and produce an Integer because **5 can act like an Integer or an Int.**


```hs
Prelude> :t (3 + 5.0)
(3 + 5.0) :: Fractional a => a
```

## Integral

`Integral` is also a numeric typeclass. `Num` includes all numbers, including real numbers and integral numbers, `Integral` includes only integral (whole) numbers. In this typeclass are `Int` and `Integer`.

## Floating
`Floating` includes only floating point numbers, so `Float` and `Double`.


A very useful function for dealing with numbers is fromIntegral. It has a type declaration of `fromIntegral :: (Num b, Integral a) => a -> b`. From its type signature we see that it takes an integral number and **turns it into a more general number**. That's useful when you want **integral and floating point types to work together nicely**. For instance, the length function has a type declaration of `length :: [a] -> Int` instead of having a more general type of `(Num b) => length :: [a] -> b`. I think that's there for historical reasons or something, although in my opinion, it's pretty stupid. Anyway, if we try to get a length of a list and then add it to `3.2`, we'll get an error because we tried to add together an `Int` and a floating point number. So to get around this, we do `fromIntegral (length [1,2,3,4]) + 3.2` and it all works out.


# Syntax in Functions

```hs
Prelude> lucky 7 = "LUCKY NUMBER SEVEN!"
Prelude> lucky x = "Sorry, you're out of luck, pal!"
Prelude> lucky 8
"Sorry, you're out of luck, pal!"
Prelude> lucky 7
"Sorry, you're out of luck, pal!"
```


```hs
Prelude> sayMe 1 = "One!"
Prelude> sayMe 2 = "Two!"
Prelude> sayMe 3 = "Three!"
Prelude> sayMe 4 = "Four!"
Prelude> sayMe 5 = "Five!"
Prelude> sayMe x = "Not between 1 and 5"
Prelude> sayMe 1
"Not between 1 and 5"
```

Note that if we moved the last pattern (the catch-all one) to the top, it would always say "Not between 1 and 5", because it would catch all the numbers and they wouldn't have a chance to fall through and be checked for any other patterns.

```hs
*Main> charName 'a'
"Albert"
*Main> charName 'd'
"*** Exception: factorial.hs:(18,1)-(20,22): Non-exhaustive patterns in function charName
```

## Pattern Matching on Tuples

```hs
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)
```

Better way:

```hs
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
```

`fst` and `snd` extract the components of pairs. But what about triples? Well, there are no provided functions that do that but we can make our own.

```hs
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z
```

```hs
*Main> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
*Main>  [a+b | (a,b) <- xs]
[4,7,6,8,11,4]
```

> Note: The x:xs pattern is used a lot, especially with recursive functions. But patterns that have : in them only match against lists of length 1 or more.


## Home made `head`

```hs
{-
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
-}

head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!"
                      (x:_) -> x

```

Let's make a trivial function that tells us some of the first elements of the list in (in)convenient English form.


## Home made length'

We already implemented our own length function using list comprehension. Now we'll do it by using pattern matching and a little recursion:

```hs
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs
```

## Guards


## Where

## Let it be
Let bindings let you bind to variables anywhere and are expressions themselves, but are very local, so they don't span across guards.

So what's the difference between the two?
For now it just seems that let puts the bindings first and the expression that uses them later whereas where is the other way around.

```hs
ghci> 4 * (let a = 9 in a + 1) + 2
42

ghci> [let square x = x * x in (square 5, square 3, square 2)]
[(25,9,4)]

*Main> let sq x = x * x in (sq 5, sq 3, sq 2)
(25,9,4)

*Main> let a = 3; b = 4; c = 5 in product [a,b,c]
60

*Main> let (a,b,c) = (3,4,5) in product [a,b,c]
60
```

Return only the BMIs for FAT people

```hs
*Main> [bmi | bmi <- calcBmis [(60, 1.68), (70, 1.60)], bmi >= 25.0]
[27.343749999999996]
```

We omitted the in part of the `let` binding when we used them in list comprehensions because the visibility of the names is already predefined there. However, we could use a `let in` binding in a predicate and the names defined would only be visible to that predicate. The `in` part can also be omitted when defining functions and constants directly in GHCi. **If we do that, then the names will be visible throughout the entire interactive session.**

## case expressions

```hs
case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   ...
```


## recursion

```hs
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs
```


```hs
repeat 3          -- Infinite list
take 5 (repeat 3) -- Finite list


*Main> zip' [1,2] ['a', 'b']
[(1,'a'),(2,'b')]

*Main> quicksort [10,2,5,3,1,6,7,4,2,3,4,8,9]
[1,2,2,3,3,4,4,5,6,7,8,9,10]
*Main> quicksort "the quick brown fox jumps over the lazy dog"
"        abcdeeefghhijklmnoooopqrrsttuuvwxyz"

```

## Higher Order Functions

```hs
Prelude> :t max
max :: Ord a => a -> a -> a

Prelude> :t max 4
max 4 :: (Num a, Ord a) => a -> a

Prelude> :t max 4 5
max 4 5 :: (Num a, Ord a) => a

Prelude> :t max 4 5 6
max 4 5 6 :: (Num (t -> t1), Num t, Ord (t -> t1)) => t1

Prelude> :t max 4 5 6 7
max 4 5 6 7 :: (Num (t1 -> t -> t2), Num t, Num t1, Ord (t1 -> t -> t2)) => t

```

```hs

ghci> let multTwoWith9 = multThree 9
ghci> multTwoWith9 2 3
54

*Main> let multWith18 = multTwoWith9 2
*Main> multWith18 10
180


```

Calling, say, `divideByTen 200` is equivalent to doing `200 / 10`, as is doing `(/10) 200`.

## Some higher-orderism is in order


```hs
*Main> applyTwice (square) 3
81

*Main> applyTwice (*2) 10
40

*Main> :t (:[])
(:[]) :: a ->

*Main> applyTwice (3:) []
[3,3]

*Main> applyTwice (3:) [1]
[3,3,1]


*Main> zipWith' (-) [4,2,5,6] [2,6,2,3]
[2,-4,3,3]

ghci> zipWith' max [6,3,2,1] [7,3,1,5]
[7,3,2,5]

ghci> zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
["foo fighters","bar hoppers","baz aldrin"]

ghci> zipWith' (*) (replicate 5 2) [1..]
[2,4,6,8,10]

```

## flip

Flip simply takes a function and returns a function that is like our original function, only the first two arguments are flipped.


```hs
*Main> replicate 5 2
[2,2,2,2,2]
*Main> flip replicate 5 2
[5,5]

*Main> flip' zip [1,2,3,4,5] "hello"
[('h',1),('e',2),('l',3),('l',4),('o',5)]

```

## folds

`\acc x -> x : acc` kind of looks like the `:` function, only the parameters are flipped. That's why we could have also written our reverse as foldl `(flip (:)) []`.


### scans

```hs
*Main> foldl1  (+) [1..5]
15
*Main> scanl1 (+) [1..5]
[1,3,6,10,15]
```

## Function application with `$`

Function application with a space is left-associative (so `f a b c` is the same as `((f a) b) c))`, function application with $ is right-associative.

Consider, `sum (map sqrt [1..130])`,  Because `$` has such a low precedence, we can rewrite that expression as `sum $ map sqrt [1..130]`

> When a `$` is encountered, the expression on its right is applied as the parameter to the function on its left.


```hs
*Main> sqrt 9+16
19.0 -- !!

*Main> sqrt (9+16)
5.0

*Main> sqrt $ 9 + 16
5.0

*Main> sqrt $ (+) 9 16
5.0


*Main> sum $ filter (> 10) $ map (*2) [2..10]
80

*Main> sum (filter (> 10) (map (*2) [2..10]))
80
]
```


But apart from getting rid of parentheses, `$` means that function application can be treated just like another function. That way, we can, for instance, map function application over a list of functions.

```hs
*Main> map ($ 5) [(*2), (*3), (^2)]
[10,15,25]
```


## Function composition

![](http://s3.amazonaws.com/lyah/composition.png)


```hs
*Main> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c

f . g = \x -> f (g x)


*Main> :t (negate . (^10))
(negate . (^10)) :: Num c => c -> c

*Main> negate . (^2) $ 10
-100

*Main> map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]

*Main> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]

```

> Function composition is right-associative.


Another common use of function composition is defining functions in the so-called point free style (also called the pointless style). Take for example this function that we wrote earlier:

```hs
fn x = ceiling (negate (tan (cos (max (pi/180) x))))

fn x = ceiling $ negate $ tan $ cos $ max (pi/180) x
fn   = ceiling . negate . tan . cos . max (pi/180)
```


```hs
oddSquareSum :: Integer
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]


oddSquareSum :: Integer
oddSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in  sum belowLimit

```


## types

```hs
ghci> surface $ Circle 10 20 10  
314.15927  

ghci> surface $ Rectangle 0 0 100 100  
10000.0 
```