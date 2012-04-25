 class Player < ActiveRecord::Base

  # Same thing has has_and_belongs_to_many however richer
  has_many :player_teams
  has_many :teams, :through => :player_teams
  
  has_many :player_fixtures
  has_many :fixtures, :through => :player_fixtures

  has_one :subscription


  #Validations that are used to check data is valid
  #E.G. Vaild data is allowed though and incorrect data gives an error, all checks uniqueness

  email_regex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_uniqueness_of :last_name
  validates_uniqueness_of :email

  validates :first_name, :presence => true, :length =>{:maximum =>25}
  validates :last_name, :presence => true, :length =>{:maximum =>25}
  validates :phone_no, :presence => true, :numericality => { :only_integer => true }, :length =>{:minimum => 11, :maximum =>11}
  validates :email, :presence => true, :length =>{:maximum =>100}, :format => email_regex

  accepts_nested_attributes_for :fixtures

   def full_name
     "#{first_name} #{last_name}"
   end
end