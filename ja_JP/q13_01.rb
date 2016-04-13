count = 0
(0..9).to_a.permutation do |r, e, a, d, w, i, t, l, k, s|
  next if r == 0 or w == 0 or t == 0 or s == 0
  read = r * 1000 + e * 100 + a * 10 + d
  write = w * 10000 + r * 1000 + i * 100 + t * 10 + e
  talk = t * 1000 + a * 100 + l * 10 + k
  skill = s * 10000 + k * 1000 + i * 100 + l * 10 + l
  if read + write + talk == skill then
    count += 1
    puts "#{read} + #{write} + #{talk} = #{skill}"
  end
end
puts count
