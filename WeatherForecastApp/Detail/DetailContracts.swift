//
//  DetailContracts.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//


import UIKit

//MARK: - Presenter
protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    
    
//    func fetchWeatherData(_ urlString: String)
}


//View a veri gönderir
 enum DetailPresenterOutput{
//    case didWeatherData(_ urlString: String)
    
}

//MARK: - Interactor

//presenter dan tetiklenir
protocol DetailInteractorInputProtocol: AnyObject {
    var delegate: DetailInteractorDelegate? { get set }
//    func fetchWeatherData(_ urlString: String)
    
}

//presenter a veri gönderir
protocol DetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: DetailInteractorOutput)
}


enum DetailInteractorOutput {
//    case didWeatherData(_ urlString: String)
    
}

//MARK: - ViewController
protocol DetailViewProtocol: AnyObject {

//    func fetchWeatherData(_ urlString: String)
    
}

//MARK: - Router
 enum DetailRoutes {
  
}

protocol DetailRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigate(_ route: DetailRoutes)
}



