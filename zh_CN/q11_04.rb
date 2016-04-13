a = b = 1
count = 0
while (count < 11) do
  c = a + b
  # 1桁ずつに分割して各桁の和を取得
  sum = 0
  c.to_s.split(//).each {|e| sum += e.to_i}
  if (c % sum == 0) then
    # 割り切れた場合に出力する
    puts c
    count += 1
  end
  a, b = b, c
end
