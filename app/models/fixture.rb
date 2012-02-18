class Fixture < ActiveRecord::Base
  belongs_to :team
  has_many :players, :through => :player_fixtures
  has_one :venue
end
