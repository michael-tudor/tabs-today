class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def update
    if Workspace.update(workspace_params)
      render json: { status: :success }, status: :ok
    else
      # need to test
      # render 'shared/notification', locals: { item: @workspace }, status: :unprocessable_entity
    end
  end

  def token
    render json: { token: form_authenticity_token }, status: :ok
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :parent_id, :positions_and_sizes)
  end
end
