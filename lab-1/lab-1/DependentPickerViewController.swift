//
//  DependentPickerViewController.swift
//  lab-1
//
//  Created by Jess Ryan on 1/31/22.
//

import UIKit

class DependentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var artistPicker: UIPickerView!
    @IBOutlet weak var artistLabel: UILabel!
    
    var musicData = DataLoader()
    var artists = [String]()
    var albums = [String]()
    
    let artistComponent = 0
    let albumComponent = 1
    let fileName = "dependent-picker-data"
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == artistComponent{
            return artists.count
        } else {
            return albums.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == artistComponent {
            return artists[row]
        } else {
            return albums[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == artistComponent{
            albums = musicData.getAlbums(index: row)
            artistPicker.reloadComponent(albumComponent)
            artistPicker.selectRow(0, inComponent: albumComponent, animated: true)
            
        }
        let artistrow = pickerView.selectedRow(inComponent: artistComponent)
        let albumrow = pickerView.selectedRow(inComponent: albumComponent)
        
        artistLabel.text = "\(albums[albumrow]) are \(artists[artistrow])"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        musicData.loadData(fileName: fileName)
        artists = musicData.getArtists()
        albums = musicData.getAlbums(index: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
