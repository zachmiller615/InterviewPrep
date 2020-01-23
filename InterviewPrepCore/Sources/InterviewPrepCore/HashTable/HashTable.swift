//
// Created by Zach Miller on 23/01/2020.
//

class HashTable<Key, Value> where Key: Hashable {
    // Inner Types
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]

    // Properties
    private var data: [Bucket] = []
    private let dataCapacity = 1000

    // Subscript
    subscript(key: Key) -> Value? {
        get {
            let hashValue = self.getHashValue(from: key)
            let bucketIndex = self.getBucketIndex(fromHashValue: hashValue)
            return self.getValue(forKey: key, atBucketIndex: bucketIndex)
        }
        set {

        }
    }
}

// Private Methods
private extension HashTable {
    func getHashValue(from key: Key) -> Int {
        var hasher = Hasher()
        key.hash(into: &hasher)
        return hasher.finalize()
    }

    func getBucketIndex(fromHashValue hashValue: Int) -> Int {
        (abs(hashValue) % self.dataCapacity)
    }

    func getValue(forKey: Key, atBucketIndex: Int) -> Value? {

    }
}




















































