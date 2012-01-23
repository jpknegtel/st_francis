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

  def edit
    @team = Team.find(params[:id])
  end

  def update
     @team = Team.find(params[:id])
    if @team.update_attributes(params[:player])
      flash[:notice] = "Team  updated"
      redirect_to(:action =>'show', :id => @team.id)
    else
      render('edit')
    end
  end

  def delete
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.destroy(params[:id])
    flash[:notice] = "Team deleted"
    redirect_to(:action =>'list')
  end


end
