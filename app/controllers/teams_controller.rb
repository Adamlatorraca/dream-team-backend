class TeamsController < ApplicationController
    def index
        teams = Team.all
        render json: teams, except: [:created_at, :updated_at]
    end

    def create
        team = Team.create(team_params)
        render json: team, except: [:created_at, :updated_at]
    end

    def show
        team = Team.find_by(id: params[:id])
        render json: team, include: [:players]
    end

    def destroy
        team = Team.find_by(id: params[:id])
        team.destroy
        render json: team
    end

private

    def team_params
        params.require(:team).permit(:name, :logo, :player_id)
    end
end