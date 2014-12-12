class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.references :task
    	t.references :user
    	t.decimal :score, default: 0
    end
  end
end