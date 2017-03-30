require 'open-uri'
require 'nokogiri'

def get_parsed_content(url)
  document = open(url)
  content = document.read.force_encoding("cp1251").encode("utf-8", undef: :replace)
  Nokogiri::HTML(content)
end

def category_parser(category_obj)
  page = 1
  @films = []

  # category_obj.category_pages   - -- replace --- 3
  for films in page..3
    base_url = "#{category_obj.category_url}page/#{page.to_s}/"
    img_url = 'http://kinogo.club'
    parsed_content = get_parsed_content(base_url)
    films_in_page = parsed_content.xpath("//div[@class='shortstory']")

    for film in films_in_page
        title = (film.xpath("div[@class='shortstorytitle']/h2/a/text()")).to_s
        link = (film.xpath("div[@class='shortstorytitle']/h2/a/@href")).to_s
        rating = (film.xpath("div[@class='shortstorytitle']/..//ul/li[@class='current-rating']/text()")).to_s
        description = (film.xpath("div[@class='shortimg']/div/text()[1]")).to_s
        desc_img = (img_url + (film.xpath("div[@class='shortimg']/div/a/img/@src").to_s))

        @films << FilmInfo.new(title, link, rating, description, desc_img)
    end

    page += 1
  end

  return @films
end

