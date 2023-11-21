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

}


//View a veri gönderir
 enum DetailPresenterOutput{
}

//MARK: - Interactor

//presenter dan tetiklenir
protocol DetailInteractorInputProtocol: AnyObject {
    var delegate: DetailInteractorDelegate? { get set }
}

//presenter a veri gönderir
protocol DetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: DetailInteractorOutput)
}


enum DetailInteractorOutput {
    
}

//MARK: - ViewController
protocol DetailViewProtocol: AnyObject {

}

//MARK: - Router
 enum DetailRoutes {
  
}

protocol DetailRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigate(_ route: DetailRoutes)
}



