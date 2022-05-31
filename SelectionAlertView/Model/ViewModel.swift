//
//  ViewModel.swift
//  SelectionAlertView
//
//  Created by Prifiyia on 31/05/22.
//

import Foundation
import UIKit

struct ViewModel {
    var topHeading                   = ""
    var isSelectAll: Bool            = false
    var arrData                      = [[String: String]]()
    var arr_DefaultSelected          = [[String: String]]()
    
    init(topHeading: String?, arr_DefaultSelected: [[String:String]], arrData: [[String:String]], isSelectAll: Bool = false) {
        self.topHeading = topHeading ?? ""
        self.arrData = arrData
        self.arr_DefaultSelected = arr_DefaultSelected
    }
    
    public func setUpData() -> String {
        return "Select \(topHeading)"
    }
    
    public func setupSearchBar(searchBar: UISearchBar) {
        searchBar.layer.borderWidth = 1.0
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.placeholder = "Search"
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.gray
            }
        }
    }
    func fetchData() -> [[String: String]] {
        return arr_DefaultSelected
    }
}
