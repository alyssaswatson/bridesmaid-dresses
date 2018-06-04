class Bridesmaid < ActiveRecord::Base
  belongs_to :bride
  has_many :dresses
end
