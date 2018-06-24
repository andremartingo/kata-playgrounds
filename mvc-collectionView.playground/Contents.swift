import UIKit
import PlaygroundSupport


class MainView: UIView,UICollectionViewDelegateFlowLayout{ //View
    var estimateWidth = 160.0
    var cellMarginSize = 10.0
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        setupGridView()
        setupConstraints()
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let greetingLabel: UILabel = {
        let label =  UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    func setupViews() {
        addSubview(greetingLabel)
        addSubview(appsCollectionView)
    }
    
    func setupConstraints(){
        greetingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        greetingLabel.backgroundColor = UIColor.black
        greetingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        greetingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //CollectionView Constraints
        appsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        appsCollectionView.delegate = MainViewController()
        appsCollectionView.dataSource = MainViewController()
        
        appsCollectionView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 8).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
    func setupGridView() {
        let flow = appsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width*1.3)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.frame.size.width / estimatedWidth))
        print(self.frame.size.width)
        //Righ And Left Margin
        let margin = CGFloat(cellMarginSize * 2)
        //Margin Beetween Cells
        let marginBetweenCells = CGFloat(cellMarginSize) * (cellCount - 1)
        let width = (self.frame.size.width - marginBetweenCells - margin) / cellCount
        return width
    }
}

class MainViewController : UIViewController {   // Controller
    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        mainView = MainView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        self.view.addSubview(mainView)
    }
    
}

extension MainViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
}

let vc = MainViewController()
PlaygroundPage.current.liveView = vc.view

