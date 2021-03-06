class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :password, presence: true, on: :create

  def mood
    if self.happiness && self.nausea
       self.happiness > self.nausea ? "happy" : "sad"
    end
  end

  def num_of_rides
    self.attractions.count
  end
end
