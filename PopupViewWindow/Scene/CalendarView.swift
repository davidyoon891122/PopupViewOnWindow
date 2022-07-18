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
            calendarView
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

        calendarView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.height.equalTo(300.0)
            $0.width.equalTo(300.0)
            $0.bottom.equalToSuperview().offset(-inset)
        }
    }
}
