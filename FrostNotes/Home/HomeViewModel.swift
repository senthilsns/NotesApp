//
//  HomeViewModel.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 10/04/21.
//

import UIKit
import CoreData


class HomeViewModel {
    
    var personDetails = [NSManagedObject]()
        
    // Closure use for Notification
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    // Array of WikiList Model class
    var modelArr : [HomeModel] = []{
        // Reload data when data set
        didSet{
            reloadList()
        }
    }
    
    
    
    
    // Fetch from DB
    
    //MARK: CoreData -> Fetch
    func fetchDetails() {
        
        // Core Data ---> Fetch
        
        // Step1:  Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Step 3: Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            // Assign Result to PersonDetails
            personDetails =  result as! [NSManagedObject]
            
            for i in personDetails{
                
                modelArr.append(HomeModel(title: i.value(forKey: "title") as? String, description: i.value(forKey: "descriptions") as? String, tag: i.value(forKey: "tag") as? String))
                
            }
            
                                
        } catch {
            print("Failed")
        }

    }
    
}
