public class PickListController {
	
    @auraEnabled
    public static List<String> getPickListValuesIntoList(String objectType, String selectedField){
        List<String> picklistValuesList = new List<String>();
        
        Schema.SObjectType convertedObj = Schema.getGlobalDescribe().get(objectType);
        Schema.describesobjectResult res = convertedObj.getDescribe();
        Schema.DescribeFieldResult fieldRes = res.fields.getMap().get(selectedField).getDescribe();
        List<Schema.PicklistEntry> ple = fieldRes.getPicklistValues();
        
        for(Schema.PicklistEntry p : ple){
            picklistValuesList.add(p.getLabel());
        }
        
        return picklistValuesList;
    }
}