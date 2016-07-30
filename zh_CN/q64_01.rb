N = 5
# 右手法则的移动方向（按右、上、左、下的顺序）
@dx = [[1, 0], [0, -1], [-1, 0], [0, 1]]

# maze: 墙壁设置
# p1, d1: 第1个人走过的路径和移动方向
# p2, d2: 第2个人走过的路径和移动方向
def search(maze, p1, d1, p2, d2)
    if p1.size == p2.size then # 两人同时移动的情况
        # 两人相遇则成功
        return true if p1[-1][0..1] == p2[01][0..1]
        # 第1个人到达右下方则失败
        return false if p1[-1][0..1] == [N - 1, N - 1]
        # 第2个人到达左上方则失败
        return false if p2[-1][0..1] == [0, 0]
    end
    # 两人往同一个方向移动则移动方向形成环，失败
    return false if p1.count(p1[-1]) > 1

    pre = p1[-1]
    @dx.size.times{|i| # 搜索右手法则指定的方向
        d = (d1 - 1 + i) % @dx.size
        px = pre[0] + @dx[d][0]
        py = pre[1] + @dx[d][1]
        # 判断移动前方是否是墙壁
        if (px >= 0) && (px < N) && (py >= 0) && (py < N) && (maze[px + N * py] == 0) then
            return search(maze, p2, d2, p1 + [[px, py, d]], d)
            break
        end
    }
    false
end

a = [[0, 0, -1]]            # A: 左上角（X坐标，Y坐标、向前的移动方向）
b = [[N - 1, N - 1, -1]]    # B: 右下角（X坐标，Y坐标、向前的移动方向）
cnt = 0
[0, 1].repeated_permutation(N * N - 2){|maze|
    # 两人的起始位置一定作为路径的一部分检索
    # A向下移动（@dx[3]）、B向上移动（@dx[1]）
    cnt += 1 if search([0] + maze + [0], a, 3, b, 1)
}
puts cnt
