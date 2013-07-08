class TodosController < ApplicationController
  respond_to :json # default to Active Model Serializers

  def index
    respond_with Todo.all
  end

  def show
    respond_with Todo.find(params[:id])
  end

  def create
    respond_with Todo.create(post_params)
  end

  def update
    respond_with Todo.update(params[:id],post_params)
  end

  def destroy
    respond_with Todo.destroy(params[:id])
  end

  private
  def post_params
    params.require(:todo).permit(:title, :is_completed) # allow only these for now
  end
end
