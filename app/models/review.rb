class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :content, :rating, :presence => true

# SPENT TWO HOURS TRYING TO GET THESE TO PASS. CANT FIND ANYTHING THAT SHOWS WHAT I'M DOING WRONG HERE


#   before_save :downcase_content, :capitalize_author
#
# private
#   define_method(:downcase_content) do
#     self.content=(content().downcase())
#   end
#
#   define_method(:capitalize_author) do
#     letters = ""
#     names = self.author.split(" ")
#     self.author = names.collect do |name|
#       letters = name.split("")
#       letters.first.upcase!
#       letters.join
#     end
#     self.author.join(" ")
#   end
end
