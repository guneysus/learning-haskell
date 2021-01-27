import Data.List
import Data.List (nub, sort)  
import Data.List hiding (nub)  
import qualified Data.Map  
import Geometry.Sphere  



numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub