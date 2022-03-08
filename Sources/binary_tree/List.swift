class NodeList<T: Initializable> {
    var data: T
    var next: NodeList<T>?
    var previous: NodeList<T>?

    init() {
        data = T()
        next = nil
        previous = nil
    }

    init(_ value: T) {
        data = value
        next = nil
        previous = nil
    }

    func instantiateObject() -> T {
        return T()
    }
}


class List<T: Initializable> {
    var root: NodeList<T>?

    init() {
        self.root = nil
    }

    func insert(_ value: T) {
        var aux = root
        var auxPrevious:NodeList<T>? = nil

        if root == nil {
            root = NodeList(value)
        } else {
            while(aux != nil) {
                auxPrevious = aux
                aux = aux?.next
            }
            aux = NodeList(value)
            aux?.previous = auxPrevious
            auxPrevious?.next = aux
        }
    }

     func update(_ index: Int, _ value: T) {
        var aux = root
        var count = 1

        while(aux != nil) {
            if count == index {
                aux?.data = value
                break
            }
            aux = aux?.next
            count += 1
        }
     }

     func delete(_ index: Int) {
        var aux = root
        var auxPrevious:NodeList<T>? = nil
        var count = 1

        while(aux != nil) {
            if count == index {
                auxPrevious?.next = aux?.next
                break
            }
            auxPrevious = aux
            aux = aux?.next
            count += 1
        }
     }

     func get(_ index: Int) -> T? {
         var aux = root
         var count = 1

         while(aux != nil) {
             if count == index {
                 return aux?.data
             }
             aux = aux?.next
             count += 1
         }

         return nil
     }

     func find(_ value: T) -> Int? {
         var aux = root
         var count = 1

         while(aux != nil) {
             if aux?.data == value {
                 return count
             }
             aux = aux?.next
             count += 1
         }

         return nil
     }

     func print() {
         var aux = root
         Swift.print("{", terminator: "")

         while(aux != nil) {
             Swift.print(aux?.data ?? "_", terminator: "")
             if aux?.next != nil {
                 Swift.print(", ", terminator: "")
             } else {
                 Swift.print("", terminator: "")
             }
             aux = aux?.next
         }

         Swift.print("}")
     }

     func sort() -> List<T> {
         let result = List<T>()
         return result
     }
}
