class AddAnswerToReplies < ActiveRecord::Migration
  def change
  	add_column :replies, :answer, :text
  end
end
