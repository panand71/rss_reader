require 'rails_helper'

# RSpec.describe Favorite, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Favorite do
  it "should not contain duplicate entries" do
    Favorite.create!(user_id: 1, entry_id: 1)
    duplicate_favorite = Favorite.new(user_id: 1, entry_id: 1)
    duplicate_favorite.should_not be_valid\
  end
end