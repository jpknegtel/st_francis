class PlayersController < ApplicationController

  def list
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @team = Team.all(params[:id])
    @player = Player.new(params[:player])
    if @player.save
      flash[:notice] = "Player Created"
      redirect_to(:action =>'list')
    else

      render('new')
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
     @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      flash[:notice] = "Player updated"
      redirect_to(:action =>'show', :id => @player.id)
    else
      render('edit')
    end
  end

  def delete
    @player = Player.find(params[:id])
  end

  def destroy
    @player = Player.destroy(params[:id])
    flash[:notice] = "Player deleted"
    redirect_to(:action =>'list')
  end

end
