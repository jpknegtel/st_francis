class TeamsController < ApplicationController

  def list
    @team = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice] = "Team Created"
      redirect_to(:action =>'list')
    else
      render('new')
    end
  end


end
