class CreateCategoriesQuestions < ActiveRecord::Migration
  def change
    create_table :categories_questions, id: false do |t|
      t.belongs_to :category
      t.belongs_to :question
    end
  end
end
