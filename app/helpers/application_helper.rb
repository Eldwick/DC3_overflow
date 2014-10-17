module ApplicationHelper
end

def markdown_filter(text)
  Kramdown::Document.new(text).to_html.html_safe
end