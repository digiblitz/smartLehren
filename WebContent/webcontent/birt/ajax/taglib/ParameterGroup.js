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
 * Utility functions for Parameter Group.
 */
ParameterGroup = Class.create( );

ParameterGroup.prototype =
{
	__group : null,
	
	/**
	 *	Initialization routine required by "ProtoType" lib.
	 *	@return, void
	 */
	initialize : function( )
	{
		this.__group = new Array( );
	},

	/**
	 *	Add parameter into group
	 *  
	 *  @param, parameter
	 *	@return, void
	 */
	addParameter : function( parameter )
	{
		var len = this.__group.length;
		this.__group[len] = {};
		this.__group[len].name = parameter.getName( );
		this.__group[len].value = parameter;
	},

	/**
	 *	Get paramter id by name
	 *  
	 *  @param, parameter
	 *	@return, void
	 */
	getParameterIdByName : function( name )
	{
		for( var i = 0; i < this.__group.length; i++ )
		{
			if( this.__group[i].name == name )
			{
				if( this.__group[i].value )
					return this.__group[i].value.getId( );
			}
		}
		
		return null;
	},
	
	/**
	 *	empty parameter group
	 *
	 *	@return, void
	 */
	empty : function( )
	{
		this.__group = new Array( );
	},
				
	noComma : "" //just to avoid javascript syntax errors
}
