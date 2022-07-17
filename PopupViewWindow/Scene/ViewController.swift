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

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            testButton
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
    }

    @objc func buttonAction() {
        generalPopup.openPopupView(view: boardView)
    }
}

