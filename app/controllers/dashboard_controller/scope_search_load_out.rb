class DashboardController

  class ScopeSearchLoadOut < ScopeSearch
    attr_reader :load_outs, :total_load_outs, :parameters, :start_date, :end_date, :status, :t1_customer, :truck_nr, :trailer_nr, :type_of_service, :total_weight, :last_week

    def initialize(parameters = {}, current_user)
      super(parameters, current_user)
      @parameters = parameters
      @start_date = parameters[:start_date]
      @end_date = parameters[:end_date]
      @status = parameters[:status]
      @t1_customer = parameters[:t1_customer]
      @truck_nr = parameters[:truck_nr]
      @trailer_nr = parameters[:trailer_nr]
      @type_of_service = parameters[:type_of_service]
      @total_weight = parameters[:total_weight]
      @last_week = parameters[:last_week]

     if @user.admin == true
        @scope = load_out_filters.order(@sort)
      else
        @scope = load_out_filters.where("t1_customer_id = ?", @user.t1_customer_id).order(@sort)
      end
    end

    def scope
      @scope
    end

    def query_scope
     if @user.admin == true
        LoadOut.global_search(@query).order(@sort)
      else
        LoadOut.where("t1_customer_id = ?", @user.t1_customer_id).global_search(@query).order(@sort)
      end
    end

    def get_load
      super
      @total_load_outs =  @total_loads
      @total_load_out_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
      @load_outs =  @loads
    end

    def load_out_filters
    @load_outs_filtered = LoadOut.where(nil) # creates an anonymous scope
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_last_week if (@last_week.present?)
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_start_date(@start_date) if (@start_date.present?)
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_end_date(@end_date) if (@end_date.present?)
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_status(@status) if @status.present?
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_t1_customer(@t1_customer) if @t1_customer.present?
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_truck_nr(@truck_nr) if @truck_nr.present?
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_trailer_nr(@trailer_nr) if @trailer_nr.present?
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_type_of_service(@type_of_service) if @type_of_service.present?
    @load_outs_filtered = @load_outs_filtered.load_out_filter_by_total_weight(@total_weight) if @total_weight.present?
    @load_outs_filtered
    end
  end
end
