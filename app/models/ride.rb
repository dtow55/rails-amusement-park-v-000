class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    #binding.pry
    if self.user.tickets < attraction.tickets && self.user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets -= attraction.tickets
      self.user.nausea += attraction.nausea_rating
      self.user.happiness += attraction.happiness_rating
      self.user.save
      self.save
    end
  end
end
