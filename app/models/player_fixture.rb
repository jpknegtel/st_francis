class PlayerFixture < ActiveRecord::Base
  belongs_to :player
  belongs_to :fixture
end
