$(document).ready(function(){
  $('.team-name').autocomplete({
    source: [1, 'jsass', '23']
  });

    PageContent.teamBox = $('.team-list')
    function split( val ) {
      return val.split(/,\s*/);
    }

    function extractLast(term) {
      return split(term).pop();
    }
    //allow user to select the team with tab key
    $('.team-input').on('keydown', function(e){
      if ( e.keyCode === $.ui.keyCode.TAB &&
        $(this).data('ui-autocomplete').menu.active){
        e.preventDefault();
      }
    })

    $('.team-input').autocomplete({
      minLenght: 0,
      source: function( request, response ) {
       // delegate back to autocomplete, but extract the last term
       response( $.ui.autocomplete.filter(
       PageContent.teamSuggestions, extractLast( request.term ) ) );
      },
      focus: function(){
        return false;
      },
      select: function(event, ui){
        var i = PageContent.teamSuggestions.indexOf(ui.item.value);
        PageContent.teamSuggestions.splice(i, 1);
        PageContent.teamBox.append("<span class='tag'><span>"+ ui.item.value +"</span><a class='tagsinput-remove-link fui-cross-16'></a></span>")
        $('.team-input').val('');
        return false;
      }
    });
    //removing the tag by clicking on the tag itself
    PageContent.teamBox.on('click', 'a.tagsinput-remove-link', function(){
      $(this).parent().remove();
    });

});