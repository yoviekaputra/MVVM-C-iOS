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
}

extension HomeVC {
    private func setupUI() {
        let me = UIBarButtonItem(title: "Me", style: .done, target: self, action: #selector(aboutClicked))
        navigationItem.title = "Football Team"
        navigationItem.rightBarButtonItem = me
        
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
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemCell.identifier, for: indexPath) as? HomeItemCell {
            cell.binding(model: data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.homeItemSelected.accept?(data[indexPath.row])
    }
}
