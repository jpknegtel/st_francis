class FixturesController < ApplicationController

  def list
    @fixture = Fixture.all
    @player = Player.all
    @venue = Venue.all
    @teams = Team.all
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
      flash[:notice] = "Fixture Created"
      redirect_to(:action =>'list')
      #sets all weeky sub payers to false on
      params[:fixture][:player_ids].each do |sub|
               unless sub.blank?
                 if @player.subscription_id == '1'
                   @fixture.player_fixtures.build(:fixtures_id => @fixture.id, :player_ids => @player.id, :sub_paid => false)
                  elseif  @player.subscription_id == '3'
                   @fixture.player_fixtures.build(:fixtures_id => @fixture.id, :player_ids => @player.id, :sub_paid => true)
                  end
               end
            end
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
