//
// Created by Zach Miller on 23/01/2020.
//

class HashTable<Key, Value> where Key: Hashable {
    // Inner Types
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]

    // Properties
    private let dataCapacity = 1000
    private lazy var data: [Bucket] = Array(repeating: [], count: self.dataCapacity)

    // Subscript
    subscript(key: Key) -> Value? {
        get {
            let bucketIndex = self.getBucketIndex(from: key)
            return self.getValue(forKey: key, atBucketIndex: bucketIndex)
        }
        set(newValue) {
            let bucketIndex = self.getBucketIndex(from: key)
            self.setValue(newValue, forKey: key, atBucketIndex: bucketIndex)
        }
    }
}

// Private Methods
private extension HashTable {
    func getBucketIndex(from key: Key) -> Int {
        var hasher = Hasher()
        key.hash(into: &hasher)
        let hashValue = hasher.finalize()
        return (abs(hashValue) % self.dataCapacity)
    }

    func getValue(forKey key: Key, atBucketIndex bucketIndex: Int) -> Value? {
        let bucket = self.data[bucketIndex]
        let element = bucket.first {
            $0.key == key
        }
        return element?.value
    }

    func setValue(_ newValue: Value?, forKey key: Key, atBucketIndex bucketIndex: Int) {
        var bucket = self.data[bucketIndex]
        let elementIndex = bucket.firstIndex {
            $0.key == key
        }
        if let newValue = newValue, let elementIndex = elementIndex {
            bucket[elementIndex].value = newValue // Update
        } else if let newValue = newValue {
            bucket.append((key, newValue)) // Insert
        } else if let elementIndex = elementIndex {
            bucket.remove(at: elementIndex) // Delete
        }
    }
}




















































