expression = "READ+WRITE+TALK==SKILL"
nums = expression.split(/[^a-zA-Z]/)
chars = nums.join().split("").uniq
head = nums.map{|num| num[0]}

count = 0
(0..9).to_a.permutation(chars.size){|seq|
  is_zero_first = false
  if seq.include?(0) then
    is_zero_first = head.include?(chars[seq.index(0)])
  end
  if !is_zero_first then
    e = expression.tr(chars.join(), seq.join())
    if eval(e) then
      puts e
      count += 1
    end
  end
}
puts count
