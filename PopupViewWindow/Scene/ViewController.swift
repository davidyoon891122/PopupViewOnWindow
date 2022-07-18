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
    private lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Board", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground

        button.layer.cornerRadius = 15.0
        button.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        button.layer.borderWidth = 0.5

        button.addTarget(
            self,
            action: #selector(buttonAction),
            for: .touchUpInside
        )

        return button
    }()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )

        cell.textLabel?.text = "Selection"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print(indexPath.row)
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            testButton,
            tableView
        ]
            .forEach {
                view.addSubview($0)
            }

        let inset: CGFloat = 16.0
        testButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(inset)
            $0.leading.equalToSuperview().offset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(50.0)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(testButton.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    @objc func buttonAction() {
        generalPopup.openPopupView(view: boardView)
    }
}
