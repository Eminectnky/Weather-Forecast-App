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
    
    func fetchWeatherData(_ urlString: String)}

//View a veri gönderir
enum PresenterOutput{
    case didWeatherData(_ urlString: String)
    
}

//MARK: - Interactor

//presenter dan tetiklenir
protocol HomeInteractorInputProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func fetchWeatherData(_ urlString: String)
    
}

//presenter a veri gönderir
protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}


enum HomeInteractorOutput {
    case didWeatherData(_ urlString: String)
    
}

//MARK: - ViewController
protocol HomeViewProtocol: AnyObject {

    func fetchWeatherData(_ urlString: String)
    
}

//MARK: - Router
enum Routes {
    case detail
    
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigate(_ route: Routes)
}


