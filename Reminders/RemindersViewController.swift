import UIKit
import RemindersCore

class RemindersViewController: UIViewController {

    private var presenter: RemindersPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RemindersPresenter(view: self)
        presenter.loadReminders()
    }
}

extension RemindersViewController: RemindersView {
    func showNoReminders() {
        let label = UILabel()
        label.text = "You have no reminders"
        label.textAlignment = .center
        label.backgroundColor = .white
        view = label
    }
}
