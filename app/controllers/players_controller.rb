class PlayersController < ApplicationController
  def list
    @players = Player.all
  end
end
