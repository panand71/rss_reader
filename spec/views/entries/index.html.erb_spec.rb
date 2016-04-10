require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(title: "Third Headline"),
      Entry.create!(title: "Fourth Headline")
    ])
  end

  it "renders a list of entries" do
    render
  end
end
