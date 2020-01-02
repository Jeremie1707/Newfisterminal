class InAssignmentsController < ApplicationController
before_action :set_in_assignment, only: [:update, :destroy]
before_action :set_load_in, only: [:create, :update, :destroy]

  def new
    @in_assignment = InAssignment.new
  end

  def create
    @in_assignment = InAssignment.new(strong_params)
    if @in_assignment.save!
      redirect_to dashboard_index_path
    else
       p "erreur"
    end
  end

  def update
    @in_assignment.update_attributes(strong_params)
    @n_assignment.save
    redirect_to dashboard_path
  end

  def destroy
  end

  private
  def strong_params
    params.require(:in_assignment).permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number)
  end

  def set_in_assignment
    @in_assignment = InAssignment.find(params[:id])
    p @in_assignment
  end

  def set_load_in
    @load_in = LoadIn.find(params[:id])
  end
end
