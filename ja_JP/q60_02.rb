a = [1, 2, 3, 4]
b = a.clone
b[0] = 5
p a
p b

c = [[1, 2], [3, 4]]
d = c.clone
d[0][0] = 5
p c
p d
