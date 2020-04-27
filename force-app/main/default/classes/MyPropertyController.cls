public class MyPropertyController {
	/*@auraEnabled
    public static List<Property__c> findProperties(Id recordId, Decimal priceRange){
        Property__c property = [Select Id, Price__c From Property__c where Id = :recordId];
        List<Property__c> similarProperties = getSimilarProperties(recordId, priceRange, property.Price__c);
        system.debug('similarProperties = '+similarProperties);
        return similarProperties;
    }*/
   @auraEnabled
    public static List<Property__c> getSimilarProperties(Id recordId, Decimal beds, Decimal price, String searchCriteria, Decimal priceRange){
        if (searchCriteria == 'Bedrooms') {
            return [
                SELECT Id, Name, Beds__c, Baths__c, Price__c, Broker__c, Status__c, Thumbnail__c
                FROM Property__c WHERE Id != :recordId AND Beds__c = :beds
            ];
        } else {
            Decimal range;
            if (priceRange == null) {
                range = 100000;
            } else {
                range = priceRange;
            }
            return [
                SELECT Id, Name, Beds__c, Baths__c, Price__c, Broker__c, Status__c, Thumbnail__c
                FROM Property__c WHERE Id != :recordId AND Price__c > :price - range AND Price__c < :price + range
            ];
        }
    }
}