class AddCommentColumn < ActiveRecord::Migration
  def change
    add_column :products, :comment_id, :integer
  end
end
