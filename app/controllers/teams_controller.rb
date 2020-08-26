class TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams.to_json
    end

    def show
        team = Team.find_by(id: params[:id])
        render json: team.players.to_json
    end
end