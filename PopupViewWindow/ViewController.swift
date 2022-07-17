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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        [
            testButton
        ]
            .forEach {
                view.addSubview($0)
            }

        testButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

