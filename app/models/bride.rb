class Bride < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :bridesmaids
  has_many :dresses, through: :bridesmaids
end
