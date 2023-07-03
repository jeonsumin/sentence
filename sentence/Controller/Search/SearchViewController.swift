//
//  SearchViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController{
     
    let baseSearchView = BaseSearchView()
    
    let FavoriteSearchCellIdentifier: String = "FavoriteSearchCell"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        navigationTitleConfigure()
        UIConfigure()
        setupTableViewSettings()
        
    }
    
    func navigationTitleConfigure(){
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Discover"
        label.font = UIFont.systemFont(ofSize: 24,weight: .bold)
        
        label.textAlignment = .left
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        titleView.backgroundColor = .clear
        titleView.addSubview(label)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }
    
    func setupSearchController(){
        let searchControlelr = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchControlelr
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchControlelr.searchBar.placeholder = "검색어를 입력해 주세요"
        
        searchControlelr.searchResultsUpdater = self
        searchControlelr.hidesNavigationBarDuringPresentation = true
        
    }
    func setupTableViewSettings(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteSearchCell.self, forCellReuseIdentifier: FavoriteSearchCellIdentifier)
    }
}

extension SearchViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteSearchCellIdentifier, for: indexPath)
        if self.isFiltering {
            cell.textLabel?.text = "\(indexPath.row)"
        }else{
            cell.textLabel?.text = "@@@"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? 0 : 3
    }
}

extension SearchViewController {
    func UIConfigure() {
        view.backgroundColor = .systemBackground
        [
            tableView,
            baseSearchView
        ].forEach{
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(0)
        }
        
        baseSearchView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(0)
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        tableView.isHidden = !isFiltering
        baseSearchView.isHidden = isFiltering
        print(searchController.searchBar.text)
    }
}
