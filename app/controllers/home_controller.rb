class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def history
  end
  
  def users
    respond_to do |format|
      format.json { render :json => User.all }
    end
  end
  
  def games
    #TODO obtain the resulting table
    games = {rank: 1, name: "juan", score:1800, games: 3},
            {rank: 2, name: "pablo", score:800, games: 2},
            {rank: 3, name: "marco", score:700, games: 1}
    respond_to do |format|
      format.json { render :json => games }
    end
  end
  
  def history_games
    #TODO obtain history from session user
    respond_to do |format|
      format.json { render :json => Game.all }
    end
  end
  
  def setGame
    #TODO link the game to the session user
    @game = Game.new
    @game.opponent_id = User.find_by(email: params[:opponent]).id
    @game.date_played = params[:date_played]
    @game.score = params[:score]
    @game.opponent_score = params[:opponent_score]
    @game.save()
    render json: params
  end

  def log
  end
end
