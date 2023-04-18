require 'byebug'
class StrictString < String

  AVAILABLE_METHODS =
    [
      [:insert, Integer, String],
      [:concat, String],
      [:slice!, Integer, Integer],
      [:sub!, String, String],
      [:gsub!, String, String],
      [:upcase!],
      [:downcase!],
      [:capitalize!],
      [:swapcase!],
      [:chop!],
      [:chomp!],
      [:strip!],
      [:rstrip!],
      [:lstrip!],
      [:ljust, Integer, String],
      [:rjust, Integer, String],
      [:center, Integer],
      [:succ!],
      [:next!],
      [:reverse!],
      [:tr!, String, String],
      [:tr_s!, String, String],
      [:delete!, String],
      [:squeeze!, String],
    ]

  AVAILABLE_METHODS.each do |m|
    # next if [:object_id, :__send__, :inspect, :is_a?].include?(m)
    undef_method m[0]
  end

  attr_reader :init, :current, :goal

  def initialize(string)
    @init = string.dup
    @current = string.dup
    @goal = convert(string.dup)
    super
  end

  def usable_methods
    AVAILABLE_METHODS.map{|m| m[0]}
  end

  def finish?
    @current == @goal
  end

  def inspect
    @current
  end

  private

  def convert(string)
    result = AVAILABLE_METHODS.shuffle[0..4].inject(string) do |r, m|
      method = m[0]
      args_classes = m[1..2]
      args = args_classes.map do |klass|
        if klass == String
          string.chars.uniq.sample
        elsif klass == Integer
          rand(string.size)
        else
          ''
        end
      end
      r.public_send(method, *args)
      print "#{method}(#{args.join(',')})"
      print "-> '#{r}'\n"
      r
    end
    pp "result: #{result}"

    result
  end

  private

  def method_missing(symbol, *args)
    puts "called #{symbol} methos."
    super unless usable_methods.include?(symbol)
    @current.public_send(symbol, *args)
  end
end
