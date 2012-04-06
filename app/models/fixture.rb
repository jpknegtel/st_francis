class Fixture < ActiveRecord::Base
  belongs_to :team
  has_many :player_fixtures
  has_many :players, :through => :player_fixtures
  has_one :venue

  validates :opposition, :presence => true, :length =>{:maximum =>25}

end
