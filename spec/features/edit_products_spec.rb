require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    product = Product.create({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA", id: 1})
    visit product_path(1)
    click_link 'Edit'
    fill_in 'Name', :with => 'Apples'
    fill_in 'Info', :with => 'These are some of the best apples on the market right now.'
    fill_in 'Cost', :with => '12'
    find('#product_origin').find(:xpath, 'option[2]').select_option
    click_on 'Update Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no information is entered" do
    product = Product.create({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA", id: 1})
    visit edit_product_path(1)
    fill_in 'Name', :with => ''
    fill_in 'Info', :with => ''
    fill_in 'Cost', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'errors'
  end
end
