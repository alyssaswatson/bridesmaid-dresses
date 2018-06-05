class Bride < ActiveRecord::Base
  has_secure_password
  has_many :bridesmaids
  has_many :dresses, through: :bridesmaids
end
