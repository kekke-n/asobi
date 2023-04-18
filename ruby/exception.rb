def hoge
  begin
    return 1
  ensure
    return 2
  end
end

def piyo
  begin
    return 1
  ensure
    2
  end
end


puts hoge # => 2
puts piyo # => 1