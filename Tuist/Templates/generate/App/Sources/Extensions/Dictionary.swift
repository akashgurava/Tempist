extension Dictionary {
    /// Force get a value from `Dictionary`
    /// This will cause a fatal error if key is not present
    /// in dictionary use this only when Key is enum.
    subscript(force key: Key) -> Value {
        if let value = self[key] {
            return value
        }
        fatalError("Forced key \(key) wasn't found in Dictionary")
    }
}
