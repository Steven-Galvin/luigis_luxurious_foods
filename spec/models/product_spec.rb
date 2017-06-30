require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :info }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :origin }
  it { should have_many :reviews }

  it "won't accept name length if less than 3 or greater than 25" do
    product = Product.new({:name => "a".*(2), info: "a".*(30), cost: 4, origin: "USA"})
    product2 = Product.new({:name => "a".*(26), info: "a".*(30), cost: 4, origin: "USA"})
    expect(product.save() && product2.save()).to(eq(false))
  end

it "accepts" do
  product3 = Product.new({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA"})
  expect(product3.save()).to(eq(true))
end

  it "won't accept info length if less than 25 or greater than 150" do
    product = Product.new({:info => "a".*(24), name: "a".*(15), cost: 4, origin: "USA"})
    product2 = Product.new({:info => "a".*(150), name: "a".*(15), cost: 4, origin: "USA"})
    product3 = Product.new({:info => "a".*(90), name: "a".*(15), cost: 4, origin: "USA"})
    expect(product.save() && product2.save()).to(eq(false))
    expect(product3.save()).to(eq(true))
  end
end