//
//  ViewController.swift
//  MapasGoogle
//
//  Created by Jorge M. B. on 07/03/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class ViewController: UIViewController, GMSMapViewDelegate, GMSAutocompleteViewControllerDelegate{
    
    
    let info = GMSMarker()

    override func loadView() {
        let camara = GMSCameraPosition.camera(withLatitude: 24.034197, longitude: -104.656982, zoom: 14)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camara)
        mapView.delegate = self
        self.view = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        info.position = location
        info.title = name
        info.opacity = 0
        info.infoWindowAnchor.y = 1
        info.map = mapView
        mapView.selectedMarker = info
        print("INFORMACION DEL LUGAR: Nombre:\(name), ID:\(placeID), \(location.latitude) - \(location.longitude)")
    }
    
    @IBAction func buscador(_ sender: UIBarButtonItem) {
        let autocomplete = GMSAutocompleteViewController()
        autocomplete.delegate = self
        present(autocomplete, animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Nombre del lugar: \(place.name)")
        print("Direccion del lugar: \(place.formattedAddress ?? "sin direccion")")
        print("Numero telefonico: \(place.phoneNumber ?? "sin numero")")
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error de busqueda", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}












