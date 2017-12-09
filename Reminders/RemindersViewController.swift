import UIKit

class RemindersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView() {
        let label = UILabel()
        label.text = "You have no reminders"
        label.textAlignment = .center
        label.backgroundColor = .white
        view = label
    }
}
