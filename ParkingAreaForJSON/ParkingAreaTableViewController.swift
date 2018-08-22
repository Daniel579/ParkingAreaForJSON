//
//  ParkingAreaTableViewController.swift
//  ParkingAreaForJSON
//
//  Created by HsiaoHsien Huang on 2018/8/15.
//  Copyright © 2018年 HsiaoHsien Huang. All rights reserved.
//

import UIKit

class ParkingAreaTableViewController: UITableViewController {
    
    var ParkingArea = [Parkings]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        if let urlStr = "https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=f4cc0b12-86ac-40f9-8745-885bddc18f79&rid=0daad6e6-0632-44f5-bd25-5e1de1e9146f".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            print("url")
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                print("Decoder")
                if let data = data, let JSONdb = try? decoder.decode(JSONDB.self, from: data) {
                    print("JSONDB OK")
                    self.ParkingArea = JSONdb.parkingLots
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRowsInSection")
        return ParkingArea.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt indexPath set cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParkingAreaCell", for: indexPath) as! ParkingAreaTableViewCell
        
        print("cellForRowAt indexPath set areaName")
        let ParkingAreas = ParkingArea[indexPath.row]
        cell.areaName.text = "地區： " + ParkingAreas.areaName
        cell.parkName.text = "停車場名稱： " + ParkingAreas.parkName
        cell.totalSpace.text = "停車格數量： " + String(ParkingAreas.totalSpace)

        return cell
    }
    
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPatch: IndexPath) {
        let detail = ParkingArea[indexPath.row]
        if let parkingController = storyboard?.instantiateViewController(withIdentifier: detail)
    }
*/

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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let DetailController = segue.destination as? ParkingAreaDetailTableViewController, let row = tableView?.indexPathForSelectedRow!.row {
//            DetailController.
            DetailController.ParkingDetail = ParkingArea[row]            
        }
    }
 

}
