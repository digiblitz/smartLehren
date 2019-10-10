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


import java.awt.Desktop;
import java.io.File;
import java.util.HashMap;
import java.util.logging.Level;
 
import org.apache.log4j.Logger;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.EngineConstants;
import org.eclipse.birt.report.engine.api.EngineException;
import org.eclipse.birt.report.engine.api.HTMLActionHandler;
import org.eclipse.birt.report.engine.api.HTMLEmitterConfig;
import org.eclipse.birt.report.engine.api.HTMLRenderContext;
import org.eclipse.birt.report.engine.api.HTMLRenderOption;
import org.eclipse.birt.report.engine.api.HTMLServerImageHandler;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;
import org.eclipse.birt.report.engine.api.IReportRunnable;
import org.eclipse.birt.report.engine.api.IRunAndRenderTask;

 
@SuppressWarnings("deprecation")
public class ExecuteReport {
	IReportEngine engine = null;
    EngineConfig config = null;
	static Logger log = Logger.getLogger(ExecuteReport.class.getName());
	
    static void executeReport() throws EngineException {
        final HashMap<String, Integer> PARAMETERS = new HashMap<String, Integer>();
        
        final String NAME = "Top Count";
        final Integer VALUE = new Integer(4);

        PARAMETERS.put(NAME, VALUE);
        
        IReportEngine engine = null;
        EngineConfig config = null;
        
        try {
        
           // Configure the Engine and start the Platform
           config = new EngineConfig();
           config.setEngineHome("C:/birt-runtime-3_7_2/birt-runtime-3_7_2/ReportEngine");
           // set log config using (null, Level) if you do not want a log file
           config.setLogConfig("C:/birt/logs", Level.FINE);
           
          // Platform.startup(config);
           final IReportEngineFactory FACTORY = (IReportEngineFactory) Platform.
               createFactoryObject(IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY);

           engine = FACTORY.createReportEngine(config);
          engine.changeLogLevel(Level.WARNING);
        
        } catch(Exception ex) {
           ex.printStackTrace();
        }
        
        // Configure the emitter to handle actions and images
        
        
      
        
        final HTMLEmitterConfig EMITTER_CONFIGURATION = new HTMLEmitterConfig();
        
        

        EMITTER_CONFIGURATION.setActionHandler(new HTMLActionHandler());
        HTMLServerImageHandler imageHandler = new HTMLServerImageHandler();
        EMITTER_CONFIGURATION.setImageHandler(imageHandler);
        config.getEmitterConfigs().put("html", EMITTER_CONFIGURATION); // $NON-NLS-1$
        
        
        
        // Open the report design
        final IReportRunnable DESIGN = 
        		//engine.openReportDesign("C:/temp/campie.rptdesign");
             engine.openReportDesign("D:/WorkStation-4/smartlehren-workspace/smartlehren/WebContent/results/reports/trail1.rptdesign"); 
        
     
        
        // Create task to run and render the report:
        final IRunAndRenderTask TASK = engine.createRunAndRenderTask(DESIGN);
        
      
        
        // Set Render context to handle URL and image locations
        final HTMLRenderContext RENDER_CONTEXT = new HTMLRenderContext();
        // Set the Base URL for all actions
        RENDER_CONTEXT.setBaseURL("C:/xampplite/htdocs");
        // Tell the Engine to prepend all images with this URL - Note this requires using 
        // the HTMLServerImageHandler
        RENDER_CONTEXT.setBaseImageURL("C:/xampplite/htdocs/myimages");
        // Tell the Engine where to write the images to
        RENDER_CONTEXT.setImageDirectory("C:/xampplite/htdocs/myimages");
        // Tell the Engine what image formats are supported.  Note you must have SVG in the string 
        // to render charts in SVG.
        RENDER_CONTEXT.setSupportedImageFormats("JPG;PNG;BMP;SVG");
        
       
        
        final HashMap<String, HTMLRenderContext> CONTEXT =
              new HashMap<String, HTMLRenderContext>();
        CONTEXT.put(EngineConstants.APPCONTEXT_HTML_RENDER_CONTEXT, RENDER_CONTEXT);
        TASK.setAppContext(CONTEXT);
        // Set PARAMETERS for the report
        TASK.setParameterValues(PARAMETERS);
        // Alternatively set each separately
        // TASK.setParameterValue("Top Count", new Integer(12));
        TASK.validateParameters();
        
      
        
        // Add a scriptable object, which will allow the report developer to put
        // script in the report that references this Java object, e.g. in script 
        // pFilter.myjavamethod()
        // final ProcessFilter PF = new ProcessFilter();
        // TASK.addScriptableJavaObject("pFilter", PF);
        
        // Set rendering options - such as file or stream output, 
        // output format, whether it is embeddable, etc
       final HTMLRenderOption HTML_OPTIONS = new HTMLRenderOption();
       
        // Remove HTML and Body tags
         HTML_OPTIONS.setEmbeddable(true);
        
        
        // Set output location
        HTML_OPTIONS.setOutputFileName("D:/WorkStation-4/smartlehren-workspace/smartlehren/WebContent/results/htmlReports/trail22222.html");
       
        // Set output format
       
        HTML_OPTIONS.setOutputFormat("html");
       
        TASK.setRenderOption(HTML_OPTIONS);
        
        File htmlFile = new File("D:/WorkStation-4/smartlehren-workspace/smartlehren/WebContent/results/htmlReports/trail22222.html");
        
        
        // run the report and destroy the engine
        // Note - If the program stays resident do not shutdown the Platform or the Engine
        TASK.run();
        
        TASK.close();
        
        //engine.shutdown();
       
       // Platform.shutdown();
       // engine.shutdown();
        try{
            Desktop.getDesktop().browse(htmlFile.toURI());
            }
            catch(Exception e){
            
            }
        
       
        
        //PDFRenderOption PDF_OPTIONS = new PDFRenderOption();
         //PDF_OPTIONS.setOutputFileName("c:/temp/testsri.pdf");
       // PDF_OPTIONS.setOutputFormat("pdf");
       // TASK.setRenderOption(PDF_OPTIONS);
      //  TASK.run();
      //  TASK.close();
       // engine.shutdown();
       // Platform.shutdown();
        
    }
    
}
