class DashboardController < ApplicationController
  # DEFAULT_ROWS_PER_PAGE = 5
  # DEFAULT_SORT = 'id DESC'

  def index
    if params[:load_in].nil? || params.values.all? { |x| x.nil? }
      @load_in = LoadIn.new
    else
      @load_in = LoadIn.new(params[:load_in].permit(:status,:t1_customer_id, :arrival_date, :truck_nr, :trailer_nr,:type_of_service,:note, :in_assignments_attributes => [ :packer, :lot_nr, :incoming_order_ref, :other_ref]
      ) )
    end
    @in_assignment = InAssignment.new
    session[:search] = nil
    @packers = Packer.pluck(:packer_nr).uniq.sort


    scope_search
  end

  def scope_search
    @search = ScopeSearch.new(params, session)
    @load_ins = @search.load_ins
    @page = @search.page
    @sort = @search.sort
    @rows_per_page = @search.rows_per_page
    @total_pages = @search.total_pages
    @query = @search.query

  end


  def set_sort
    scope_search
  end

  def set_page
    scope_search
  end

  def set_rows
    scope_search
  end


  def search
    # ESSAYER DE MEMORISE LES LOADINS DANS LA SESSION (commencé ligne)
    # @sort = session[:sort]
    # @rows_per_page = session[:rows_per_page]
    session[:search] = nil
    # @page = 1
    # @search = params[:query]
    # @session_search = session[:search]
    # get_load_ins
    scope_search
    p "hello #{scope_search}"
  end



  def set_modal
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

  private

  def in_assignment_params
    params.permit(:packer, :lot_nr, :incoming_order_ref, :other_ref, :boxe_number, :pallet_number, :load_in_id)
  end


end
