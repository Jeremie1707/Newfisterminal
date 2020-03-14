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
        format.html { redirect_to dashboard_index_path, notice: 'Load Out was successfully created.' }
      else
        flash[:error] << @load_out.errors
            format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the LoadOut. " }
            format.json { render json: @load_out.errors, status: :unprocessable_entity }
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
      if @load_out.save!
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
    :t1_customer_id, :status, :arrival_date, :truck_nr, :trailer_nr, :type_of_service,:note, :out_assignments_attributes => [ :lot_nr, :incoming_order_ref, :other_ref]
  )
  end
end


