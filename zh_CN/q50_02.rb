def shuffle(card)
  left = card.take(card.size / 2)
  right = card.drop(card.size / 2)
  result = []
  left.size.times{|i|
    result.push(left[i])
    result.push(right[i])
  }
  result
end

count = 0

(1..100).each{|n|
  init = (1..(2 * n)).to_a
  card = init.clone
  i = 0
  while true do
    card = shuffle(card)
    i += 1
    break if card == init
  end
  count += 1 if i == 2 * (n - 1)
}

puts count
