import CoreData
import Foundation

// MARK: - Setup Core Data Stack

// Create Entity Description
let entityDescription = NSEntityDescription()
entityDescription.name = "Student"
entityDescription.managedObjectClassName = "Student"

// Create Attributes
let nameAttribute = NSAttributeDescription()
nameAttribute.name = "name"
nameAttribute.attributeType = .stringAttributeType

let ageAttribute = NSAttributeDescription()
ageAttribute.name = "age"
ageAttribute.attributeType = .integer64AttributeType

entityDescription.properties = [nameAttribute, ageAttribute]

// Create Managed Object Model
let managedObjectModel = NSManagedObjectModel()
managedObjectModel.entities = [entityDescription]

// Create Persistent Store Coordinator
let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)

do {
    try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
} catch {
    fatalError("Failed to setup persistent store: \(error)")
}

let mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
mainContext.persistentStoreCoordinator = persistentStoreCoordinator

// MARK: - Create and Save Data

let newPerson = NSEntityDescription.insertNewObject(forEntityName: "Student", into: mainContext)
newPerson.setValue("Johanna", forKey: "name")
newPerson.setValue(24, forKey: "age")

do {
    try mainContext.save()
    print("Saved successfully!")
} catch {
    print("Failed to save: \(error)")
}

// MARK: - Fetch Data

let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
var fetchedPersons: [NSManagedObject] = []

do {
    if let results = try mainContext.fetch(fetchRequest) as? [NSManagedObject] {
        fetchedPersons = results
    }
} catch {
    print("Failed to fetch: \(error)")
}

// MARK: - Update Data

if let firstPerson = fetchedPersons.first {
    firstPerson.setValue(27, forKey: "age")
    
    do {
        try mainContext.save()
        print("Updated successfully!")
    } catch {
        print("Failed to update: \(error)")
    }
}

// MARK: - Retrieve and Print Updated Data

do {
    if let results = try mainContext.fetch(fetchRequest) as? [NSManagedObject] {
        for person in results {
            if let name = person.value(forKey: "name") as? String,
               let age = person.value(forKey: "age") as? Int {
                print("Name: \(name), Age: \(age)")
            }
        }
    }
} catch {
    print("Failed to fetch updated data: \(error)")
}

