//
//  ViewController.swift
//  Mapas
//
//  Created by Jorge Maldonado Borbón on 27/08/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var buscador: UISearchBar!
    
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buscador.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscador.resignFirstResponder()
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscador.text!) { (places:[CLPlacemark]?, error:Error?) in
            if error == nil{
                
                let place = places?.first
                let anotacion = MKPointAnnotation()
                anotacion.coordinate = (place?.location?.coordinate)!
                anotacion.title = self.buscador.text
                
                let span = MKCoordinateSpanMake(0.10, 0.10)
                let region = MKCoordinateRegion(center: anotacion.coordinate, span: span)
                self.mapa.setRegion(region, animated: true)
                
                self.mapa.addAnnotation(anotacion)
                self.mapa.selectAnnotation(anotacion, animated: true)
                
            }else{
                print("hubo un error")
            }
        }
        
    }



}

