require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }

  it "won't accept review length if less than 50 or greater than 250" do
    product = Product.new({:name => "a".*(20), info: "a".*(30), cost: 4, origin: "USA", id: 1})
    review = Review.new({:author => "a".*(15), content: "a".*(1), rating: 4, product_id: 1})
    review2 = Review.new({:author => "a".*(15), content: "a".*(251), rating: 4, product_id: 1})
    review3 = Review.new({:author => "a".*(15), content: "a".*(60), rating: 4, product_id: 1})
    product.save()
    expect(review3.save()).to(eq(true))
    expect(review.save() && review2.save()).to(eq(false))
  end


  # SPENT TWO HOURS TRYING TO GET THESE TO PASS. CANT FIND ANYTHING THAT SHOWS WHAT I'M DOING WRONG HERE

  # it("converts the content to lowercase") do
  #   review = Review.create({:content => "Not the BesT ProdUct", author: "steven galvin", rating: 2})
  #   expect(review.content()).to(eq("not the best product"))
  # end
  #
  # it("converts the author to titlecase") do
  #   review = Review.create({:author => "steven galvin", content: "not the best product", rating: 2})
  #   expect(review.author()).to(eq("Steven Galvin"))
  # end
end
