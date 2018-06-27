class Bridesmaid < ActiveRecord::Base
  validates :name, presence: true
  validates :dress_id, presence: true
  belongs_to :bride
  belongs_to :dress
end
