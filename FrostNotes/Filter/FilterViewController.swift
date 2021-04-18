//
//  FilterViewController.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 10/04/21.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // View model object
    var viewModel = FilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Filter"
        // Do any additional setup after loading the view.
    }
    

   

}

//MARK: FilterViewController Extension
extension FilterViewController : UITableViewDelegate,UITableViewDataSource{
    // Table view settings
    func tableViewSetup()  {
        tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterArr.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : FilterCell.self)) as! FilterCell
        
    
        cell.titleLabel.text = viewModel.filterArr[indexPath.row]
             

        return cell
    }
}

