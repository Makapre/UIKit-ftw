//
//  SettingsVCViewController.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 14.08.24.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUi()
    }
    
    private lazy var informationStack = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        stackView.layer.cornerRadius = 8
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var appInformationStack = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let author: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        
        label.text = "Marius Preikschat"
        return label
    }()
    
    private let appInformationTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        label.text = "App Information:"
        return label
    }()
    
    private let appInformationDetails: UILabel = {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        
        let label = UILabel()
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = if let version, let build {
            "\(version) (\(build))"
        } else {
            "No information"
        }
        return label
    }()
    
    private func setupUi() {
        view.addSubview(informationStack)
    
        informationStack.addArrangedSubview(author)
        informationStack.addArrangedSubview(appInformationStack)
        appInformationStack.addArrangedSubview(appInformationTitle)
        appInformationStack.addArrangedSubview(appInformationDetails)
        
        NSLayoutConstraint.activate([
            informationStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            informationStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#Preview {
    SettingsVC()
}
