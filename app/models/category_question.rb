class CategoryQuestion < ActiveRecord::Base
  self.table_name = 'categories_questions'
  belongs_to :category
  belongs_to :question

end