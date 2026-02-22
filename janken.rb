puts "===== じゃんけん & あっち向いてホイ ====="

hands = ["グー", "チョキ", "パー"]
directions = ["上", "下", "左", "右"]

loop do
  puts "【じゃんけん】"
  puts "0: グー"
  puts "1: チョキ"
  puts "2: パー"
  puts "3: 終了"
  print "数字を入力してください: "

  input = gets.chomp

  unless input.match?(/^[0-3]$/)
    puts "0~3の数字を入力してください。"
    next
  end

  player_hand = input.to_i

  if player_hand == 3
    puts "ゲームを終了します。"
    break
  end

  computer_hand = rand(3)

  puts "あなた: #{hands[player_hand]}"
  puts "相手: #{hands[computer_hand]}"

  if player_hand == computer_hand
    puts "あいこです。もう一度じゃんけん！"
    puts ""
    next
  end

  player_win =
    (player_hand == 0 && computer_hand == 1) ||
    (player_hand == 1 && computer_hand == 2) ||
    (player_hand == 2 && computer_hand == 0)

  puts "【あっち向いてホイ】"
  puts "0: 上"
  puts "1: 下"
  puts "2: 左"
  puts "3: 右"
  print "数字を入力してください: "

  direction_input = gets.chomp

  unless direction_input.match?(/^[0-3]$/)
    puts "0~3の数字を入力してください。"
    puts ""
    next
  end

  player_direction = direction_input.to_i
  computer_direction = rand(4)

  if player_win
    puts "あなた（指さす）: #{directions[player_direction]}"
    puts "相手（顔を向ける）: #{directions[computer_direction]}"
  else
    puts "相手（指さす）: #{directions[computer_direction]}"
    puts "あなた（顔を向ける）: #{directions[player_direction]}"
  end

  if player_direction == computer_direction
    if player_win
      puts "あなたの勝ちです！"
    else
      puts "相手の勝ちです！"
    end
    break
  else
    puts "勝負つかず。もう一度じゃんけん！"
    puts ""
  end
end

puts "ゲーム終了"