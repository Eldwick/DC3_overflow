class Question < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  scope :status, -> (status) { where status: status }
  scope :user_id, -> (user_id) { where user_id: user_id }
  scope :in_category, -> (category_id) { joins(:categories).where('categories.id = ?', category_id)}  
  

end
