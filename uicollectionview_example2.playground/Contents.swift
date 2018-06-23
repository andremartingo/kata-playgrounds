import UIKit
import PlaygroundSupport



class CategoryCell: UICollectionViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    private let appCellId = "appCellId"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Collection View Inside CategoryCell
    let appsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //Collection View Inside Margin
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor = UIColor.red
        
        addSubview(appsCollectionView)
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellId)
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        //Good -> CollectionView and AppCellContentViewMargin
        NSLayoutConstraint.activate([
            appsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
            ])
        
        //Bad
//        NSLayoutConstraint.activate([
//            appsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
//            appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
//            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appCellId, for: indexPath) as! AppCell
        return cell
    }
    
    //AppCell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    //Collection View Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

class AppCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label =  UILabel()
        label.text = "Disney Build It: Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(logoImageView)
        addSubview(nameLabel)
        logoImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
    }
    
}

class CollectionViewController : UICollectionViewController,UICollectionViewDelegateFlowLayout  {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    collectionView?.backgroundColor = UIColor.white
    collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
    return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 230)
    }
}

PlaygroundPage.current.liveView = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
