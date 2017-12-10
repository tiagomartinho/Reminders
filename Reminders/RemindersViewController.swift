import UIKit
import RemindersCore

class RemindersViewController: UIViewController {

    private var presenter: RemindersPresenter!
    private var router: Router!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initCollaborators()
        presenter.loadReminders()
    }

    private func initView() {
        title = "Reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
        let addReminderButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addReminder))
        navigationItem.setRightBarButtonItems([addReminderButton], animated: false)
    }

    private func initCollaborators() {
        router = AppRouter()
        presenter = RemindersPresenter(view: self, router: router)
    }

    @objc private func addReminder() {
        presenter.addNewReminder()
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
