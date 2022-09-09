//
//  ViewController.swift
//  URLSession
//
//  Created by Kim Nghĩa on 08/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        getJSon {
//            self.tableView.reloadData()
//            print("success")
//        }
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let newlist = newlists[indexPath.row]
        cell.textLabel?.text = "\(newlist.id)"
        cell.detailTextLabel?.text = newlist.title.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroViewController {
            destination.newlist = newlists[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    @IBAction func GET(_ sender: Any) {
        getJSon {
            self.tableView.reloadData()
            print("get JSon success")
        }
    }
    
    @IBAction func POST(_ sender: Any) {
        postJSon {
            self.tableView.reloadData()
            print("post JSon success")
        }
        
    }
    
}

