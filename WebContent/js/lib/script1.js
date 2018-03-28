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
/*  jQuery ready function. Specify a function to execute when the DOM is fully loaded.  */
$(document).ready(
  //var dropoffdate;
  /* This is the function that will get executed after the DOM is fully loaded */
  function () {
    $( "#pickup_date" ).datepicker({
      //changeMonth: true,//this option for allowing user to select month
      //changeYear: true //this option for allowing user to select from year range
      minDate: new Date(),
      onSelect : function(selected_date){
        var selectedDate = new Date(selected_date);
        var msecsInADay = 86400000;
        var endDate = new Date(selectedDate.getTime() + msecsInADay);
        
         $("#dropoff_date").datepicker( "option", "minDate", endDate );
      }
    });
    
    $('#dropoff_date').datepicker({});
  }
  
  
);
