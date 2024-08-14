//
//  ViewController.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 13.08.24.
//

import UIKit

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UserDefaults.standard.set(true, forKey: "has-seen-onboarding")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(false, forKey: "has-seen-onboarding")

    }
}

#Preview {
    HomeVC()
}
