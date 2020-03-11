class LoadInsController < ApplicationController

  def new
    puts "starts loadins controller"
    @load_in = LoadIn.new
  end

  def create

    @load_in = LoadIn.new(strong_params)
    respond_to do |format|
      if @load_in.save
        if @load_in.type_of_service == "TRUCK TO TRUCK"
          p "hello load_out"
          p params
          @load_out = LoadOut.new(t1_customer_id: params[:load_in][:t1_customer_id], type_of_service: params[:load_in][:type_of_service],note: params[:load_in][:note])
          @load_out.save!

        end
        format.html { redirect_to dashboard_index_path, notice: 'Load In was successfully created.' }
      else
        flash[:error] = @load_in.errors
        puts  "hello flash"
        p flash[:error]
        format.html { redirect_to dashboard_index_path(request.parameters), :alert => "There were errors in creating the Load In. " }
        format.json { render json: @load_in.errors, status: :unprocessable_entity }
      end
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
        # format.json { render json: @load_in, status: :updated, location: @load_in }
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

  # def load_out_strong_params
  #   p params
  #   params.permit(:t1_customer_id, :type_of_service,:note)
  # end

end

