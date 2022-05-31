//
//  ViewController.swift
//  SelectionAlertView
//
//  Created by Prifiyia on 30/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel           : UILabel!
    @IBOutlet weak var searchBar            : UISearchBar!
    @IBOutlet weak var tableView            : UITableView!
    var manager                             : ViewManager?
    var filterData                          = [[String:String]]()
    
    var data                                = [[String:String]]()
    var topHeading                          = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("data",data)
        searchBar.delegate = self
        manager = ViewManager.init(topHeading: topHeading, arr_DefaultSelected: data, arrData: data)
        manager?.setupSearchBar(searchBar: searchBar)
        titleLabel.text = manager?.setUpData()
        filterData = manager?.fetchData() ?? [[:]]
        print("filterData", filterData)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        preferredContentSize.height = tableView.contentSize.height + tableView.layoutMargins.top + tableView.layoutMargins.bottom
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        cell.textLabel?.text = filterData[indexPath.row]["value"]
        return cell
    }
}
extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchPredicate = NSPredicate(format: "value CONTAINS[c] %@", searchText)
        
        self.filterData = searchText.isEmpty ? manager?.fetchData() as! [[String : String]] : manager?.fetchData().filter { searchPredicate.evaluate(with: $0) } as! [[String : String]]
        
        self.tableView.reloadData()
    }
}
