class BarTab
  attr_accessor :total, :content

  def initialize()
    @total = 0
    @content = []
  end

  def add_order(hash)
    @content << hash
  end

  def update_total
    @content.each{|x| @total += x[:price]}
  end

end
