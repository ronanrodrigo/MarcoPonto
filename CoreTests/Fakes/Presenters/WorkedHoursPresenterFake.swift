import Foundation

class WorkedHoursPresenterFake: WorkedHoursPresenter {
    var workHours: [WorkHour] = []

    func showTotal(workHours: [WorkHour]) {
        self.workHours = workHours
    }
}
