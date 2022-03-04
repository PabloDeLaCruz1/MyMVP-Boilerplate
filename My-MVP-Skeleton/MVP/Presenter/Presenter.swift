//
//  Presenter.swift
//  My-MVP-Skeleton
//
//  Created by Pablo De La Cruz on 3/3/22.
//

//List of users to json as placeholer
//https://jsonplaceholder.typicode.com/users
//https://jsonplaceholder.typicode.com/posts
//https://www.youtube.com/watch?v=SFqIP5jYn_4

import Foundation
import UIKit

//This delegate delegates which functions the controller will have to conform to and implement.
protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User]) // takes users models
    func presentAlert(title: String, message: String)
}

typealias PresesnterDelegate = UserPresenterDelegate & UIViewController



class UserPresenter {
    weak var delegate: PresesnterDelegate?

//    public func getUsers() {
//        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
//            URLSession.shared.dataTask(with: url) { myData, _, error in
//                if let myData = myData
//                {
//                    do {
//                        let users = try JSONDecoder().decode([User].self, from: myData)
//                        print("users, ", users)
//                        self.delegate?.presentUsers(users: users)
//                    } catch {
//                    }
//                }
//            }.resume()
//        }
//    }

    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] myData, _, error in
            guard let myData = myData, error == nil else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: myData)
                self?.delegate?.presentUsers(users: users)
            } catch {
                print("Error deconding json")
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresesnterDelegate) {
        self.delegate = delegate
    }
    
}


