require 'rails_helper'

RSpec.describe "Team Index Page" do
  describe "When I visit the team index page" do
    it "I see the name and hometown of all Teams" do
      team_1 = Team.create!(nickname: "Rockies", hometown: "Denver")
      team_2 = Team.create!(nickname: "Dodgers", hometown: "Los Angeles")
      team_3 = Team.create!(nickname: "Aliens", hometown: "Mars")

      visit teams_path
      expect(page).to have_content(team_1.nickname)
      expect(page).to have_content(team_1.hometown)
      expect(page).to have_content(team_2.nickname)
      expect(page).to have_content(team_2.hometown)
      expect(page).to have_content(team_3.nickname)
      expect(page).to have_content(team_3.hometown)
    end

    it "under each team I see the names and ages of all its players" do
      team_1 = Team.create!(nickname: "Rockies", hometown: "Denver")
      team_2 = Team.create!(nickname: "Dodgers", hometown: "Los Angeles")
      player_a = Player.create!(name: "Wallace", age: 20, team_id: team_1.id)
      player_b = Player.create!(name: "Jim", age: 23, team_id: team_1.id)
      player_c = Player.create!(name: "Pete", age: 39, team_id: team_2.id)
      player_d = Player.create!(name: "Gary", age: 32, team_id: team_2.id)
      visit teams_path
        expect(page).to have_content(player_a.name)
        expect(page).to have_content(player_a.age)
        expect(page).to have_content(player_b.name)
        expect(page).to have_content(player_b.age)

        expect(page).to have_content(player_a.name)
        expect(page).to have_content(player_a.age)
        expect(page).to have_content(player_b.name)
        expect(page).to have_content(player_b.age)
    end
  end

end
