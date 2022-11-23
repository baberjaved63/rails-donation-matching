class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = current_user.matches.build
  end

  def create
    @match = current_user.matches.build(matche_params)

    redirect_to matches_path and return if @match.save

    render :new
  end

  private

  def match_params
    params.require(:match).permit(:match_type, :end_date, :pledge_limit, :pledge_amount)
  end
end
