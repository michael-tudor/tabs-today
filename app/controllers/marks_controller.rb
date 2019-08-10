class MarksController < ApplicationController
  # load_and_authorize_resource
  before_action :set_mark, only: [:update, :destroy]
  before_action :authenticate_user!

  def index
    @marks = Mark.select('id, title').where(user_id: current_user.id)
    workspace = current_user.get_default_workspace

    respond_to do |format|
      format.html do
        @workspace_id = workspace.id
      end
      format.js do
        @positions_and_sizes = workspace.positions_and_sizes_to_h
      end
    end
  end

  def create
    @mark = Mark.new(mark_params)
    @mark.user = current_user

    respond_to do |format|
      if @mark.save
        format.js do
          workspace = current_user.get_default_workspace
          @positions_and_sizes = workspace.positions_and_sizes_to_h

          render :index
        end
      else
        # need to test
        # format.js { render 'shared/notification', locals: { item: @mark }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.js { render nothing: true, status: :ok }
      else
        # need to test
        # format.js { render 'shared/notification', locals: { item: @mark }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mark.destroy

    respond_to do |format|
      format.js # Mark was successfully destroyed.
    end
  end

  private

  def set_mark
    @mark = Mark.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:title, :type)
  end
end
