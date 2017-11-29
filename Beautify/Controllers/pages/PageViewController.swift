//
//  PageViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 19.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit
//TODO: Debug changing slides
class PageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var pageControl = UIPageControl()
    var index = 0
    var tTime: Timer!

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newNumberedViewController(number: "First"),
                self.newNumberedViewController(number: "Second"),
                self.newNumberedViewController(number: "Third")]
    }()
    
    private func newNumberedViewController(number: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(number)PageController")
    }
    
    @objc func changeSlide() {
        if index + 1 < self.orderedViewControllers.count {
            setViewControllers([orderedViewControllers[index + 1]], direction: .forward, animated: true, completion: nil)
        }
        else {
            let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationPhotoViewController") as! UINavigationController
            self.present(newViewController, animated: true, completion: nil)
        }
        index = index + 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dataSource = (self as! UIPageViewControllerDataSource)
//        if let firstViewController = orderedViewControllers.first {
//            setViewControllers([firstViewController],
//                               direction: .forward,
//                               animated: true,
//                               completion: nil)
//            
//        }
//        self.delegate = self as! UIPageViewControllerDelegate
//        configurePageControl()
        setViewControllers([orderedViewControllers[0]], direction: .forward, animated: true, completion: nil)
        tTime = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.changeSlide), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//extension PageViewController: UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
//            return nil
//        }
//
//        let previousIndex = viewControllerIndex - 1
//        guard previousIndex >= 0 else {
//            return nil
//        }
//        guard orderedViewControllers.count > previousIndex else {
//            return nil
//        }
//        return orderedViewControllers[previousIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//            guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
//                return nil
//            }
//            let nextIndex = viewControllerIndex + 1
//            let orderedViewControllersCount = orderedViewControllers.count
//            guard orderedViewControllersCount != nextIndex else {
//                return nil
//            }
//            guard orderedViewControllersCount > nextIndex else {
//                return nil
//            }
//            return orderedViewControllers[nextIndex]
//    }
//
//    func configurePageControl() {
//        // The total number of pages that are available is based on how many available colors we have.
//        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
//        self.pageControl.numberOfPages = orderedViewControllers.count
//        self.pageControl.currentPage = 0
//        self.pageControl.tintColor = UIColor.darkGray
//        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
//        self.pageControl.currentPageIndicatorTintColor = UIColor.darkGray
//        self.view.addSubview(pageControl)
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        let pageContentViewController = pageViewController.viewControllers![0]
//        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
//    }
//}


