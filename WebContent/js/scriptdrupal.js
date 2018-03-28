//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
( function( $ ) {
$( document ).ready(function() {
$(document).ready(function(){

$('#cssmenu1 > ul > li ul').each(function(index, e){
  //var count = $(e).find('li').length;
  var content = '<span class=\"cnt\">'  + '</span>';
  $(e).closest('li').children('a').append(content);
});
$('#cssmenu1 ul ul li:odd').addClass('odd');
$('#cssmenu1 ul ul li:even').addClass('even');
$('#cssmenu1 > ul > li > a').click(function() {
  $('#cssmenu1 li').removeClass('active');
  $(this).closest('li').addClass('active');	
  var checkElement = $(this).next();
  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
    $(this).closest('li').removeClass('active');
    checkElement.slideUp('normal');
  }
  if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
    $('#cssmenu1 ul ul:visible').slideUp('normal');
    checkElement.slideDown('normal');
  }
  if($(this).closest('li').find('ul').children().length == 0) {
    return true;
  } else {
    return false;	
  }		
});

});

});
} )( jQuery );
