//
//  ViewController.swift
//  JsonParseUsingSwiftyJSONDemo
//
//  Created by Asmita Borawake on 20/12/21.
//

import UIKit
import SwiftUI
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [JsonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        jsonParsing()
    }

    
    func jsonParsing() {
        
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            do{
                let json = try JSON(data : data)
               // print(json)
                let results = json["results"]
                print(results)
                
                for item in results.arrayValue{
                   // print(item["trackPrice"])
                   // print(item["artworkUrl100"])
                    self.arrData.append(JsonModel(json: item))
                    
                    
                }
                //print(self.arrData)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()

    }
}


extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.artistName.text = arrData[indexPath.item].artistName
        cell.trackCenseredName.text = arrData[indexPath.item].trackCensoredName
        cell.artWorkImage.kf.setImage(with: URL(string: arrData[indexPath.row].artworkUrl100))
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
