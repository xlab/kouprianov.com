###
# Blog settings
###

Time.zone = "Europe/Moscow"

activate :blog do |blog|
  blog.permalink = ":year/:month/:title.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
  blog.default_extension = ".md"
end

set :build_dir, "../public"
activate :i18n, :langs => [:en, :ru], :mount_at_root => false

set :markdown, :smartypants => true
set :markdown_engine, :kramdown

activate :gzip
activate :sprockets
activate :directory_indexes
page "/feed.xml", :layout => false
page "/ru/hello.html", :layout => "clean_layout"
page "/en/hello.html", :layout => "clean_layout"
page "/posts/*", :layout => "article_layout"
page "/paper/*", :layout => "clean_layout"
page "/plain/*", :layout => false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def smartypants dirty_html
    RubyPants.new(dirty_html).to_html
  end

  def explained_img img, explanation
    prefix = '/posts/' + caller[0].split(':').shift().split('/').pop().split('.').shift() + '/'
    <<-eos
<dl class="explained">
  <dt>#{image_tag(prefix + img)}</dt>
  <dd>#{explanation}</dd>
</dl>
eos
  end

  def zoom_img img, original, alt
    prefix = '/posts/' + caller[0].split(':').shift().split('/').pop().split('.').shift() + '/'
    <<-eos
<a class="fancybox" href="#{original}">
  #{image_tag(prefix + img, alt: alt, title: alt)}
</a>
eos
  end

  def explained_zoom_img img, original, explanation
    prefix = '/posts/' + caller[0].split(':').shift().split('/').pop().split('.').shift() + '/'
    <<-eos
<dl class="explained">
  <dt>
    <a class="fancybox" href="#{original}">
      #{image_tag(prefix + img, alt: explanation, title: explanation)}
    </a>
  </dt>
  <dd>#{explanation}</dd>
</dl>
eos
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html, :remove_http_protocol => false
  activate :favicon_maker

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
end

