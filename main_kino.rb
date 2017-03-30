require '../kinogo/category'
require '../kinogo/film_info'
require '../kinogo/format'


comedy = Category.new('komedii')

com_pars = category_parser(comedy)

InfoFileGenerator.generate(com_pars, 'html')
