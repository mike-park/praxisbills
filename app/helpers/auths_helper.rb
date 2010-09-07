module AuthsHelper
  def auth_path(auth)
    patient_auth_path(auth.patient, auth)
  end

  def edit_auth_path(auth)
    edit_patient_auth_path(auth.patient, auth)
  end
end
