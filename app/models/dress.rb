class Dress < ActiveRecord::Base
  has_many :bridesmaids
  has_many :brides, through: :bridesmaids
  validates :link, presence: true
  validates :material, presence: true
  validates :length, presence: true
  validates_numericality_of :length, :on => :create
  accepts_nested_attributes_for :bridesmaids
end
