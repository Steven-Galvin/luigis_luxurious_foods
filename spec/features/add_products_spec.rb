require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Apples'
    fill_in 'Info', :with => 'These are some of the best apples on the market right now.'
    fill_in 'Cost', :with => '12'
    find('#product_origin').find(:xpath, 'option[2]').select_option
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no information is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
