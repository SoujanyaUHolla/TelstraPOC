

import UIKit


class InfoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   
    var info:[InfoModel]?
    let infoTableView = UITableView()
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableSetUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tableSetUp(){
        
            view.addSubview(infoTableView)
            infoTableView.translatesAutoresizingMaskIntoConstraints = false

            infoTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
            infoTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
            infoTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
            infoTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        
            infoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "infoCell")
            infoTableView.rowHeight = UITableView.automaticDimension
            infoTableView.estimatedRowHeight = 300
    
            infoTableView.dataSource = self
            infoTableView.delegate = self
            
    }

    
    
    //MARK: - TableView Deleagte Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        return cell
    }
 


}
