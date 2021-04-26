class CompetitionsController < ApplicationController

  def show
    @competition = Competition.find(params[:id])
    @team_competitions = TeamCompetition.all
    @teams = Team.all
  end
end
