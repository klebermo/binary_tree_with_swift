class Tree<T: Initializable> {
    var root: Node<T>?

    init() {
        self.root = nil
    }

    func insert(_ value: T) {
        if root == nil {
            root = Node(value)
        } else {
            var aux = root
            var auxParent: Node<T>? = nil

            while(aux != nil) {
                if aux?.data == value {
                    break
                }

                if aux?.data ?? value > value {
                    auxParent = aux
                    aux = aux?.left
                } else {
                    auxParent = aux
                    aux = aux?.right
                }
            }

            if aux == nil {
                aux = Node(value)
                if auxParent?.data ?? value > value {
                    auxParent?.left = aux
                } else {
                    auxParent?.right = aux
                }
            }
        }
    }

    func update(_ old_value: T, _ new_value: T) {
        if root == nil {
            return
        } else {
            var aux = root

            while(aux != nil) {
                if aux?.data == old_value {
                    aux?.data = new_value
                    break
                }

                if aux?.data ?? old_value > old_value {
                    aux = aux?.left
                } else {
                    aux = aux?.right
                }
            }
        }
    }

    func delete(_ value: T) {
        if root == nil {
            return
        } else {
            var aux = root
            var auxParent: Node<T>? = nil

            while(aux != nil) {
                if aux?.data == value {
                    break
                }

                if aux?.data ?? value > value {
                    auxParent = aux
                    aux = aux?.left
                } else {
                    auxParent = aux
                    aux = aux?.right
                }
            }

            if(aux?.left == nil && aux?.right == nil) {
                if auxParent?.left != nil && auxParent?.left?.data == value {
                    auxParent?.left = nil
                }
                if auxParent?.right != nil && auxParent?.right?.data == value {
                    auxParent?.right = nil
                }
            } else if(aux?.left == nil && aux?.right != nil) {
                if auxParent?.left != nil && auxParent?.left?.data == value {
                    auxParent?.left = aux?.right
                }
                if auxParent?.right != nil && auxParent?.right?.data == value {
                    auxParent?.right = aux?.right
                }
            } else if(aux?.left != nil && aux?.right == nil) {
                if auxParent?.left != nil && auxParent?.left?.data == value {
                    auxParent?.left = aux?.left
                }
                if auxParent?.right != nil && auxParent?.right?.data == value {
                    auxParent?.right = aux?.left
                }
            } else {
                let list = self.inOrder()
                let index = list.find(value) ?? 0
                let node = list.get(index-1) ?? value
                let toDelete = list.get(index-1) ?? value
                self.delete(toDelete)
                aux?.data = node
            }
        }
    }

    func preOrder() -> List<T> {
        let list = List<T>()

        if self.root != nil {
            list.insert(self.root?.data ?? T())
            preOrder(self.root?.left, list)
            preOrder(self.root?.right, list)
        }

        return list
    }

    func preOrder(_ node: Node<T>?, _ list: List<T>) -> List<T> {
        if node != nil {
            list.insert(node?.data ?? T())
            preOrder(node?.left, list)
            preOrder(node?.right, list)
        }

        return list
    }

    func inOrder() -> List<T> {
        let list = List<T>()

        if self.root != nil {
            inOrder(self.root?.left, list)
            list.insert(self.root?.data ?? T())
            inOrder(self.root?.right, list)
        }

        return list
    }

    func inOrder(_ node: Node<T>?, _ list: List<T>) -> List<T> {
        if node != nil {
            inOrder(node?.left, list)
            list.insert(node?.data ?? T())
            inOrder(node?.right, list)
        }

        return list
    }

    func postOrder() -> List<T> {
        let list = List<T>()

        if self.root != nil {
            postOrder(self.root?.left, list)
            postOrder(self.root?.right, list)
            list.insert(self.root?.data ?? T())
        }

        return list
    }

    func postOrder(_ node: Node<T>?, _ list: List<T>) -> List<T> {
        if node != nil {
            postOrder(node?.left, list)
            postOrder(node?.right, list)
            list.insert(node?.data ?? T())
        }

        return list
    }
}
