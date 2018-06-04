class Bridesmaid < ActiveRecord::Base
  belongs_to :bride
  belongs_to :dresses
end
