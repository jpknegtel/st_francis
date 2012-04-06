class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :fixtures

  validates :name, :presence => true, :length =>{:maximum =>25}
end
