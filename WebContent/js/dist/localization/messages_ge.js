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
(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/**
 * @author  @tatocaster <kutaliatato@gmail.com>
 * Translated default messages for the jQuery validation plugin.
 * Locale: GE (Georgian; แฅแ?แ แแฃแแ)
 */
$.extend($.validator.messages, {
	required: "แแก แแแแ แกแ?แแ?แแแแแฃแแ?แ?",
	remote: "แแแฎแ?แแ แจแแ?แกแฌแ?แ แ?แ.",
	email: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แกแฌแ?แ แ แคแ?แ แแ?แขแแ.",
	url: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แกแฌแ?แ แ แคแ?แ แแ?แขแแ.",
	date: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แกแฌแ?แ แ แแ?แ แแฆแ.",
	dateISO: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แกแฌแ?แ แ แคแ?แ แแ?แขแแ ( ISO ).",
	number: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แ แแชแฎแแ.",
	digits: "แแ?แจแแแแฃแแแ? แแฎแ?แแ?แ แชแแคแ แแแ.",
	creditcard: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แกแฌแ?แ แ แคแ?แ แแ?แขแแก แแ?แ แ?แแแก แแ?แแ.",
	equalTo: "แแแฎแ?แแ แจแแแงแแ?แแ?แ แแแแแ แแแแจแแแแแ?แแ?.",
	maxlength: $.validator.format( "แแแฎแ?แแ แจแแแงแแ?แแ?แ แ?แ แ? แฃแแแขแแก {0} แกแแแแ?แแ?แกแ." ),
	minlength: $.validator.format( "แจแแแงแแ?แแแ แแแแแแฃแ {0} แกแแแแ?แแ?." ),
	rangelength: $.validator.format( "แแแฎแ?แแ แจแแแงแแ?แแ?แ {0} -แแ?แ {1} -แแแ แ แ?แ?แแแแ?แแแก แกแแแแ?แแ?แแแ." ),
	range: $.validator.format( "แจแแแงแแ?แแแ {0} -แกแ? {1} -แก แจแ?แ แแก." ),
	max: $.validator.format( "แแแฎแ?แแ แจแแแงแแ?แแ?แ แแแแจแแแแแ?แแ? แแ?แแแแแ แ?แ แขแ?แแ {0} -แก." ),
	min: $.validator.format( "แแแฎแ?แแ แจแแแงแแ?แแ?แ แแแแจแแแแแ?แแ? แแแขแ แ?แ แขแ?แแ {0} -แก." )
});

}));
