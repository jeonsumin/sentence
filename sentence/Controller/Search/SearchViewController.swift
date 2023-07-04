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
    let codeSegmented = SearchSegmentedControl(frame: .zero, buttonTitle: ["문장","책"])
    
    let FavoriteSearchCellIdentifier: String = "FavoriteSearchCell"
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    //    var controlDelegate: CustomSegmentedControlDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        CommonUtils.navigationTitleConfigure(viewController: self, navigationTitle: "Discover")
        UIConfigure()
        setupTableViewSettings()
        
        codeSegmented.delegate = self
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
        
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: FavoriteSearchCellIdentifier)
        tableView.isHidden = true
        
        tableView.separatorStyle = .none
    }
}

extension SearchViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteSearchCellIdentifier, for: indexPath)
        cell.textLabel?.text = "@@@"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch codeSegmented.selectedIndex {
        case 0 :
            return self.isFiltering ? 0 : 3
        case 1 :
            return self.isFiltering ? 0 : 7
        default:
            return 10
        }
        
    }
}

extension SearchViewController {
    func UIConfigure() {
        view.backgroundColor = .systemBackground
        [
            tableView,
            baseSearchView,
            codeSegmented
        ].forEach{
            view.addSubview($0)
        }
        //        CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        codeSegmented.snp.makeConstraints{
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(50)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        codeSegmented.isHidden = true
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
        baseSearchView.isHidden = searchController.isActive
        codeSegmented.isHidden = !searchController.isActive
    }
}

extension SearchViewController: CustomSegmentedControlDelegate{
    func change(to index: Int) {
    }
}
