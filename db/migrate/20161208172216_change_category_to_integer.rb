class ChangeCategoryToInteger < ActiveRecord::Migration
  def change
    remove_column(:products, :category, :string)
    add_column(:products, :category_id, :integer)
  end
end
