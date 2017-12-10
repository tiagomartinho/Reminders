import UIKit
import RemindersCore

class AddReminderViewController: UIViewController {

    private var router: Router!
    private var repository: RemindersRepository!
    private var presenter: AddReminderPresenter!

    private var titleTextField: UITextField!

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
        addTitleTextField()
    }

    private func setRightBarButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveReminder))
        navigationItem.setRightBarButtonItems([saveButton], animated: false)
    }

    private func setLeftBarButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.setLeftBarButtonItems([cancelButton], animated: false)
    }

    private func addTitleTextField() {
        titleTextField = UITextField()
        titleTextField.placeholder = "Title"
        view.addSubview(titleTextField)
        let margins = view.layoutMarginsGuide
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        let topAnchor = view.safeAreaLayoutGuide.topAnchor
        titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }

    private func initCollaborators() {
        router = AppRouter(controller: self)
        repository = InMemoryRemindersRepository()
        presenter = AddReminderPresenter(router: router, repository: repository)
    }

    @objc func saveReminder() {
        let title = titleTextField.text ?? ""
        let reminder = Reminder(title: title)
        presenter.save(reminder)
    }

    @objc func cancel() {
        presenter.cancel()
    }
}
