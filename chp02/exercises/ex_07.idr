
top_ten : Ord a => List a -> List a
top_ten xs = take 10 (reverse (sort xs))
