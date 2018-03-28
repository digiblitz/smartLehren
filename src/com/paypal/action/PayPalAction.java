/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paypal.action;



import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.xmlrpc.XmlRpcException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.email.EmailContent;
import com.email.MailMail;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCPaymentResultVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcmrm.util.Debug;
import com.infusionejb.session.InfusionSessionBean;
import com.util.baseDB;



/**
 *
 * @author dhivya
 */


    /* forward name="success" path="" */
   // private final static String SUCCESS = "success";
   // NVPEncoder encoder = new NVPEncoder();
    //NVPDecoder decoder = new NVPDecoder();

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */

@Controller
public class PayPalAction {
    	
    	private final static String SUCCESS = "success"; 
    	
    	static Logger log = Logger.getLogger(PayPalAction.class.getName());
    	
    	public static final String prop_file = "paypalapi.properties";
    	
    	InputStream inputStream;
    	
    	@RequestMapping("/paypal.html")
    	public ModelAndView handleRequest(HttpServletRequest request,
    			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
    			IOException, ParserConfigurationException, SAXException, NoSuchAlgorithmException {
    		
    		//SSLContext ctx = SSLContext.getInstance("TLSv1.1");
    		    		
    		org.apache.axis.AxisProperties.setProperty("axis.socketSecureFactory", "com.paypal.sdk.core.DefaultSSLFactory");
    		
    		PayPalPayments paypalpayments = PayPalPayments.getInstance();
    		
        HttpSession session = request.getSession();
        InfusionSessionBean emails=new InfusionSessionBean();
        //String[] payDet = new String[7];
       
        //ArrayList finalPayResults = new ArrayList();
        baseDB db6 = baseDB.getInstance();
        // PaymentDetails objPayment = new PaymentDetails();
        //String fwd="success";
        
        
        //fetching the API creadentials from properties
        Properties prop = new Properties();
	     
		inputStream = getClass().getClassLoader().getResourceAsStream(prop_file);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + prop_file + "' not found in the classpath");
		}
			
