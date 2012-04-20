class FixturesController < ApplicationController

  def list
    @fixtures = Fixture.all
    @players = Player.all

    @teams = Team.all
    @unpaid = player.find(sub_paid=false)
  end

    def show
    @fixtures = Fixture.find(params[:id])
  end

  def new
    @fixtures = Fixture.new

  end

  def create

    @fixtures = Fixture.new(params[:fixture])
    if @fixtures.save
      @player = Player.find(params[:player_id])
      @fixtures.player_fixtures << PlayerFixture.new(:sub_paid => params[:sub_paid], :player => @player)
      flash[:notice] = "Fixture Created"
      redirect_to(:action =>'list')
    else
      flash.now[:error] = "Could not save fixture. Please re-enter information"
      render('new')
    end
  end

  def edit
    @fixtures = Fixture.find(params[:id])
  end

  def update
     @fixtures = Fixture.find(params[:id])
    if @fixtures.update_attributes(params[:fixture])
      flash[:notice] = "Fixture updated"
      redirect_to(:action =>'show', :id => @fixtures.id)
    else
      render('edit')
    end
  end

  def delete
    @fixtures = Fixture.find(params[:id])
  end

  def destroy
    @fixtures = Fixture.destroy(params[:id])
    flash[:notice] = "Fixture deleted"
    redirect_to(:action =>'list')
  end


end
