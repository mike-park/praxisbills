// update insurer selection with last used insurer of currently
// selected patient
function patientChanged(elem) {
  $.ajax({ 
    data: { id: $("#auth_patient_id").val() },
    dataType: "json",
    success: function (data, textStatus, req) {
      console.log(data);
      $("#auth_insurer_id").val(data ? data.insurer_id : '');
      $("#auth_last_date_hint").html(data ? data.last_date_hint : '');
    },
    url: "/api/last_auth"
  });
}
