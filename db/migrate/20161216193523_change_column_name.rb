class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :likes, :bright_ideas_id, :idea_id
  end
end
