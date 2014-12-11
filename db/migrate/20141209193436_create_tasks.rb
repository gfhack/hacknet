class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :title
    	t.text :text
    	t.date :begin
    	t.date :end
    end
  end
end
