//
//  WeatherTableViewController.swift
//  WeatherDemo
//
//  Created by 沈韶泓 on 2016/11/26.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    var sectionTitles = [
        "",
        NSLocalizedString("One Week Weather Forecast", comment: "Week cell title"),
        NSLocalizedString("Weather Brief Report", comment: "Brief report cell title"),
        NSLocalizedString("Other Information", comment: "Attach cell title")
    ]
    
    var results: [Result] = []
    var resultToday: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let nibHeader = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(nibHeader, forCellReuseIdentifier: "HeaderCell")
        
        let nibWeek = UINib(nibName: "WeekTableViewCell", bundle: nil)
        tableView.register(nibWeek, forCellReuseIdentifier: "WeekCell")
        
        let nibBrief = UINib(nibName: "BriefTableViewCell", bundle: nil)
        tableView.register(nibBrief, forCellReuseIdentifier: "BriefCell")
        
        let nibAttach = UINib(nibName: "AttachTableViewCell", bundle: nil)
        tableView.register(nibAttach, forCellReuseIdentifier: "AttachCell")
        
        // Weather conditions in Chengdu
        let weeklyWeatherCD = NetworkHelper.weeklyWeather(weaid: "265")
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        print("isNetworkActivity")
        
        weeklyWeatherCD.getWeather { (results, error) in
            if let results = results {
                self.results = results
                self.resultToday.append(results.first!)
                
                OperationQueue.main.addOperation({ 
                    self.tableView.reloadData()
                })
            } else {
                OperationQueue.main.addOperation({ 
                    let alertViewController = UIAlertController(title: NSLocalizedString("Network error", comment: "Network error alert controller title"), message: error!, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Alert action title"), style: .default, handler: nil)
                    
                    alertViewController.addAction(alertAction)
                    
                    self.present(alertViewController, animated: true, completion: nil)
                })
            }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 1:
            return results.count
        default:
            return resultToday.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 3:
            return 88
        default:
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderTableViewCell
            
            cell.labelCity.text = resultToday[0].citynm
            cell.labelTemperature.text = resultToday[0].tempHigh + "°"
            cell.labelWeatherSituation.text = resultToday[0].weather
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeekCell", for: indexPath) as! WeekTableViewCell
            
            cell.labelWeek.text = results[indexPath.row].week
            if indexPath.row == 0 {
                cell.labelToday.text = NSLocalizedString("Today", comment: "Today label title")
            } else {
                cell.labelToday.text = " "
            }
            
            let data = try! Data(contentsOf: URL(string: results[indexPath.row].weatherIcon)!)
            cell.imageWeatherIcon.image = UIImage(data: data)
            
            cell.labelHighTemperature.text = results[indexPath.row].tempHigh
            cell.labelLowTemperature.text = results[indexPath.row].tempLow
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BriefCell", for: indexPath) as! BriefTableViewCell
            cell.labelBriefReport.text = results[indexPath.row].weather + "\n" + NSLocalizedString("Highest temperature", comment: "Highest temperature") + resultToday[0].tempHigh + "\n" + NSLocalizedString("Lowest temperature", comment: "Lowest temperature") + resultToday[0].tempLow
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AttachCell", for: indexPath) as! AttachTableViewCell
            
            cell.labelHumidity.text = resultToday[0].humidity
            cell.labelWind.text = resultToday[0].wind
            
            return cell
        default:
            return UITableViewCell(frame: CGRect.zero)
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
