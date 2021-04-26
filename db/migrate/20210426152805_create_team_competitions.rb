class CreateTeamCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :team_competitions do |t|
      t.references :team, foreign_key: true
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
