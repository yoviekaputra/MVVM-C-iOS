//
//  HomeVC.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel!
    private var data: [TeamModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear.accept?(())
    }
}

extension HomeVC {
    private func setupUI() {
        let me = UIBarButtonItem(title: "Me", style: .done, target: self, action: #selector(aboutClicked))
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = me
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 104
        tableView.separatorStyle = .none
        tableView.register(
            UINib(nibName: HomeItemCell.identifier, bundle: nil),
            forCellReuseIdentifier: HomeItemCell.identifier
        )
    }
    
    private func setupData() {
        data = viewModel.fetctTeam()
        tableView.reloadData()
    }
    
    @objc private func aboutClicked() {
        viewModel.aboutSelected.accept?(())
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemCell.identifier, for: indexPath) as? HomeItemCell {
            let model = data[indexPath.row]
            cell.binding(model: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.homeItemSelected.accept?(data[indexPath.row])
    }
}
