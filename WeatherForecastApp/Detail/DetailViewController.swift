//
//  DetailViewController.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - UI Elements
    
    
    //MARK: - Properties
    
  
    
    var presenter: DetailPresenterProtocol?

    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("uygulama basladi")
        presenter?.view = self
        
     
        
    }
    
    //MARK: - Functions
   

    
}

//MARK: - DetailViewController
extension DetailViewController: DetailViewProtocol {
    
//    func fetchWeatherData(_ path: String) {
//        presenter?.fetchWeatherData(path)
//    }
    
    

}





