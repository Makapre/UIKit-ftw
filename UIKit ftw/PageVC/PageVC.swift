//
//  PageVC.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 15.08.24.
//

import UIKit

class PageVC: UIPageViewController {
    
    private var pageControl = UIPageControl()
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [FirstPageVC(),
                SecondPageVC(),
                ThirdPageVC()]
    }()
    
    private func configurePageControl() {
        // TODO: not nice, it ignores safearea
        let y = UIScreen.main.bounds.height - (self.tabBarController?.tabBar.frame.height ?? 0) - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
//        isDoubleSided = true // for fun
        
        configurePageControl()
    }
}

// MARK: UIPageViewControllerDataSource

extension PageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}

// MARK: UIPageViewControllerDelegate

extension PageVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let pageContentViewController = pageViewController.viewControllers?.first {
            self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController) ?? 0
        }
    }
}

#Preview {
    PageVC()
}
