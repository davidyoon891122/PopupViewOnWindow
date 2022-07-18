//
//  ViewController.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/18.
//

import UIKit
import SnapKit
import SwiftUI

class ViewController: UIViewController {
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
        return tableView
    }()

    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(
            white: 0.2,
            alpha: 0.8
        )
        return view
    }()
    private let generalPopup = GeneralPopup()
    private let boardView = BoardView()

    // MARK: - Variables

    private var companies = ["Microsoft", "Apple", "Google", "Facebook", "Amazon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigation()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return companies.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        let company = companies[indexPath.row]
        cell.textLabel?.text = company
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print(indexPath.row)

        let alert = UIAlertController(
            title: "Alert",
            message: "Check the popupView",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(
            title: "Confirm",
            style: .default,
            handler: { [weak self] _ in
                guard let self = self else { return }
                print("Confirm")
                self.generalPopup.openPopupView(view: self.boardView)
            }
        ))

        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))

        present(
            alert,
            animated: true,
            completion: nil
        )
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            tableView
        ]
            .forEach {
                view.addSubview($0)
            }

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configureNavigation() {
        navigationItem.title = "WishList"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
