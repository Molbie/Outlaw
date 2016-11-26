//
//  Types.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation
import Outlaw


enum DayOfWeek: Int {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

struct Address: Hashable {
    var street: String
    var city: String
    
    var hashValue: Int {
        return street.hashValue ^ city.hashValue
    }
}
struct Address2 {
    var street: String
    var city: String
}
func ==(lhs: Address, rhs: Address) -> Bool {
    return lhs.street == rhs.street && lhs.city == rhs.city
}

struct Person: Hashable {
    var firstName: String
    var lastName: String
    var address: Address?
    
    var hashValue: Int {
        var result = firstName.hashValue ^ lastName.hashValue
        if let address = address {
            result = result ^ address.hashValue
        }
        return result
    }
}
struct Person2 {
    var firstName: String
    var lastName: String
    var address: Address2?
}
func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.address == rhs.address
}

protocol AddressContext {}
protocol PersonContext {}
protocol PersonContextIncludeAddress: PersonContext, AddressContext {}

class SomeAddressContext: AddressContext {}
class SomePersonContextExcludeAddress: PersonContext {}
class SomePersonContextIncludeAddress: PersonContextIncludeAddress {}
class NewObjectContext: PersonContextIncludeAddress {
    func newPerson() -> Person {
        return Person(firstName: "First", lastName: "Last", address: nil)
    }
    func newPerson2() -> Person2 {
        return Person2(firstName: "First", lastName: "Last", address: nil)
    }
    func newAddress() -> Address {
        return Address(street: "Street", city: "City")
    }
    func newAddress2() -> Address2 {
        return Address2(street: "Street", city: "City")
    }
}
