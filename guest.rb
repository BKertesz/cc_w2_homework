require "pry"
class Guest
  attr_reader :name,:money
  attr_accessor :favorite_song

  def initialize(name,money)
    @name = name
    @money = money
    @favorite_song = nil
  end

  def enough_money?(amount)
    return true if @money >= amount
    return false
  end

  def remove_money(amount)
    return @money -= amount if enough_money?(amount)
    return false
  end

  def find_out_favorite_song(title)
    @favorite_song = title.capitalize
  end

  def is_favorite_song_playing?(playlist)
    playlist.each {|x| return "Whoo!" if x.title == @favorite_song}
    return false
  end

  def order(item,price)
    new_hash = {
      item: item,
      price: price
    }

    return new_hash
  end





end
