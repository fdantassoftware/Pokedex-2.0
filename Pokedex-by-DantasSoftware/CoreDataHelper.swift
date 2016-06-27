//
//  CoreDataHelper.swift
//  MemeLab
//
//  Created by Fabio Dantas on 07/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper: NSObject {
    
    class func manageObjectContext() -> NSManagedObjectContext {
        
        return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
    }

    class func insertManageObeject(className: NSString, manageObjectContext: NSManagedObjectContext) -> AnyObject {
        
        let manageObject = NSEntityDescription.insertNewObjectForEntityForName(className as String, inManagedObjectContext: manageObjectContext)
        
        return manageObject
    }



    class func fetchEntities(className: NSString, manageObjectContext: NSManagedObjectContext) -> NSArray {
        
        let fetchRequest = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName(className as String, inManagedObjectContext: manageObjectContext)
        fetchRequest.entity = entityDescription
        
        var items = []
        
        do{
            
            
            try items = manageObjectContext.executeFetchRequest(fetchRequest)
        
        } catch {
            
            print(error)
        }
    
        return items
    
    
    }


}
