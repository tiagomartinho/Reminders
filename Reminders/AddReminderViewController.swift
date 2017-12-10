import UIKit

class AddReminderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    private func initView() {
        view.backgroundColor = .white
        title = "Add Reminder"
        navigationController?.navigationBar.prefersLargeTitles = true
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveReminder))
        navigationItem.setRightBarButtonItems([saveButton], animated: false)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.setLeftBarButtonItems([cancelButton], animated: false)
    }

    @objc func saveReminder() {

    }

    @objc func cancel() {

    }
}
