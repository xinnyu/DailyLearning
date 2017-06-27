//: [Previous](@previous)

import Foundation

class TreeNode<T:Equatable> {
    var value: T

    public typealias Node = TreeNode<T>

    var leftChild: Node?
    var rightChild: Node?

    init(value: T) {
        self.value = value
    }
    /// 创建完全二叉树
    static func creatTree (a: [T], i: Int) -> Node? {
        let count = a.count
        if i >= a.count {
            return nil
        }
        let node = Node(value: a[i])
        var leftChild:Node?
        var rightChild:Node?
        if i * 2 + 1 < count {
            leftChild = creatTree(a: a, i: 2 * i + 1)
        }

        if i * 2 + 1 < count {
            rightChild = creatTree(a: a, i: 2 * i + 2)
        }
        node.leftChild = leftChild
        node.rightChild = rightChild

        return node
    }


    //树中序遍历
    static func inorderTreeWalk(tree: Node?) {
        guard let node = tree else {
            return
        }
        inorderTreeWalk(tree: node.leftChild)
        print(node.value)
        inorderTreeWalk(tree: node.rightChild)
    }

    //前序

    static func preorderTreeWalk(tree: Node?) {
        guard let node = tree else {
            return
        }
        print(node.value)
        preorderTreeWalk(tree: node.leftChild)
        preorderTreeWalk(tree: node.rightChild)
    }

    //后序
    static func postorderTreeWalk(tree: Node?) {
        guard let node = tree else {
            return
        }
        postorderTreeWalk(tree: node.leftChild)
        postorderTreeWalk(tree: node.rightChild)
        print(node.value)
    }
}


let array = [1,23,5,6,7,8,9,43,2,3]

let n0 = TreeNode.creatTree(a: array, i: 0)

//TreeNode.preorderTreeWalk(tree: n0)
//TreeNode.postorderTreeWalk(tree: n0)
TreeNode.inorderTreeWalk(tree: n0)






