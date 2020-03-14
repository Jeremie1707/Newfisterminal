class OutAssignmentsController < ApplicationController
before_action :set_load_out, only: [:create]
before_action :set_out_assignment, only: [:edit, :update, :destroy]

  def new
    @out_assignment = OutAssignment.new
  end

  def create
    @out_assignment = OutAssignment.new(strong_params)
    @out_assignment.load_out = @load_out

    respond_to do |format|
      if @out_assignment.save
        @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
        @load_out.save
        format.html { redirect_to dashboard_index_path, success: 'Assignment was successfully created.' }
        format.js
        # format.json { render json: @out_assignment, status: :created, location: @out_assignment }
      else
        # redirect_to dashboard_index_path, alert: @load_out.errors
      end
    end
  end

  def edit
  end

  def update
    @out_assignment.update_attributes(strong_params)
    @load_out = LoadOut.find(@out_assignment.load_out_id)
    respond_to do |format|
      if @out_assignment.save
        @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
        @load_out.save!
        format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully updated.' }
        format.js
        # format.json { render json: @out_assignment, status: :updated, location: @out_assignment }
      else
        format.html { render action: "update" }
        format.json { render json: @out_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @out_assignment = OutAssignment.find(params[:id])
    @load_out = LoadOut.find(@out_assignment.load_out_id)
    @out_assignment.destroy
    respond_to do |format|
    if @out_assignment.destroy!
      @load_out.total_weight = @load_out.out_assignments.sum(:net_weight)
      @load_out.save!
      format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully deleted.'  }
      format.js
    else
        format.html { render action: "new" }
        format.json { render json: @out_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def strong_params
    params.require(:out_assignment).permit(:order_index, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet, :net_weight,:cost, :div_cost, :load_out_id)
  end

  def set_out_assignment
    @out_assignment = OutAssignment.find(params[:id])
  end

  def set_load_out
    @load_out = LoadOut.find(params[:out_assignment][:load_out_id])
  end
end

