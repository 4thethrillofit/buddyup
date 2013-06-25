// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

$(document).ready(function(){

  PageContent.suggestionBox = $('.suggestion-box');
  PageContent.removeSuggestion = function(teamName){
    var index = this.suggestions.indexOf(teamName);
    this.suggestions.splice(index, 1);
  };

  $('input.tags-input').typeahead({
    source: PageContent.suggestions,
    updater: function(item){
      var teamLabel = $("<span class='label label-success'>"+item+"<a href='#remove' class='remove-tag'> X </a></span>")
      $('section.suggestion-box').append(teamLabel, ' ');
      PageContent.removeSuggestion(item);
    }
  });

});