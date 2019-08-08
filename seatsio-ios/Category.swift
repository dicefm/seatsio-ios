import Foundation

public class Category: Codable {

    let key: String
    let color: String
    let label: String?
    let accessible: Bool?
    let seatShape: String?

    public init(key: String, color: String, label: String? = nil, accessible: Bool? = nil, seatShape: String? = nil) {
        self.key = key
        self.color = color
        self.label = label
        self.accessible = accessible
        self.seatShape = seatShape
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decode(Int.self, forKey: .key) {
            key = String(value)
        } else {
            key = try container.decode(String.self, forKey: .key)
        }
        color = try container.decode(String.self, forKey: .color)
        label = try container.decodeIfPresent(String.self, forKey: .label)
        accessible = try container.decodeIfPresent(Bool.self, forKey: .accessible)
        seatShape = try container.decodeIfPresent(String.self, forKey: .seatShape)
    }

    private enum CodingKeys: String, CodingKey {
        case key
        case color
        case label
        case accessible
        case seatShape
    }
}
