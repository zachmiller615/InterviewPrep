//
// Created by Zach Miller on 30/01/2020.
//

struct Person {
    let name: String
    let age: Int
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        (lhs.name == rhs.name)
    }
}