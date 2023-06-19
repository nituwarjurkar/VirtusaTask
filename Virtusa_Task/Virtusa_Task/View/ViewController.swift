//
//  ViewController.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ViewModel?
    private let reuseIdentifier = "UITableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(delegate: self)
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ProgressHUD.show()
        viewModel?.fetchPosts()
    }
    
    private func configureUI() {
        title = "User List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.posts??.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        if let data = viewModel?.posts??[indexPath.row] {
            cell.textLabel?.text = data.title
            cell.textLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = data.body
            cell.detailTextLabel?.numberOfLines = 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: ViewModel Protocol
extension ViewController : ViewModelProtocol {
    
    func fetchSuccess() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    func fetchfailure(message: String) {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.showAlert(title: AlertFailure.title, message: message, actionTitle: AlertFailure.button)
            
        }
    }
}







