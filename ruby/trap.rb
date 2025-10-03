# trapの挙動の確認
# https://docs.ruby-lang.org/ja/latest/method/Signal/m/trap.html

DYING_COUNT = 3

Signal.trap(:INT) do
  Signal.trap(:INT＝, "SIG_IGN")
  puts "\n#{DYING_COUNT}秒間待ってやる"
  sleep DYING_COUNT
  Process.kill :QUIT, $$
end

loop do
  puts "Ctrl-cを入力すると#{DYING_COUNT}秒待って停止します"
  gets
end
