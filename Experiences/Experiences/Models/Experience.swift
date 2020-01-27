//
//  Experience.swift
//  Experiences
//
//  Created by Fabiola S on 1/27/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

import Foundation
import MapKit

class Experience: NSObject, MKAnnotation {
    var experienceTitle: String
    var coordinate: CLLocationCoordinate2D
    var imageData: Data
    var videoURL: URL
    var audioURL: URL
    
    init(experienceTitle: String, coordinate: CLLocationCoordinate2D, audioURL: URL, imageData: Data, videoURL: URL) {
        self.experienceTitle = experienceTitle
        self.imageData = imageData
        self.audioURL = audioURL
        self.videoURL = videoURL
        self.coordinate = coordinate
    }
}
