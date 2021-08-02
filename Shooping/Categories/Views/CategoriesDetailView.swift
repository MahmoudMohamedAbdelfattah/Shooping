//
//  CategoriesDetailView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/06/2021.
//

import UIKit

class CategoriesDetailView: UIViewController, PertocolCategoriesDeatials ,  UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    var presenter : CategoryDeatialsPresent?

  convenience init (presenter: CategoryDeatialsPresent ) {
     self.init()
    self.presenter = presenter
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.returnNumberOfData() ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellDeatailCategories", for: indexPath) as! DeatailCategoriesCell
        guard let  data =  presenter?.TitleImage(index: indexPath.row) else { return cell }
            cell.AddInfoCell(NameModule: data)
        let Path = data.images?.first ?? ""
        if let url = URL(string: Path) {
            cell.IMGProductDeatial.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let width = DeatialCategories.frame.size.width
        let hight = DeatialCategories.frame.size.height
            return CGSize(width: width, height: hight)
    }
    
    @IBOutlet weak var DeatialCategories: UICollectionView!

    func reloadTableCategories() {
        self.DeatialCategories?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollecition ()
        presenter?.delegat = self        
    }

    private func SetupCollecition () {
        DeatialCategories.delegate = self
        DeatialCategories.dataSource = self
        DeatialCategories?.register(UINib(nibName: "DeatailCategoriesCell", bundle: nil), forCellWithReuseIdentifier: "cellDeatailCategories")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func startSpinner() {
       let vc = storyboard?.instantiateViewController(withIdentifier: "spinner") as! ViewControllerSpinner
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func endSpinner() {
        dismiss(animated: true, completion: nil)
    }

}
