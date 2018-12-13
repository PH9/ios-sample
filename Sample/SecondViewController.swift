import UIKit

class SecondViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hidesBottomBarWhenPushed = false
    }

    @IBAction func showOrder(_ sender: Any) {
        hidesBottomBarWhenPushed = true
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        let finishButton = UIButton(frame: vc.view.frame)
        finishButton.setTitle("CLICK HERE", for: .normal)
        finishButton.addTarget(self, action: #selector(backToHome(_:)), for: .touchUpInside)

        finishButton.center = vc.view.center
        vc.view.addSubview(finishButton)
        show(vc, sender: self)
    }

    @objc private func backToHome(_ sender: Any) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        guard let rootVC = window.rootViewController else {
            return
        }

        guard let firstVC = rootVC.children.first else {
            return
        }

        let newVC = UIViewController()
        newVC.view.backgroundColor = .blue
        newVC.hidesBottomBarWhenPushed = true
        firstVC.show(newVC, sender: self)

        let options = UIWindow.TransitionOptions(direction: .toRight, style: .easeOut)
        window.setRootViewController(rootVC, options: options)

        // Return second tab stack!
        navigationController?.popToRootViewController(animated: false)

        // Move to first tab
        (rootVC as? UITabBarController)?.selectedIndex = 0
    }
}



