require "csv"

puts "===== メモ管理アプリ ====="
puts "1: 新規メモを作成"
puts "2: 既存メモを編集"
print "番号を選択してください: "

user_select = gets.chomp

if user_select == "1"

  print "作成するCSVファイル名を入力してください（例: memo.csv）: "
  file_path = gets.chomp

  print "メモのタイトルを入力してください: "
  memo_title = gets.chomp

  print "メモの内容を入力してください: "
  memo_body = gets.chomp

  CSV.open(file_path, "w") do |csv|
    csv << ["タイトル", "内容"]
    csv << [memo_title, memo_body]
  end

  puts "#{file_path} を新規作成しました。"

elsif user_select == "2"

  print "編集するCSVファイル名を入力してください: "
  file_path = gets.chomp

  if !File.exist?(file_path)
    puts "指定されたファイルが見つかりません。"
    exit
  end

  print "メモのタイトルを入力してください: "
  memo_title = gets.chomp

  print "メモの内容を入力してください: "
  memo_body = gets.chomp

  CSV.open(file_path, "a") do |csv|
    csv << [memo_title, memo_body]
  end

  puts "#{file_path} に追記しました。"

else
  puts "1か2を入力してください。"
end