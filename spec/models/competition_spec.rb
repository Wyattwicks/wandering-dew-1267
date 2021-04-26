require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "relationships" do
    it {should have_many :teams}
    it {should have_many :team_competitions}
    it {should have_many :players}
  end

  describe "instance methods" do
    describe '#average_player_age' do
      it "returns the average age of all players in a competition" do
        @competition_1 = Competition.create!(name: "grand open", location: "chicago", sport: "hockey")
        @team_1 = Team.create!(nickname: "Rockies", hometown: "Denver")
        @team_2 = Team.create!(nickname: "Dodgers", hometown: "Los Angeles")
        TeamCompetition.create!(team_id: @team_1.id, competition_id: @competition_1.id)
        TeamCompetition.create!(team_id: @team_2.id, competition_id: @competition_1.id)
        player_a = Player.create!(name: "Wallace", age: 20, team_id: @team_1.id)
        player_b = Player.create!(name: "Jim", age: 20, team_id: @team_1.id)
        player_c = Player.create!(name: "Pete", age: 30, team_id: @team_2.id)
        player_d = Player.create!(name: "Gary", age: 30, team_id: @team_2.id)
        expect(@competition_1.average_player_age).to eq(25)
      end
    end
  end


end
