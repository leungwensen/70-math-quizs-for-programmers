@cnt = 0
def change(target, coins, usable)
  coin = coins.shift
  if coins.size == 0 then
    @cnt += 1 if target / coin <= usable
  else
    (0..target/coin).each{|i|
      change(target - coin * i, coins.clone, usable - i)
    }
  end
end
change(1000, [500, 100, 50, 10], 15)
puts @cnt
