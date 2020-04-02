class DashboardController < ApplicationController

  def index
    @in_assignment = InAssignment.new
    @out_assignment = OutAssignment.new
    @packers = Packer.pluck(:packer_nr).uniq.sort

    if params[:load_in].nil? || params.values.all? { |x| x.nil? }
      @load_in = LoadIn.new
    else

      @load_in = LoadIn.new(params[:load_in].permit(:status,
                                                    :t1_customer_id,
                                                    :arrival_date,
                                                    :truck_nr,
                                                    :trailer_nr,
                                                    :type_of_service,
                                                    :note,
                                                    :in_assignments_attributes => [ :packer,
                                                                                    :number_of_boxe,
                                                                                    :number_of_pallet,
                                                                                    :net_weight,
                                                                                    :lot_nr,
                                                                                    :incoming_order_ref,
                                                                                    :other_ref]))
    end

    if params[:load_out].nil? || params.values.all? { |x| x.nil? }
      @load_out = LoadOut.new
    else
      @load_out = LoadOut.new(params[:load_out].permit(:status,
                                                       :t1_customer_id,
                                                       :departure_date,
                                                       :truck_nr,
                                                       :trailer_nr,
                                                       :type_of_service,
                                                       :note,
                                                       :out_assignments_attributes => [:packer,
                                                                                       :number_of_boxe,
                                                                                       :number_of_pallet,
                                                                                       :net_weight,
                                                                                       :lot_nr,
                                                                                       :incoming_order_ref,
                                                                                       :other_ref]))
    end


  scope_search_load_in
  scope_search_load_out
  end

  # Load In and In assignement
  def scope_search_load_in
    @scope_search = ScopeSearchLoadIn.new(params, current_user)
    @load_ins = @scope_search.get_load
    @page = @scope_search.page
    @sort = @scope_search.sort
    @rows_per_page = @scope_search.rows_per_page
    @total_load_in_pages = @scope_search.total_pages
    @query = @scope_search.query
    @total_load_ins = @scope_search.total_load_ins
    @start_date = @scope_search.start_date
    @end_date =  @scope_search.end_date
    @status = @scope_search.status
    @t1_customer = @scope_search.t1_customer
    @truck_nr = @scope_search.truck_nr
    @trailer_nr = @scope_search.trailer_nr
    @type_of_service = @scope_search.type_of_service
    @total_weight = @scope_search.total_weight
    @last_week = @scope_search.last_week

  end


  def search_load_in
    scope_search_load_in
  end

  def clear_search_load_in
      scope_search_load_in
  end

  def set_modal_load_in
    @load_in = LoadIn.find(params[:load_in])
    @in_assignment = InAssignment.new
  end

  def create_modal_in_assignment
    @in_assignment = InAssignment.new(in_assignment_params)
    @load_in = LoadIn.find(params[:load_in])
    @packers = Packer.pluck(:packer_nr).uniq.sort
  end

  def edit_modal_in_assignment
    @in_assignment = InAssignment.find(params[:id])
    @packers = Packer.pluck(:packer_nr).uniq.sort
  end


  # Load Out and Out assignement
  def scope_search_load_out
    @scope_search = ScopeSearchLoadOut.new(params, current_user)
    @load_outs = @scope_search.get_load
    @page = @scope_search.page
    @sort = @scope_search.sort
    @rows_per_page = @scope_search.rows_per_page
    @total_load_out_pages = @scope_search.total_pages
    @query = @scope_search.query
    @total_load_outs = @scope_search.total_load_outs
    @start_date = @scope_search.start_date
    @end_date =  @scope_search.end_date
    @status = @scope_search.status
    @t1_customer = @scope_search.t1_customer
    @truck_nr = @scope_search.truck_nr
    @trailer_nr = @scope_search.trailer_nr
    @type_of_service = @scope_search.type_of_service
    @total_weight = @scope_search.total_weight
    @last_week = @scope_search.last_week
  end


  def search_load_out
    scope_search_load_out
  end

  def clear_search_load_out
      scope_search_load_out
  end

  def set_modal_load_out
    @load_out = LoadOut.find(params[:load_out])
    @out_assignment = OutAssignment.new
  end

  def create_modal_out_assignment
    @packers = Packer.pluck(:packer_nr).uniq.sort
    @out_assignment = OutAssignment.new(out_assignment_params)
    @load_out = LoadOut.find(params[:load_out])
  end

  def edit_modal_out_assignment
    @packers = Packer.pluck(:packer_nr).uniq.sort
    @out_assignment = OutAssignment.find(params[:id])
  end

  private

  def in_assignment_params
    params.permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet,:net_weight, :load_in_id)
  end

  def out_assignment_params
    params.permit(:packer,:lot_nr, :incoming_order_ref, :other_ref, :number_of_boxe, :number_of_pallet,:net_weight, :load_out_id)
  end
end
