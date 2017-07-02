require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    product = Product.create({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA", id: 1})
    visit product_path(1)
    click_link 'Add New Review'
    fill_in 'Author', :with => 'Steven Galvin'
    fill_in 'Content', :with => 'These are some of the best apples on the market right now.'
    find('#review_rating').find(:xpath, 'option[4]').select_option
    click_on 'Create Review'
    expect(page).to have_content 'Reviews'
  end

  it "gives error when no information is entered" do
    product = Product.create({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA", id: 1})
    visit new_product_review_path(1)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
