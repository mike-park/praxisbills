class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_patient=(patient)
    @patient = patient
    session[:patient_id] = patient.nil? ? nil : patient.id
  end
  
  def current_patient
    @patient = find_object_referenced_by(:patient_id, Patient)
  end

  def current_invoice=(invoice)
    @invoice = invoice
    session[:invoice_id] = invoice.nil? ? nil : invoice.id
  end
  def current_invoice
    @invoice = find_object_referenced_by(:invoice_id, Invoice)
  end
  
  def find_object_referenced_by(sym, model)
    id = [params[sym], session[sym]].compact.first
    if id
      begin
        obj = model.find(id)
        session[sym] = id
      rescue
        session[sym] = nil
      end
    end
    obj
  end

end
