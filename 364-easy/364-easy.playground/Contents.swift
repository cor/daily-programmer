//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let margins = view.safeAreaLayoutGuide
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 200, width: 200, height: 20)
        label.text = "Vrienden"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        
        view.addSubview(label)

        label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8).isActive = true

        self.view = view
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let cv = circleView(location: touch.location(in: self.view), radius: 25)
            view.addSubview(cv)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            print(touch.force)
            let cv = circleView(location: touch.location(in: self.view), radius: 25)
            view.addSubview(cv)
        }
    }
    
    private func circleView(location: CGPoint, radius r: CGFloat) -> UIView {
        let backgroundColors = [#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]
        let view = UIView(frame: CGRect(x: location.x - r, y: location.y - r, width: r*2, height: r*2))
        view.backgroundColor = backgroundColors.randomElement()
        view.layer.cornerRadius = r
        return view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
