require '../kinogo/parser'

class Category

  attr_reader :category_url, :category_pages

  def initialize(category)
    @category_url = "http://kinogo.club/#{category}/"
    @parsed_content = get_parsed_content(@category_url)
    @category_pages = get_category_pages
  end

  def get_category_pages
    pages = @parsed_content.xpath('//div[@class="bot-navigation"]/a/text()')[-2]
    (pages.to_s).to_i
  end

end