		// get the property value and print it out
		String api_username = prop.getProperty("API_username");
		String api_password = prop.getProperty("API_password");
		String api_Signature = prop.getProperty("API_Signature");
						
		       
        try {

           /* Context jndiContext = new InitialContext();
            Object objPayss = jndiContext.lookup("ejb/HLCPaymentSessionBean");
            HLCPaymentSessionRemoteHome objPaySessHome = (HLCPaymentSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(objPayss, HLCPaymentSessionRemoteHome.class);
            HLCPaymentSessionRemote objPaySessRemote = objPaySessHome.create();

            MessageResources mr = getResources(request);
            String namingfactory = mr.getMessage("ejbclient.namingfactory");
            String contextfactory = mr.getMessage("ejbclient.contextfactory");
            String urlprovider = mr.getMessage("ejbclient.urlprovider");
            String lookupip = mr.getMessage("ejbclient.ip");

            String mahanadhiJndi = mr.getMessage("jndi.acc");
            Debug.print("mahanadhiJndi  :" + mahanadhiJndi);
            Object maha = jndiContext.lookup(mahanadhiJndi);
            HLCMahanadhiSessionRemoteHome mahaHome = (HLCMahanadhiSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(maha, HLCMahanadhiSessionRemoteHome.class);
            HLCMahanadhiSessionRemote mahaRemote = mahaHome.create();

            String jndiname = mr.getMessage("jndi.usrreg");
            Object objref = jndiContext.lookup(jndiname);
            HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCkaverystatelessRemoteHome.class);
            HLCkaverystatelessRemote remote = home.create();*/
        	
        	HLCkaverystatelessBean humanMemb = new HLCkaverystatelessBean();
            HLCPaymentResultVO payRes = new HLCPaymentResultVO();
            String forwardPage = null;

            String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");

            String purpose = (String) request.getParameter("purpose");
            
            //
            String API_username = api_username;
            String API_password = api_password;
            String API_Signature = api_Signature;
          
            
            //String API_username=request.getParameter("USER");
            //String API_password=request.getParameter("PWD");
            //String API_Signature=request.getParameter("SIGNATURE");
            String payAction = request.getParameter("PAYMENTACTION");
            String ccType = request.getParameter("CREDITCARDTYPE");
            String acct = request.getParameter("ACCT");
            String expDt = request.getParameter("EXPDATE");
            String ipAdd = request.getParameter("IPADDRESS");
            String fName = request.getParameter("FIRSTNAME");
            String cvvNo = request.getParameter("CVVNO");
            String street = request.getParameter("STREET");
            String city = request.getParameter("CITY");
            String state = request.getParameter("STATE");
            String zip = request.getParameter("ZIP");
            String amount = request.getParameter("AMT");
            String ccode = request.getParameter("COUNTRYCODE");
            String method = request.getParameter("METHOD");
            String version = request.getParameter("VERSION");
            String Environ = request.getParameter("ENVIRON");
            String emailId = request.getParameter("EMAIL");
            String coupon_code = request.getParameter("coupon_code");
           
            String coupon_value = request.getParameter("coupon_value");
            System.out.println("coupon code====>"+"===="+coupon_value);
            String product_type = request.getParameter("product_type");
            String currCode = request.getParameter("CURRENCYCODE");
            String expDat1 = request.getParameter("expDat1");
            System.out.println("Check database expiry detail===>"+expDat1);

            String inVoiceId1 = request.getParameter("INVId");

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String mobileno = request.getParameter("mobileno");
            String companyname = request.getParameter("companyname");
            String country = request.getParameter("country");
            String type = request.getParameter("type");
            String plan = request.getParameter("plan");
            String monthYear = request.getParameter("monthYear");
            String fee = request.getParameter("fee");
            String email1 = request.getParameter("EMAIL");
            String customerid=db6.selectcustomerid(email1);	
            
                       
            String INVId = (String) session.getAttribute("INVId");
            System.out.println("SESSION INVId in servlet:::" + INVId);

            String inVId = null;
            if (INVId == null || INVId.equalsIgnoreCase("null")) {
                inVId = "start";
            } else {
                inVId = INVId;
            }
            //System.out.println("inVoiceId1 in servlet:::" + inVoiceId1);
            /*System.out.println("inVId in servlet:::" + inVId);
            System.out.println("purpose in servlet:::" + purpose);
            System.out.println("API_username in servlet:::" + API_username);
            System.out.println("API_password in servlet:::" + API_password);
            System.out.println("API_Signature in servlet:::" + API_Signature);
            System.out.println("method in servlet:::" + method);
            System.out.println("amount in servlet:::" + amount);
            System.out.println("version in servlet:::" + version);
            System.out.println("Environ in servlet:::" + Environ);
            System.out.println("payAction in servlet:::" + payAction);
            System.out.println("ccType in servlet:::" + ccType);
            System.out.println("acct in servlet:::" + acct);
            System.out.println("expDt in servlet:::" + expDt);
            System.out.println("cvvNo in servlet:::" + cvvNo);
            System.out.println("fName in servlet:::" + fName);
            System.out.println("ipAdd in servlet:::" + ipAdd);
           System.out.println("emailId in servlet:::" + emailId);*/


            session.setAttribute("inVoiceId1", inVoiceId1);

            /*session.setAttribute("API_username", API_username);
            session.setAttribute("API_password", API_password);
            session.setAttribute("API_Signature", API_Signature);*/
            session.setAttribute("currCode", currCode);
            session.setAttribute("amount", amount);
            session.setAttribute("purpose", purpose); 

            /* String API_username="dhivya_1237881559_biz_api1.digiblitz.com";
            String API_password="1237881603";
            String API_Signature="AZz-.wpdCAiKvEaTAQDfbvLNOC1RA9dqJQtBGucKZ9D.wxwoO6D7nQy2";
            String method="DoDirectPayment";
            String amount="10.00";
            String version="51.0";
            String Environ="sandbox";
            String payAction="Sale";
            String ccType="Visa";
            String acct="4169580619448012";
            String expDt="032019";
            String ipAdd="192.168.1.5"; 
            String fName="dhivya";
            String lName="AB";
            String street="1 Main St";
            String city="San Jose";
            String state="CA";  
            String zip="95131";
            String ccode="US";*/

//System.out.println("API_username:" + API_username);
//System.out.println("API_password:" + API_password);
//System.out.println("API_Signature:" + API_Signature);
            System.out.println("amount:" + amount);
                        
            String results[] = null;
            if (sessionInvoiceId.equalsIgnoreCase("1")) {
                results = paypalpayments.DoDirectPaymentCode(API_username, API_password, API_Signature, method, amount, version, Environ, payAction, ccType, acct, expDt, cvvNo, fName, ipAdd, emailId, inVId, inVoiceId1,lastname,street,city,state,ccode,zip);
            }
            //System.out.println("results:" + results);
            session.setAttribute("results", results);
            String statusId3=null;
            if (results != null) {

                 statusId3 = (String) results[0];
                String transactionId3 = (String) results[2];
                String compType3 = "Complete";
                String inVoiceId3 = (String) results[6];
                String ppAmt3 = (String) results[3];
                String sslAvsResponse = (String) results[4];
                String sslCvv2Response = (String) results[5];
                String lngMsg = (String) results[7];
                String errorCd = (String) results[8];
                String tmStmp = (String) results[9];
                String Environ1 = (String) results[10];
                String sslResultMessage = (String) results[0];
                String finalSslAvsResponse = "";
                String finalSslCvv2Response = "";

                if (sslAvsResponse == null || sslAvsResponse.equalsIgnoreCase("")) {
                    finalSslAvsResponse = "NG";
                } else {
                    finalSslAvsResponse = sslAvsResponse;
                }
                if (sslCvv2Response == null || sslCvv2Response.equalsIgnoreCase("")) {
                    finalSslCvv2Response = "NG";
                } else {
                    finalSslCvv2Response = sslCvv2Response;
                }

                session.setAttribute("sessionInvoiceId", inVoiceId3);

                payRes.setAmount(amount);
                payRes.setErrorCd(errorCd);
                payRes.setLngMsg(lngMsg);
                payRes.setSslAvsResponse(finalSslAvsResponse);
                payRes.setSslCvv2Response(finalSslCvv2Response);
                payRes.setTmStmp(tmStmp);

                session.setAttribute("payRes", payRes);

                HLCPaymentDetails objPayment = null;
                if (session.getAttribute("objPayment") != null && session.getAttribute("objPayment") instanceof HLCPaymentDetails) {
                    objPayment = (HLCPaymentDetails) session.getAttribute("objPayment");
                }
 
                Debug.print("objPayment"+objPayment);                
                /*if(objPayment.getPaymentId()!=null){
                String payId=objPayment.getPaymentId();
                session.setAttribute("payId", payId);
                }*/
                
                HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();

                //System.out.println("ppAmt in DoDirectPaymentCode#####" + ppAmt3);
                //System.out.println("statusId3 in servlet#####" + statusId3);
                //System.out.println("Transaction Id ----:" + transactionId3);

                String currCode1 = (String) session.getAttribute("currCode");
                String amount1 = (String) session.getAttribute("amount");
                System.out.println("amount1 in paypal: " + amount1);
                //System.out.println("currCode in paypal:........... " + currCode1);
                String method1 = "DoCapture";
                String version1 = "51.0";
               // String Environ1 = "sandbox";
                String payAction1 = "Authorization";
                String method2 = "DoAuthorization";


                if (statusId3.equalsIgnoreCase("Success")) {


                    //String authorRes[] = PayPalPayments.DoAuthorizationCode(API_username, API_password, API_Signature, method2, amount1, version1, Environ1, transactionId3, currCode1);

                    if (results != null) {

                       // String statusId2 = (String) authorRes[0];
                      //  String authorId = (String) authorRes[1];
                      //  String payAmt = (String) authorRes[2];

                        //System.out.println("authorId in doAuthorization" + authorId + "satatus Id:" + statusId2 + " Payment amount" + payAmt);

                        String results1[] = PayPalPayments.doCapture(API_username, API_password, API_Signature, method1, amount1, version1, Environ1, payAction1, transactionId3, compType3, inVoiceId3);

                        String statusId1 = (String) results1[0];
                        String ppAuthorizationID = null;
                        if (results1[1] != null) {
                            ppAuthorizationID = (String) results1[1];
                        } else {
                            String correctAction = humanMemb.getErrorDets(errorCd);
                            String finalCorecAction = "";
                            if (correctAction != null && !(correctAction.equalsIgnoreCase(""))) {
                                finalCorecAction = correctAction;
                            } else {
                                finalCorecAction = "NG";
                            }
                            //System.out.println("Inside Paypal ACtion "+finalSslAvsResponse+"  "+finalSslCvv2Response);
                           // String emailToUSEA=mr.getMessage("hlc.emailid");
                            //String emailToUSEA="parasu88@gmail.com";
                            String toMailIds[] = {"finance@digiblitz.com","sales@digiblitz.com",emailId};
                            EmailContent email = new EmailContent();
                            email.setTo(toMailIds);
                            email.setFrom("info@digiblitz.com");
                            String subject=null;
                              if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            subject="Horse Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             subject="Change Rider Owner Decline";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                            subject="Add Rider Owner Decline";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            subject="Not Registered Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            subject="Membership Renewal  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             subject="Membership Registration  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            subject="Education Activity Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             subject="Upgrade Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            subject="Area Membership Decline";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            subject="Event Registration Decline";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                             subject="Annual Meeting Registration Decline";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                               subject="Donation Decline";
                          }
                             else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                               subject="Purchasing Tickets for Area Reception Decline";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              
                          }
                            
                              
                              //******infusion payment decline***//
                              boolean  emailstatus=false;
                              String fromAddress="sales@smartlehren.com";
                    		  String toAddress=emailId;
                              String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                               subject="Payment Failure"; String textBody="";
                               String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                           			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                           			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:18443/smartlehren/images/smartLehrenlogo.png\" alt=\"Logo\"/></a></td>" +
                           			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                           			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                           			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                           					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Sorry for inconvenience</h4><p style=\"   font-size: 19px;" +
                           					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Invalid Transaction.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                           					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:18443/smartlehren\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                           					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                           					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                           					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>First Name</strong><br />"+firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>Email ID</strong><br />"+emailId+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>Message</strong><br /> "+lngMsg+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>TIME STAMP </strong><br /> "+tmStmp+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>Error Code</strong><br /> "+errorCd+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>Amount</strong><br /> $"+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                              try {
             					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
             				} catch (XmlRpcException e) {
             					// TODO Auto-generated catch block
             					e.printStackTrace();
             				}
                              
                            email.setSubject(subject);
                            String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                                    " <tr>" +
                                    " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                                    " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                                    "<tr>" +
                                    "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                                    " </tr>" +
                                    "  <tr>" +
                                    "<td valign=\"top\">" +
                                    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                                    "<tr>" +
                                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                                    "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                                    "</tr>" +
                                    "<tr>" +
                                    "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                                    "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                                    "<p>Payment has been declined and the details are as follows:<p>" +
                                    "<span class=\"boldTxt\">Declined Details:</span>.</p>" +
                                    "TIMESTAMP:" + tmStmp + " <br/>" +
                                    "L_ERRORCODE0:" + errorCd + "<br/>" +
                                    "L_LONGMESSAGE0:" + lngMsg + "<br/>" +
                                    "AMT:" + amount + "<br/>" +
                                    "AVSCODE: " + finalSslAvsResponse + "<br/>" +
                                    "CVV2MATCH:" + finalSslCvv2Response + "<br/>" +
                                    "Corrective action:" + finalCorecAction + "<br/></p>" +
                                    "<span class=\"boldRedTxt\">HLC Team</span></td>" +
                                    "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                                    "</tr>" +
                                    "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                                    "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                                    "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                                    "</tr>" +
                                    " </table>" +
                                    "</td></tr>" +
                                    "+<tr>" +
                                    "<td valign=\"top\" style=\"padding:10px;\">" +
                                    "</td>" +
                                    "</tr>" +
                                    " <tr>" +
                                    "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                                    "</tr>" +
                                    "</table>";
                            email.setBody(content);
                            MailMail mail = new MailMail();
                            boolean emailFlag = mail.sendMimeEmail(email);
                            Debug.print("Email sent sucessfully :" + emailFlag);
                            request.setAttribute("msg", "Payment Declined");
                            request.setAttribute("errorCd", errorCd);
                            request.setAttribute("lngMsg", lngMsg);
                            request.setAttribute("emailId", emailId);
                            /*session.removeAttribute("API_username1");
                            session.removeAttribute("API_password1");
                            session.removeAttribute("API_Signature1");*/
                            session.removeAttribute("currCode1");
                            session.removeAttribute("amount1");
                            return new ModelAndView("payDecline"); 
                        }
                        String payInfo = (String) results1[2];
                        String sslTxnId = (String) results1[3];
                        String sslTransactionType = (String) results1[4];
                        String ppPaymentType = (String) results1[5];
                        String payDt = (String) results1[6].replace("%2d", "-");
                        payDt=(String)payDt.replace("%3a",":");
                        String grsAmt = (String) results1[7].replace("%2e", ".");
                        String ppFeeAmt = (String) results1[8].replace("%2e", ".");
                        String ppSettleAmt = (String) results1[9].replace("%2e", ".");
                        String ppTaxAmt = (String) results1[10].replace("%2e", ".");
                        String ppExchangeRate = (String) results1[11];
                        String ppPaymentStatus = (String) results1[12];
                        String ppPendingReason = (String) results1[13];
                        String PP_back1 = (String) results1[14];
                        String sslInvoiceNo = (String) results1[15].replace("%2d", "-");
                        String timeStmp = (String) results1[16];
                        String ppCorrelationID = (String) results1[17];
                        String ppParentTransactionID = (String) results1[18];
                        String ppReasonCode = (String) results1[19];

                        /* System.out.println("grsAmt::::::"+grsAmt);
                        System.out.println("ppFeeAmt::::::"+ppFeeAmt);
                        System.out.println("ppSettleAmt::::::"+ppSettleAmt);
                        System.out.println("ppTaxAmt::::::"+ppTaxAmt);
                        System.out.println("sslInvoiceNo::::::"+sslInvoiceNo);
                        System.out.println("sslTxnId::::::"+sslTxnId);*/


                        /*System.out.println("results1 in doCapture"+results1); 
                        System.out.println("statusId1 in doCapture"+statusId1); 
                        System.out.println("authorId1 in doCapture"+authorId1); 
                        System.out.println("payInfo in doCapture"+payInfo);  
                        System.out.println("transacId in doCapture"+transacId);
                        System.out.println("transacTyp in doCapture"+transacTyp);
                        System.out.println("payType in doCapture"+payType);
                        System.out.println("payDt in doCapture"+payDt);
                        System.out.println("grsAmt in doCapture"+grsAmt);
                        System.out.println("feAmt in doCapture"+feAmt);
                        System.out.println("sAmt in doCapture"+sAmt);
                        System.out.println("tAmt in doCapture"+tAmt);
                        System.out.println("exRt in doCapture"+exRt);
                        System.out.println("payStat in doCapture"+payStat);
                        System.out.println("pendR in doCapture"+pendR);
                        System.out.println("PP_back1 in doCapture"+PP_back1);
                        System.out.println("recpId in doCapture"+recpId);
                        System.out.println("timeStmp in doCapture"+timeStmp);
                        System.out.println("correlId in doCapture"+correlId);
                        System.out.println("parentId in doCapture"+parentId);
                        System.out.println("reasonCode in doCapture"+reasonCode);*/

                        if (session.getAttribute("objPayment") != null && session.getAttribute("objPayment") instanceof HLCPaymentDetails) {
                            System.out.println("objPayment instanceof PaymentDetails");
                            objPayDet.setPaymentId(objPayment.getPaymentId());
                            objPayDet.setUserId(objPayment.getUserId());
                            objPayDet.setCcName(objPayment.getCcName());
                            objPayDet.setCcType(objPayment.getCcType());
                            objPayDet.setCcExpMonth(objPayment.getCcExpMonth());
                            objPayDet.setCcExpYear(objPayment.getCcExpYear());
                            objPayDet.setCcCvvid(objPayment.getCcCvvid());
                            objPayDet.setBankName(objPayment.getBankName());
                            objPayDet.setAmount(objPayment.getAmount());
                            objPayDet.setPaymentStatus(objPayment.getPaymentStatus());
                            objPayDet.setCcNumber(objPayment.getCcNumber());
                            objPayDet.setIpAddress(objPayment.getIpAddress());
                        }

                        objPayDet.setSslResultMessage(sslResultMessage);
                        String sslResult = "0";
                        if (statusId3.equalsIgnoreCase("Success")) {
                            objPayDet.setSslResult(sslResult);
                        } else {
                            sslResult = "1";
                            objPayDet.setSslResult(sslResult);
                        }

                        objPayDet.setSslTxnId(sslTxnId);
                        // objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(String.valueOf(session.getAttribute("emailId")));
                        objPayDet.setPpAuthorizationID(ppAuthorizationID);
                        objPayDet.setPpPaymentType(ppPaymentType);
                        if (ppFeeAmt != null && !(ppFeeAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpFeeAmt(Double.parseDouble(ppFeeAmt));
                        } else {
                            objPayDet.setPpFeeAmt(0);
                        }
                        if (ppSettleAmt != null && !(ppSettleAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpSettleAmt(Double.parseDouble(ppSettleAmt));
                        } else {
                            objPayDet.setPpSettleAmt(0);
                        }
                        if (ppTaxAmt != null && !(ppTaxAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpTaxAmt(Double.parseDouble(ppTaxAmt));
                        } else {
                            objPayDet.setPpTaxAmt(0);
                        }
                        objPayDet.setPpExchangeRate(ppExchangeRate);
                        objPayDet.setPpPaymentStatus(ppPaymentStatus);
                        objPayDet.setPpPendingReason(ppPendingReason);
                        objPayDet.setPpCorrelationID(ppCorrelationID);
                        objPayDet.setPpParentTransactionID(ppParentTransactionID);
                        objPayDet.setPpReasonCode(ppReasonCode);
                        objPayDet.setInVoiceID(inVoiceId3);
                        objPayDet.setAmount(Double.parseDouble(amount1));

                        //System.out.println("objPayDet in servlet:" + objPayDet);
                        // }

                        //if(results!=null){
                        String statusId = (String) results[0];
                        String correlationId = (String) results[1];
                        String transactionId = (String) results[2];
                        String ppAmt = (String) results[3];
                        String avsCode = (String) results[4];
                        String cvv2 = (String) results[5];
                        String inVoiceId = (String) results[6];


                        System.out.println("statusId:" + statusId);
                      //  System.out.println("payDt:"+payDt);
                      //  System.out.println("invoiceid3:"+inVoiceId3);
                      //  System.out.println("amount:"+amount1);
                     //  System.out.println("ppFeeAmount:"+ppFeeAmt);
                         //System.out.println("transactionId:" + transactionId);
                        session.setAttribute("statusId3", statusId3);
                        session.setAttribute("statusId", statusId);
                        session.setAttribute("objPayDet", objPayDet);
                        
                        
                        
                        db6.insertsignup(firstname,lastname,emailId,mobileno,city,state,country,companyname,ccType,acct,cvvNo,fName,expDat1,monthYear, type, plan, amount, transactionId,coupon_code,coupon_value,product_type);
                        /*if (statusId.equalsIgnoreCase("Success")) {
                        boolean resultPay = objPaySessRemote.createPayment(objPayDet);
                        request.setAttribute("result", String.valueOf(resultPay));
                        System.out.println("resultPay in PayPalAction::::::" + resultPay);
                        String ccNumber1 = "";
                        if (!(objPayment.getCcNumber().equals("0"))) {
                        String temp = objPayment.getCcNumber().substring(0, 2);
                        String temp1 = objPayment.getCcNumber().substring(2, 12);
                        String temp2 = objPayment.getCcNumber().substring(12);
                        temp1 = "***";
                        ccNumber1 = temp + temp1 + temp2;
                        }*/
                         
                        //String emailToUSEA=mr.getMessage("hlc.emailid");
                       
                        //********infusion payment success*****//
                        boolean  emailstatus=false;
                        String fromAddress="sales@smartlehren.com";
              		  String toAddress=emailId;
                        String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                         String subject="Payment Success"; String textBody="";
                         String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                     			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                     			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:18443/smartlehren/images/smartLehrenlogo.png\" alt=\"Logo\"/></a></td>" +
                     			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                     			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                     			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                     					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Congratulation!!</h4><p style=\"   font-size: 19px;" +
                     					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Your Transaction completed successfully.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                     					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:18443/smartlehren\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                     					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                     					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                     					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>First Name</strong><br />"+firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Email ID</strong><br />"+emailId+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Institution Name</strong><br />"+companyname+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Package Type</strong><br />"+type+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Total Amount</strong><br /> $"+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"<strong>Transaction ID</strong><br /> "+transactionId+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                        try {
       					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
       				} catch (XmlRpcException e) {
       					// TODO Auto-generated catch block
       					e.printStackTrace();
       				}
                        
                        String emailToUSEA="parasu88@gmail.com";
                        String toMailIds[] = {"finance@digiblitz.com","sales@digiblitz.com",emailId};
                        EmailContent email = new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@digiblitz.com");
                        email.setSubject("Payment Details");
                        String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                        " <tr>" +
                        " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                        " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                        "<tr>" +
                        "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                        " </tr>" +
                        "  <tr>" +
                        "<td valign=\"top\">" +
                        "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                        "<tr>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                        "</tr>" +
                        "<tr>" +
                        "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                        "<p>Payment has been made successfully and the details are as follows:<p>" +
                        "<span class=\"boldTxt\">Payment Details:</span></p>" +
                        "Payment Date:" + payDt + " <br/>" +
                        "Invoice ID:" + inVoiceId3 + "<br/>" +
                        "Amount:" + amount1 + "<br/>" +
                        "Fee Amount:" + ppFeeAmt + "<br/>" +
                        "cc Name: " + ccType + "<br/>" +
                        "cc Number:" + acct+ "<br/>" +
                        "Email ID:" + emailId + "<br/></p>" +
                        "<span class=\"boldRedTxt\">HLC Team</span></td>" +
                        "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        " </table>" +
                        "</td></tr>" +
                        "+<tr>" +
                        "<td valign=\"top\" style=\"padding:10px;\">" +
                        "</td>" +
                        "</tr>" +
                        " <tr>" +
                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                        "</tr>" +
                        "</table>";
                        email.setBody(content);
                        MailMail mail = new MailMail();
                        //boolean emailFlag = mail.sendMimeEmail(email);
                        //Debug.print("Email sent sucessfully :" + emailFlag);
                        
                        
                        
                        
                        
                        /*request.setAttribute("correlationId", correlationId);
                        request.setAttribute("transactionId", transactionId);
                        request.setAttribute("ppAmt", amount);
                        request.setAttribute("avsCode", avsCode);
                        request.setAttribute("cvv2", cvv2);
                        request.setAttribute("INVId", inVoiceId);
                        session.removeAttribute("API_username1");
                        session.removeAttribute("API_password1");
                        session.removeAttribute("API_Signature1");
                        session.removeAttribute("currCode1");
                        session.removeAttribute("amount1");
                        }*/
                        session.setAttribute("amount", amount1);
                        session.setAttribute("cctype", ccType);
                        session.setAttribute("acctno", acct);
                        session.setAttribute("emailId", emailId);
                        session.setAttribute("payDt", payDt);
                        session.setAttribute("firstname", firstname);
                        session.setAttribute("lastname", lastname);
                        session.setAttribute("companyname", companyname);
                        session.setAttribute("customerid", customerid);
                        session.setAttribute("type", type);
                        session.setAttribute("plan", plan);
                        session.setAttribute("amount", amount);
                        session.setAttribute("transactionId", transactionId);
                        session.setAttribute("inVoiceId", inVoiceId);
                        System.out.println("purpose here: " + purpose);
                       
                        if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            session.setAttribute("purpose","newhorseregistration");
                            forwardPage = "horseRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             session.setAttribute("purpose","horseriderownerchange");
                            forwardPage = "riderOwnerChange";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                             session.setAttribute("purpose","addriderowner");
                            forwardPage = "addRiderOwner";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            session.setAttribute("purpose","notregisteredhorse");
                            forwardPage = "notRegisteredHorse";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            session.setAttribute("purpose","membershiprenewal");
                            forwardPage = "membershipRenewal";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                            session.setAttribute("purpose","memberregistration");
                            forwardPage = "memberRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            forwardPage = "educationRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             session.setAttribute("purpose","upgradehorse");
                            forwardPage = "upgradeHorseRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            forwardPage = "AreaMembership";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            forwardPage = "EndorsedFormRegistration";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                            forwardPage = "annualMeetingRegistration";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                        else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                             session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                        
                        else {

                            forwardPage = "paySuccess";
                        }
                        return new ModelAndView("forwardPage"); 
                       
                    }
                /*else if (statusId3.equalsIgnoreCase("Failure")) {
                System.out.println("Inside Failure11111");
                String correctAction = remote.getErrorDets(errorCd);
                String finalCorecAction = "";
                if (correctAction != null && correctAction.equalsIgnoreCase("")) {
                finalCorecAction = correctAction;
                } else {
                finalCorecAction = "NG";
                }
                String toMailIds[] = {"payments@useventing.com"};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dashboard@useventing.com");
                email.setSubject("Donation");
                String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                " <tr>" +
                " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                "<tr>" +
                "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"USEA Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                " </tr>" +
                "  <tr>" +
                "<td valign=\"top\">" +
                "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                "<tr>" +
                "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                "</tr>" +
                "<tr>" +
                "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                "<p>Payment has been declined and the details are as follows:<p>" +
                "<span class=\"boldTxt\">Declined Details:</span>.</p>" +
                "TIMESTAMP:" + tmStmp + " <br/>" +
                "L_ERRORCODE0:" + errorCd + "<br/>" +
                "L_LONGMESSAGE0:" + lngMsg + "<br/>" +
                "AMT:" + amount + "<br/>" +
                "AVSCODE: " + sslAvsResponse + "<br/>" +
                "CVV2MATCH:" + sslCvv2Response + "<br/>" +
                "Corrective action:" + finalCorecAction + "<br/></p>" +
                "<span class=\"boldRedTxt\">USEA Team</span></td>" +
                "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                "</tr>" +
                "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                "</tr>" +
                " </table>" +
                "</td></tr>" +
                "+<tr>" +
                "<td valign=\"top\" style=\"padding:10px;\">" +
                "</td>" +
                "</tr>" +
                " <tr>" +
                "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                "</tr>" +
                "</table>";
                email.setBody(content);
                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                Debug.print("Email sent sucessfully :" + emailFlag);
                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);
                session.removeAttribute("API_username1");
                session.removeAttribute("API_password1");
                session.removeAttribute("API_Signature1");
                session.removeAttribute("currCode1");
                session.removeAttribute("amount1");
                return mapping.findForward("payDecline");
                }*/
                } else {
                    System.out.println("Inside Failure");
                    System.out.println("Inside Failure22222");

                   /* String correctAction = humanMemb.getErrorDets(errorCd);
                    System.out.println("Inside correctAction"+correctAction);
                    String finalCorecAction = "";

                    if (correctAction != null || !(correctAction.equalsIgnoreCase(""))) {
                        finalCorecAction = correctAction;
                    } else {
                        finalCorecAction = "NG";
                    }
                    payRes.setFinalCorecAction(finalCorecAction);*/
                    session.setAttribute("payRes", payRes);
                    session.setAttribute("statusId3", statusId3);
                    //System.out.println("Inside Paypal ACtion "+finalSslAvsResponse+"  "+finalSslCvv2Response);
                    // String emailToUSEA=mr.getMessage("hlc.emailid");
                     String emailToUSEA="parasu88@gmail.com";
                     String toMailIds[] = {"finance@digiblitz.com","sales@digiblitz.com",emailId};
                    EmailContent email = new EmailContent();
                    email.setTo(toMailIds);
                    email.setFrom("info@digiblitz.com");
                    String subject=null;
                              if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            subject="Horse Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             subject="Horse Rider/Owner Change Decline";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                            subject="Add Rider/Owner Decline";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            subject="Not Registered Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            subject="Membership Renewal  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             subject="Membership Registration  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            subject="Education Activity Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             subject="Upgrade Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            subject="Area Membership Decline";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            subject="Event Registration Decline";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                             subject="Annual Meeting Registration Decline";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                               subject="Donation Decline";
                          }
                         else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                               subject="Purchasing Tickets for Area Reception Decline";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              
                          }
                              
                              
                              //****infusion payment decline*****//
                              boolean  emailstatus=false;
                              String fromAddress="sales@smartlehren.com";
                    		  String toAddress=emailId;
                              String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                               subject="Payment Failure"; String textBody="";
                               String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                           			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                           			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:18443/smartlehren/images/smartLehrenlogo.png\" alt=\"Logo\"/></a></td>" +
                           			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                           			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                           			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                           					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Sorry for inconvenience</h4><p style=\"   font-size: 19px;" +
                           					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Invalid Transaction.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                           					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:18443/smartlehren\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                           					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                           					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                           					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>First Name</strong><br />"+firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>Email ID</strong><br />"+emailId+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                           					"<strong>Message</strong><br /> "+lngMsg+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>TIME STAMP </strong><br /> "+tmStmp+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>Error Code</strong><br /> "+errorCd+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"<strong>Amount</strong><br /> $"+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                           					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                              try {
             					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
             				} catch (XmlRpcException e) {
             					// TODO Auto-generated catch block
             					e.printStackTrace();
             				}
                     email.setSubject(subject);
                    String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                    " <tr>" +
                    " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                    " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                    "<tr>" +
                    "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                    " </tr>" +
                    "  <tr>" +
                    "<td valign=\"top\">" +
                    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                    "<tr>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                    "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                    "<p>Payment has been declined and the details are as follows:<p>" +
                    "<span class=\"boldTxt\">Declined Details:</span>.</p>" +
                    "TIMESTAMP:" + tmStmp + " <br/>" +
                    "L_ERRORCODE0:" + errorCd + "<br/>" +
                    "L_LONGMESSAGE0:" + lngMsg + "<br/>" +
                    "AMT:" + amount + "<br/>" +
                    "AVSCODE: " + finalSslAvsResponse + "<br/>" +
                    "CVV2MATCH:" + finalSslCvv2Response + "<br/>" +
                    "Corrective action:" + //finalCorecAction + "<br/></p>" +
                    "<span class=\"boldRedTxt\">HLC Team</span></td>" +
                    "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                    "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                    "</tr>" +
                    " </table>" +
                    "</td></tr>" +
                    "+<tr>" +
                    "<td valign=\"top\" style=\"padding:10px;\">" +
                    "</td>" +
                    "</tr>" +
                    " <tr>" +
                    "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                    "</tr>" +
                    "</table>";
                    email.setBody(content);
                    MailMail mail = new MailMail();
                    //boolean emailFlag = mail.sendMimeEmail(email);
                    //Debug.print("Email sent sucessfully :" + emailFlag);
                    /* session.removeAttribute("API_username1");
                    session.removeAttribute("API_password1");
                    session.removeAttribute("API_Signature1");
                    session.removeAttribute("currCode1");
                    session.removeAttribute("amount1");*/
                    
                    System.out.println("purpose in decline: " + purpose);
                    if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                        session.setAttribute("purpose","newhorseregistration");
                        forwardPage = "horseRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                        session.setAttribute("purpose","horseriderownerchange");
                        forwardPage = "riderOwnerChange";
                    } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                        session.setAttribute("purpose","addriderowner");
                        forwardPage = "addRiderOwner";
                    } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                        session.setAttribute("purpose","notregisteredhorse");
                        forwardPage = "notRegisteredHorse";
                    } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                        session.setAttribute("purpose","membershiprenewal");
                        forwardPage = "membershipRenewal";
                    } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                        session.setAttribute("purpose","memberregistration");
                        forwardPage = "memberRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                        forwardPage = "educationRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                         session.setAttribute("purpose","upgradehorse");
                        forwardPage = "upgradeHorseRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                        forwardPage = "AreaMembership";
                    } 
                     else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            forwardPage = "EndorsedFormRegistration";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                            forwardPage = "annualMeetingRegistration";
                           } 
                    else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                     else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                     else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                              session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                    else {
                        forwardPage = "payDecline";
                    }
                    request.setAttribute("msg", "Payment Declined");
                    request.setAttribute("errorCd", errorCd);
                    request.setAttribute("lngMsg", lngMsg);
                    request.setAttribute("emailId", emailId);
                    return new ModelAndView("payDecline"); 
                }
            } else {
                /*request.setAttribute("msg", "Payment Already Made");
                session.removeAttribute("API_username1");
                session.removeAttribute("API_password1");
                session.removeAttribute("API_Signature1");
                session.removeAttribute("currCode1");
                session.removeAttribute("amount1");
                return mapping.findForward("payDecline");*/
               
                session.setAttribute("statusId3", statusId3);
                System.out.println("purpose in result null: " + purpose);

                if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                   session.setAttribute("purpose","newhorseregistration");  
                    forwardPage = "horseRegistration";
                } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                    session.setAttribute("purpose","horseriderownerchange");
                    forwardPage = "riderOwnerChange";
                } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                     session.setAttribute("purpose","addriderowner");
                    forwardPage = "addRiderOwner";
                } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                    session.setAttribute("purpose","notregisteredhorse");  
                    forwardPage = "notRegisteredHorse";
                } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                     session.setAttribute("purpose","membershiprenewal");
                    forwardPage = "membershipRenewal";
                } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                    forwardPage = "educationRegistration";
                } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                    session.setAttribute("purpose","upgradehorse"); 
                    forwardPage = "upgradeHorseRegistration";
                } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                    forwardPage = "AreaMembership";
                } 
                else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                    forwardPage = "EndorsedFormRegistration";
                }
                else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                forwardPage = "annualMeetingRegistration";
                }
                else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             session.setAttribute("purpose","memberregistration");
                            forwardPage = "memberRegistration";
                        }
                 else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                 else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                              session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                else {
                    forwardPage = "payDecline";
                }
                request.setAttribute("emailId", emailId);
                return new ModelAndView("forwardPage"); 

            }

        } catch (Exception e) {
            System.out.print("in the catch block");
            e.printStackTrace();
            String emailId = request.getParameter("EMAIL");
            request.setAttribute("emailId", emailId);
            return new ModelAndView("payDecline"); 
            
        }
        return null;

    }
    	
  
}
