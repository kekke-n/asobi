class Foo
  #　@see : https://docs.ruby-lang.org/ja/latest/method/Module/i/define_method.html
  # ブロックを与えた場合、定義したメソッドの実行時にブロックがレシーバクラスのインスタンスの上で BasicObject#instance_eval されます。

  define_method 'hoge' do
    puts self # => #<Foo:0x0000000104a07ee0>

    # インスタンスメソッドを呼べる
    piyo # => piyo
  end

  define_singleton_method 'func' do
    puts self  # => Foo

    # クラスメソッドを呼べる
    class_method # => class_method
  end

  def piyo
    puts 'piyo'
  end

  def self.class_method
    puts 'class_method'
  end
end

