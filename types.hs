data Bool = True | False;

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)


surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

-- data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)
tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Vector a = Vector a a a deriving (Show)  

vplus :: (Num t) => Vector t -> Vector t -> Vector t  
vectMult :: (Num t) => Vector t -> t -> Vector t  
scalarMult :: (Num t) => Vector t -> Vector t -> t  

(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  
