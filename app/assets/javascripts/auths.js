// update insurer selection with last used insurer of currently
// selected patient
function patientChanged(elem) {
  $.ajax({ 
    data: { id: $("#auth_patient_id").val() },
    dataType: "json",
    success: function (auth, textStatus, req) {
      //console.log(auth);
      $("#auth_insurer_id").val(auth ? auth.insurer_id : '');
    },
    url: "/api/last_auth"
  });
}
