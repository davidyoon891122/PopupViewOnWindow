//
//  GeneralPopup.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/18.
//

import Foundation
import UIKit


final class GeneralPopup {
    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(
            white: 0.2,
            alpha: 0.8
        )
        return view
    }()

    private var popupView: UIView?

    func openPopupView(view: UIView) {
        self.popupView = view

        let scenes = UIApplication.shared.connectedScenes
        guard let windowScene = scenes.first as? UIWindowScene else { return }
        guard let window = windowScene.windows.first,
              let popupView = self.popupView
        else { return }

        blackView.frame = window.frame
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blackViewTapGesture))
        blackView.addGestureRecognizer(tapGesture)
        blackView.alpha = 1

        [
            blackView,
            popupView
        ]
            .forEach {
                window.addSubview($0)
            }

        blackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        popupView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    @objc func blackViewTapGesture() {
        blackView.alpha = 0
        popupView?.removeFromSuperview()

    }
}
