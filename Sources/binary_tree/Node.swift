protocol Initializable: Equatable, Comparable {
    init()
}

class Node<T: Initializable> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?

    init() {
        data = T()
        left = nil
        right = nil
    }

    init(_ value: T) {
        data = value
        left = nil
        right = nil
    }

    func instantiateObject() -> T {
        return T()
    }
}
