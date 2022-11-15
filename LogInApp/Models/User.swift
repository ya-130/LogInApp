//
//  User.swift
//  LogInApp
//
//  Created by Egor Yakovin on 12.11.2022.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(username: "User",
             password: "123",
             person: .getPerson()        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let cityOfBirth: String
    let image: String
    
    static func getPerson() -> Person {
        Person(name: "Ivan", surname: "Ivanov", age: 48, cityOfBirth: "Moscow", image: "Image")
    }
}
