class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: { data: @tasks }
  end
end
