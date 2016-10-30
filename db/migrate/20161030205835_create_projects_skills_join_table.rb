class CreateProjectsSkillsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :skills do |t|
      t.references :project, foreign_key: true
      t.references :skill, foreign_key: true
    end
  end
end
