//
//  AlbumDetailViewController.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol AlbumDetailDisplayLogic: AnyObject {
    func displayAlbumDetail(_ viewModel: AlbumDetailModels.ShowDetail.ViewModel)
}

final class AlbumDetailViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var albumImageView: UIImageView!
    
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var genreNameLabel: UILabel!
    @IBOutlet private weak var trackCountLabel: UILabel!
    
    
    // MARK: - Public Properties

    var interactor: AlbumDetailBusinessLogic?
    var router: (AlbumDetailRoutingLogic & AlbumDetailDataPassing)?

    // MARK: - Private Properties
    private var selectedAlbum: [AlbumDetail] = []
    
    
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
        requestToFetchAlbumDetail()
    }

    // MARK: - Public Methods


    // MARK: - Requests
    private func requestToFetchAlbumDetail() {
        let request = AlbumDetailModels.ShowDetail.Request()
        interactor?.fetchAlbumDetail(request)
    }

    // MARK: - Private Methods
    private func setup() {
        let interactor = AlbumDetailInteractor()
        let presenter = AlbumDetailPresenter()
        let router = AlbumDetailRouter()

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
  
    // MARK: - UI Actions

    
}

// MARK: - Display Logic

extension AlbumDetailViewController: AlbumDetailDisplayLogic {
    func displayAlbumDetail(_ viewModel: AlbumDetailModels.ShowDetail.ViewModel) {
        selectedAlbum = viewModel.detail
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension AlbumDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedAlbum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = selectedAlbum[indexPath.row]
        
        if indexPath.row == 0 {
            let albumCell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
            if album.wrapperType == WrapperType.collection  {
                albumCell.configure(with: album)
            }
            return albumCell
        } else {
            let songCell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
            if album.wrapperType == WrapperType.track {
                songCell.configure(with: album)
            }
            return songCell
        }
    }
    
}
