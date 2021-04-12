import Foundation

struct EnterpriseModel: Decodable {
    let enterprises: [Enterprise]
}

struct Enterprise: Decodable {
    let id: Int
    let enterprise_name: String
    let description: String
    let photo: String
}
