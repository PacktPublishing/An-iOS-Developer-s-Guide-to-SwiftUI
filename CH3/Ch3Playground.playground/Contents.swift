import Foundation


@propertyWrapper
struct Capitalised {
    private var value = ""
    
    var wrappedValue: String {
        get { return value }
        set { value = String(newValue.capitalized) }
    }
}

class Person {
    @Capitalised var name: String
    @Capitalised var surname: String
    
    init(name:String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

var employee = Person(name:"john", surname: "smith")

print (employee.name)
print (employee.surname)


