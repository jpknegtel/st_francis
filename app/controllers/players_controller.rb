class PlayersController < ApplicationController

  def list
    @player = Player.all

  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      PlayerMailer.welcome_email(@player).deliver

      flash[:notice] = "Player Created"
      redirect_to(:action =>'list')
    else
      flash[:error] = "Something was wrong. Try again!"
      render('new')
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    params[:player][:team_ids] ||= []
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
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Player deleted"
    redirect_to(:action =>'list')
  end

end
