import Foundation

struct User: Decodable {
    let investor: Investor
}

struct Investor: Decodable {
    let id: Int
    let email: String
}
