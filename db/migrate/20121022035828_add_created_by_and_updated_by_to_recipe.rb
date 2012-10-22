class AddCreatedByAndUpdatedByToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :created_by_id, :integer
    add_column :recipes, :updated_by_id, :integer
  end
end
