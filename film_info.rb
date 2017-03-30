class FilmInfo
  attr_reader :title, :link, :rating, :description, :desc_image

  def initialize(title, link, rating, description, desc_image)
    @title = title
    @link = link
    @rating = rating
    @description = description
    @desc_image = desc_image
  end

end