//
//  PrViewController.swift
//  demo123
//
//  Created by Альберт Садыков on 03.02.2021.
//

import UIKit

class PrViewController: UIViewController {
    
    var p: Priniky!
    var viewMas:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.spacing = 10
        
        var newView : UIView!
        for view in viewMas{
            
            switch view{
            case "hz":
                print("hz")
                newView = setupViewHZ()
            
            case "picture":
                print("picture")
                newView = setupViewPicture()
            
            
            case "selector":
                print("selector")
                newView = setupViewSelector()
            
            
            default:
                break
            }
            
            
            stackView.addArrangedSubview(newView)
        }
        
    }
    
    func setupViewHZ() -> UIView{
        let view = UIView(frame: CGRect(x: 10, y: 50, width: 300, height: 200))
        
        let label: UILabel = {
            let text = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 100))
            
            text.text = p.data[0].data.text
            return text
        }()
        view.addSubview(label)
        return view
    }
    func setupViewPicture() -> UIView{
        let view = UIView(frame: CGRect(x: 10, y: 30, width: 300, height: 200))
      
        let imageView : UIImageView = {
            let iV = UIImageView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
            
            let urll = URL(string: p.data[1].data.url!)
            
            DispatchQueue.global(qos: .utility).async {
                guard let url = urll, let imageData = try? Data(contentsOf: url) else {return}
                DispatchQueue.main.async {
                    iV.image = UIImage(data: imageData)
                }
            }
            return iV
        }()
        
        let label: UILabel = {
            let text = UILabel(frame: CGRect(x: 10, y: 20, width: 300, height: 100))
            
            text.text = p.data[1].data.text
            return text
        }()
        view.addSubview(imageView)
        view.addSubview(label)
        return view
    }
    func setupViewSelector() -> UIView{
        let view = UIView(frame: CGRect(x: 10, y: 40, width: 300, height: 200))
        
        let segmentedControll: UISegmentedControl = {
            
            let mySegmentedControll = UISegmentedControl(frame: CGRect(x: 10, y: 150, width: 300, height: 30))
            let masVariants = p.data[2].data.variants!
            for variant in masVariants{
                let title = variant.text
                let last = mySegmentedControll.numberOfSegments
                mySegmentedControll.insertSegment(withTitle: title, at: last, animated: true)
                
            }
            mySegmentedControll.selectedSegmentIndex = p.data[2].data.selectedID! - 1
            
            return mySegmentedControll
        }()
        view.addSubview(segmentedControll)
        return view
    }
    
}
