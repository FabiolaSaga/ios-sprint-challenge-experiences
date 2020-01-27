//
//  ExperienceMapViewController.swift
//  Experiences
//
//  Created by Fabiola S on 1/27/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

import UIKit
import MapKit

class ExperienceMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Properties
    let experienceController = ExperienceController()
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "ExperienceAnnotationView")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.mapView.addAnnotations(self.experienceController.experiences)
    }
    
    //MARK: Delegate Method
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let experience = annotation as? Experience else { return nil }
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "ExperienceAnnotationView", for: experience) as! MKMarkerAnnotationView
        annotationView.glyphTintColor = .red
        annotationView.canShowCallout = true
        
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
