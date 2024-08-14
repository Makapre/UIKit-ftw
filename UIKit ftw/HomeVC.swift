//
//  ViewController.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 13.08.24.
//

import UIKit

class HomeVC: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var hasSeenOnboarding: Bool {
        UserDefaults.standard.bool(forKey: "has-seen-onboarding")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = "Has seen onboarding: \(hasSeenOnboarding)"
    }
    
    private func setupUi() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#Preview {
    HomeVC()
}
