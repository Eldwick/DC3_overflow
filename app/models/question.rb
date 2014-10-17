class Question < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  scope :status, -> (status) { where status: status }
  scope :user_id, -> (user_id) { where user_id: user_id }
  # scope :in_category, -> (category_id) { joins(:categories).where(Category.arel_table[:id].in(category_id).or(CategoryQuestion.arel_table[:category_id].in(category_id))).uniq}
  scope :in_category, -> (category_ids) { joins(:categories).where("categories_questions.category_id IN (?)", category_ids).uniq }
  scope :search, -> (search) {where("lower(text) like ? OR lower(subject) like ?", "%#{search.downcase}%", "%#{search.downcase}%").uniq}
  
  def time_format
      time = Time.at(self.created_at)
      time.to_formatted_s(:long)
  end
  
end
