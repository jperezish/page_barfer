Gem::Specification.new do |s|
  s.name        = 'page_barfer'
  s.version     = '0.0.0'
  s.date        = '2013-11-09'
  s.summary     = "Barf out HTML files from your product catalog."
  s.description = "You have a product catalog and you'd like to use Jekyll to create a static site. You don't want this content to be in the Jekyll posts directory and treated as blog content. Awesome. Use page barfer to barf out all those pages as HTML."
  s.authors     = ["Jason Perez"]
  s.email       = 'jason@perezish.com'

  s.files       = %w[
    lib/catalog_addition.rb
    lib/page_addition.rb
    ]
  s.homepage    =
    'http://rubygems.org/gems/page_barfer'
  s.executables << 'page_barfer'
  s.license     = 'MIT'
end