module ApplicationHelper
end

def markdown_filter(text)
  Kramdown::Document.new(text).to_html.html_safe
end

def social_security_format(nums, x)
  string = nums.to_s
  array_nums = string.split('')
  formatted_string = ''
  array_nums[0].to_s + array_nums[1].to_s + array_nums[2].to_s + x + array_nums[3].to_s + array_nums[4].to_s + x +  array_nums[5].to_s + array_nums[6].to_s + array_nums[7].to_s + array_nums[8].to_s
end

puts social_security_format(123456789, ' & ')