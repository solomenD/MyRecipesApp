

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

//struct Instruction: Codable {
//    let start_time: Int?
//    let appliance: String?
//    let end_time: Int?
//    let temperature: Int?
//    let id, position: Int?
//    let display_text: String?
//}
struct Instruction: Codable {
    let display_text: String?
    let start_time: Int?
    let appliance: Appliance?
    let end_time: Int?
    let temperature: Int?
    let id, position: Int?

}
enum Appliance: String, Codable {
    case foodThermometer = "food_thermometer"
    case oven = "oven"
    case stovetop = "stovetop"
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
