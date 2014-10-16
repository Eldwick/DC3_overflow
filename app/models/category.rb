class Category < ActiveRecord::Base
  has_and_belongs_to_many :questions
  scope :in_question, -> (question_ids) { joins(:questions).where("categories_questions.question_id IN (?)", question_ids) }

end
