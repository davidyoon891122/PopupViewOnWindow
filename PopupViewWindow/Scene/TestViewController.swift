//
//  TestViewController.swift
//  PopupViewWindow
//
//  Created by iMac on 2022/07/18.
//

import Foundation
import UIKit

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

import SwiftUI

struct PreView_test: PreviewProvider {
    static var previews: some View {
        let testVC = TestViewController()
        testVC.toPreview()
    }
}
