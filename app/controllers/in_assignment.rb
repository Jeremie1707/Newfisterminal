class LoadInsController < ApplicationController

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

  private
  def strong_params
    params.require(:assignment_in).permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number)
  end
end

