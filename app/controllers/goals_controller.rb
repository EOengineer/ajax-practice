class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save

        format.html { redirect_to @goal, flash[:notice] = 'Success!'}
        format.json { render json:
          { location: url_for(controller: 'goals', action: 'show', id: @goal.id),
            flash: { notice: "goal successfully created." } } }

      else

        format.html { render 'new'}
        format.json { render json: @goal.errors, status: 422 }

      end
    end
  end


  def show
    @goal = Goal.find(params[:id])
  end

private

  def goal_params
    params.require(:goal).permit(:title, :details, :difficulty)
  end
end
