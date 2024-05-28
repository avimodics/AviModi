// CarController.cls
global class CarController {
    @AuraEnabled(cacheable=true)
    public static List<Car_Details__c> getCars() {
        return [SELECT Id, Name, Car_Image__c, Car_Brand__c	, Car_Type__c, Car_Price__c FROM Car_Details__c];
    }
    
    @AuraEnabled(Cacheable= true)
    public static List<String> getPriceRange() {
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Car__c.Price__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        {
            options.add(f.getLabel());
        }
        System.debug('options:: '+options);
          return options;
    }
    
     @AuraEnabled(Cacheable= true)
    public static List<String> getBrandName() {
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Car__c.Brand__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        {
            options.add(f.getLabel());
        }
        System.debug('options:: '+options);
          return options;
    }
    
    @AuraEnabled(Cacheable= true)
    public static List<String> getType() {
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Car__c.Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        {
            options.add(f.getLabel());
        }
        System.debug('options:: '+options);
          return options;
    }
    
    @AuraEnabled
    public static List<Car_Details__c> getCarDetails(String brand, String budget, String carType) {
        Car__c car = new Car__c();
        car.Name = 'Test';
        car.Brand__c = brand;
        car.Type__c = carType;
        car.Price__c = budget;
        insert car;
        
        List<Car_Details__c> carDetails = [Select Name, Car_Price__c, Car_Description__c, Car_Image__c 
                                           FROM Car_Details__c 
                                           WHERE  Car_Price__c =: budget AND Car_Brand__c =: brand AND Car_Type__c =:carType];
     
        return carDetails;
            
       
    }
}
