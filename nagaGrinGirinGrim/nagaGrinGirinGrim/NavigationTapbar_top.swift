import UIKit

class TopNavigationTapbar: UIViewController {
    
    // Create left UIBarButtonItem.
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed(_:)))
        button.tag = 1
        
        return button
    }()
    
    // Create right UIBarButtonItem.
    lazy var rightButton: UIBarButtonItem = {
        let rightButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(buttonPressed(_:)))
        rightButton.tag = 2
        
        return rightButton
    }()
    
    // Create back button.
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: self.view.frame.size.height/2, width: self.view.frame.size.width, height: 100))
        button.setTitle("back", for: .normal)
        button.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Set the background color to Green.
        self.view.backgroundColor = .green
        
        // Set the title of NavigationController.
        self.title = "navigationVC"
        
        // Set it to the left of the navigation bar.
        self.navigationItem.leftBarButtonItem = self.leftButton
        
        // Set it to the right of the navigation bar.
        self.navigationItem.rightBarButtonItem = self.rightButton
        
        // Add back button on view
        self.view.addSubview(self.backButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event.
    @objc private func buttonPressed(_ sender: Any) {
        if let button = sender as? UIBarButtonItem {
            switch button.tag {
            case 1:
                // Change the background color to blue.
                self.view.backgroundColor = .blue
            case 2:
                // Change the background color to red.
                self.view.backgroundColor = .red
            default:
                print("error")
            }
        }
    }
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
