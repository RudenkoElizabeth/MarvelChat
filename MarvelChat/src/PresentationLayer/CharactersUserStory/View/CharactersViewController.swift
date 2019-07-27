//
//  CharactersViewController.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxCocoa
import RxSwift

class CharactersViewController: UIViewController {
    
    // MARK: - Value
    
    @IBOutlet weak var tableView: UITableView!
    private var characterViewModel = CharacterViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        characterViewModel.getCharacters()
        setupErrorMessage()
        setupTableViewItems()
        setupContentOffset()
        setupSelectedCell()
    }
    
    private func setupErrorMessage() {
        characterViewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { error in
                self.showAlertWith(message: error)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableViewItems() {
        characterViewModel
            .characters
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: CharactersConstants.cell, 
                                         cellType: CharacterCell.self)) { (row, element, cell) in
                cell.setupNameLabelWith(text: element.name)
                if let imagePath = element.thumbnail?.path,
                    let imageExtension =  element.thumbnail?.imageExtension {
                    cell.setupCharacterImageViewWith(imageUrlString: imagePath + CharactersConstants.imageSize + imageExtension)
                    if imagePath.suffix(19) == CharactersConstants.imagePlaceholder {
                        cell.setupInitialLabelWith(text: element.name)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func setupContentOffset() {
        tableView?.rx.contentOffset
            .subscribe { [weak self] _ in
                guard let characterViewModel = self?.characterViewModel,
                    characterViewModel.shouldLoadNextPage,
                    let tableView = self?.tableView,
                    tableView.isNearBottomEdge(edgeOffset: 20.0) else {
                        return
                }
                self?.characterViewModel.getCharacters()
            }
            .disposed(by: disposeBag)
    }
    
    private func setupSelectedCell() {
        tableView.rx.modelSelected(Character.self)
            .subscribe(onNext: { [weak self] element in
                print(element.id)
                self?.routeToChat(character: element)
            })
            .disposed(by: disposeBag)
    }
    
    private func routeToChat(character: CharacterProtocol) {
        let identifier = CharactersConstants.viewController
        let viewController = UIViewController.instantiateFromStoryboard(identifier) as! ChatViewController
        viewController.viewModel = ChatViewModel(character: character)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
