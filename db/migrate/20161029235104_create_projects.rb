class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :content
      t.boolean :funding
      t.string :creator

      t.timestamps
    end
  end
end
