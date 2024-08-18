--a)

f1 :: (Num p, Integral t) => t -> p
f1 0 = 1
f1 n = 2^n + f1 (n-1)

--b)
f2 :: (Num p, Integral t) => t -> p -> p
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

--c)
f3 :: (Num t2, Integral t1) => t1 -> t2 -> t2
f3 0 q = 0
f3 n q = f3 (n-1) q + q^((2*n)-1) + q^(2*n)

--d)
f4 :: (Num t2, Integral t1) => t1 -> t2 -> t2
f4 0 q = 1
f4 n q = f4 (n-1) q + q^((2*n)-1) + q^(2*n) - q^(n-1)