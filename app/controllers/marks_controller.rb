class MarksController < ApplicationController
  # load_and_authorize_resource
  before_action :set_mark, only: [:update, :destroy]
  before_action :authenticate_user!

  def index
    @marks = Mark.select('id, title, position_size').where(user_id: current_user.id)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @mark = Mark.new(mark_params)
    @mark.user = current_user
    @mark.position_size = '4,2,4,4'

    respond_to do |format|
      if @mark.save
        @marks = [@mark]
        format.js { render :index }
      else
        # format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.js { render nothing: true, status: :ok }
      else
        format.js { render :update, status: :unprocessable_entity }
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
    params.require(:mark).permit(:title, :type, :position_size)
  end
end
