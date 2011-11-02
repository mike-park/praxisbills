module PatientsHelper
  def last_invoice_date(patient)
    if date = patient.current_invoice.try(:sent_date)
      l(date)
    end
  end

  def total_billed(patient)
    number_to_euro patient.auths.billed_amount
  end

  def total_received(patient)
    number_to_euro patient.auths.received_amount
  end

  def owed_to_us(patient)
    number_to_euro patient.auths.owed_to_us
  end
end
