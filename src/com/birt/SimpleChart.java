/*******************************************************************************
*Copyright: 2019 digiBlitz Foundation
*
*License: digiBlitz Public License 1.0 (DPL) 
*Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
*
*Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
*
*Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
*
*"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
******************************************************************************/
package com.birt;


import java.io.IOException;

import org.apache.log4j.Logger;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.LegendItemType;
import org.eclipse.birt.chart.model.attribute.Palette;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
import org.eclipse.birt.chart.model.attribute.impl.PaletteImpl;
import org.eclipse.birt.chart.model.component.Axis;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.BaseSampleData;
import org.eclipse.birt.chart.model.data.DataFactory;
import org.eclipse.birt.chart.model.data.OrthogonalSampleData;
import org.eclipse.birt.chart.model.data.SampleData;
import org.eclipse.birt.chart.model.data.SeriesDefinition;
import org.eclipse.birt.chart.model.data.impl.QueryImpl;
import org.eclipse.birt.chart.model.data.impl.SeriesDefinitionImpl;
import org.eclipse.birt.chart.model.impl.ChartWithAxesImpl;
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.layout.Plot;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.model.api.DesignConfig;
import org.eclipse.birt.report.model.api.ElementFactory;
import org.eclipse.birt.report.model.api.ExtendedItemHandle;
import org.eclipse.birt.report.model.api.IDesignEngine;
import org.eclipse.birt.report.model.api.IDesignEngineFactory;
import org.eclipse.birt.report.model.api.OdaDataSetHandle;
import org.eclipse.birt.report.model.api.OdaDataSourceHandle;
import org.eclipse.birt.report.model.api.ReportDesignHandle;
import org.eclipse.birt.report.model.api.SessionHandle;
import org.eclipse.birt.report.model.api.SimpleMasterPageHandle;
import org.eclipse.birt.report.model.api.StructureFactory;
import org.eclipse.birt.report.model.api.activity.SemanticException;
import org.eclipse.birt.report.model.api.command.ContentException;
import org.eclipse.birt.report.model.api.command.NameException;

import com.ibm.icu.util.ULocale;


public class SimpleChart

{
	static Logger log = Logger.getLogger(SimpleChart.class.getName());
	
    private ReportDesignHandle reportDesignHandle = null;

    private ElementFactory elementFactory = null;

    private OdaDataSourceHandle odaDataSourceHandle = null;

    private String dataSourceName = "datasource";

    private String dataSetName = "maindataset";
    private SessionHandle sessionHandle =null;

	org.eclipse.birt.report.model.api.elements.structures.ComputedColumn cs1, cs2 = null;

    public static void main()

    {
        try {
        		
            new SimpleChart().createReport();
            Thread thread = new Thread();
            thread.sleep(2000);
        } catch (Exception e) {

            e.printStackTrace();

        }
            
           /* try {
          ExecuteReport.executeReport();
            }
            catch (final Exception EX) {
            	EX.printStackTrace();
            }*/

       

    }


    public void createReport() throws SemanticException, IOException

    {
        System.out.println("Start");
        init();
        
        createMasterPages();
      
        buildDataSource();
       
        buildDataSet();       
       
        createBody();
       
        reportDesignHandle.saveAs("D:/WorkStation-4/smartlehren-workspace/smartlehren/WebContent/report/SampleChart.rptdesign");
        
       // reportDesignHandle.saveAs("C:/birt-runtime-4.5.0-20150609/birt-runtime-4_5_0/ReportEngine/freshapi23456.rptdesign");  
        reportDesignHandle.close( );
		//Platform.shutdown();
		
    }


    private void init(){


		DesignConfig config = new DesignConfig( );
		config.setBIRTHome("C:/birt-runtime-3_7_2/birt-runtime-3_7_2/ReportEngine");
		IDesignEngine engine = null;

        try {

            Platform.startup(config);

            IDesignEngineFactory factory = (IDesignEngineFactory) Platform

            .createFactoryObject(IDesignEngineFactory.EXTENSION_DESIGN_ENGINE_FACTORY);

            engine = factory.createDesignEngine(config);

        } catch (Exception ex) {

            ex.printStackTrace();

        }


        // we need a handle of session of design engine

        sessionHandle = engine.newSessionHandle(ULocale.ENGLISH);
        reportDesignHandle = sessionHandle.createDesign();
        elementFactory = reportDesignHandle.getElementFactory();

    }


    private void createMasterPages() throws ContentException, NameException

    {

        SimpleMasterPageHandle simpleMasterPage =
            elementFactory.newSimpleMasterPage("Master Page");

        reportDesignHandle.getMasterPages().add(simpleMasterPage);

    }

	void buildDataSource( ) throws SemanticException
	{
		
		
		OdaDataSourceHandle dsHandle = elementFactory.newOdaDataSource(
				"Data Source", "org.eclipse.birt.report.data.oda.jdbc" );
		dsHandle.setProperty( "odaDriverClass",
		"com.microsoft.sqlserver.jdbc.SQLServerDriver" );
		dsHandle.setProperty( "odaURL", "jdbc:sqlserver://192.168.1.135:1433;" +
			"DatabaseName=TEST" );
		dsHandle.setProperty( "odaUser", "sa" );
		dsHandle.setProperty( "odaPassword", "digiBlitz@12345" );

		//OdaDataSourceHandle dsHandle = elementFactory.newOdaDataSource(
		//		"Data Source", "org.eclipse.birt.report.data.oda.jdbc" );
		//dsHandle.setProperty( "odaDriverClass",
		//"org.eclipse.birt.report.data.oda.sampledb.Driver" );
		//dsHandle.setProperty( "odaURL", "jdbc:classicmodels:sampledb" );
		//dsHandle.setProperty( "odaUser", "ClassicModels" );
		//dsHandle.setProperty( "odaPassword", "" );
		
		//PropertyBinding pb = new PropertyBinding();

		reportDesignHandle.getDataSources( ).add( dsHandle );

	}

