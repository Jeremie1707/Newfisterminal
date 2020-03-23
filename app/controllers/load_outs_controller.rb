class LoadOutsController < ApplicationController

  def new
    puts "starts loadins controller"
    @load_out = LoadOut.new
  end

  def create
    @load_out = LoadOut.new(strong_params)
    flash[:load_out_error] = []
    respond_to do |format|
      if @load_out.save
       @load_out.set_reference
       @out_assignment = OutAssignment.find_by(id: @load_out.out_assignments.first.id)
       @out_assignment.set_reference
        flash[:notice] = "Load Out was successfully created."
        format.html { redirect_to dashboard_index_path, notice: 'Load Out was successfully created.' }
        format.js {render js: "window.location='#{dashboard_index_path}'"}
      else
        flash[:notice] = "There were errors in creating the Load Out."
        flash[:load_out_error] << @load_out.errors
        format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the LoadOut. " }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @load_out = LoadOut.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def update
    @load_out = LoadOut.find(params[:id])
    @load_out.update_attributes(strong_params)
    respond_to do |format|
      if @load_out.save
        format.html { redirect_to dashboard_index_path, success: 'Load Out was successfully updated.' }
        format.js
      else
        format.html { render action: "update" }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @load_out = LoadOut.find(params[:id])
    @load_out.destroy
    respond_to do |format|
    if @load_out.destroy!
      format.html { redirect_to dashboard_index_path, success: 'Load Out was successfully deleted.' }
    else
        format.html { render action: "new" }
        format.json { render json: @load_out.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def strong_params
    params.require(:load_out).permit(
    :t1_customer_id, :status, :departure_date, :truck_nr, :trailer_nr, :type_of_service,:note, :out_assignments_attributes => [ :lot_nr, :incoming_order_ref, :other_ref,:cost, :div_cost]
  )
  end

  # def set_reference_load(load_input)
  #   p "hello load input class #{load_input}"
  #   if load_input.class.last.id.nil?
  #     if load_input.class == LoadIn
  #       load_input.reference = "10001-LI"
  #     else
  #       load_input.reference = "10001-LO"
  #     end
  #   else
  #     if load_input.class == LoadIn
  #       "hello load in"
  #     load_input.reference = (load_input.id.to_i + 10001).to_s + "-LI"
  #     else
  #       load_input.reference = (load_input.id.to_i + 10001).to_s + "-LO"
  #     end
  #   end
  #   load_input.save
  # end

end


