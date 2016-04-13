# ワールドカップ出場国を配列にセット
@country = ["Brazil", "Croatia", "Mexico", "Cameroon",
            "Spain", "Netherlands", "Chile", "Australia",
            "Colombia", "Greece", "Cote d'Ivoire", "Japan",
            "Uruguay", "Costa Rica", "England", "Italy",
            "Switzerland", "Ecuador", "France", "Honduras",
            "Argentina", "Bosnia and Herzegovina", "Iran",
            "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia",
            "Korea Republic"]
# 使用済みかをチェック
@is_used = Array.new(@country.size, false)

def search(prev, depth)
  is_last = true
  @country.each_with_index{|c, i|
    if c[0] == prev[-1].upcase then
      if !@is_used[i] then
        is_last = false
        @is_used[i] = true
        search(c, depth + 1)
        @is_used[i] = false
      end
    end
  }
  @max_depth = [@max_depth, depth].max if is_last
end

# すべての国から開始
@max_depth = 0
@country.each_with_index{|c, i|
  @is_used[i] = true
  search(c, 1)
  @is_used[i] = false
}
# 深さの最大値（しりとりで続く国の数）を表示
puts @max_depth
