//
//  RMCharactersViewController.swift
//  ZaraTest
//
//  Created by JOEDELROSARIO on 29/1/23.
//

import Foundation
import UIKit

class RMCharactersViewController: UIViewController {
    var characters: Characters? = nil
    @IBOutlet weak var charactersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.charactersTableView.backgroundColor = .white
        self.charactersTableView.dataSource = self
        self.charactersTableView.delegate = self
        self.charactersTableView.tableFooterView = UIView()
        
        //self.charactersTableView.register(UInib(RMTableViewCell.nibName), forCellReuseIdentifier: RMTableViewCell.identifier)
        
        self.charactersTableView.register(UINib(nibName: RMTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: RMTableViewCell.identifier)
    }
}

extension RMCharactersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters!.results!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RMTableViewCell.identifier, for: indexPath) as! RMTableViewCell
        cell.imgFirst.loadFrom(URLAddress: self.characters!.results![indexPath.row].image!)
        cell.lblTitle!.text = self.characters!.results![indexPath.row].name
        cell.lblStatus!.text = self.characters!.results![indexPath.row].status
        cell.lblFirstSeenIn!.text = self.characters!.results![indexPath.row].created
        cell.lblLastKnowLocation!.text = self.characters!.results![indexPath.row].location!.name
        return cell
    }
    
    
}

extension RMCharactersViewController: UITableViewDelegate {
    
}
