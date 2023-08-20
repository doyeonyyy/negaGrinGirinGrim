//
//  DetailPopUp.swift
//  nagaGrinGirinGrim
//
//  Created by Jack Lee on 2023/08/20.
//

import UIKit

class DetailPopUp: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.backgroundColor = .blue
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.backgroundColor = .red
//    }
}
