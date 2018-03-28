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
/******************************************************************************
 *	Copyright (c) 2004 Actuate Corporation and others.
 *	All rights reserved. This program and the accompanying materials 
 *	are made available under the terms of the Eclipse Public License v1.0
 *	which accompanies this distribution, and is available at
 *		http://www.eclipse.org/legal/epl-v10.html
 *	
 *	Contributors:
 *		Actuate Corporation - Initial implementation.
 *****************************************************************************/

/**
 *	BirtSoapResponse
 *	...
 */
BirtSoapResponse = Class.create( );

BirtSoapResponse.prototype =
{
	/**
	 *	Initialization routine required by "ProtoType" lib.
	 *
	 *	@return, void
	 */
	initialize: function( )
	{
	},
	
	/**
	 *	Process the soap response, dispatcher message content to designated
	 *	message handlers.
	 *
	 *	@message, incoming soap message DOM
	 *	@return, void
	 */
	process: function( message )
	{
		// TODO: will gradually remove it since not all response are in soap now.
		var soapBody = message.getElementsByTagName( 'soapenv:Body' )[ 0 ];
		if ( !soapBody )
		{
			soapBody = message.getElementsByTagName( 'Body' )[ 0 ];
		}
		
		if ( soapBody )
		{
			for ( var i = 0; i < soapBody.childNodes.length; i++ )
			{
				if ( soapBody.childNodes[i].nodeType == 1 ) // Need to use NodeType definition.
				{
					if ( soapBody.childNodes[i].tagName == 'soapenv:Fault' )
					{
						birtExceptionDialog.__cb_bind( soapBody.childNodes[i] );
					}
					else
					{
						var handler = eval( 'birt' + soapBody.childNodes[i].tagName + 'Handler' );
						if ( handler )
						{
							handler.__process( soapBody.childNodes[i] );
						}
					}
					
					break;
				}
			}
			
			return;
		}
		
		if ( message )
		{
			var handler = eval( 'birt' + message.tagName + 'ResponseHandler' );
			if ( handler )
			{
				handler.__process( message );
			}
		}
	}
}

var birtSoapResponse = new BirtSoapResponse( );
