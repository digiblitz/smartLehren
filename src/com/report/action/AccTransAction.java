/*
 * AccTransAction.java
 *
 * Created on May 13, 2007, 1:08 PM
 */
package com.report.action;

import com.hlcaccounts.util.Debug;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCPaymentDetails;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import com.util.BIRTGraphsConfig;
import com.acc.action.DailySalesReport;
import com.acc.action.MonthlySalesReport;
import com.acc.action.YearlySalesReport;
import com.birt.graphs.BarGraph;
import com.birt.graphs.LineGraph;
import com.birt.graphs.PieGraph;
import com.birt.graphs.PyramidGraph;
import com.db.GeneralDBAction;

import java.util.List;
import javax.xml.parsers.ParserConfigurationException;

import org.eclipse.birt.chart.model.Chart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;
import org.tc33.jheatchart.HeatChart;
import org.xml.sax.SAXException;

/**
 *
 * @author punitha
 * @version
 */


@Controller
public class AccTransAction implements ServletContextAware  {
		
	//	@Autowired
		//ServletContext context;
	    GeneralDBAction db=new GeneralDBAction();
		 private ServletContext servletContext; 
		 
		 public void setServletContext(ServletContext servletContext) {
		       this.servletContext=servletContext;
		    }
		 
		 public ServletContext getServletContext() {
		        return servletContext;
		    }
		
		 @RequestMapping("/MakeChart.html")
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
			
			//String servletContext = request.getServletPath();
			
			
        HttpSession session = request.getSession();
     
        HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
        HLCkaverystatelessBean kaveryBean=new HLCkaverystatelessBean();
        
        //String context=servletContext.getContextPath();
      //  String context=servletContext.getRealPath("/")+ "images/";
      
        System.out.println("getContextPath in AccTransAction::"+servletContext.getContextPath()); 
        System.out.println("getRealPath in AccTransAction::"+servletContext.getRealPath("/")+ "images/"); 
    
        String realPath =servletContext.getRealPath("/")+ "images/";
      
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
        
