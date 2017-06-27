//: [Previous](@previous)

import Foundation

struct PointValue {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    init(point: PointValue) {
        self = point
    }
}

class PointRef {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    init(point: PointRef) {
        // 这样是会报错的, 因为在 class 中 self 是一个常量, 不能直接给它赋值, 而引用类型就可以;
        // self = point

        self.x = point.x
        self.y = point.y
    }
}


class Point3D: PointRef {
    var z: Double

    init(x: Double, y: Double, z: Double) {
        self.z = z

        // 必须在调用 super.init 之前保证搜索属性都有初始值;
        super.init(x: x, y: y)
    }

}

//: [Next](@next)
