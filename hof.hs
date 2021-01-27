fn x = ceiling (negate (tan (cos (max (pi/180) x))))


pi_180 = (/180) pi

fn x = ceiling $ negate $ tan $ cos $ max (pi/180) x
-- fn   = ceiling . negate . tan . cos . max . pi_180

m x = max (pi/180) x
m = max (pi/180)

