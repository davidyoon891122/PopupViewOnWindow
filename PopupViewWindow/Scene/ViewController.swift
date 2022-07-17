//
//  ViewController.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("TEST", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .green
        return button
    }()

    private let boardView = BoardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        [
            testButton,
            boardView
        ]
            .forEach {
                view.addSubview($0)
            }

        let inset: CGFloat = 16.0
        testButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(inset)
            $0.leading.equalToSuperview().offset(inset)
        }

        boardView.snp.makeConstraints {
            $0.center.equalToSuperview()
            
        }

    }
}

