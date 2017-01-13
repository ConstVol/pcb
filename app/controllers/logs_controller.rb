class LogsController < ApplicationController
  def index
    @logs = Log.all
  end
  def show
    @logs = Log.find(params[:id])
  end
end
