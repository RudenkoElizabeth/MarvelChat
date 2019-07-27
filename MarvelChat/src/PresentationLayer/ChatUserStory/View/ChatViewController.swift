//
//  ChatViewController.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxSwift
import RxCocoa

class ChatViewController: UIViewController {
    
    // MARK: - Value
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: ChatViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollToBottom()
    }    
    
    // MARK: - Setup
    
    private func setup() {
        setupTableView()
        setupCollectionView()
    }
    
    private func setupTableView() {
        viewModel
            .messages
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ChatConstants.chatCell)) { (row, element, cell) in
                if let cell = cell as? ChatCell {
                    cell.setupLabel(with: element.text, for: element.type)
                }
            }
            .disposed(by: disposeBag)
        
        viewModel
            .messages
            .asObservable()
            .debounce(RxTimeInterval.milliseconds(500), 
                      scheduler: MainScheduler.instance)
            .subscribe({ (event) in
                 self.scrollToBottom()
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCollectionView() {
        viewModel
            .anwers
            .asObservable()
            .bind(to: collectionView.rx.items(cellIdentifier: ChatConstants.answerCell, 
                                              cellType: ChatAnswerCell.self)) { row, element, cell in
                cell.setupLabel(with: element)
            }
            .disposed(by: disposeBag)
        collectionView
            .rx
            .itemSelected
            .subscribe(onNext:{ [weak self] indexPath in
                self?.viewModel.sendAnswerFor(index: indexPath.row)
            }).disposed(by: disposeBag)
    }
    
    private func scrollToBottom(){
        let indexPath = IndexPath(row: viewModel.getLastCellRow(), 
                                  section: 0)
        self.tableView.scrollToRow(at: indexPath, 
                                   at: .bottom, 
                                   animated: true)
    }
}
