class ChangeTextTypeFromAnswer < ActiveRecord::Migration
  def change
    change_column :answers, :text, :text
  end
end
