class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, :through => :player_teams
  has_many :fixtures

  validates :name, :presence => true, :length =>{:maximum =>25}
end