package service;


import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.FunderServlet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

@Path("/Funder")

public class FunderService {
	FunderServlet funderObj = new FunderServlet();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readFunder()
	{
	return funderObj.readFunders();
	}
	
	@POST    
	@Path("/") 
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String insertFunder( 
		 @FormParam("funderName") String funderName,
		 @FormParam("funderEmail") String funderEmail,
		 @FormParam("funderTel") String funderTel,
		 @FormParam("funderGender") String funderGender,
		 @FormParam("funderDonation") String funderDonation,
		 @FormParam("funderDesc") String funderDesc)
		 
	{ 
		String output = funderObj.insertFunder(funderName,funderEmail,funderTel,funderGender,funderDonation,funderDesc); 
		return output; 
	}	
	
	
	@PUT
	@Path("/") 
	@Consumes(MediaType.APPLICATION_JSON) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String updateFunder(String funderData) 
	{ 
		//Convert the input string to a JSON object 
		 JsonObject funderObject = new JsonParser().parse(funderData).getAsJsonObject(); 
		//Read the values from the JSON object
		 String funderID = funderObject.get("funderID").getAsString();  
		 String funderName = funderObject.get("funderName").getAsString();
		 String funderEmail = funderObject.get("funderEmail").getAsString();
		 String funderTel = funderObject.get("funderTel").getAsString();
		 String funderGender = funderObject.get("funderGender").getAsString();
		 String funderDonation = funderObject.get("funderDonation").getAsString();   
		 String funderDesc = funderObject.get("funderDesc").getAsString(); 
		 
		 String output = funderObj.updateFunder(funderID, funderName, funderEmail, funderTel ,funderGender , funderDonation, funderDesc); 
		 return output; 
	}
	
	
	@DELETE
	@Path("/") 
	@Consumes(MediaType.APPLICATION_XML) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String deleteFunder(String funderData) 
	{ 
		//Convert the input string to an XML document
		 Document doc = Jsoup.parse(funderData, "", Parser.xmlParser()); 
		 
		//Read the value from the element <itemID>
		 String funderID = doc.select("funderID").text(); 
		 String output = funderObj.deleteFunder(funderID); 
		 return output; 
	}
}