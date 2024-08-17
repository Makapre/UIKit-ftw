//
//  PreviewVC.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 17.08.24.
//

import UIKit

class PreviewVC: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var index: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        
        view.addSubview(label)
        label.text = "Ich bin Preview Nr.\(index)"
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let width = view.bounds.width * 0.75
        let height = view.bounds.height * 0.6
        preferredContentSize = CGSize(width: width, height: height)
    }
}
