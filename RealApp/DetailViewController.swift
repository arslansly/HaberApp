//
//  DetailViewController.swift
//  RealApp
//
//  Created by Süleyman Arslan on 5.12.2022.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
   
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detailtitle: UILabel!
    
    @IBOutlet weak var uyudunmu: UITextView!
    var photo = Photo([:])
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailtitle.text = photo.title
        if let url = URL(string: photo.thumbnailUrl){
            image.load(url: url)
        }
        loadLogo()
        uyudunmu.text = photo.description
        //getComments()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        
        let row = comments[indexPath.row]
        cell.yorum.text = row.description
        
        return cell
        
    }
    
    func loadLogo() {
        if let logo = UIImage(named: "1"){
            let newLogo = Util.app.resizeImageWithAspect(image: logo, scaledToMaxWidth: 300, maxHeight: 50)
            let imageView = UIImageView(image: newLogo)
            self.navigationItem.titleView = imageView
        }
    }

    func getComments(){
        
        comments = []
        
        let url = URL(string: "https://kararsizkaldim.com/suleyman.php")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("error: \(error)")
            }else {
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                        
                        //print(json)
                        
                        for dic in json {
                            
                            self.comments.append(Comment(dic))
                           print(Photo(dic))
                        }
                        
    
                        DispatchQueue.main.async {
                         //   self.tableView.reloadData()
                        }
                        
                    }
                }
                catch let error as NSError {
                    print("error: \(error.localizedDescription)")
                }
            }
            
            
        }
        task.resume()
        
    }

}
