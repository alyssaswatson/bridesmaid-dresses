class Bride < ActiveRecord::Base
  validates :name, presence: true
  #validates :password, presence: true
  #validates :grooms_name, presence: true
  #validates :name, uniqueness: true
  has_secure_password
  has_many :bridesmaids
  has_many :dresses, through: :bridesmaids
end
