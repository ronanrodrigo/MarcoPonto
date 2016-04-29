import Foundation

class WorkedHoursPresenterFake: WorkedHoursPresenter {
    var workHours: [WorkHour] = []

    func showTotal(workHour: WorkHour) {
        workHours.append(workHour)
    }
}
