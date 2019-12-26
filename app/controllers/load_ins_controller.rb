class LoadInsController < ApplicationController

  def new
    @load_in = LoadIn.new
  end

  def create
    p "hello strong params"
    p strong_params
    @load_in = LoadIn.new(strong_params)
    p @load_in
    if @load_in.save!
      redirect_to dashboard_index_path
    else
       p "erreur"
    end
  end

  private

  def strong_params
    params.require(:load_in).permit(
    :t1_customer_id, :status, :arrival_date, :truck_nr, :trailer_nr, :type_of_service, :in_assignments_attributes => [ :packer_id, :lot_nr, :incoming_order_ref, :other_ref]
  )
  end
end
