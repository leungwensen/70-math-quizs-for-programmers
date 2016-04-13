# ワールドカップ出場国を配列にセット
country = ["Brazil", "Croatia", "Mexico", "Cameroon",
           "Spain", "Netherlands", "Chile", "Australia",
           "Colombia", "Greece", "Cote d'Ivoire", "Japan",
           "Uruguay", "Costa Rica", "England", "Italy",
           "Switzerland", "Ecuador", "France", "Honduras",
           "Argentina", "Bosnia and Herzegovina", "Iran",
           "Nigeria", "Germany", "Portugal", "Ghana",
           "USA", "Belgium", "Algeria", "Russia",
           "Korea Republic"]
def search(countrys, prev, depth)
  # 前の国名に続く国の一覧を取得
  next_country = countrys.select{|c| c[0] == prev[-1].upcase}
  if next_country.size > 0 then
    # 続く国がある場合、その国を除いて再帰的に探索
    next_country.each{|c|
      search(countrys - [c], c, depth + 1)
    }
  else
    # 続く国がない場合、深さが最大かどうかチェック
    @max_depth = [@max_depth, depth].max
  end
end

# すべての国から開始
@max_depth = 0
country.each{|c|
  search(country - [c], c, 1)
}
# 深さの最大値（しりとりで続く国の数）を表示
puts @max_depth
