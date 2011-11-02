class PatientsController < ApplicationController
  respond_to :html

  def index
    respond_with(@patients = Patient.by_name.all)
  end

  def show
    respond_with(@patient = Patient.find(params[:id]))
  end

  def new
    respond_with(@patient = Patient.new)
  end

  def edit
    respond_with(@patient = Patient.find(params[:id]))
  end

  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      format.html do
        if @patient.save
          redirect_to(new_invoice_auth_path(current_invoice), notice: "Patient created")
        else
          render action: "new"
        end
      end
    end
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to(@patient, :notice => 'Patient was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
    end
  end
end
