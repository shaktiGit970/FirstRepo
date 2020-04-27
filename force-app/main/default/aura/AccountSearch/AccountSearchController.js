({
	onInit : function(component, event, helper) {
		var searchTerm = component.get("v.searchTerm");
        helper.handleSearch(component, searchTerm);
	},
    
    onSearchTermChange : function(component, event, helper){
        var searchTerm = component.get("v.searchTerm");
        var delayMills = 500;
        var timeoutId = component.get("v.searchTimeoutId");
        clearTimeout(timeoutId);
        
        timeoutId = setTimeout($A.getCallback(function(){
            helper.handleSearch(component, searchTerm);
        }), delayMills);
        component.set("v.searchTimeoutId", timeoutId);
    }
})