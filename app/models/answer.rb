class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def time_format
      time = Time.at(self.created_at)
      time.to_formatted_s(:long)
  end

end
