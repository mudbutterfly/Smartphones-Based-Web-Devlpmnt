//
//  ViewController.swift
//  weatherApp
//
//  Created by Kiki Pan on 11/19/22.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    
    let locationManager = CLLocationManager()
    var lat: CLLocationDegrees?
    var lng: CLLocationDegrees?
    
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var lblLocation: UILabel!

    var temps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
}
    
    @IBAction func getLocationAction(_ sender: Any) {
        let apiKey = ""  //YOURAPIKEY
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += String(format: "%f", lat!) + "," + String(format: "%f", lng!)
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key="
        url += apiKey
        
        SwiftSpinner.show("Getting Weather Values")
        
        AF.request(url).responseJSON { responseData in

            SwiftSpinner.hide()
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            let weatherData = JSON(responseData.data as Any)
            let forecastValues =  weatherData["locations"][String(format: "%f", self.lat!) + "," + String(format: "%f", self.lng!)]["values"]

            print(forecastValues.count)

            self.temps = [String]()
            for forecast in forecastValues {
                print(forecast)
                
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let condition = forecastJSON["conditions"].stringValue
                let str = "Temperature = \(temp) °F, \(condition)"
                self.temps.append(str)
            }
            self.tblView.reloadData()
        
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temps.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = temps[indexPath.row]
        return cell
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
  
        
    
    @IBAction func getWeatherAction(_ sender: Any) {
        let cityName = txtLocation.text!
        let apiKey = ""  //YOURAPIKEY

        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += cityName
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key="
        url += apiKey
        
        SwiftSpinner.show("Getting Weather Values")
        
        AF.request(url).responseJSON { responseData in

            SwiftSpinner.hide()
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            let weatherData = JSON(responseData.data as Any)
            let forecastValues =  weatherData["locations"][self.txtLocation.text!]["values"]

            print(forecastValues.count)

            self.temps = [String]()
            for forecast in forecastValues {
                print(forecast)
                
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let condition = forecastJSON["conditions"].stringValue
                let str = "Temperature = \(temp) °F, \(condition)"
                self.temps.append(str)
            }
            self.tblView.reloadData()
        }
    }
}

