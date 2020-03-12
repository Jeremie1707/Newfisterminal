class LoadInsController < ApplicationController

  def new
    puts "starts loadins controller"
    @load_in = LoadIn.new
  end

  def create

    @load_in = LoadIn.new(strong_params)
    flash[:error] = []
    respond_to do |format|
      if @load_in.save
        if @load_in.type_of_service == "TRUCK TO TRUCK"
          if create_load_out_and_out_assignment(params)
          format.html { redirect_to dashboard_index_path, notice: 'Load In was successfully created.' }
          else
            flash[:error] << @load_out.errors
            format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the LoadOut. " }
            format.json { render json: @load_out.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:error] << @load_in.errors
        format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the Load In. " }
        format.json { render json: @load_in.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_load_out_and_out_assignment(params = {})
    @load_out = LoadOut.new(t1_customer_id: params[:load_in][:t1_customer_id], type_of_service: params[:load_in][:type_of_service],note: params[:load_in][:note])
    if @load_out.save!
      @out_assignment = OutAssignment.new(load_out_id: @load_out.id, lot_nr: params[:load_in][:in_assignments_attributes][0][:lot_nr], other_ref: params[:load_in][:in_assignments_attributes][0][:other_ref])
      if @out_assignment.save
        @assignment = Assignment.new(in_assignment_id: @load_in.in_assignment_ids.first, out_assignment_id: @out_assignment.id)
          if @assignment.save
             flash[:notice] = 'Assignment was successfully created.'
          else
            flash[:error] << @assignment.errors
          end
        flash[:notice] << 'Out Assignment was successfully created.'
      else
        flash[:error] << @out_assignment.errors
      end
      flash[:notice] <<'Load Out was successfully created.'
    else
      flash[:error] << @load_out.errors
    end
  end

  def edit
    @load_in = LoadIn.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def update
    @load_in = LoadIn.find(params[:id])
    @load_in.update_attributes(strong_params)
    respond_to do |format|
      if @load_in.save!
        format.html { redirect_to dashboard_index_path, success: 'Load In was successfully updated.' }
        format.js
      else
        format.html { render action: "update" }
        format.json { render json: @load_in.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @load_in = LoadIn.find(params[:id])
    @load_in.destroy
    respond_to do |format|
    if @load_in.destroy!
      format.html { redirect_to dashboard_index_path, success: 'Load In was successfully deleted.' }
    else
        format.html { render action: "new" }
        format.json { render json: @load_in.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def strong_params
    params.require(:load_in).permit(
    :t1_customer_id, :status, :arrival_date, :truck_nr, :trailer_nr, :type_of_service,:note, :in_assignments_attributes => [ :packer, :lot_nr, :incoming_order_ref, :other_ref]
  )
  end
end

