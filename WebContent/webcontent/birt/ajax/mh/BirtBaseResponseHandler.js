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
 *	BirtBaseResponseHandler
 *	...
 */
BirtBaseResponseHandler = function(){}; 

BirtBaseResponseHandler.prototype =
{
	
	associations: {}, //map of response types, handlers
	
	/**
	* Add handler for response target types
	* Holds one handlerObject per targetType with newer handlerObject overwriting existing handlerObject
	* @param targetType String name of target, length 5 
	* @param handlerObject 
	*/
	addAssociation: function(targetType, handlerObject)
	{
		this.associations[targetType] = handlerObject;			
	},
	

	/**
	 *	Process update response message. Trigger necessary UI updates.
	 *	See response schema for details.
	 *
	 *	@message, update response DOM.
	 *	@return, void
	 */
	__process: function( message )
	{
		this.__process( message );
	}
	
	////////////////////////////////////////////////////////////////////////////
	//	Local methods
	///////////////////////////////////////////////////////////////////////////
	

}
