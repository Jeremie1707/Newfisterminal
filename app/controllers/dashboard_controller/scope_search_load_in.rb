class DashboardController

  class ScopeSearchLoadIn < ScopeSearch
    attr_reader :load_ins, :total_load_ins

    def initialize(parameters = {}, current_user)
      super(parameters, current_user)
      if @user.admin == true
        @scope = parameters[:scope] || LoadIn.all.order(@sort)
      else
        @scope = parameters[:scope] || LoadIn.where("t1_customer_id = ?", @user.t1_customer_id).order(@sort)
      end
    end

    def scope
      @scope
    end

    def query_scope
      if @user.admin == true
        LoadIn.order(@sort).global_search(@query)
      else
        LoadIn.where("t1_customer_id = ?", @user.t1_customer_id).order(@sort).order(@sort).global_search(@query)
      end
    end

    def get_load
      super
      @total_load_ins =  @total_loads
      @total_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
      @load_ins =  @loads
    end
  end
end
