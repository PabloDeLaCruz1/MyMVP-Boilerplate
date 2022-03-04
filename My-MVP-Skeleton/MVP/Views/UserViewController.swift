//
//  ViewController.swift
//  My-MVP-Skeleton
//
//  Created by Pablo De La Cruz on 3/3/22.
//
//What is going on here?
//We have table view,2 we have an empty array of users, we have a presenter, we set up the tables, we set the view delegate (critical), then we get users, then present users (this function simply assign users and reload table view

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserPresenterDelegate {
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    private var users = [User]()
    private let presenter  = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Users"
        
        //table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    
        //Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Ask presenter to handle the tap
        
}
    
    //Presenter Delegate
    func presentUsers(users: [User]) {
        self.users = users
        print("Present users")
        //Dispatch to main thread since we cant guaranteed this will fire only on the main thread
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func presentAlert(title: String, message: String) {
        
    }
}
