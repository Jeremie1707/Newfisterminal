class InAssignmentsController < ApplicationController
before_action :set_load_in, only: [:create]
before_action :set_in_assignment, only: [:edit, :update, :destroy]

  def new
    @in_assignment = InAssignment.new
  end

  def create
    @in_assignment = InAssignment.new(strong_params)
    @in_assignment.load_in = @load_in
    respond_to do |format|
      if @in_assignment.save!
        format.html { redirect_to dashboard_index_path, success: 'Assignment was successfully created.' }
        format.js
        # format.json { render json: @in_assignment, status: :created, location: @in_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @in_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @in_assignment.update_attributes(strong_params)
    @load_in = LoadIn.find(@in_assignment.load_in_id)
    respond_to do |format|
      if @in_assignment.save!
        format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully updated.' }
        format.js
        # format.json { render json: @in_assignment, status: :updated, location: @in_assignment }
      else
        format.html { render action: "update" }
        format.json { render json: @in_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @in_assignment = InAssignment.find(params[:id])
    @load_in = LoadIn.find(@in_assignment.load_in_id)
    @in_assignment.destroy
    respond_to do |format|
    if @in_assignment.destroy!
      format.html { redirect_to dashboard_index_path, notice: 'Assignment was successfully deleted.'  }
      format.js
    else
        format.html { render action: "new" }
        format.json { render json: @in_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def strong_params
    params.require(:in_assignment).permit(:order_index, :packer, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet, :net_weight, :load_in_id)
  end

  def set_in_assignment
    @in_assignment = InAssignment.find(params[:id])
  end

  def set_load_in
    @load_in = LoadIn.find(params[:in_assignment][:load_in_id])
  end
end
