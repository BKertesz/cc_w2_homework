require "pry"

class Room
  attr_reader :name, :occupants, :playlist, :max_capacity, :sum, :entry_fee

  def initialize(name, max_capacity,entry_fee)
    @name = name
    @max_capacity = max_capacity
    @occupants = []
    @playlist = []
    @sum = 0
    @entry_fee = entry_fee
  end

  def is_there_capacity?()
    return true if @occupants.length < @max_capacity
    return false
  end

  def add_song(song)
    return @playlist << song
  end

  def check_in_guest(guest)
    return false if !is_there_capacity?
    return @occupants << guest if guest.remove_money(@entry_fee)
    return false
  end

  def check_out_guest(name)
    leaver = @occupants.find_index{|x| x.name == name}
    return @occupants.delete_at(leaver)
  end

  def take_payment(guest,amount)
    @sum += amount if guest.remove_money(amount)
    return false
  end

  def playlist_favorites()

    @occupants.each do |x|
       return x.is_favorite_song_playing?(@playlist) ? true : false
       # binding.pry
    end
  end

end
