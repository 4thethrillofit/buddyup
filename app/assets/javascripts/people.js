$(document).ready(function(){
  $('input.tags-input').on('focusout keydown click', function(){
    var teams = $('section.suggestion-box span .tag-text').map(function(v, index){
      return $(this).text();
    }).get().join(', ');
    $('input.teams').val(teams);
  });
})