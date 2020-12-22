require "csv"

# ループ開始
while true do
  puts "1(新規でメモを作成) 2(既存のメモ編集する) 3(終了)"
  
  # ユーザー入力
  memo_type = gets.to_i

  # 新規メモ作成
  if memo_type == 1
    puts "タイトルを入力してください。（拡張子を除く）"
    
    title = gets
    
    puts "メモを入力してください。(終了時はctrl + Dを入力してください)"
    
    array = []
    while text = gets
      array << text.chomp
    end
    
    CSV.open("#{title}.csv", "w") do |write|
      write << ["#{array}"]
    end
  
  # 既存メモの編集
  elsif memo_type == 2
    puts "編集するメモのタイトルを入力してください。（拡張子を除く）"
    
    title = gets
    puts CSV.read("#{title}.csv")
    
    puts "メモを入力してください。(終了時はctrl + Dを入力してください)"
    text_data = []
    while texts = gets
      text_data << texts.chomp
    end
    
    puts "1(上書きしますか？) 2(既存のメモに追加しますか？)"
    choose = gets.to_i
    
    if choose == 1
      CSV.open("#{title}.csv", "w") do |write|
        write << ["#{text_data}"]
      end
    
    else
      CSV.open("#{title}.csv", "a") do |write|
        write << ["#{text_data}"]
      end
    end
    
  # ループ終了
  elsif memo_type == 3
    break
    
  else
    puts "選択できない項目です。"
  end
end