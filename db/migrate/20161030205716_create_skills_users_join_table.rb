class CreateSkillsUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :skills, :users do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
