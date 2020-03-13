class DashboardController < ApplicationController

  def index
    if params[:load_in].nil? || params.values.all? { |x| x.nil? }
      @load_in = LoadIn.new
    else
      @load_in = LoadIn.new(params[:load_in].permit(:status,:t1_customer_id, :arrival_date, :truck_nr, :trailer_nr,:type_of_service,:note, :in_assignments_attributes => [ :packer, :lot_nr, :incoming_order_ref, :other_ref]
      ) )
    end
    @in_assignment = InAssignment.new
    @packers = Packer.pluck(:packer_nr).uniq.sort
    scope_search_load_in

    if params[:load_out].nil? || params.values.all? { |x| x.nil? }
      @load_out = LoadOut.new
    else
      @load_out = LoadOut.new(params[:load_out].permit(:status,:t1_customer_id, :departure_date, :truck_nr, :trailer_nr,:type_of_service, :note, :out_assignments_attributes => [:lot_nr, :incoming_order_ref, :other_ref]
      ) )
    end
    @out_assignment = OutAssignment.new
  end

  # Load In and In assignement
  def scope_search_load_in
    @scope_search = ScopeSearchLoadIn.new(params)
    @load_ins = @scope_search.get_load
    @page = @scope_search.page
    @sort = @scope_search.sort
    @rows_per_page = @scope_search.rows_per_page
    @total_pages = @scope_search.total_pages
    @query = @scope_search.query
    @total_load_ins = @scope_search.total_load_ins
  end


  def search_load_in
    scope_search_load_in
  end

  def set_modal_load_in
    @load_in = LoadIn.find(params[:load_in])
    @in_assignment = InAssignment.new
  end

  def create_modal_in_assignment
    @in_assignment = InAssignment.new(in_assignment_params)
    @load_in = LoadIn.find(params[:load_in])
  end

  def edit_modal_in_assignment
    @in_assignment = InAssignment.find(params[:id])
  end


  # Load Out and Out assignement
  def scope_search_load_out
    @scope_search = ScopeSearchLoadOut.new(params)
    @load_outs = @scope_search.get_load
    @page = @scope_search.page
    @sort = @scope_search.sort
    @rows_per_page = @scope_search.rows_per_page
    @total_pages = @scope_search.total_pages
    @query = @scope_search.query
    @total_load_outs = @scope_search.total_load_outs
  end


  def search_load_out
    scope_search_load_out
  end

  def set_modal_load_out
    @load_out = LoadOut.find(params[:load_out])
    @out_assignment = OutAssignment.new
  end

  def create_modal_out_assignment
    @out_assignment = OutAssignment.new(out_assignment_params)
    @load_out = LoadOut.find(params[:load_out])
  end

  def edit_modal_out_assignment
    @out_assignment = OutAssignment.find(params[:id])
  end

  private

  def in_assignment_params
    params.permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number, :load_in_id)
  end

  def out_assignment_params
    params.permit(:lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number, :load_out_id)
  end
end
