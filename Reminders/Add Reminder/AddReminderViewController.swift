import UIKit
import RemindersCore

class AddReminderViewController: UIViewController {

    private var router: Router!
    private var repository: RemindersRepository!
    private var presenter: AddReminderPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initCollaborators()
    }

    private func initView() {
        view.backgroundColor = .white
        title = "Add Reminder"
        navigationController?.navigationBar.prefersLargeTitles = true
        setRightBarButton()
        setLeftBarButton()
    }

    private func setRightBarButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveReminder))
        navigationItem.setRightBarButtonItems([saveButton], animated: false)
    }

    private func setLeftBarButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.setLeftBarButtonItems([cancelButton], animated: false)
    }

    private func initCollaborators() {
        router = AppRouter(controller: self)
        repository = InMemoryRemindersRepository()
        presenter = AddReminderPresenter(router: router, repository: repository)
    }

    @objc func saveReminder() {
        presenter.save(Reminder(title: ""))
    }

    @objc func cancel() {
        presenter.cancel()
    }
}
