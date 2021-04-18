//
//  ViewController.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 10/04/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var tableView: UITableView!

    @IBAction func noteAction(_ sender: Any) {
                
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)

    }
    
    
    @IBAction func filterAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
    // View model object
    var viewModel = HomeViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Notes"
        
        
        // Create table View
        pageSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    //MARK: Initial page settings
    func pageSetup()  {
        tableViewSetup()
        ///DB from viewmodel class
        // Call DB method from view model
        viewModel.fetchDetails()

        closureSetUp()
    }
    
    
    //MARK: Closure Initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main thread
            DispatchQueue.main.async { [self] in
                self?.tableView.isHidden = false
                self?.viewModel.fetchDetails()
                self?.tableView.reloadData()
            }
        }
        viewModel.errorMessage = {  (message)  in
            DispatchQueue.main.async {
                print(message)
            }
        }
    }

}



//MARK: ViewController Extension
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    // Table view settings
    func tableViewSetup()  {
        tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.personDetails.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : HomeCell.self)) as! HomeCell
        

        
        let person = viewModel.modelArr[indexPath.row]
        cell.titleLabel.text = person.title
        cell.DescriptionLabel.text = person.description
       
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(newViewController, animated: true)

    }

    
    
}

