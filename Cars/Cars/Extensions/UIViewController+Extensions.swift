import UIKit

extension UIViewController {
    func showLoading() {
        let viewController = LoadingViewController()
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: false)
    }

    func hideLoading() {
        guard let viewController = presentedViewController as? LoadingViewController else {
            return
        }

        viewController.dismiss(animated: false)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
