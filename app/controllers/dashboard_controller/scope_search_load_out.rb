class DashboardController

  class ScopeSearchLoadOut < ScopeSearch
    attr_reader :load_outs, :total_load_outs

    def initialize(parameters = {}, current_user)
      super(parameters, current_user)
      if @user.admin == true
        @scope = parameters[:scope] || LoadOut.all.order(@sort)
      else
        @scope = parameters[:scope] || LoadOut.where("t1_customer_id = ?", @user.t1_customer_id).order(@sort)
      end
    end

    def scope
      @scope
    end

    def query_scope
     if @user.admin == true
        LoadOut.order(@sort).global_search(@query)
      else
        LoadOut.where("t1_customer_id = ?", @user.t1_customer_id).order(@sort).global_search(@query)
      end
    end

    def get_load
      super
      @total_load_outs =  @total_loads
      @total_load_out_pages = (@total_loads.to_f / @rows_per_page.to_f).ceil
      @load_outs =  @loads
    end
  end
end
