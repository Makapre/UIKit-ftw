//
//  TabBarController.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 14.08.24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.setupTabbar()
    }
    
    private func setupTabbar() {
        self.tabBar.barTintColor = .systemRed.withAlphaComponent(0.1)
        self.tabBar.unselectedItemTintColor = .systemMint.withAlphaComponent(0.3)
        self.tabBar.tintColor = .systemBackground
//        self.tabBar.isTranslucent = false
    }
    
    private func setupTabs() {
        let home = createTabbarItem(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        let table = createTabbarItem(with: "Table", and: UIImage(systemName: "gear"), vc: TableVC())
        
        self.setViewControllers([table, home], animated: true)
    }
    
    private func createTabbarItem(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let item = UINavigationController(rootViewController: vc)
        item.tabBarItem.title = title
        item.tabBarItem.image = image
        
        item.viewControllers.first?.navigationItem.title = title + " controller"
        item.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tut nix", style: .plain, target: nil, action: #selector(nothing))
        
        return item
    }
    
    @objc private func nothing() {
        let alert = UIAlertController(title: "ich tu nix 🐶", message: "has seen onboarding: \(UserDefaults.standard.bool(forKey: "has-seen-onboarding"))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok, danke", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

#Preview {
    TabBarController()
}
