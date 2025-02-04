//
//  HeaderTVC.swift
//  AppleWeather
//
//  Created by 김혜수 on 2021/07/29.
//

import UIKit

class HeaderTVC: UITableViewCell {
    
    var dayWeatherList : [DaysModel] = []

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var width: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        print(UIScreen.main.bounds.width)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .none
        
        // Initialization code
       // width.constant = UIScreen.main.bounds.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerXib(){
        let nib = UINib(nibName: HeaderCVC.identifier, bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: HeaderCVC.identifier)
    }
    
    public func maskCell(fromTop margin: CGFloat) {
            layer.mask = visibilityMask(withLocation: margin / frame.size.height)
            layer.masksToBounds = true
        }

    private func visibilityMask(withLocation location: CGFloat) -> CAGradientLayer {
            let mask = CAGradientLayer()
            mask.frame = bounds
            mask.colors = [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.cgColor]
            let num = location as NSNumber
            mask.locations = [num, num]
            return mask
    }
    
    func setData(list : [DaysModel]){
        dayWeatherList = list
    }
    
}

extension HeaderTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: HeaderCVC.identifier, for: indexPath) as? HeaderCVC else {
            return UICollectionViewCell()
        }
        cell.setData(time: dayWeatherList[indexPath.row].hour,
                     icon: dayWeatherList[indexPath.row].weather,
                     temperature: dayWeatherList[indexPath.row].temperature)
        return cell
    }
    
    
}

extension HeaderTVC: UICollectionViewDelegate {
    
}

extension HeaderTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
