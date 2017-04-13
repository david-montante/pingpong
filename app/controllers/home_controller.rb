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
    respond_to do |format|
      format.json { render :json => Game.all }
    end
  end
  
  def setGame
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
