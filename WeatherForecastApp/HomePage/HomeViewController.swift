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
    
//    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var temp1: UILabel!
        
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var temp2: UILabel!
    
    @IBOutlet weak var day3: UILabel!
    @IBOutlet weak var temp3: UILabel!
    
    @IBOutlet weak var day4: UILabel!
    @IBOutlet weak var temp4: UILabel!
    
    @IBOutlet weak var day5: UILabel!
    @IBOutlet weak var temp5: UILabel!
    
    
    //MARK: - Properties
    
    let locationManager = CLLocationManager()
    var presenter: HomePresenterProtocol?
    let apiKey = AppConfig.openWeatherMapApiKey
//    var days = [List]()
    let dateFormatter = DateFormatter()
    var days = [String]()
    var temps = [String]()
  
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = "lat=44.34&lon=10.99&appid=\(apiKey)&units=metric"
        fetchWeatherData(path)
        print("uygulama basladi")
        presenter?.view = self
        setupUI()
        
    }
    
    
    func setupUI(){
        
        requestLocationPermission()
        getCurrentLocation()
//        serviceControl()
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    //MARK: - Functions
    // Kullanıcıdan konum iznini istediğimiz fonksiyon
    func requestLocationPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    // Konumu alıyoruz
    func getCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    // Bugünün tarihinden başlayarak 7 gün boyunca verileri almak için kullanacağım fonksiyon
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
            
            // Eğer filtreleme sonucunda veri bulunduysa, ekleyerek devam ediliyor
            if let firstDataForDay = filteredData.first {
                selectedWeatherData.append(firstDataForDay)
            }
            
            // Bir sonraki güne geçiliyor
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        }
        
        return selectedWeatherData
    }
    
//   Servise istek atıldı
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
        
    
//        self.days = selectedWeatherDataForNext7Days
        print("Günler dizisindeki eleman sayısı:\(selectedWeatherDataForNext7Days.count)")
  
//        setupUI()
        // Seçilen verileri yazdırıyoruz
        selectedWeatherDataForNext7Days.forEach { data in
            
            print("Tarih: \(data.dtTxt ?? ""), Sicaklik: \(data.main?.temp ?? 0.0)")
            
            days.append("\(data.dtTxt ?? "")")
            temps.append("\(data.main?.temp ?? 0.0)")
            
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

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        days.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: “cell”, for: indexPath) as!     HomeViewCell
//        cell.textLabel?.text = days[indexPath.row].dtTxt
//        return cell
//    }
//    
    
//}


