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
```