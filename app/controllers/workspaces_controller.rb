class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:update, :destroy]
  before_action :authenticate_user!

  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.js { render nothing: true, status: :ok }
      else
        # need to test
        # format.js { render 'shared/notification', locals: { item: @workspace }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_workspace
    @workspace = workspace.find(params[:id])
  end

  def workspace_params
    params.require(:workspace).permit(:name, :parent_id, :positions_and_sizes)
  end
end
