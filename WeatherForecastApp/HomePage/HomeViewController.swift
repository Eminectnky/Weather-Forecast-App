//
//  ViewController.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 17.11.2023.
//

import UIKit



class HomeViewController: UIViewController {
    
    //MARK: - UI Elements
    
    
    //MARK: - Properties
    
  
    
    var presenter: HomePresenterProtocol?

    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("uygulama basladi")
        presenter?.view = self
        
     
        
    }
    
    //MARK: - Functions
   

    
}

//MARK: - HomeViewController
extension HomeViewController: HomeViewProtocol {
    func fetchWeatherData(_ path: String) {
        presenter?.fetchWeatherData(path)
    }
    
    

}





