import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    
    // Use CodingKeys to map property names to keys in the JSON, only the mapped keys will be converted.
    // user_id gets remapped to id and user_email to email
    // user_address to "
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name
        case email = "user_email"
    }
}

// Example User instance
let user = User(id: 1, name: "Ross Super", email: "ross@example.com")

// Create a JSONEncoder to encode the user
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted // For readable JSON output

do {
    let jsonData = try encoder.encode(user)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("Encoded JSON: \n\(jsonString)")
    }
} catch {
    print("Encoding failed: \(error)")
}

// Simulate the reception of a JSON string from a server
let jsonString = """
{
    "user_id": 3,
    "name": "Ross Super",
    "user_email": "ross@example.com"
}
"""

// Create a JSONDecoder instance in order to decode the JSON string back into a User struct
let decoder = JSONDecoder()

do {
    let jsonData = Data(jsonString.utf8)
    let decodedUser = try decoder.decode(User.self, from: jsonData)
    print("Decoded User: \(decodedUser)")
} catch {
    print("Decoding failed: \(error)")
}

