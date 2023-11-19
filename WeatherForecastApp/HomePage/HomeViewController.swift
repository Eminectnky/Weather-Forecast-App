//
//  ViewController.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 17.11.2023.
//

import UIKit
import CoreLocation



class HomeViewController: UIViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var unitLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    var presenter: HomePresenterProtocol?
    let apiKey = AppConfig.openWeatherMapApiKey
    var days = [String]()
    let dateFormatter = DateFormatter()
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("uygulama basladi")
        presenter?.view = self
        requestLocationPermission()
        getCurrentLocation()
        
    }
    
    //MARK: - Functions
    // Kullanıcıdan konum iznini istedigimiz fonksiyon
    func requestLocationPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    // Konumu aliyoruz
    func getCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    // Bugunun tarihinden başlayarak 7 gün boyunca verileri almak için kullanılabilecek bir fonksiyon
    func getWeatherForNext7Days(from startDate: Date, in weatherModel: WeatherModel) -> [List] {
        guard let allWeatherData = weatherModel.list else {
            return []
        }
        
        var selectedWeatherData: [List] = []
        
        let calendar = Calendar.current
        var currentDate = startDate
        print(startDate)
        
        // Belirli bir tarih aralığındaki verileri alıyoruz
        for _ in 1...7 {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let filteredData = allWeatherData.filter {
                if let dtTxt = $0.dtTxt, let date = dateFormatter.date(from: dtTxt) {
                    return calendar.isDate(date, inSameDayAs: currentDate)
                }
                return false
            }
            print(filteredData)
            
            // Eğer filtreleme sonucunda veri bulunduysa, ekleyerek devam ediyoruz
            if let firstDataForDay = filteredData.first {
                selectedWeatherData.append(firstDataForDay)
            }
            
            // Bir sonraki güne geçiyoruz
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        }
        
        return selectedWeatherData
    }
    
    
    //    func serviceControl(){
    
    //                let apiUrl = "https://api.openweathermap.org/data/2.5/forecast?q=London&appid=\(apiKey)"
    //                AF.request(apiUrl).responseJSON { response in
    //                    switch response.result {
    //                    case .success(let value):
    //                        print("JSON: \(value)")
    //
    //                    case .failure(let error):
    //                        print("Error: \(error)")
    //                    }
    //                }
    //    }
    
    
//    fahrenheit a çevirmek için
//    @IBAction func transformType(_ sender: Any){
//        //        let path = "\(latitude)&lon=\(longitude)&appid=\(apiKey)units=imperial"
//    }
    
}

//MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        let startDate = Date()

        let selectedWeatherDataForNext7Days = getWeatherForNext7Days(from: startDate, in: weatherModel)
        
      let day1 = selectedWeatherDataForNext7Days[0]
        print(day1)
        
        // Seçilen verileri yazdırıyoruz
        selectedWeatherDataForNext7Days.forEach { data in
            print("Tarih: \(data.dtTxt ?? ""), Sicaklik: \(data.main?.temp ?? 0.0)")
        }
        
    
    }
    
    func fetchWeatherData(_ path: String) {
        presenter?.fetchWeatherData(path)
    }
    
}

//MARK: - CLLocationManagerDelegate
extension HomeViewController: CLLocationManagerDelegate {
    // CLLocationManagerDelegate metotları
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude    //Konumdaki enlem degeri
        let longitude = location.coordinate.longitude  //Konumdaki boylam degeri
        
        // latitude ve longitude ile konumdaki hava durumu API'ıne istek yapabiliriz
        let path = "\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
//      &units=metric C türünden sıcaklığı getirir
        fetchWeatherData(path)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Konum alınamadı: \(error.localizedDescription)")
    }
}




