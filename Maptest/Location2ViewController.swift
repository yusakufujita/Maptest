//
//  Location2ViewController.swift
//  Maptest
//
//  Created by 藤田優作 on 2020/12/26.
//

import UIKit
import CoreLocation
import MapKit

class Location2ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        //locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        }
        print("１２")
    }
    
    
    @IBAction func stop(_ sender: Any) {
        locationManager?.stopUpdatingLocation()
    }
    // 位置情報の取得
    func locationManager(_ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
        print(locations)
            // 現在の位置情報を取得
                let location : CLLocation = locations[0]
                let latlng = location.coordinate
            
                textView.text = "現在の位置情報\n-----------\n緯度: \(latlng.latitude)\n経度: \(latlng.longitude)"
                textView.text = "現在の位置情報\n-----------\n緯度: 35.607506\n経度: 139.582696"
                print(textView.text)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
            print(error)
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
