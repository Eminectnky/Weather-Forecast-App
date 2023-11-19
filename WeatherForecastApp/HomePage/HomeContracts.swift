//
//  HomeContracts.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 18.11.2023.
//

import UIKit

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    
    func fetchWeatherData(_ urlString: String)

    
}


//MARK: - Interactor

//presenter dan tetiklenir
protocol HomeInteractorInputProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func fetchWeatherData(_ urlString: String)
    
}

//presenter a veri gonderir
protocol HomeInteractorDelegate: AnyObject {
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
}


//MARK: - HomeViewController
protocol HomeViewProtocol: AnyObject {
    
    func fetchWeatherData(_ path: String)
    func didReceiveWeatherData(_ weatherModel: WeatherModel)

    
}

//MARK: - Router
enum Routes {
    case detail
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigate(_ route: Routes)
}

