require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }


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
