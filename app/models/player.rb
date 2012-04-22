 class Player < ActiveRecord::Base

  # Same thing has has_and_belongs_to_many
  has_many :player_teams
  has_many :teams, :through => :player_teams
  
  has_many :player_fixtures
  has_many :fixtures, :through => :player_fixtures

  email_regex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :first_name, :presence => true, :length =>{:maximum =>25}
  validates :last_name, :presence => true, :length =>{:maximum =>25}
  validates :email, :presence => true, :length =>{:maximum =>100}, :format => email_regex

   def full_name
     "#{first_name} #{last_name}"
   end
end