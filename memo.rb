require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 
# ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう.
if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp + ".csv"

  puts "新規でメモを作成します"
  puts "メモの内容を入力してください"
  puts "終了時にCtrl + Dを押してください:"
  memo_content = STDIN.read

  CSV.open(file_name, "w") do |csv|
    csv << [memo_content]
  end

  puts "メモが保存されました"
end

if memo_type == 2
  puts "既存のメモを編集します"

  # 既存メモのファイル名を取得
  puts "編集したいメモのファイル名を入力してください:"
  file_name = gets.chomp + ".csv"

  if File.exist?(file_name)
    # ファイルが存在する場合、内容を読み込んで編集
    memos = CSV.read(file_name)
    puts "既存のメモ内容: #{memos[0][1]}"

    puts "新しいメモの内容を入力してください"
    puts "終了時にCtrl + Dを押してください:"
    new_memo_content = STDIN.read

    # ファイルを上書きして新しいメモを保存
    CSV.open(file_name, "w") do |csv|
      csv << [new_memo_content]
    end
    puts "メモが編集され、保存されました"
  else
    puts "指定したファイルが見つかりません"
  end
end
