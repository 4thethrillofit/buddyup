$(document).ready(function(){
  $('a.send-pair-email').on('ajax:success', function(xhr, data, status){
    $(this).attr('disabled', true)
         .text('Emails sent!')
         .removeClass('btn-warning')
         .attr('href', '#');
  });
});