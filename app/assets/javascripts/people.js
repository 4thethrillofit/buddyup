$(document).ready(function(){

  $('input.tags-input').on('focusout keydown', function(){
  // $('section.suggestion-box').on('contentchanged', function(){
    var teams = $('section.suggestion-box span .tag-text').map(function(v, index){
      return $(this).text();
    }).get().join(', ');
    $('input.teams').val(teams);
    console.log($('input.teams').val())
  });
})