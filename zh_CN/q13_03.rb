count = 0
(0..9).to_a.permutation(6){|e, a, d, t, k, l|
  if ((a + t == 8) || (a + t == 9) || (a + t == 10)) &&
     ((a + e == 8) || (a + e == 9) || (a + e == 10)) &&
     ((d + e + k) % 10 == l) &&
     (((a + t + l) * 10 + d + e + k) % 100 == l * 11) then
    ((0..9).to_a - [k, e, d, l, t, a]).permutation(4){|i, r, s, w|
      if ((r != 0) && (w != 0) && (t != 0)) &&
         ((s == w + 1) || (s == w + 2)) then
        read = r * 1000 + e * 100 + a * 10 + d
        write = w * 10000 + r * 1000 + i * 100 + t * 10 + e
        talk = t * 1000 + a * 100 + l * 10 + k
        skill = s * 10000 + k * 1000 + i * 100 + l * 10 + l
        if read + write + talk == skill then
          puts "#{read} + #{write} + #{talk} = #{skill}"
          count += 1
        end
      end
    }
  end
}
puts count
