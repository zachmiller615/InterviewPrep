//
// Created by Zach Miller on 23/01/2020.
//

struct StringBuilder {
    // Properties
    private var data: [String] = []

    // Methods
    mutating func append(_ text: String) {
        self.data.append(text)
    }

    func toString() -> String {
        self.data.joined()
    }
}