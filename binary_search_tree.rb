class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data, right = nil, left = nil)
    @data = data
    @right = right
    @left = left
  end

  def insert(n)
    if n <= @data
      if @left.nil?
        @left = Bst.new(n)
      else
        @left.insert(n)
      end
    else
      if @right.nil?
        @right = Bst.new(n)
      else
        @right.insert(n)
      end
    end
  end

  def each(&block)
    if block_given?
      @left.each(&block) if @left
      yield(@data)
      @right.each(&block) if @right
    else
      to_enum(:each)
    end
  end
end


def record_all_data(bst)
  all_data = []
  bst.each { |data| all_data << data }
  all_data
end

four = Bst.new 4
four.insert 2
four.insert 5
four.insert 3
four.insert 6
four.insert 7
four.insert 5
p four.each

