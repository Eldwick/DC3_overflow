class Question < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  scope :status, -> (status) { where status: status }
  scope :user_id, -> (user_id) { where user_id: user_id }

  def self.category_filer(category_ids)
    categories = Category.find(category_ids)
    select{ |question| !(question.categories & categories).empty? }
  end
end
