class LoadInsController < ApplicationController

  def new
    @load_in = LoadIn.new
  end

  def create

    @load_in = LoadIn.new(strong_params)
    p @load_in
    if @load_in.save!
      redirect_to dashboard_index_path
    else
       p "erreur"
    end
  end

  def edit
    @load_in = LoadIn.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def update
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
    :t1_customer_id, :status, :arrival_date, :truck_nr, :trailer_nr, :type_of_service, :in_assignments_attributes => [ :packer, :lot_nr, :incoming_order_ref, :other_ref]
  )
  end
end

