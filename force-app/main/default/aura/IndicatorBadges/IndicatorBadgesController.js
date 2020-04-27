({
  doInit : function(component, event, helper) {
    var recId = component.get("v.recordId");
    var sObj = component.get("v.sObjectName");
      console.log('recId = '+recId);
      console.log('sObj = '+sObj);
    if(sObj){
      helper.getLabelForRecord(component, sObj);
      helper.getBadgesForRecord(component, recId, sObj);
    }
  },
  //future code here
})