class AddStatusToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :status, :boolean
  end
end
