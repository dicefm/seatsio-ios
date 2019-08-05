import Foundation

struct SeatsioObject: Decodable {
    let objectType: String
    let label: String
    let numberOfSelectableObjects: Optional<Int16>
}
