//
//  AddNoteViewModel.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 10/04/21.
//

import UIKit
import CoreData

class AddNoteViewModel {
    
    //MARK: CoreData -> Save
    func saveInDB (title:String,Description:String,tag:String) {
        
        // Core Data ---> Save

        // Step 1: Container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // Step 2: We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Step 3: Create an entity and new user records
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: managedContext)
        let newNote = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Step 4: we need to add some data to our newly created record
        newNote.setValue(title, forKey: "title")
        newNote.setValue(Description, forKey: "descriptions")
        newNote.setValue(tag, forKey: "tag")
        
        // Step 5: Set all the values. The next step is to save them inside the Core Data
        
        do {
            // Save Person Details
            try managedContext.save()
            // Additional
            print("Saved!!!")

        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
}


