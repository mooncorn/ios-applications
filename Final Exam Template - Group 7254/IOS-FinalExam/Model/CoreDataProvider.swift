
import Foundation
import CoreData


protocol CoreDataProviderProtocol {

    func save( context : NSManagedObjectContext ) -> UUID?
           
    func delete( context : NSManagedObjectContext ) -> Bool
    
}

    

class CoreDataProvider {
    
        
    static func all(context : NSManagedObjectContext, entityName : String) -> [Any?] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let allObjects = try context.fetch(request)
            return allObjects
        } catch {
            print("**** EXCEPTION at CoreDataProvider.all **** \n \(error.localizedDescription)")
            return []
        }
    }
    

    
    static public func save( context : NSManagedObjectContext ) throws {
        
        do {
            try context.save()
        } catch {
            print("**** EXCEPTION at CoreDataProvider.save **** \n \(error.localizedDescription)")
            throw error
        }
       
    }
    
    
    
    static func delete( context : NSManagedObjectContext, objectToDelete : NSManagedObject ) throws -> Bool {
        
        context.delete(objectToDelete)
        
        do {
            try save(context: context)
            return true
        } catch {
            print("**** EXCEPTION at CoreDataProvider.delete **** \n \(error.localizedDescription)")
            throw error
        }
        
    }

    
    
}
