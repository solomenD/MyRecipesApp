

import Foundation

struct Recipes: Codable {
    let count: Int
    let results: [Result]
}

struct Result: Codable {
    let name: String?
    let thumbnail_url: String?
    let video_url: String?
    let description: String?
    let renditions: [Rendition]?
    let instructions: [Instruction]?
    let country: String?
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
