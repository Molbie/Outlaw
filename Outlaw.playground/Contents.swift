//: Playground - noun: a place where people can play

import UIKit
import Outlaw


func json(_ fileName: String) throws -> [String: Any] {
    let path = Bundle.main.path(forResource: fileName, ofType: "json")!
    let url = URL(fileURLWithPath: path)
    
    return try! JSON.value(from: url)
}












let data = try! json("ArrayTests")
let character: [Character] = try! data.value(for: "character")
let bool: [Bool] = try! data.value(for: "bool")




