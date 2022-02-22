//
//  DashboardViewController.swift
//  LoginExample
//
//  Created by MacBook Air on 29/02/20.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    
    
    var ModelDashboard = [DashboardModel]()
    
    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var tblDashboard: UITableView!
    
    @IBOutlet weak var searchBarClick: UISearchBar!
    
    @IBAction func SearchBarButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Search", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        nextViewController.modalPresentationStyle = .fullScreen
        
        
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func tambahData(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "AddProduct", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        
        nextViewController.modalPresentationStyle = .fullScreen
        
        
        self.present(nextViewController, animated:true, completion:nil)
        
        
        print("tambahhhhhhh")
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        tblDashboard.dataSource = self
        tblDashboard.delegate = self
        self.tblDashboard.reloadData()
       
        let APIManager = APIManager()
        APIManager.getAllDataObat()
        APIManager.completionHandler { [weak self] (Dashboard, status, message) in
            if status {
                guard let self = self else {return}
                guard let _Dashboard = Dashboard else {return}
                self.ModelDashboard = _Dashboard
                self.tblDashboard.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblDashboard.dataSource = self
        tblDashboard.delegate = self
        self.tblDashboard.reloadData()
       
        let APIManager = APIManager()
        APIManager.getAllDataObat()
        APIManager.completionHandler { [weak self] (Dashboard, status, message) in
            if status {
                guard let self = self else {return}
                guard let _Dashboard = Dashboard else {return}
                self.ModelDashboard = _Dashboard
                self.tblDashboard.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelDashboard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell")
        if cell == nil {
            cell == UITableViewCell(style: .subtitle, reuseIdentifier: "dashboardCell")
        }
        
        let dashboard = ModelDashboard[indexPath.row]
        
        cell?.textLabel?.text = dashboard.title ?? "no data"
//        cell?.detailTextLabel?.text = dashboard.sku ?? "---"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indextPath: IndexPath){
        tableView.deselectRow(at: indextPath, animated: true)
        print("you awesome tapped")
        
        let dashboard = ModelDashboard[indextPath.row]
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "UpdateDelete", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "UpdateDeleteViewController") as! UpdateDeleteViewController
        
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.UD_id = dashboard.id ?? 0
        nextViewController.UD_title = dashboard.title ?? "null"
        nextViewController.UD_content = dashboard.content ?? "null"
        
        
        
        self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    
    
   
    
}
//extension DashboardViewController{
//    static func shareInstance() -> DashboardViewController{
//        return DashboardViewController.instantiateFromStoryboard("Dashboard")
//    }
//}
