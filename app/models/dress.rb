class Dress < ActiveRecord::Base
  has_many :bridesmaids
  has_many :brides, through: :bridesmaids
end
