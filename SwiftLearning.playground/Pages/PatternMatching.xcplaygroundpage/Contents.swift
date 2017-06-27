//: [Previous](@previous)

import Foundation

/*:
 ### if case, guard case, for case
 
 */
//: if case let x = y { // do something }


enum Media {
    case book(title: String, author: String, year: Int)
    case movie(title: String, director: String, year: Int)
    case webSite(urlString: String)
}

let m = Media.movie(title: "Swift Tips", director: "xxx", year: 2016)


let mf = Media.movie

print(type(of: mf))

if case let Media.movie(title, _, _) = m {
    print("This is a movie named \(title)")
}

switch m {
case let Media.movie( _, autor, _) :
    print(autor)
default:
    break
}


//: [Next](@next)











