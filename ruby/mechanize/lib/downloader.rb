require "rubygems"
require "bundler/setup"
require "mechanize"

# Step 1: Download googles image search page with a query
agent = Mechanize.new
page = agent.get("http://www.google.com/search?tbm=isch&q=#{ARGV[0]}")

# Step 2: Find all images
page.search("//div[@id='ImgCont']//img/@src").each_with_index do |file, index|
  # Step 3: Save images to disk
  agent.get(file).save_as("images/#{index}.jpg")
end
