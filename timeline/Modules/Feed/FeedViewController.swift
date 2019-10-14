//
//  FeedViewController.swift
//  timeline
//
//  Created by pattarapol sawasdee on 12/10/2562 BE.
//  Copyright (c) 2562 pattarapol. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol FeedDisplayLogic: class
{
  func displayFeed(viewModel: Feed.AlbumFeed.ViewModel)
  func displayPhoto(viewModel: Feed.Photo.ViewModel)
  func routeToPost(viewModel: Feed.Post.ViewModel)
  func displaySearch(viewModel: Feed.Search.ViewModel)
}

class FeedViewController: UIViewController, FeedDisplayLogic
{
  var interactor: FeedBusinessLogic?
  var router: (NSObjectProtocol & FeedRoutingLogic & FeedDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = FeedInteractor()
    let presenter = FeedPresenter()
    let router = FeedRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    shouldHideKeyboardWhenTappedAnyArea()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addTapped))
    searchBar.delegate = self
    setupTableView()
    loadFeed()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    searchBar.setCenteredPlaceHolder()
  }

  @objc func addTapped() {

  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  @IBOutlet var navBar: UINavigationItem!
  @IBOutlet var searchBar: UISearchBar!
  @IBOutlet var tableView: UITableView!

  var feedData: [Feed.PresentFeed]?

  func setupTableView() {
    tableView.registerNib(FeedTableViewCell.self)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
  }

  func loadFeed() {
    let request = Feed.AlbumFeed.Request()
    interactor?.getAlbums(request: request)
  }

  func displayFeed(viewModel: Feed.AlbumFeed.ViewModel) {
    feedData = viewModel.data
    tableView.reloadData()
  }

  func loadPhoto(id: String, indexPath: IndexPath) {
    let request = Feed.Photo.Request(id: id, indexPath: indexPath)
    interactor?.getPhoto(request: request)
  }

  func displayPhoto(viewModel: Feed.Photo.ViewModel) {
    feedData = viewModel.data
    tableView.reloadRows(at: [viewModel.indexPath], with: .fade)
  }

  func loadSearch(data: String) {
    let request = Feed.Search.Request(data: data)
    interactor?.getSearchList(request: request)
  }

  func displaySearch(viewModel: Feed.Search.ViewModel) {
    feedData = viewModel.data
    tableView.reloadData()
  }

  func routeToPost(viewModel: Feed.Post.ViewModel) {
    performSegue(withIdentifier: "Post", sender: nil)
  }

  func getTime() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter.string(from: date)
  }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return feedData?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.deque(FeedTableViewCell.self, for: indexPath)

    guard let data = feedData?[safe: indexPath.row] else {
      return UITableViewCell()
    }

    cell.titleLabel.text = data.title
    cell.timeLabel.text = getTime()

    if !data.isLoadPhoto {
      loadPhoto(id: data.id, indexPath: indexPath)
    } else {
      if let photo = data.photoList?[safe: 0] {

        cell.image1.kf.setImage(with: URL(string: photo))
        cell.image1.isHidden = false
      } else {
        cell.image1.isHidden = true
      }

      if let photo = data.photoList?[safe: 1] {

        cell.image2.kf.setImage(with: URL(string: photo))
        cell.image2.isHidden = false
      } else {
        cell.image2.isHidden = true
      }

      if let photo = data.photoList?[safe: 2] {

        cell.image3.kf.setImage(with: URL(string: photo))
        cell.image3.isHidden = false
      } else {
        cell.image3.isHidden = true
      }
    }
    return cell

  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.deque(FeedTableViewCell.self, for: indexPath)
    guard let item = feedData?[indexPath.row] else {
      return
    }
    let request = Feed.Post.Request(id: item.id, time: cell.timeLabel.text ?? "")
    interactor?.setDataPostView(request: request)

  }
}

extension FeedViewController: UISearchBarDelegate {
  fileprivate func updateAlignmentSearchBar(_ searchBar: UISearchBar) {
    if searchBar.text?.isEmpty ?? true {
      searchBar.setCenteredPlaceHolder()
    } else {
      searchBar.setDefaultView()
    }
  }

  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.setDefaultView()
  }

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    updateAlignmentSearchBar(searchBar)
    searchBar.endEditing(true)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    updateAlignmentSearchBar(searchBar)
    searchBar.endEditing(true)
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    updateAlignmentSearchBar(searchBar)
    searchBar.endEditing(true)
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    loadSearch(data: searchText)
  }
}
