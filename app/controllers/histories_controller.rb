class HistoriesController < ApplicationController
  def show
    @history = History.find(params[:history_id])
  end
end
