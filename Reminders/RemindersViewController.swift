import UIKit
import RemindersCore

class RemindersViewController: UIViewController {

    private var presenter: RemindersPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        presenter = RemindersPresenter(view: self)
        presenter.loadReminders()
    }

    private func initView() {
        title = "Reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
        let addReminderButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addReminder))
        navigationItem.setRightBarButtonItems([addReminderButton], animated: false)
    }

    @objc private func addReminder() {

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
