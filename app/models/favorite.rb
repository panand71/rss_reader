class Favorite < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :entry

  validates :entry_id, uniqueness: { scope: :user_id }
end
