import RemindersCore
import UIKit

class RemindersViewController: UIViewController {
    var presenter: RemindersPresenter!

    private var reminders: [Reminder]!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    private func initView() {
        title = "Reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
        setRightBarButton()
    }

    private func setRightBarButton() {
        let addReminderButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addReminder))
        navigationItem.setRightBarButtonItems([addReminderButton], animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadReminders()
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

    func showReminders(reminders: [Reminder]) {
        self.reminders = reminders
        let tableView = UITableView()
        tableView.accessibilityLabel = "Reminders"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.allowsSelection = false
        view = tableView
    }
}

extension RemindersViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell(tableView: tableView, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = reminders[indexPath.row].title
        return cell
    }

    private func tableViewCell(tableView: UITableView, reuseIdentifier: String) -> UITableViewCell {
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            return dequeuedCell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
    }
}
