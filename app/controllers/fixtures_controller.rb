class FixturesController < ApplicationController

  def list
    @fixtures = Fixture.all
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
      flash[:notice] = "Fixture Created"
      redirect_to(:action =>'list')
    else
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
      redirect_to(:action =>'show', :id => @fixture.id)
    else
      render('edit')
    end
  end

  def delete
    @fixtures = Fixture.find(params[:id])
  end

  def destroy
    @fixture = Fixture.destroy(params[:id])
    flash[:notice] = "Fixture deleted"
    redirect_to(:action =>'list')
  end


end
