package dropDowns;
import java.util.ArrayList;

public class FormTypeArrayList {
	
	

 	public ArrayList getFormTypeArrayList(String Form_type1)
	{
		
		
		ArrayList<String> list=new ArrayList<String>();
		list.add("File Share groups");
		list.add("Active Directory - DEV");
		list.add("AIX Unix");
		list.add("Application Xtender groups");
		list.add("Aveksa Compliance Manager (ACM)");
		list.add("Caseworks groups");
		list.add("CITRIX groups");
		list.add("Clarity");
		list.add("Clarity groups");
		list.add("Databases - Oracle");
		list.add("Databases - SQL");
		list.add("Databases - SQL DEV");
		list.add("EAI End System SME groups");
		list.add("ePortal Application groups");
		list.add("eService Portal Groups");
		list.add("Ferguson ASP");
		list.add("Folder Access");
		list.add("Gas Supply groups");
		list.add("GasPro");
		list.add("ITS Facilities");
		list.add("ITS Server Support groups");
		list.add("Miscellaneous groups");
		list.add("Mobile Mapping groups");
		list.add("Other");
		list.add("PeopleSoft Finance/Supply Chain (ePro)");
		list.add("PeopleSoft HRMS/Payroll");
		list.add("Powerplant/Powertax");
		list.add("Remote Access");
		list.add("SalesForce");
		list.add("Shared Mailbox Creation");
		list.add("SharePoint groups");
		list.add("Smallworld");
		list.add("Supervisor Change for Contractors");
		list.add("Supplier Interface Manager (SIM) Application  groups");
		list.add("Tableau Development");
		list.add("Transfer.washgas (FTP)");
		list.add("Transmission Risk Model (TRM)");
		list.add("Unity");
		list.add("WGES Coollinks");
		list.add("WGES Entegrate");
		list.add("WGES groups");
		list.add("WGL Distribution Lists");
		list.add("WM Asset Manager");
		list.add("WM BAF");
		list.add("WM Central Config");
		list.add("WM EE_GUI");
		list.add("WM Security Admin");
		list.add("WM Web Work Manager");
		list.add("WM Work Manager");
		list.add("Washington Gas On-boarding Express Access");
		list.add("Contractor On-boarding Express Access");
		list.add("Termination");
		list.add("Termination Request Form");
		list.add("Profile update");
		list.add("Application Access");
		
		list.add("Server Access");
		list.add("User List");
		list.add(Form_type1);
		return list;
	}
	
	
	public ArrayList getTicketType(String Ticket_type1)
	{
		ArrayList<String> type=new ArrayList<String>();
		type.add("Aveksa");
		type.add("Snow");
		type.add(Ticket_type1);
		return type;
	}

   public ArrayList getTicketCategory(String Ticket_Category1)
   {
	   ArrayList<String> ticketCategory=new ArrayList<String>();
	   ticketCategory.add("Normal Access Request");
	   ticketCategory.add("Onboarding Request	");
	   ticketCategory.add("Normal Termination");
	   ticketCategory.add("Escalated Access Request");
	   ticketCategory.add("Expedited Termination");
	   ticketCategory.add("ATS");
	   ticketCategory.add(Ticket_Category1);
	   
	   
	   return ticketCategory;
   }

  public ArrayList getLocation(String Location1)
  {
	  ArrayList<String> location=new ArrayList<String>();
	  location.add("Remote");
	  location.add("Corporate Office");
	  location.add("Rockville Station");
	  location.add("Southeast Station");
	  location.add("Chillum Station");
	  location.add("Northwest Station");
	  location.add("Springfield Center");
	  location.add("Manassas");
	  location.add("Dranesville Station");
	  location.add("Ravensworth Station");
	  location.add("Shenandoah");
	  location.add("Hampshire");
	  location.add("Frederick");
	  location.add("East Station");
	  location.add("LaPlata");
	  location.add("1100 H Street");
	  location.add("WGEServices HQ");
	  location.add("WGEServices MD");
	  location.add("WGEServices PA1");
	  location.add("WGEServices PA2");
	  location.add("WGEServices OH");
	  location.add("WGEServices PA3");
	  location.add("WGEServices PA4");
	  location.add("WGEServices NJ");
	  location.add("WGESystems McLean");
	  location.add("Anacostia Station");
	  location.add("Hampshire Retirement");
	  location.add("Shenandoah Retirement");
	  location.add("Washington Gas Retirement");
	  location.add(Location1);
	  
	  return  location;
  }

  public ArrayList getStatus(String Ticket_Status1)
  {
	  
	  ArrayList<String> status=new ArrayList<String>();
	  status.add("Inprogress");
	  status.add("Completed");
	  status.add("Awaiting User info");
	  status.add("Awaiting User confirmation");
	  status.add("Transferred");
	  status.add("Cancelled");
	  status.add("On-Hold");
	  status.add(Ticket_Status1);
	  return status;
  }

  public ArrayList getAFX(String AFX)
	{
		ArrayList<String> afx=new ArrayList<String>();
		afx.add("Yes");
		afx.add("No");
		afx.add(AFX);
		return afx;
	}
  public ArrayList getAssignee(String Assignee)
	{
		ArrayList<String> assigned=new ArrayList<String>();
		assigned.add("Ram");
		assigned.add("Saurabh");
		assigned.add("Namrata");
		assigned.add("Vijay");
		assigned.add("Arun");
		assigned.add(Assignee);
		return assigned;
	}


}
