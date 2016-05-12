# 设置一个保持世界杯参赛国的数组
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
  # 取得所有后续可能的国名
  next_country = countrys.select{|c| c[0] == prev[-1].upcase}
  if next_country.size > 0 then
    # 如果有可用的国名，则加入队列，并除去这个国名继续递归搜索
    next_country.each{|c|
      search(countrys - [c], c, depth + 1)
    }
  else
    # 如果没有可用国名，则判断当前深度是否最大
    @max_depth = [@max_depth, depth].max
  end
end

# 从各个国家开始
@max_depth = 0
country.each{|c|
  search(country - [c], c, 1)
}
# 输出最大深度（即连续的国名数目）
puts @max_depth
