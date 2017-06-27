//: [Previous](@previous)

import Foundation

// 二叉搜索树

class Node<T: Comparable> {
    var data: T!
    var left: Node<T>?
    var right: Node<T>?

    init(data: T, left: Node<T>?, right: Node<T>?) {
        self.data = data
        self.left = left
        self.right = right
    }
}


struct BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    private(set) var count: Int = 0

    var isEmpty: Bool {
        return count == 0
    }

    private init(root: Node<T>) {
        self.root = root
        self.count = 1
    }

    static func creatTree(data: T) -> BinarySearchTree {
        let node = Node<T>(data: data, left: nil, right: nil)
        let tree = BinarySearchTree(root: node)
        return tree
    }

    func inorder(node: Node<T>?) {
        if node == nil {
            return
        }
        inorder(node: node?.left)
        print(node!.data)
        inorder(node: node?.right)
    }

    func preorder(node: Node<T>? = nil) {
        if node == nil {
            return
        }
        print(node?.data ?? 0)
        preorder(node: node?.left)
        preorder(node: node?.right)
    }

    mutating func insert(data: T, node: Node<T>) {
        let node = Node<T>(data: data, left: nil, right: nil)
        // 如果树为空, 则将 node 设为 root, count++
        if self.isEmpty {
            self.root = node
            self.count += 1
            return
        }
        /* 如果不为空,


         */
    }
}

let tree = BinarySearchTree.creatTree(data: 1)

tree.inorder(node: tree.root)

