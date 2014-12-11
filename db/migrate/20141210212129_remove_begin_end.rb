class RemoveBeginEnd < ActiveRecord::Migration
  def change
  	remove_column :tasks, :begin
  	remove_column :tasks, :end
  end
end
