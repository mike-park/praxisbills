// enable date picker

$(function() {
  var dp = $('input.ui-date-picker');
  if (dp.length > 0)
    dp.datepicker({ dateFormat: 'dd.mm.yy' });
});
