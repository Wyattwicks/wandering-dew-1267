class TeamCompetitionsController < ApplicationController

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.find_by nickname: params[:nickname]
    TeamCompetition.create!(competition_id: competition.id, team_id: team.id)
    redirect_to competition_path(competition)
  end
end
