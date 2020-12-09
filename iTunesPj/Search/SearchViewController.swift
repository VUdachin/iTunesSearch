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
    @IBOutlet private weak var collectionView: UICollectionView!
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
        setupCollectionView()
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
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Введите название альбома"
    }
    
}

// MARK: - Display Logic
extension SearchViewController: SearchDisplayLogic {
    func displayFetchedAlbum(_ viewController: SearchModels.SearchAlbums.ViewModel) {
        searchResult = viewController.albums
        DispatchQueue.main.async {
            print(self.searchResult)
            self.collectionView.reloadData()
        }
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = searchResult[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.configure(with: album)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = searchResult[indexPath.item].collectionID!
        requestToSelectedAlbum(by: id)
        router?.routeToAlbumDetails()
        view.endEditing(true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIScreen.main.bounds.height / 3)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { (_) in
            self.requestToSearchAlbum(name: searchText)
            
            /* В запрос также можно добавить ActivityIndicatorView дабы он отображался пока данные доходят и картинка отображается, но я взглянул что у Apple Медиатека реализована без него и решил сделать также
             Я знаю, что его предпочтительно реализовывать при любой подгрузке из сети, чтобы пользователь понимал что данные приходят */
        })
    }
}

