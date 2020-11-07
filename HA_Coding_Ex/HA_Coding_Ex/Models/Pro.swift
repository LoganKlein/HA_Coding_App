//
//  Pro.swift
//  HA_Coding_Ex
//
//  Created by Logan Klein on 11/7/20.
//

import Foundation
import ObjectMapper

class Pro: Mappable {
    var entityId: String?
    var companyName: String = ""
    var ratingCount: String?
    var compositeRating: String?
    var companyOverview: String?
    var canadianSP: Bool = false
    var spanishSpeaking: Bool = false
    var phoneNumber: String?
    var latitude: Float?
    var longitude: Float?
    var servicesOffered: String = "Services Not Available"
    var specialty: String?
    var primaryLocation: String?
    var email: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    // MARK: - Mappable
    func mapping(map: Map) {
        entityId        <- map["entityId"]
        companyName     <- map["companyName"]
        ratingCount     <- map["ratingCount"]
        compositeRating <- map["compositeRating"]
        companyOverview <- map["companyOverview"]
        canadianSP      <- map["canadianSP"]
        spanishSpeaking <- map["spanishSpeaking"]
        phoneNumber     <- map["phoneNumber"]
        latitude        <- map["latitude"]
        longitude       <- map["longitude"]
        servicesOffered <- map["servicesOffered"]
        specialty       <- map["specialty"]
        primaryLocation <- map["primaryLocation"]
        email           <- map["email"]
    }
    
    // MARK: - Helper Methods
    
    var ratingCountInt: Int {
        guard let count = ratingCount else { return 0 }
        return Int(count) ?? 0
    }
    
    var compositeRatingFloat: Float {
        guard let rating = compositeRating else { return 0.0 }
        return Float(rating) ?? 0.0
    }
    
    var subtitleColor: UIColor {
        if ratingCountInt > 0 {
            if compositeRatingFloat >= 4 {
                return UIColor.green
            }
            
            else if compositeRatingFloat > 3 {
                return UIColor.orange
            }
            
            else {
                return UIColor.red
            }
        }
        
        return UIColor.black
    }
    
    var ratingText: String {
        let ratings = ratingCountInt
        let rating = compositeRatingFloat
        
        if ratings > 0 {
            return "Rating: \(rating) | \(ratings) rating(s)"
        }
        
        return "References Available"
    }
}
