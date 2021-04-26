class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :teams, through: :team_competitions
end