	void buildDataSet( ) throws SemanticException
	{

		OdaDataSetHandle dsHandle = elementFactory.newOdaDataSet( dataSetName,
		"org.eclipse.birt.report.data.oda.jdbc.JdbcSelectDataSet" );
		dsHandle.setDataSource( "Data Source" );
		String qry = "SELECT DATEPART(yyyy,[date]) AS year,COUNT(*) AS Occurences From [TEST].[dbo].[tblEnrolldetails] GROUP BY DATEPART(yyyy,[date]); " ;
        
		dsHandle.setQueryText( qry );	
	
		reportDesignHandle.getDataSets( ).add( dsHandle );

		


	}

    private void createBody() throws SemanticException

    {
        ExtendedItemHandle extendedItemHandle = elementFactory.newExtendedItem("Simple Chart", "Chart");
        extendedItemHandle.setWidth("700px");
        extendedItemHandle.setHeight("500px");
        extendedItemHandle.setProperty(ExtendedItemHandle.DATA_SET_PROP, dataSetName);
        extendedItemHandle.setProperty("outputFormat","PNG");


    
        Chart c = createChart();

        extendedItemHandle.getReportItem().setProperty( "chart.instance", c );

        reportDesignHandle.getBody().add(extendedItemHandle);

      
		//PropertyHandle computedSet = extendedItemHandle.getColumnBindings( );
		//computedSet.clearValue();
		
		cs1 = StructureFactory.createComputedColumn( );
		cs1.setName( "year" );
		cs1.setExpression( "dataSetRow[\"year\"]");
		cs1.setDataType("integer");
		cs1.setAggregateOn(null);
		
		
		cs2 = StructureFactory.createComputedColumn( );
		cs2.setName( "Occurences" );
		cs2.setExpression( "dataSetRow[\"Occurences\"]");
		cs2.setDataType( "integer" );		
		
		extendedItemHandle.addColumnBinding(cs2, true);
		extendedItemHandle.addColumnBinding(cs1, true);
		

    }

    private Chart createChart() {

        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
        cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
        cwaBar.setSubType( "Overlay" ); //$NON-NLS-1$
        cwaBar.getBlock().getBounds().setWidth(600);
        cwaBar.getBlock().getBounds().setHeight(400);

        
        // Plot
        cwaBar.getBlock().setBackground( ColorDefinitionImpl.WHITE() );
        Plot p = cwaBar.getPlot();
        p.getClientArea().setBackground( ColorDefinitionImpl.create( 255, 255,
                225 ) );

        // Title
        cwaBar.getTitle().getLabel().getCaption().setValue("Year Wise admittance vs Enrollment Sheet" );
        cwaBar.getTitle().setVisible(true);

        // Legend
        cwaBar.getLegend().setVisible( true );
		Legend lg = cwaBar.getLegend();
		lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
	//	label.getCaption().setValue("newValue");
        Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType( AxisType.TEXT_LITERAL );
        xAxisPrimary.getMajorGrid().setTickStyle( TickStyle.BELOW_LITERAL );
        xAxisPrimary.getOrigin().setType( IntersectionType.MIN_LITERAL );
        xAxisPrimary.getLabel().getCaption().setValue("new value");
        xAxisPrimary.getLabel().setVisible(true);
        xAxisPrimary.getTitle().getCaption().setValue("Year");
        xAxisPrimary.getTitle().setVisible(true);

        // Y-Axis
        Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis( xAxisPrimary );
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getMajorGrid().setTickStyle( TickStyle.RIGHT_LITERAL );
        yAxisPrimary.getLabel().getCaption().setValue("TEST");
        yAxisPrimary.getLabel().setVisible(true);
        yAxisPrimary.getTitle().getCaption().setValue("No.of admits");
        yAxisPrimary.getTitle().setVisible(true);
   
		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "Category-A, Category-B" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );


		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "4,12" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwaBar.setSampleData( sd );

        // X-Series


        
		Series seCategory = SeriesImpl.create( );
		// seCategory.setDataSet( categoryValues );
		
		// Set category expression.
		seCategory.getDataDefinition( )
				.add( QueryImpl.create( "row[\"year\"]" ) );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		Palette palx = PaletteImpl.create(10, false);
		//sdY.getSeriesPalette( ).shift(1);
		sdX.setSeriesPalette(palx);
		
		
		//sdX.getSeriesPalette( ).shift( 1 );
        //sdX.setSorting(SortOption.ASCENDING_LITERAL);
		// Set default grouping.
		//SeriesGrouping grouping = sdX.getGrouping( );
		//grouping.getAggregateExpression();
		//grouping.setEnabled( false );
		//grouping.setGroupType( DataType.TEXT_LITERAL );
		//grouping.setGroupingUnit( GroupingUnitType.STRING_PREFIX_LITERAL );
		//grouping.setGroupingInterval( 1 );
		//grouping.setAggregateExpression( "Sum" ); // Set Count aggregation. //$NON-NLS-1$

		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );
		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
	
		bs1.getDataDefinition( ).add( QueryImpl.create( "row[\"Occurences\"]" ) );
		bs1.getLabel( ).setVisible( true );
		

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );		
		//Palette pal = PaletteImpl.create(10, false);
		//sdY.getSeriesPalette( ).shift(1);
		//sdY.setSeriesPalette(pal);
		
		sdY.getGrouping().setEnabled(false);
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		
		sdY.getSeries( ).add( bs1 );        
        

        return cwaBar;
    }
} 
