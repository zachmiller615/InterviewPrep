//
// Created by Zach Miller on 22/01/2020.
//

extension Array {
    func indexIsValid(_ index: Int) -> Bool {
        ((index >= 0) && (index < self.count))
    }
}