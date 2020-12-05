//
//  SearchViewController.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol SearchDisplayLogic: AnyObject {
    func displayFetchedAlbum(_ viewController: SearchModels.SearchAlbums.ViewModel)
}

final class SearchViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Public Properties

    var interactor: SearchBusinessLogic?
    var router: (SearchRoutingLogic & SearchDataPassing)?

    // MARK: - Private Properties
    private var searchResult: [Album] = []
    private var timer: Timer?

    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    private func requestToSearchAlbum(name: String) {
        let request = SearchModels.SearchAlbums.Request(albumName: name)
        interactor?.fetchAlbum(request)
    }
    
    private func requestToSelectedAlbum(by albumID: Int) {
        let request = SearchModels.SelectAlbum.Request(index: albumID)
        interactor?.selectAlbum(request)
    }

    // MARK: - Private Methods
    private func setup() {
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Введите название альбома"
        
        
    }
  
    // MARK: - UI Actions

    
}

// MARK: - Display Logic

extension SearchViewController: SearchDisplayLogic {
    func displayFetchedAlbum(_ viewController: SearchModels.SearchAlbums.ViewModel) {
        searchResult = viewController.albums
        DispatchQueue.main.async {
            print(self.searchResult)
            self.tableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = searchResult[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.configure(with: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = searchResult[indexPath.row].collectionID!
        requestToSelectedAlbum(by: id)
        router?.routeToAlbumDetails()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            self.requestToSearchAlbum(name: searchText)
            print("fine")
        })
    }
}
