//
//  BoardView.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/18.
//

import UIKit
import SnapKit

final class BoardView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이벤트 보드"
        label.font = .boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 13.0

        return view
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BoardView {
    func setupViews() {
        [
            titleLabel,
            mainView
        ]
            .forEach {
                addSubview($0)
            }

        let inset: CGFloat = 16.0
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(inset)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
        }

        mainView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(inset)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.bottom.equalToSuperview().offset(-inset)
            $0.width.equalTo(200.0)
            $0.height.equalTo(300.0)
        }
    }
}
