({
    doInit : function(component, event, helper) {
        var recId = component.get("v.recordId");
        if(recId){
            component.set("v.modalContext", "Edit");
        }
        if(!recId){
            component.find("forceRecord").getNewRecord(
                "Property__c",
                null,
                false,
                $A.getCallback(function(){
                    var rec = component.get("v.propertyRecord");
                    var error = component.get("v.recordError");
                    if (error || (rec === null)) {
                        console.log("Error initializing record template: " + error);
                        return;
                    }  
                }));
        }
    },
    
    cancelDialog : function(component, event, helper){
        var recId = component.get("v.recordId");
        if(!recId){
            var homeEvt = $A.get("e.force:navigateToObjectHome");
            homeEvt.setParams({
                "scope":"Property__c"
            });
            homeEvt.fire();
        }
        else{
            helper.navigateTo(component, recId);
        }
    }
})