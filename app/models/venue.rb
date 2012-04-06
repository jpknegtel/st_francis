class Venue < ActiveRecord::Base
  belongs_to :fixture

  validates :name, :presence => true, :length =>{:maximum =>25}

end
