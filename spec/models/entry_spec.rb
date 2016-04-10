require 'rails_helper'

# RSpec.describe Entry, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Entry do

  let!(:entry_1) { FactoryGirl.create(:entry) }
  it "should not contain duplicate entries" do
    Entry.create!(title: "New headline")
    duplicate_entry = Entry.new(title: "New headline")
    duplicate_entry.should_not be_valid
  end
end