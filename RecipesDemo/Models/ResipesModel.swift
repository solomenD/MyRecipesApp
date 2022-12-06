

import Foundation

struct Recipes: Codable {
    let count: Int?
    let results: [Result]?
}

struct Result: Codable {
    let name: String?
    let thumbnail_url: String?
    let video_url: String?
    let description: String?
    let renditions: [Rendition]?
    let instructions: [Instruction]?
    let country: String?
    let sections: [Section]?
}

struct Rendition: Codable {
    let poster_url: String?
    let aspect: String?
    let url: String?
}

struct Instruction: Codable {
    let display_text: String?
    let position: Int?
    let appliance: String?
}

struct Section: Codable {
    let components: [Component]?
    let name: String?
    let position: Int?
}


struct Component: Codable {
    let position: Int?
    let measurements: [Measurement]?
    let rawText, extraComment: String?
    let ingredient: Ingredient?
    let id: Int?
}
struct Ingredient: Codable {
    let createdAt: Int?
    let displayPlural: String?
    let id: Int?
    let displaySingular: String?
    let updatedAt: Int?
    let name: String?
}
struct Measurement: Codable {
    let unit: Unit?
    let quantity: String?
    let id: Int?
}
struct Unit: Codable {
        let displayPlural, displaySingular, abbreviation: String?
        let system: VideoAdContent?
        let name: String?
}
enum VideoAdContent: String, Codable {
    case imperial = "imperial"
    case metric = "metric"
    case none = "none"
}
