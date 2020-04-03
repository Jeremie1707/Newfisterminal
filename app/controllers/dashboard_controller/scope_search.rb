class DashboardController
  class ScopeSearch

    attr_accessor  :page, :sort, :rows_per_page, :total_pages,:total_loads,:loads, :query


    def initialize(parameters = {}, current_user)
      @page = parameters[:page] || 1
      @rows_per_page = parameters[:rows_per_page] || 10
      @sort = protect_sort(parameters[:sort]) || 'id DESC'
      @query = parameters[:query] || ''
      @user = current_user

    end

    def get_load
      pagination
        if @query.blank?
          @loads = scope[@range_index]
        else !@query.blank?
          @scope = query_scope
          @loads = scope[@range_index]
        end
        @total_loads = scope.size
        @total_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
        @loads
    end

    private

    def scope
      self.class.scope
    end

    def query_scope
      self.class.query_scope
    end


    def pagination
      page = @page.to_i
      rows_per_page = @rows_per_page.to_i
      @index = (page - 1) * rows_per_page
      @range_index = @index..@index + rows_per_page - 1
    end

    def protect_sort(parameter)
      order_mappings = {
      'truck_nr_asc'  => 'truck_nr ASC',
      'truck_nr_desc' => 'truck_nr DESC',
      'trip_ref_asc'  => 'trip_ref ASC',
      'trip_ref_desc' => 'trip_ref DESC',
      'trailer_nr_asc'   => 'trailer_nr ASC',
      'trailer_nr_desc'  => 'trailer_nr DESC',
      'total_weight_asc'   => 'total_weight ASC',
      'total_weight_desc'  => 'total_weight DESC',
      'status_asc'   => 'status ASC',
      'status_desc'  => 'status DESC',
      'type_of_service_asc'   => 'type_of_service ASC',
      'type_of_service_desc'  => 'type_of_service DESC',
      'arrival_date_asc'   => 'arrival_date ASC',
      'arrival_date_desc'  => 'arrival_date DESC',
      'reference_asc'   => 'reference ASC',
      'reference_desc'  => 'reference DESC',
    }
      if order_mappings.has_key?(parameter)
        order = order_mappings[parameter]
      elsif order_mappings.has_value?(parameter)
        order = parameter
      end
      order
    end

  end
end
