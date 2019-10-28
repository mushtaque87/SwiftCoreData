//
//  Storemanager.swift
//  SwiftCoreData
//
//  Created by Mushtaque Ahmed on 10/28/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Storemanager  {
    
    func createtasks (for task:Task) {
        guard let appdelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appdelegate.persistentContainer.viewContext
        let taskEntity = NSEntityDescription.entity(forEntityName: "Tasks", in: managedContext)
        if let entity = taskEntity {
            let taskObj = NSManagedObject(entity: entity, insertInto: managedContext)
            taskObj.setValue(task.title, forKey: "title")
            taskObj.setValue(task.type, forKey: "type")
            taskObj.setValue(task.creationDate  , forKey: "creationdate")
            taskObj.setValue(task.endDate   , forKey: "enddate")
            taskObj.setValue(task.priority, forKey: "priority")
        }
        
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    @discardableResult
    func readTask() -> [Task] {
        var tasks = [Task]()
        guard let appdelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        let managedContext = appdelegate.persistentContainer.viewContext
        let fetchRequest =       NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let task = Task(data.value(forKey: "title") as! String, data.value(forKey: "type") as! String, creationDate: data.value(forKey: "creationdate") as! Date, endDate: data.value(forKey: "enddate") as! Date, priority: data.value(forKey: "priority") as! Int)
                print(data.value(forKey: "title") as! String)
                tasks.append(task)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            
        }
        return tasks
    }
    
    func deleteTask(_ task:Task){
        
    }
    
    func deleteAllTask() {
        guard let appdelegate  = UIApplication.shared.delegate as? AppDelegate else {
                   return
               }
               let managedContext = appdelegate.persistentContainer.viewContext
               let fetchRequest =       NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        
        do {
             let tasks = try managedContext.fetch(fetchRequest)
            
            for task in tasks as! [NSManagedObject] {
                managedContext.delete(task)
            }
            
            saveContext(managedContext)
            
        } catch let error as NSError {
            print("Error: \(error)")
            
        }

    }
    
    func saveContext(_ managedContext:NSManagedObjectContext) {
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
}
