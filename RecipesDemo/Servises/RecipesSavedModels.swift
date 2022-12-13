//
//  SaveModels.swift
//  RecipesDemo
//
//  Created by Solomon  on 05.12.2022.
//

import Foundation
import RealmSwift

class RecipesSavedModels: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var imageString: String?
    @objc dynamic var detailslabel: String?
    @objc dynamic var videoString: String?
    @objc dynamic var contry: String?
    @objc dynamic var isItSave: Bool = false
    
}
