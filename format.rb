require 'json'

class HtmlSave
  def save_as(data=[])
    File.open("test.html", "w") do |f|
      for item in data
        f.write "<div class='film-info'>"
        f.write "<div class='film-title'>#{item.title} - #{item.rating}</div>"
        f.write "<div class='film-description'>"
        f.write "<div class='film-desc-img'><img src='#{item.desc_image}' /></div>"
        f.write "<div class='film-desc-text'><p>#{item.description}</p></div>"
        f.write '</div>'
        f.write '</div>'
      end
    end
  end
end

class JsonSave
  def save_as(data=[])
    data_hash = {}
    for item in data
      data_hash[item.title] = {rating: item.rating, title: item.title,
                               description: item.description, image: item.desc_image }
    end
    File.open("test.json", "w") do |f|
      f.write JSON.dump(data_hash)
    end
  end
end

class DataType
  def self.for(type)
    case type
      when 'html'
        HtmlSave.new
      when 'json'
        JsonSave.new
      else
        raise "Invalid format"
    end
  end
end

class InfoFileGenerator
  def self.generate(data, type)
    DataType.for(type).save_as(data)
  end
end