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
$(document).ready(function(){
		   
		   var $affectedElements = $("div,p,h2,h4,h5,a,style,img,address, label,li,span,input,form"); // Can be extended, ex. $("div, p, span.someClass")

// Storing the original size in a data attribute so size can be reset
$affectedElements.each( function(){
  var $this = $(this);
  $this.data("orig-size", $this.css("font-size") );
});

$("#btn-increase").click(function(){
  changeFontSize(4);
  var count = document.getElementById("clickcount").value;
  var s= parseInt(count)+1;
  if(s==2){
	  document.getElementById("btn-increase").disabled=true;
  }else{
	  document.getElementById("btn-decrease").disabled=false;
  }
  document.getElementById("clickcount").value=s;
})

$("#btn-decrease").click(function(){
  changeFontSize(-3);
  var count = document.getElementById("clickcount").value;
 
  var s= parseInt(count)-1;
  
  if(s==-2){
	 
	  document.getElementById("btn-decrease").disabled=true;
  }else{
	  document.getElementById("btn-increase").disabled=false;
  }
  document.getElementById("clickcount").value=s;
})

$("#btn-orig").click(function(){
  $affectedElements.each( function(){
        var $this = $(this);
        $this.css( "font-size" , $this.data("orig-size") );
		document.getElementById("clickcount").value=0;
		document.getElementById("btn-increase").disabled=false;
		document.getElementById("btn-decrease").disabled=false;
   });
})

function changeFontSize(direction){
    $affectedElements.each( function(){
        var $this = $(this);
        $this.css( "font-size" , parseInt($this.css("font-size"))+direction );
    });
}

}); 
