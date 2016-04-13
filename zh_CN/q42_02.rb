@found = false
@op = ['+', '-', '*', '/', '']
def check(n, expr, num)
  if n == 0 then
    if eval(expr) == 1234 then
      puts expr
      @found = true
    end
  else
    @op.each{|i|
      check(n - 1, "#{expr}#{i}#{num}", num)
    }
  end
end
len = 1
while !@found do
  (1..9).to_a.each{|num|
    check(len, num, num)
  }
  len += 1
end
