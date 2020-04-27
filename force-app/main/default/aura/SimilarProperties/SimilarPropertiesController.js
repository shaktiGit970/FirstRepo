({
	doInit : function(component, event, helper) {
        var spinner = component.find("spinner");
        $A.util.removeClass(spinner, 'slds-hide');
        
		var action = component.get("c.getSimilarProperties");
        action.setParams({
            recordId:component.get("v.recordId"),
            beds:component.get("v.property.fields.Beds__c.value"),
            price:component.get("v.property.fields.Price__c.value"),
            searchCriteria:component.get("v.searchCriteria"),
            priceRange:parseInt(component.get("v.priceRange"),10)
        });
        
        action.setCallback(this, function(response){
            
            if(response.getState() === "SUCCESS"){
                component.set("v.similarProperties", response.getReturnValue());
            }
            else{
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
        
        $A.util.addClass(spinner, 'slds-hide');
	}
})