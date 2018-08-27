
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    @IBOutlet weak var alaramButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var weatherView: UIView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    var tableData: [Model] = []
    var dayWeatherData: DayWeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Data.getDayAndWeather { (data: DayWeatherModel?) in
            if let data = data{
                self.dayLabel.text = data.dayName
                self.dateLabel.text = data.longDate
                self.weatherImageView.image = data.weatherIcon
                self.temperatureLabel.text = data.temperature
                self.cityLabel.text = data.city
            }
        }
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
            self.animateTableViewCells()
        }
        
        closeMenu()
        setupAnimationOnViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            //here setupAnimationOnViews() is called first. So after its completion we want to transform to its original position ie destination position
            
            self.dateView.transform = .identity
            self.weatherView.transform = .identity
            
        }) { (success) in
            // after completion of above code it checks for success and come to the loop
        }
    }


    @IBAction func menuButtonTapped(_ sender: FloatingActionButton) {
        
        UIView.animate(withDuration: 0.3) {
            //identity means it removes all transforms to it
            if self.menuView.transform == .identity {
                
                // menu is open, so close it
                self.closeMenu()
            }
            else{
                //menu is closed , so open it
                //identity means it removes all transforms to it
                self.menuView.transform = .identity
                
            }
        }
        
        //spring animate method
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity{
                self.alaramButton.transform = .identity
                self.chatButton.transform = .identity
                self.pencilButton.transform = .identity
            }
        })
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        alaramButton.transform = CGAffineTransform(translationX: 0, y: 15)
        chatButton.transform = CGAffineTransform(translationX: 10, y: 15)
        pencilButton.transform = CGAffineTransform(translationX: 15, y: 0)
    }
    
    func setupAnimationOnViews() {
        dateView.transform = CGAffineTransform(translationX: -dateView.frame.width, y: 0)
        weatherView.transform = CGAffineTransform(translationX: weatherView.frame.width, y: 0)
    }
    
    func animateTableViewCells() {
        let cells = tableView.visibleCells
        
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        }
        
        
        var delay = 0.5
        for cell in cells{
            UIView.animate(withDuration: 0.2, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            })
            delay += 0.15
        }
        
        
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableData[indexPath.row]
        var cell: TableViewCell!
        
        if row.image.count > 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellWithImages") as! TableViewCell
        }
        else
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
            
        }
        cell.setup(model: tableData[indexPath.row])
        return cell
   
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //adjust the height of the prototype cell. 
        let row = tableData[indexPath.row]
            if row.image.count > 0
            {
                return 100
            }
        return 70
    }

}











