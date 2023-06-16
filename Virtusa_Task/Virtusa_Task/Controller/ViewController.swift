//
//  ViewController.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ViewModel!
    var posts = Posts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(httpClient: HttpClient())
        configureUI()
        registerCell()
        fetchPosts()
    }
    
    func configureUI() {
        title = "User List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func registerCell() {
        // register tableview cell
        let cellNib = UINib(nibName: UserListTableViewCell.identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: UserListTableViewCell.identifier)
    }
    
    func fetchPosts(){
        Task {
            do {
                posts = try await viewModel.fetchDetails() ?? []
                tableView.reloadData()
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier) as? UserListTableViewCell else { return UITableViewCell() }
        if posts.count > 0 {
            cell.configureData(data: posts[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}





