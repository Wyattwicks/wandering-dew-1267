require 'rails_helper'

RSpec.describe "Competition Show Page" do
  describe "When I visit a competition show page" do
    before :each do
      @competition_1 = Competition.create!(name: "grand open", location: "chicago", sport: "hockey")
      @competition_2 = Competition.create!(name: "sports comp", location: "california", sport: "baseball")
      @team_1 = Team.create!(nickname: "Rockies", hometown: "Denver")
      @team_2 = Team.create!(nickname: "Dodgers", hometown: "Los Angeles")
      @team_3 = Team.create!(nickname: "Aliens", hometown: "Mars")
      @team_4 = Team.create!(nickname: "The Fish", hometown: "Atlantic City")
      TeamCompetition.create!(team_id: @team_1.id, competition_id: @competition_1.id)
      TeamCompetition.create!(team_id: @team_2.id, competition_id: @competition_1.id)
      TeamCompetition.create!(team_id: @team_3.id, competition_id: @competition_1.id)
      TeamCompetition.create!(team_id: @team_4.id, competition_id: @competition_2.id)

      visit competition_path(@competition_1)
    end

    it "I see the competition's name, location, and sport" do
      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_1.location)
      expect(page).to have_content(@competition_1.sport)
      expect(page).to_not have_content(@competition_2.name)
    end

    it "I see the name and hometown of all teams in this competition" do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_3.nickname)
      expect(page).to have_content(@team_3.hometown)

      expect(page).to_not have_content(@team_4.nickname)
      expect(page).to_not have_content(@team_4.hometown)
    end

    it "I see the average age of all players in the competition" do
      competition_1 = Competition.create!(name: "grand open", location: "chicago", sport: "hockey")
      team_1 = Team.create!(nickname: "Rockies", hometown: "Denver")
      team_2 = Team.create!(nickname: "Dodgers", hometown: "Los Angeles")
      TeamCompetition.create!(team_id: team_1.id, competition_id: competition_1.id)
      TeamCompetition.create!(team_id: team_2.id, competition_id: competition_1.id)
      player_a = Player.create!(name: "Wallace", age: 20, team_id: team_1.id)
      player_b = Player.create!(name: "Jim", age: 20, team_id: team_1.id)
      player_c = Player.create!(name: "Pete", age: 30, team_id: team_2.id)
      player_d = Player.create!(name: "Gary", age: 30, team_id: team_2.id)
      visit competition_path(competition_1)

      expect(page).to have_content(25)
    end

    it "I see a text field to add an existing team to a competition" do
      expect(page).to have_content("Nickname:")
      expect(page).to_not have_content(@team_4.nickname)
      within("#add-team") do
        fill_in "nickname", with: "The Fish"
        click_on "Add Team"
      end
      expect(page).to have_content(@team_4.nickname)
      expect(current_path).to eq(competition_path(@competition_1))
    end

  end
end
