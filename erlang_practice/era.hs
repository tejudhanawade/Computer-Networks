
xs = [1..10]

prime [] = []
prime (x:xs) = x : (prime xs')
  where 
    xs' = filter (\y -> rem y x /=0) xs


