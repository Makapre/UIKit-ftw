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
        self.tabBar.unselectedItemTintColor = .systemMint.withAlphaComponent(0.3)
        self.tabBar.tintColor = .systemRed
        self.tabBar.backgroundColor = .systemRed.withAlphaComponent(0.5)
        self.tabBar.isTranslucent = false
    }
    
    private func setupTabs() {
        let home = createTabbarItem(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        let table = createTabbarItem(with: "Table", and: UIImage(systemName: "tablecells"), vc: TableVC())
        let settings = createTabbarItem(with: "Settings", and: UIImage(systemName: "gear"), vc: SettingsVC())
        
        self.setViewControllers([table, home, settings], animated: true)
    }
    
    private func createTabbarItem(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let item = UINavigationController(rootViewController: vc)
        item.tabBarItem.title = title
        item.tabBarItem.image = image
        
        let firstVC = item.viewControllers.first
        firstVC?.navigationItem.title = if firstVC is SettingsVC {
            title
        } else {
            title + " controller"
        }
        
        if !(firstVC is SettingsVC) {
            firstVC?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tut nix", style: .plain, target: nil, action: #selector(nothing))
        }
        
        return item
    }
    
    @objc private func nothing() {
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "has-seen-onboarding")
        UserDefaults.standard.setValue(!hasSeenOnboarding, forKey: "has-seen-onboarding")
        let alert = UIAlertController(title: "ich tu nix 🐶", message: "has seen onboarding: \(!hasSeenOnboarding)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok, danke", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

#Preview {
    TabBarController()
}
