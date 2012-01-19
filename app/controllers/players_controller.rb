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
    @player = Player.new(params[:player])
    if @player.save
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
      redirect_to(:action =>'show', :id => @player.id)
    else
      render('edit')
    end
  end
end
