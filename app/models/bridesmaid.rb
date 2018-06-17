class Bridesmaid < ActiveRecord::Base
  belongs_to :bride
  belongs_to :dress
end
