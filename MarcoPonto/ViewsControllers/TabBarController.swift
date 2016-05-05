import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.primary
    }

    override func viewWillAppear(animated: Bool) {
        let punchsNavigationController = PunchsNavigationController()
        let punchsNavigationControllerTabBarItem = UITabBarItem(
            title: "Pontos",
            image: UIImage.accessTime,
            selectedImage: nil)
        punchsNavigationController.tabBarItem = punchsNavigationControllerTabBarItem

        let reportsNavigationController = ReportsNavigationController()
        let reportsNavigationControllerTabBarItem = UITabBarItem(
            title: "Relatório",
            image: UIImage.dateRange,
            selectedImage: nil)
        reportsNavigationController.tabBarItem = reportsNavigationControllerTabBarItem

        self.viewControllers = [punchsNavigationController, reportsNavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
