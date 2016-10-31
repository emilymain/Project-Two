class RemoveCreatorFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :creator, :string
    add_column :projects, :creator, :integer 
  end
end