        try {
            String process = request.getParameter("process");
            System.out.print("process function:" + process);

            if (process == null || process.trim().length() == 0) {
                return new ModelAndView("frmHome");
            } else if (process != null && process.equalsIgnoreCase("initPage")) {
                return new ModelAndView("frmAccTransactionDetails");
            } else if (process != null && process.equalsIgnoreCase("getTrans")) {
                String transDate = request.getParameter("transDate");
                Date tmpTransDate = null;
                System.out.println("transDate value in servlet:" + transDate);
                if (transDate != null && transDate.trim().length() != 0) {
                    tmpTransDate = sdf.parse(transDate);
                } else {
                    tmpTransDate = null;
                }
                ArrayList objTransDetails = mahanadhiBean.listAccTxnDetails(tmpTransDate, false);
                System.out.println("Array List value" + objTransDetails.size());
                request.setAttribute("objTransDetails", objTransDetails);
                request.setAttribute("transDate", transDate);
                return new ModelAndView("frmAccTransactionDetails");
            } //Suresh Here ==============================
            else if (process != null && process.equalsIgnoreCase("initMemberTrans")) {
                Debug.print("AccTransAction.process:initMemberTrans");
                return new ModelAndView("frmAccMembershipTransactionDetails");
            } else if (process != null && process.equalsIgnoreCase("getMembershipTrans")) {
                Debug.print("AccTransAction.process:getMembershipTrans");
                String transDate = request.getParameter("transDate");
                String paymentMode = request.getParameter("paymentMode");
                Date tmpTransDate = null;
                System.out.println("AccTransAction.transDate value in servlet:" + transDate);

                if (transDate != null && transDate.trim().length() != 0) {
                    tmpTransDate = sdf.parse(transDate);
                } else {
                    tmpTransDate = null;
                }

                String userId = (String) session.getAttribute("userId");

                ArrayList objMembershipTrans = null;
                if (tmpTransDate != null && paymentMode != null) {
                    objMembershipTrans = mahanadhiBean.getMembershipTranctionDetails(tmpTransDate, paymentMode, userId);
                }
                System.out.println("Array List value" + objMembershipTrans.size());
                request.setAttribute("objMembershipTrans", objMembershipTrans);
                request.setAttribute("transDate", tmpTransDate);
                request.setAttribute("paymentMode", paymentMode);
                return new ModelAndView("frmAccMembershipTransactionDetails");
            } else if (process != null && process.equalsIgnoreCase("initSyncTrans")) {
                Debug.print("AccTransAction.process:initSyncTrans");
                return new ModelAndView("frmSynchronisedTransDet");
            } else if (process != null && process.equalsIgnoreCase("listMembTrans")) {
                Debug.print("AccTransAction.process:listMembTrans");
                String transDate = request.getParameter("transDate");
                String paymentMode = request.getParameter("paymentMode");
                Date tmpTransDate = null;
                System.out.println("AccTransAction.transDate value in servlet:" + transDate);

                if (transDate != null && transDate.trim().length() != 0) {
                    tmpTransDate = sdf.parse(transDate);
                } else {
                    tmpTransDate = null;
                }
                ArrayList objMembershipTrans = null;
                if (tmpTransDate != null && paymentMode != null) {
                    objMembershipTrans = mahanadhiBean.selectSyncronizedQBTransctionDetails(tmpTransDate, paymentMode);
                }
                System.out.println("Array List value" + objMembershipTrans.size());
                request.setAttribute("objMembershipTrans", objMembershipTrans);
                request.setAttribute("transDate", tmpTransDate);
                request.setAttribute("paymentMode", paymentMode);
                return new ModelAndView("frmSynchronisedTransDet");
            } //Suresh Here ==============================
            ///////// By Admin Holdin the list of transactions
            else if (process != null && process.equalsIgnoreCase("initTrans")) {
                Debug.print("AccTransAction.process:initSyncTrans");
                return new ModelAndView("frmAccListingTransDet");
            } else if (process != null && process.equalsIgnoreCase("listTransDet")) {
                Debug.print("AccTransAction.process:listTransDet");
                String transDate = request.getParameter("transDate");
                String CheckNumber = request.getParameter("CheckNumber");
                Date tmpTransDate = null;
                System.out.println("AccTransAction.transDate value in servlet:" + transDate);
                System.out.println("AccTransAction.CheckNumber value in servlet:" + CheckNumber);

                if (transDate != null && transDate.trim().length() != 0) {
                    tmpTransDate = sdf.parse(transDate);
                } else {
                    tmpTransDate = null;
                }
                ArrayList objMembershipTrans = null;

                objMembershipTrans = mahanadhiBean.searchQBTransctionDetails(tmpTransDate, CheckNumber);

                System.out.println("Array List value" + objMembershipTrans.size());
                request.setAttribute("objMembershipTrans", objMembershipTrans);
                request.setAttribute("transDate", tmpTransDate);
                request.setAttribute("paymentMode", CheckNumber);
                return new ModelAndView("frmAccListingTransDet");
            } else if (process != null && process.equalsIgnoreCase("detailTrans")) {
                String payId = request.getParameter("pId");
                ArrayList transacEntries = null;
                ArrayList subTransac = null;
                ArrayList nxtTransac = null;
                HLCPaymentDetails objPayment = null;
                if (payId != null || payId.trim().length() != 0) {
                    transacEntries = mahanadhiBean.getAccTxnDetailsOnPaymentId(payId);
                    objPayment = kaveryBean.getPaymentDetails(payId);
                    nxtTransac = kaveryBean.getAdminPaymentDetails(payId);
                }
                request.setAttribute("objPayment", objPayment);
                request.setAttribute("transacEntries", transacEntries);
                request.setAttribute("subTransac", nxtTransac);

                return new ModelAndView("frmAdminholdTrans");
            } else if (process != null && process.equalsIgnoreCase("holdTrans")) {
                String radioValue = request.getParameter("radioValue");
                String payId = request.getParameter("paymentId");
                boolean status = true;
                Debug.print("radioValue is " + radioValue);

                if (radioValue.equalsIgnoreCase("yes")) {
                    status = false;
                }
                Debug.print("status is " + status);

                if (radioValue != null && radioValue.trim().length() != 0 && payId != null && payId.trim().length() != 0) {
                    mahanadhiBean.updateAccTxnDetailsMissingCheck(payId, status);
                }
                return new ModelAndView("frmAccListingTransDet");
            }
            else if (process != null && process.equalsIgnoreCase("daily")) {
                String findForward = null;
                String month1 = request.getParameter("month");
                //String chartType = request.getParameter("chartType");
                String year1 = request.getParameter("year");
                int month = Integer.parseInt(month1.trim());
                int year = Integer.parseInt(year1.trim());
                String paymentMode = request.getParameter("paymentMode");
                ArrayList dailyPaymentDet = null;
                System.out.println("month value in generateReport:" + month);
                Debug.print("paymentMode is " + paymentMode);
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");

                if (month != 0 && paymentMode != null && paymentMode.trim().length() != 0) {
                    dailyPaymentDet = mahanadhiBean.getDailyPaymentDetails(year, month, paymentMode);

                    Debug.print("dailyPaymentDet is " + dailyPaymentDet);

                }

                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("pie")) {
                            Debug.print("Inside Pie For daily sales");
                            // Pie Chart Generation

                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPie = PieGraph.createDailySalesPie(dailyPaymentDet, year1, month1);
                            PieGraph.generatePieGraphImage(chartPie, realPath);
                        } else if (graph[i].equalsIgnoreCase("chart")) {
                            // BAr Chart Generation
                            Debug.print("Inside Bar For daily sales");
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartBar = BarGraph.createBarGraph(dailyPaymentDet, year1, month1);
                            BarGraph.generateBarGraphImage(chartBar, realPath);
                        } else if (graph[i].equalsIgnoreCase("Linechart")) {
                            // Line Chart Generation
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartLine = LineGraph.createDailySalesLine(dailyPaymentDet, year1, month1);
                            LineGraph.generateLineGraphImage(chartLine, realPath);
                        } else if (graph[i].equalsIgnoreCase("PyramidChart")) {
                            // Pyramid Chart Generation
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPyramid = PyramidGraph.createDailySalesPyramid(dailyPaymentDet, year1, month1);
                            PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                        }
                        if (graph[i].equalsIgnoreCase("HeatMap")) {
                        	
                        	 String userid=(String)session.getAttribute("user_id");
                        	 System.out.println("used id form heatmap===="+userid);
                        	 
                        	String date=null;
                        	String login=null;
                        	String logout=null;
                        	
                        	ArrayList getAttendanceDetails=new ArrayList();
                        	getAttendanceDetails = (ArrayList) db.getAttendanceDetails();
                        	System.out.println("before iterator of heat map");
                        	 if(getAttendanceDetails!=null && getAttendanceDetails.size()!=0){
                     			Iterator itrs = getAttendanceDetails.iterator();
                     		    while (itrs.hasNext()) {    
                     		    	System.out.println("inside iterator of heat map");
                     		    	
                     		    	String TempList[] = (String[])itrs.next();
                     		    	date =TempList[2];
                     		    	login = TempList[3];
                     		    	logout = TempList[4];
                     		    	
                     		    	System.out.println("heatmaplist date===="+date);
                     		    	System.out.println("heatmaplist login===="+login);
                     		    	System.out.println("heatmaplist logout===="+logout);
                     		    	
                     		    	SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

                     				Date d1 = null;
                     				Date d2 = null;

                     				try {
                     					d1 = format.parse(login);
                     					d2 = format.parse(logout);

                     					//in milliseconds
                     					long diff = d2.getTime() - d1.getTime();

                     					long diffSeconds = diff / 1000 % 60;
                     					long diffMinutes = diff / (60 * 1000) % 60;
                     					long diffHours = diff / (60 * 60 * 1000) % 24;
                     					long diffDays = diff / (24 * 60 * 60 * 1000);

                     					System.out.print(diffDays + " days, ");
                     					System.out.print(diffHours + " hours, ");
                     					System.out.print(diffMinutes + " minutes, ");
                     					System.out.print(diffSeconds + " seconds.");
                     					 String hours=String.valueOf(diffHours);  
                     				    String minutes=String.valueOf(diffMinutes);  
                     				    ArrayList date_diff=new ArrayList();
                     				    String strList[]={hours};
                     				    date_diff.add(strList);
                     				   
                     				    Iterator itr= date_diff.iterator();
                     				    while (itr.hasNext()) {   
                     				    	
                     				    	String TempList1[] = (String[])itr.next();
                     				    	hours =TempList1[0];
                     				    	//minutes = TempList1[1];
                     		 		    	
                     				    	
                     				    }

                     				} catch (Exception e) {
                     					e.printStackTrace();
                     				}
                     		    		
                     		    }}
                        	
                        	double[][] data = new double[][]{
                    				{3,2,3,4,5,6},
                    				{3,4,5,6,7,6},
                                    {4,5,6,7,6,5}
                                    };
                      //ArrayList partnerList = new ArrayList();
                	
                    //Step 1: Create our heat map chart using our data.
                    System.out.println("running well");
                    HeatChart map = new HeatChart(data);
                   //Step 2: Customise the chart.
                    map.setTitle("Heat map");
                    map.setXAxisLabel("X Axis");
                    map.setYAxisLabel("Y Axis");
                    map.setHighValueColour(Color.BLUE);
                    map.setLowValueColour(Color.GREEN);

                    //Step 3: Output the chart to a file.
                    try {
                    	map.saveToFile(new File("d:/java-heat-chart.png"));
                    	
                    	
                    } catch (IOException e) {
                    	// TODO Auto-generated catch block
                    	e.printStackTrace();
                    }
                        }
                        
                        Debug.print("----------------------------------------->>>>>>>>" + request.getRequestURL());
                    }
                    request.setAttribute("graphsCount", graphNew);
                   // findForward = "generateDailyBarReport";
                    findForward="generateBarFromDB";
                    
                } else {
                    int i = 1;
                    List list = new ArrayList();
                    for (Iterator it = dailyPaymentDet.iterator(); it.hasNext();) {

                        Double db = (Double) it.next();
                        //double dbValue = db.doubleValue();
                        DailySalesReport dailySales = new DailySalesReport();
                        dailySales.setDays(i);
                        dailySales.setAmount(db);
                        list.add(dailySales);
                        i = i + 1;
                    }
                    session.setAttribute("demo", list);
                    findForward = "generateDailyBarTabularReport";
                }
                return new ModelAndView(findForward);

            } else if (process != null && process.equalsIgnoreCase("monthly")) {
                String findForward = null;
                //String chartType = request.getParameter("chartType");
                String year1 = request.getParameter("year");
                int year = Integer.parseInt(year1.trim());
                String paymentMode = request.getParameter("paymentMode");
                ArrayList monthlyPaymentDet = null;
                Debug.print("paymentMode is " + paymentMode);
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");

                if (year != 0 && paymentMode != null && paymentMode.trim().length() != 0) {
                    monthlyPaymentDet = mahanadhiBean.getMonthlyPaymentDetails(year, paymentMode);

                    Debug.print("monthlyPaymentDet is " + monthlyPaymentDet);
                    session.setAttribute("monthlyPaymentDet", monthlyPaymentDet);
                    session.setAttribute("yearValue", year1);
                }
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("pie")) {
                            //Pie chart generation   
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPie = PieGraph.createMonthlySalesPie(monthlyPaymentDet, year1);
                            PieGraph.generatePieGraphImage(chartPie, realPath);
                        } else if (graph[i].equalsIgnoreCase("chart")) {
                            //Bar chart generation 
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartBar = BarGraph.createMonthlyBarGraph(monthlyPaymentDet, year1);
                            BarGraph.generateBarGraphImage(chartBar, realPath);
                        } else if (graph[i].equalsIgnoreCase("Linechart")) {
                            //Line chart generation 
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartLine = LineGraph.createMonthlySalesLine(monthlyPaymentDet, year1);
                            LineGraph.generateLineGraphImage(chartLine, realPath);
                        } else if (graph[i].equalsIgnoreCase("PyramidChart")) {
                            //Pyramid chart generation 
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPyramid = PyramidGraph.createMonthlySalesPyramid(monthlyPaymentDet, year1);
                            PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                        }
                    }
                    request.setAttribute("graphsCount", graphNew);
                    findForward = "generateMonthlyBarFromDB";
                } else {
                    String monthList[] = {"Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"};
                    List list = new ArrayList();
                    int j = 0;
                    for (Iterator it = monthlyPaymentDet.iterator(); it.hasNext();) {
                        Double db = (Double) it.next();
                        MonthlySalesReport sales = new MonthlySalesReport();
                        sales.setMonth(monthList[j]);
                        sales.setAmount(db);
                        list.add(sales);
                        j = j + 1;
                    }
                    session.setAttribute("demo", list);
                    findForward = "generateMonthlyBarTabularReport";
                }
                return new ModelAndView(findForward);
            } else if (process != null && process.equalsIgnoreCase("area_yearly")) {
                String findForward = null;
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList areaPaymentDet = null;
                ArrayList areaValues = null;
                ArrayList areaAmount = new ArrayList();

                Iterator itrOuter = null;
                double totalAmount = 0;
                String chartType = request.getParameter("chartType");
                //Debug.print("paymentMode is "+paymentMode);
                String year1 = request.getParameter("year");
                int year = Integer.parseInt(year1.trim());
                areaPaymentDet = mahanadhiBean.getAreaPaymentDetails(year);


                itrOuter = areaPaymentDet.iterator();

                String areaName = null;
                Double amount = null;
                String area = null;
                for (int i = 1; i <= 9; i++) {


                    while (itrOuter.hasNext()) {
                        areaValues = (ArrayList) itrOuter.next();

                        String areaCode = (String) areaValues.get(0);
                        areaName = (String) areaValues.get(1);
                        amount = (Double) areaValues.get(2);

                        if (areaCode.equalsIgnoreCase("0" + i)) {
                            totalAmount = totalAmount + amount.doubleValue();
                        }


                    }
                    itrOuter = areaPaymentDet.iterator();
                    areaAmount.add(new Double(totalAmount));
                    totalAmount = 0;
                }
                itrOuter = areaPaymentDet.iterator();
                while (itrOuter.hasNext()) {
                    areaValues = (ArrayList) itrOuter.next();

                    String areaCode = (String) areaValues.get(0);
                    areaName = (String) areaValues.get(1);
                    amount = (Double) areaValues.get(2);

                    if (areaCode.equalsIgnoreCase("10")) {
                        totalAmount = totalAmount + amount.doubleValue();
                    }
                }

                areaAmount.add(new Double(totalAmount));
                totalAmount = 0;
                itrOuter = areaPaymentDet.iterator();
                while (itrOuter.hasNext()) {
                    areaValues = (ArrayList) itrOuter.next();

                    String areaCode = (String) areaValues.get(0);
                    areaName = (String) areaValues.get(1);
                    amount = (Double) areaValues.get(2);

                    if (areaCode.equalsIgnoreCase("11")) {
                        totalAmount = totalAmount + amount.doubleValue();
                    }

                }

                areaAmount.add(new Double(totalAmount));
                totalAmount = 0;
                for (int i = 0; i < 11; i++) {

                    Debug.print("-------------->>>>>>areaAmount values" + ((Double) areaAmount.get(i)).doubleValue());
                }
                Debug.print("areaAmount is " + areaAmount);
                session.setAttribute("areaAmount", areaAmount);
                //session.setAttribute("areaName",areaName);


                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("chart")) {
                            //generate Area Bar graph
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartAreaBar = BarGraph.createAreaBarGraph(areaAmount);
                            BarGraph.generateBarGraphImage(chartAreaBar, realPath);
                        } else if (graph[i].equalsIgnoreCase("pie")) {
                            //generate area Pie Graph
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartAreaPai = PieGraph.createAreaSalesPie(areaAmount);
                            PieGraph.generatePieGraphImage(chartAreaPai, realPath);
                        } else if (graph[i].equalsIgnoreCase("PyramidChart")) {
                            //generate Area Pyramid graph
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartAreaPyramid = PyramidGraph.createAreaSalesPyramid(areaAmount);
                            PyramidGraph.generatePyramidGraphImage(chartAreaPyramid, realPath);
                        } //generate Area Line graph
                        else if (graph[i].equalsIgnoreCase("Linechart")) {
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartAreaLine = LineGraph.createAreaSalesLine(areaAmount);
                            LineGraph.generateLineGraphImage(chartAreaLine, realPath);
                        }
                    }
                    request.setAttribute("graphsCount", graphNew);
                    request.setAttribute("title", year1 + " Area Sales Report");
                    findForward = "generateRegAreaPieFromDB";
                } else // For tabular view
                {
                    int j = 1;
                    String area_Name = null;
                    List list = new ArrayList();
                    for (Iterator it = areaAmount.iterator(); it.hasNext();) {
                        Double db = (Double) it.next();
                        if (j == 1) {
                            area_Name = "Area I";
                        }
                        if (j == 2) {
                            area_Name = "Area II";
                        }
                        if (j == 3) {
                            area_Name = "Area III";
                        }
                        if (j == 4) {
                            area_Name = "Area IV";
                        }
                        if (j == 5) {
                            area_Name = "Area V";
                        }
                        if (j == 6) {
                            area_Name = "Area VI";
                        }
                        if (j == 7) {
                            area_Name = "Area VII";
                        }
                        if (j == 8) {
                            area_Name = "Area VIII";
                        }
                        if (j == 9) {
                            area_Name = "Area IX";
                        }
                        if (j == 10) {
                            area_Name = "Area X";
                        }
                        if (j == 11) {
                            area_Name = "Area XI";
                        }
                        YearlySalesReport yearly = new YearlySalesReport();
                        yearly.setAreaName(area_Name);

                        yearly.setAmount(db);
                        list.add(yearly);
                        j = j + 1;
                    }
                    session.setAttribute("demo", list);
                    session.setAttribute("reportTitle", year1 + " Area Sales Report");
                    findForward = "generatePieAreaTabularReport";
                }
                return new ModelAndView(findForward);

            } else if (process != null && process.equalsIgnoreCase("regDet")) {
                String findForward = null;
                //String chartType = request.getParameter("chartType");
                String year = request.getParameter("year");
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList regDet = null;


                if (year != null) {
                    regDet = mahanadhiBean.getMemberRegistrationDetails(year);

                    Debug.print("regDet is " + regDet);
                    session.setAttribute("regDet", regDet);
                    session.setAttribute("yearValue", year);
                }

                //if (chartType.equals("Pie")) {
                //generating pie chart
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("pie")) {
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPie = PieGraph.createMemberShipSalesPie(regDet, year);
                            PieGraph.generatePieGraphImage(chartPie, realPath);
                        } //generating bar chart
                        else if (graph[i].equalsIgnoreCase("chart")) {
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartBar = BarGraph.createMemberShipSalesBar(regDet, year);
                            BarGraph.generateBarGraphImage(chartBar, realPath);
                        } //generating pyramid chart
                        else if (graph[i].equalsIgnoreCase("PyramidChart")) {
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartPyramid = PyramidGraph.createMemberShipSalesPyramid(regDet, year);
                            PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                        } //generating Line chart
                        else if (graph[i].equalsIgnoreCase("Linechart")) {
                            BIRTGraphsConfig.initializeDesignConfig(servletContext);
                            Chart chartLine = LineGraph.createMemberShipSalesLine(regDet, year);
                            LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                    }
                    request.setAttribute("graphsCount", graphNew);
                    findForward = "generateRegPieFromDB";
                } else {
                    int i = 1;
                    String area_Name = null;
                    List list = new ArrayList();
                    for (Iterator it = regDet.iterator(); it.hasNext();) {
                        Double db = (Double) it.next();

                        if (i == 1) {
                            area_Name = "Junior Member";
                        }
                        if (i == 2) {
                            area_Name = "Non-Competing Member";
                        }
                        if (i == 3) {
                            area_Name = "Subscribing Member";
                        }
                        if (i == 4) {
                            area_Name = "Family Member";
                        }
                        if (i == 5) {
                            area_Name = "Full Member";
                        }
                        if (i == 6) {
                            area_Name = "Life Member";
                        }
                        YearlySalesReport yearly = new YearlySalesReport();
                        yearly.setAreaName(area_Name);
                        yearly.setAmount(db);
                        list.add(yearly);
                        i = i + 1;
                    }
                    session.setAttribute("demo", list);
                    findForward = "generateRegPieFromDBTabular";
                }

                // } else if (chartType.equals("Bar")) {
                //  findForward = "generateDailyBarReport";
                // } else {
                // findForward = "generateDaily3DReport";
                //}

                return new ModelAndView(findForward);
            }



        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception in AccTransAction::::;" + e.getMessage());
        }
        Debug.print("AccTransAction.process: Final Return");
        return null;

    }
		
		/*private ServletContext context;

		public void setServletContext(ServletContext servletContext) {
		     this.context = servletContext;
		}*/
}
