class FixturesController < ApplicationController

  def list
    @fixture = Fixture.all
    @player = Player.all

    @teams = Team.all
    #@unpaid = Player.find(sub_paid=false)
  end

    def show
    @fixture = Fixture.find(params[:id])
  end

  def new
    @fixture = Fixture.new

  end

  def create

    @fixture = Fixture.new(params[:fixture])
    if @fixture.save
      @player = Player.find(params[:player_id])
      @fixture.player_fixtures << PlayerFixture.new(:sub_paid => params[:sub_paid], :player => @player)
      flash[:notice] = "Fixture Created"
      redirect_to(:action =>'list')
    else
      flash.now[:error] = "Could not save fixture. Please re-enter information"
      render('new')
    end
  end

  def edit
    @fixture = Fixture.find(params[:id])
  end

  def update
     @fixture = Fixture.find(params[:id])
    if @fixture.update_attributes(params[:fixture])
      flash[:notice] = "Fixture updated"
      redirect_to(:action =>'show', :id => @fixture.id)
    else
      render('edit')
    end
  end

  def delete
    @fixture = Fixture.find(params[:id])
  end

  def destroy
    @fixture = Fixture.destroy(params[:id])
    flash[:notice] = "Fixture deleted"
    redirect_to(:action =>'list')
  end


end
