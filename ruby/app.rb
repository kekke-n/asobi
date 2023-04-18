
# untile while
x = 0
begin
  puts x
  x += 1
end while x < 0


def test(hoge, piyo)
  yield hoge: hoge, piyo: piyo
end

test('a', 'b'){|hash| puts "#{hash[:hoge]}:#{hash[:piyo]}"}


enumerator = 3.times # Enumeratorオブジェクト
enumerator.each{|x| print x} # 012を出力


iterator = 1.upto(10)
begin
  print iterator.next while true
rescue StopIteration
  puts '..blastoff!!'
end

iterator = 1.upto(10)
loop do
  print iterator.next
end
puts '..blastoff!!'




# 要素が互い違いになっているコレクションの要素を一つずつ並列で取得する
def bundle(*enumerables)
  enumerators = enumerables.map{|e| e.to_enum}
  loop{ yield enumerators.map{|e| e.next}}
end

a,b,c = [1,2,3], 4..6, 'a'..'e'
bundle(a,b,c){|x| print x}

# => [1, 4, "a"][2, 5, "b"][3, 6, "c"]
