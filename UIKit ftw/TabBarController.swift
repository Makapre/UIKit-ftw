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
        let appearance: UITabBarAppearance = UITabBarAppearance()
        
        // tabbar
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .orange
        
        // items - selected
        appearance.stackedLayoutAppearance.selected.iconColor = .blue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = .init(horizontal: 0, vertical: 6)
        
        // items - normal
        appearance.stackedLayoutAppearance.normal.iconColor = .red
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]
        

        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTabs() {
        let home = createTabbarItem(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        let table = createTabbarItem(with: "Table", and: UIImage(systemName: "tablecells"), vc: TableVC())
//        let settings = createTabbarItem(with: "Settings", and: UIImage(systemName: "gear"), vc: SettingsVC())
        let pagesPageCurl = createTabbarItem(with: "Curl", and: UIImage(systemName: "book.pages"), vc: PageVC(transitionStyle: .pageCurl, navigationOrientation: .horizontal))
        let pagesScroll = createTabbarItem(with: "Scroll", and: UIImage(systemName: "book.pages.fill"), vc: PageVC(transitionStyle: .scroll, navigationOrientation: .vertical))

        self.setViewControllers([table, home, pagesPageCurl, pagesScroll], animated: true)
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
        
        var buttons = [UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: nil, action: #selector(showSettings))]
        
        if !(firstVC is SettingsVC) {
            buttons.append(UIBarButtonItem(title: "Tut nix", style: .plain, target: nil, action: #selector(nothing)))
        }
        
        firstVC?.navigationItem.rightBarButtonItem?.tintColor = .label
        firstVC?.navigationItem.rightBarButtonItems = buttons
        
        return item
    }
    
    @objc private func nothing() {
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "has-seen-onboarding")
        UserDefaults.standard.setValue(!hasSeenOnboarding, forKey: "has-seen-onboarding")
        let alert = UIAlertController(title: "ich tu nix 🐶", message: "has seen onboarding: \(!hasSeenOnboarding)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok, danke", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func showSettings() {
        let vc = SettingsVC()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 25
            sheet.prefersGrabberVisible = true
        }
        let transitions: [UIModalTransitionStyle] = [.flipHorizontal, .coverVertical, .crossDissolve]
        vc.modalTransitionStyle = transitions.randomElement() ?? .coverVertical
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true, completion: nil)
    }
}

#Preview {
    TabBarController()
}
