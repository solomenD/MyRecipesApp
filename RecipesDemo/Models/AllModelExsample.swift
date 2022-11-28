//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let count: Int
//    let results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let thumbnailURL: String
//    let nutritionVisibility: String
//    let instructions: [Instruction]
//    let facebookPosts: [JSONAny]
//    let id: Int
//    let sections: [Section]
//    let brandID: JSONNull?
//    let numServings: Int
//    let videoURL: String?
//    let originalVideoURL: String?
//    let language, slug, name: String
//    let compilations: [JSONAny]
//    let isOneTop: Bool
//    let seoTitle: String
//    let buzzID: JSONNull?
//    let show: Show
//    let videoAdContent: VideoAdContent?
//    let yields, canonicalID, country: String
//    let userRatings: UserRatings
//    let brand: JSONNull?
//    let aspectRatio: String
//    let approvedAt: Int
//    let renditions: [Rendition]
//    let beautyURL: JSONNull?
//    let prepTimeMinutes: Int
//    let thumbnailAltText, promotion, servingsNounPlural: String
//    let showID: Int
//    let tags: [Tag]
//    let nutrition: Nutrition
//    let createdAt: Int
//    let resultDescription: String
//    let totalTimeMinutes, updatedAt: Int
//    let isShoppable: Bool
//    let keywords, servingsNounSingular: String
//    let tipsAndRatingsEnabled: Bool
//    let draftStatus: String
//    let videoID: Int?
//    let inspiredByURL: JSONNull?
//    let credits: [Credit]
//    let topics: [Topic]
//    let totalTimeTier: TotalTimeTier
//    let cookTimeMinutes: Int
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnailURL = "thumbnail_url"
//        case nutritionVisibility = "nutrition_visibility"
//        case instructions
//        case facebookPosts = "facebook_posts"
//        case id, sections
//        case brandID = "brand_id"
//        case numServings = "num_servings"
//        case videoURL = "video_url"
//        case originalVideoURL = "original_video_url"
//        case language, slug, name, compilations
//        case isOneTop = "is_one_top"
//        case seoTitle = "seo_title"
//        case buzzID = "buzz_id"
//        case show
//        case videoAdContent = "video_ad_content"
//        case yields
//        case canonicalID = "canonical_id"
//        case country
//        case userRatings = "user_ratings"
//        case brand
//        case aspectRatio = "aspect_ratio"
//        case approvedAt = "approved_at"
//        case renditions
//        case beautyURL = "beauty_url"
//        case prepTimeMinutes = "prep_time_minutes"
//        case thumbnailAltText = "thumbnail_alt_text"
//        case promotion
//        case servingsNounPlural = "servings_noun_plural"
//        case showID = "show_id"
//        case tags, nutrition
//        case createdAt = "created_at"
//        case resultDescription = "description"
//        case totalTimeMinutes = "total_time_minutes"
//        case updatedAt = "updated_at"
//        case isShoppable = "is_shoppable"
//        case keywords
//        case servingsNounSingular = "servings_noun_singular"
//        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
//        case draftStatus = "draft_status"
//        case videoID = "video_id"
//        case inspiredByURL = "inspired_by_url"
//        case credits, topics
//        case totalTimeTier = "total_time_tier"
//        case cookTimeMinutes = "cook_time_minutes"
//    }
//}
//
//// MARK: - Credit
//struct Credit: Codable {
//    let name, type: String
//}
//
//// MARK: - Instruction
//struct Instruction: Codable {
//    let startTime: Int
//    let appliance: String?
//    let endTime: Int
//    let temperature: Int?
//    let id, position: Int
//    let displayText: String
//
//    enum CodingKeys: String, CodingKey {
//        case startTime = "start_time"
//        case appliance
//        case endTime = "end_time"
//        case temperature, id, position
//        case displayText = "display_text"
//    }
//}
//
//// MARK: - Nutrition
//struct Nutrition: Codable {
//    let carbohydrates, fiber: Int?
//    let updatedAt: Date?
//    let protein, fat, calories, sugar: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case carbohydrates, fiber
//        case updatedAt = "updated_at"
//        case protein, fat, calories, sugar
//    }
//}
//
//// MARK: - Rendition
//struct Rendition: Codable {
//    let name: String
//    let maximumBitRate: Int?
//    let container: Container
//    let fileSize: Int?
//    let duration: Int
//    let contentType: ContentType
//    let aspect: Aspect
//    let width, height: Int
//    let posterURL: String
//    let url: String
//    let bitRate, minimumBitRate: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case maximumBitRate = "maximum_bit_rate"
//        case container
//        case fileSize = "file_size"
//        case duration
//        case contentType = "content_type"
//        case aspect, width, height
//        case posterURL = "poster_url"
//        case url
//        case bitRate = "bit_rate"
//        case minimumBitRate = "minimum_bit_rate"
//    }
//}
//
//enum Aspect: String, Codable {
//    case portrait = "portrait"
//}
//
//enum Container: String, Codable {
//    case mp4 = "mp4"
//    case ts = "ts"
//}
//
//enum ContentType: String, Codable {
//    case applicationVndAppleMpegurl = "application/vnd.apple.mpegurl"
//    case videoMp4 = "video/mp4"
//}
//
//// MARK: - Section
//struct Section: Codable {
//    let components: [Component]
//    let name: String?
//    let position: Int
//}
//
//// MARK: - Component
//struct Component: Codable {
//    let position: Int
//    let measurements: [Measurement]
//    let rawText, extraComment: String
//    let ingredient: Ingredient
//    let id: Int
//
//    enum CodingKeys: String, CodingKey {
//        case position, measurements
//        case rawText = "raw_text"
//        case extraComment = "extra_comment"
//        case ingredient, id
//    }
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let createdAt: Int
//    let displayPlural: String?
//    let id: Int
//    let displaySingular: String?
//    let updatedAt: Int
//    let name: String
//
//    enum CodingKeys: String, CodingKey {
//        case createdAt = "created_at"
//        case displayPlural = "display_plural"
//        case id
//        case displaySingular = "display_singular"
//        case updatedAt = "updated_at"
//        case name
//    }
//}
//
//// MARK: - Measurement
//struct Measurement: Codable {
//    let unit: Unit
//    let quantity: String
//    let id: Int
//}
//
//// MARK: - Unit
//struct Unit: Codable {
//    let displayPlural, displaySingular, abbreviation: String
//    let system: VideoAdContent
//    let name: String
//
//    enum CodingKeys: String, CodingKey {
//        case displayPlural = "display_plural"
//        case displaySingular = "display_singular"
//        case abbreviation, system, name
//    }
//}
//
//enum VideoAdContent: String, Codable {
//    case imperial = "imperial"
//    case metric = "metric"
//    case none = "none"
//}
//
//// MARK: - Show
//struct Show: Codable {
//    let name: String
//    let id: Int
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let name: String
//    let id: Int
//    let displayName, type: String
//
//    enum CodingKeys: String, CodingKey {
//        case name, id
//        case displayName = "display_name"
//        case type
//    }
//}
//
//// MARK: - Topic
//struct Topic: Codable {
//    let name, slug: String
//}
//
//// MARK: - TotalTimeTier
//struct TotalTimeTier: Codable {
//    let tier, displayTier: String
//
//    enum CodingKeys: String, CodingKey {
//        case tier
//        case displayTier = "display_tier"
//    }
//}
//
//// MARK: - UserRatings
//struct UserRatings: Codable {
//    let countPositive: Int
//    let score: Double
//    let countNegative: Int
//
//    enum CodingKeys: String, CodingKey {
//        case countPositive = "count_positive"
//        case score
//        case countNegative = "count_negative"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
