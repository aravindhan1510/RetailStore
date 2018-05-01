# RetailStore

RetailStore is an appliaction created to demonstrate my coding skills. 

Please refer Retail_Store.pdf for the requirements covered in this application

PFB my assumptions and the external library used in this application

Language - Swift 

Design Patterns Used - MVVM, Protocol, Delegate 

I have created json files for the categories and product list. If we need to add any category or product, we can add it in those json filse. The application uses those files as data source. Also the application UI will change dynamically according to the number of categories/products which is essential when we need to extend this application.

Also in future if we wish to include web-service, there will be only slight change in the code with this architecture.

I have used the below mentioned external library for core data. It provides easy to use extensions for the core data functions to store cart details
	•	https://github.com/tadija/AERecord
