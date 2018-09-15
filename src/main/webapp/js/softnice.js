


function getState(countryCode,stateCode){
  
	softNiceUtilityData.getState(countryCode,{
		callback : function(str) 
		{
			 list = str.list;
			 var slist ='<option value="0">Select</option>';
			 $('#city').html('<option value="0">Select</option>');
			// alert(stateCode);
			 for(var i=0; i<list.length;i++)
			 {

				 if(stateCode==list[i].code){
					 slist += '<option selected="selected" value='+list[i].code+'>'+list[i].name+'</option>';
				 }else{
					 slist += '<option value='+list[i].code+'>'+list[i].name+'</option>';
				 }
					
	        	
	         }         

	         $('#state').html(slist);
	       
         } 
    });
}
function getCity(stateCode,cityCode){
	  
	//$('#ajaxLoader').find(".lightbox").show();
	softNiceUtilityData.getCity(stateCode,{
		callback : function(str) 
		{
			 list = str.list;
			 var slist ='<option value="0">Select</option>';
			 for(var i=0; i<list.length;i++)
			 {
				 
				 if(cityCode==list[i].code){
					 slist += '<option selected="selected" value='+list[i].code+'>'+list[i].name+'</option>';
				 }else{
					 slist += '<option value='+list[i].code+'>'+list[i].name+'</option>';
				 }
					
	        	
	         }         

	         $('#city').html(slist);
	         
	         
	        // $('#ajaxLoader').find(".lightbox").hide();
	       
         } 
    });
}

function sendInterested(toMemberId,fromMemberId){ 
	
	softNiceUtilityData.sendRequestInterested(toMemberId,fromMemberId,{
		callback : function(str) 
		{
			 if(str == 'Sucess'){
				 
				 document.getElementById("requestResult").value = "0";
				 return "0";
				 
			 }else{
				 document.getElementById("requestResult").value = "1";
				 return "1";
			 }
	       
         } 
    });
	
	//wait(2000);
}

function getEndDate(startDate,planId){
	softNiceUtilityData.getEndDate(startDate,planId,{
		callback : function(str) 
		{
			$('#txtEndDate').val(str);
	       
         } 
    });
	
}