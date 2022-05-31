//
//  ViewManager.swift
//  SelectionAlertView
//
//  Created by Prifiyia on 31/05/22.
//

import Foundation
import UIKit

public class ViewManager: NSObject{
    
    var model : ViewModel?
    static var sharedManager = ViewManager()
    
    override init() {}
    
    init(topHeading: String?, arr_DefaultSelected: [[String:String]], arrData: [[String:String]], isSelectAll: Bool = false) {
        model = ViewModel.init(topHeading: topHeading, arr_DefaultSelected: arr_DefaultSelected, arrData: arrData)
    }
    
    public func setUpData() -> String {
        print("call setupdata manager")
        return model?.setUpData() ?? ""
    }
    
    public func setupSearchBar(searchBar: UISearchBar) {
        model?.setupSearchBar(searchBar: searchBar)
    }
    
    func fetchData() -> [[String: String]] {
        model?.fetchData() ?? [[:]]
    }
}
