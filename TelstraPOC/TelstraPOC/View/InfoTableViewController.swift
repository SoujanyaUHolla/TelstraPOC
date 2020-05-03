

import UIKit


class InfoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   
    var info:[InfoModel]?
    let infoTableView = UITableView()
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        if #available(iOS 13.0, *) {
            activityIndicator.style = .medium
        } else {
            activityIndicator.style = .gray
        }
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableSetUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInfoFromURL()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(pullToRefreshContents), for: .valueChanged)
        infoTableView.refreshControl = refresh
    }
    
    @objc func pullToRefreshContents(refresh: UIRefreshControl) {
           getInfoFromURL()
           refresh.endRefreshing()
       }
    
    
    func tableSetUp(){
            let leftBarButton = UIBarButtonItem(customView: activityIndicator)
                   navigationItem.setLeftBarButton(leftBarButton, animated: true)
        
            view.addSubview(infoTableView)
            infoTableView.translatesAutoresizingMaskIntoConstraints = false

            infoTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
            infoTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
            infoTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
            infoTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        
            infoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "infoCell")
            infoTableView.rowHeight = UITableView.automaticDimension
            infoTableView.estimatedRowHeight = 400
    
            infoTableView.dataSource = self
            infoTableView.delegate = self
            
    }

    
    
    //MARK: - TableView Deleagte Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        if let currentLastItem = info?[indexPath.row]
        {
            cell.loadCellContents(news:currentLastItem)
        }
            else{
            return cell
        }
        return cell
    }
    
 
    func getInfoFromURL(){
        activityIndicator.startAnimating()
        Networking.sharedInstance.getInfo{[weak self](MainInfo,Error) in
            DispatchQueue.main.async {
            if let infoResults = MainInfo{
                self?.info = (infoResults.rows).filter{$0.title != nil}
                       self?.navigationItem.title = infoResults.title
                       self?.activityIndicator.stopAnimating()
                       self?.infoTableView.reloadData()
            
                
            }
            else if let error = Error{
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Error", message:
               "Ops..Network Connection is lost!\nPlease try again", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
            
                self?.present(alertController, animated: true, completion: nil)
                
            }
                
            }
        }
        
    }

}
