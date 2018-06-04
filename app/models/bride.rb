class Bride < ActiveRecord::Base
  has_many :bridesmaids
  has_many :dresses, through: :bridesmaids
end
