//
//  CalendarView.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/19.
//

import UIKit
import SnapKit
import FSCalendar

final class CalendarView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "스케줄"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .label
        return label
    }()

    private lazy var calendarView: FSCalendar = {
        let calendar = FSCalendar()
        calendar.delegate = self
        return calendar
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    private lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        [
            cancelButton,
            confirmButton
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }

        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarView: FSCalendarDelegate {

}

private extension CalendarView {
    func setupViews() {
        backgroundColor = .secondarySystemBackground
        [
            titleLabel,
            calendarView,
            buttonHStackView
        ]
            .forEach {
                addSubview($0)
            }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        calendarView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(300.0)
            $0.width.equalTo(300.0)
        }

        buttonHStackView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50.0)
            $0.bottom.equalToSuperview()
        }
    }
}
