# 集計フィールド
@count = 0

# 再帰的に検索
def search(list, len)
  if list.length == 1 then # 一意に識別できたとき
    @count += len - 1
  else
    # 複数存在するとき、1文字増やして調査
    list.uniq{|x| x[0, len]}.each{|k|
      search(list.select{|x| x.start_with?(k[0, len])}, len + 1)
    }
  end
end

# CSVファイルから「かな」の列を配列にセットし、転置
$<.drop(1).map{|e| e.split(',')[3,2]}.transpose.each{|ku|
  search(ku, 1)
}
puts @count
