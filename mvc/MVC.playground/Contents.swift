/**
 * MVC iOS Design Pattern
 *
 */

import UIKit
import PlaygroundSupport

struct Person { // Model
    let firstName: String
    let lastName: String
}


class GreetingView: UIView { //View
    
    var tapAction: (()->Void)?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let greetingLabel: UILabel = {
        let label =  UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    let showGreetingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me", for: .normal)
        button.setTitle("You badass", for: .highlighted)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.red, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        addSubview(greetingLabel)
        greetingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        greetingLabel.backgroundColor = UIColor.black
        greetingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        greetingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(showGreetingButton)
        showGreetingButton.backgroundColor = UIColor.red

        showGreetingButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 8).isActive = true
        showGreetingButton.leadingAnchor.constraint(equalTo:
            greetingLabel.leadingAnchor, constant: 0).isActive = true
        showGreetingButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        showGreetingButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showGreetingButton.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
    }
    
    @objc func tap(){
        tapAction?()
    }
    
    
}

class GreetingViewController : UIViewController {   // Controller
    var person: Person!
    var greetingView: GreetingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        greetingView = GreetingView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        self.view.addSubview(greetingView)
        
        greetingView.tapAction = {
            [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.greetingView.greetingLabel.text = "Hello " + strongSelf.person.firstName + " " + strongSelf.person.lastName
        }
    }
    
}

let model = Person(firstName: "Wasin", lastName: "Thonkaew")
let vc = GreetingViewController()
vc.person = model

PlaygroundPage.current.liveView = vc.view
