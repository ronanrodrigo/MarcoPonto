import UIKit

class TabBarController: UITabBarController {
    var marcoPontoViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.primary
    }

    override func viewWillAppear(animated: Bool) {
        loadPunchs()
        loadReports()
        loadSettings()
        loadViewControllers()
    }

    private func loadPunchs() {
        let punchsNavigationController = PunchsNavigationController()
        let punchsNavigationControllerTabBarItem = UITabBarItem(
            title: "Pontos",
            image: UIImage.accessTime,
            selectedImage: nil)
        punchsNavigationController.tabBarItem = punchsNavigationControllerTabBarItem
        marcoPontoViewControllers.append(punchsNavigationController)
    }

    private func loadReports() {
        let reportsNavigationController = ReportsNavigationController()
        let reportsNavigationControllerTabBarItem = UITabBarItem(
            title: "Relatório",
            image: UIImage.dateRange,
            selectedImage: nil)
        reportsNavigationController.tabBarItem = reportsNavigationControllerTabBarItem
        marcoPontoViewControllers.append(reportsNavigationController)
    }

    private func loadSettings() {
        let settingsNavigationController = SettingsNavigationController()
        let settingsNavigationControllerTabBarItem = UITabBarItem(
            title: "Configurações",
            image: UIImage.settings,
            selectedImage: nil)
        settingsNavigationController.tabBarItem = settingsNavigationControllerTabBarItem
        marcoPontoViewControllers.append(settingsNavigationController)
    }

    private func loadViewControllers() {
        viewControllers = marcoPontoViewControllers
    }
}
