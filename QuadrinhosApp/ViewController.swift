//
//  ViewController.swift
//  QuadrinhosApp
//
//  Created by Gabriela Lima de Araujo on 12/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var session: URLSession?
    var converter: QuadrinhosConverter = QuadrinhosConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        
        let config = URLSessionConfiguration.default
        
        session = URLSession(configuration: config)
        
        let url = URL(string: "https://xkcd.com/info.0.json")
        
        let task = session?.dataTask(with: url!, completionHandler: { data, response, error in
            
            let text = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Response: \(text)")
            self.populateFields(data: data)
        })
        
        task?.resume()
    }
    
    private func populateFields(data: Data?) {
        DispatchQueue.main.sync {
            self.txtTitle.text = self.converter.getTitle(data: data!) ?? ""
            self.txtId.text = self.converter.getNum(data: data!) ?? ""
            self.txtDate.text = self.converter.getDate(data: data!) ?? ""
            self.loadImage(urlImage: self.converter.getImage(data: data!) ?? "")
        }
    }
    
    private func loadImage(urlImage: String) {
        let myUrl = URL(string: urlImage)
        let url = URLRequest(url: myUrl!)
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            if let imageData = data {
                DispatchQueue.main.sync {
                    self.myImage.image = UIImage(data: imageData)
                }
            }
            
        }
        task.resume()
    }
    
}

