# 3주차 세미나 실습 파일



## UIPickerView

사용을 위해 채택 후 구현해야 하는 2가지의 프로토콜

[**UIPickerViewDelegate**](https://developer.apple.com/documentation/uikit/uipickerviewdelegate)

[**UIPickerViewDataSource**](https://developer.apple.com/documentation/uikit/uipickerviewdatasource)

* delegate와 비슷한 역할
* delegate는 사용자 인터페이스 제어에 관련된 권한, datasource는 데이터를 제어하는 기능을 위임받음

1. 구조체 만들기 - Part.swift

   ```swift
   import UIKit
   struct Part {
       var imageName: String
       var partName: String
       
       func makeImage() -> UIImage? {
           return UIImage(named: imageName)
       }
   }
   ```

2. VC 파일에 배열 + 정보 생성 메소드 추가

   ```swift
   var parts: [Part] = [] //Part 정보를 저장할 배열을 멤버변수로 선언
   ...
   func setPartData(){} //Part 정보를 생성하는 메소드 선언, 해당 함수 viewDidLoad()에서 호출
   ```

3. 데이터 생성

   ```swift
   func setPartData() {
           parts.append(contentsOf: [
               Part(imageName: "plan", partName: "Plan"),
               ...
           ])
       }
   ```

4. 두 프로토콜(UIPickerViewDataSource, UIPickerViewDelegate)를 채택하여 사용하는 extension 작성

   ```swift
   extension PickerViewTestVC: UIPickerViewDataSource{
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return parts.count
       }
   }
   
   extension PickerViewTestVC: UIPickerViewDelegate {
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return parts[row].partName
       }
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           let selectPart = parts[row]
           self.partImageView.image = selectPart.makeImage()
           self.partNameLabel.text = selectPart.partName
       }
   }
   
   ```

5. 뷰 컨트롤러에 권한 위임 - viewDidLoad()

   ```swift
   partPickerView.dataSource = self
   partPickerView.delegate = self
   ```



## UITableView

> UIScrollView의 상속을 받은 객체, 데이터를 동적으로 받아서 표현할 수 있다

0. tableview VC에 outlet 연결

1. identifier static 선언 - MusicRankCell.swift

   ```swift
   static let identifier = "MusicRankCell"
   ```

   이후 cell에 Class 연결, identifier 지정 해 줌

   * identifier를 지정해야 하는 이유

     1000개의 Data가 있다고 생각하면 TableView는 1000개의 데이터를 먼저 생성하지 않음. 우선 화면에 보이는 것 먼저 생성

     즉, 예로 6개가 화면에 먼저 생성되고 스크롤을 하면 보이지 않는 영역은 Reuse Queue의 풀에 들어가고 

     새롭게 보이는 Cell에 해당 풀에서 꺼내 와서 새롭게 보여주게 됨

     즉 해당 Queue의 identifier가 되는 것이기 때문에 꼭 지정해주어야 함!

2. 모델 만들기 - Music.swift

   ```swift
   import UIKit
   
   struct Music{
       var title: String
       var singer: String
       var albumImageName: String
       
       func makeAlbumImage() -> UIImage?{
           return UIImage(named: albumImageName)
       }
   }
   ```

3. 데이터를 뿌려주는 함수 setCell() 만들기 - Cell.swift

   ```swift
   func setCell(rank: Int, music: Music){
       albumImageView.image = music.makeAlbumImage()
       rankLabel.text = "\(rank+1)"
       titleLabel.text = music.title
       singerLabel.text = music.singer
   }
   ```

4. VC 파일에 배열 + tableView에 들어갈 데이터 생성 메소드 추가

   ```swift
   var musicRank: [Music] = []
   ...
   func setMusicData(){
       musicRank.append(contentsOf: [
           Music(title: "Lovesick Girls", singer: "BLACK PINK", albumImageName: "blackpink"),
         	...
       ])
   }
   ```

   viewDidLoad() 에서 호출

5. 프로토콜(UITableViewDataSource)를 채택하여 사용하는 extension 작성

   ```swift
   extension TableViewTestVC: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return musicRank.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicRankCell.identifier) as? MusicRankCell else { // 해당 Queue 풀로부터 Cell을 재활용하여 사용하겠다는 의미.
             					 //as 연산자를 사용해 MusicRankCell로 타입을 캐스팅하고 사용한다는 의미.
               return UITableViewCell()
           }
           cell.setCell(rank: indexPath.row, music: musicRank[indexPath.row])
           return cell
       }
   }
   ```

   

6. 뷰 컨트롤러에 권한 위임 - viewDidLoad()

   ```swift
   musicRankTableView.dataSource = self
   musicRankTableView.delegate = self
   ```

### delegate 구현 - 셀 클릭 시 정보전달 + 화면 전환

1. newVC에 정보 받을 함수, 정보 뿌려줄 함수 만들기

```swift
var music: Music?
...
func setMusicInfo(){ //viewDidLoad()에서 호출
    if let music = music {
        titleLabel.text = music.title
        singerLabel.text = music.singer
        albumImageView.image = music.makeAlbumImage()
    }
}
```

2. newVC에 Navigator Controller Embed 하기

3. 프로토콜(UITableViewDelegate)를 채택하여 사용하는 extension 작성

   ```swift
   extension TableViewTestVC: UITableViewDelegate {
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedMusic = musicRank[indexPath.row]
           if let dvc = self.storyboard?.instantiateViewController(identifier: "MusicInfoVC") as? MusicInfoVC {
               dvc.music = selectedMusic
               self.navigationController?.pushViewController(dvc, animated: true)
           }
       }
   }
   ```

   > 난 musicRankTableView랑 MusicRankInfo VC를 같은 storyboard에 만들었지만, 다른 스토리보드에 만들었다면 아래와 같이 작성

   ```swift
   extension TableViewTestVC: UITableViewDelegate { 
     	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
         let selectMusic = musicRank[indexPath.row]
   			let storyboard = UIStoryboard(name: "MusicInfo", bundle: nil) //다른 스토리보드 참조하는 코드
     
   		if let dvc = storyboard.instantiateViewController(identifier: "MusicInfoVC") as? MusicInfoVC {
   			dvc.music = selectMusic
   			self.navigationController?.pushViewController(dvc, animated: true) 
       }	
   	} 
   }
   ```

   

## UICollectionView

> 그리드 형태 : 세로,가로 스크롤 가능
>
> 동적으로 데이터 받아서 표현 가능
>
> UIScrollView의 상속을 받은 객체

* `Estimate Size` - None으로 설정
  * Cell의 AutoLayout을 기반으로 셀의 사이즈가 조절되지 않고 개발자의 코드를 기반으로 레이아웃을 잡기 위해 None으로 지정
  * UICollectionViewDelegateFlowLayout을 채택하여 메소드를 구현하여 해당 Cell의 사이즈를 동적으로 조절해줄 수 있음

1. Cell.swift에 identifier static 변수 선언, imageView 설정 메소드 정의

   ```swift
       static let identifier = "PartBannerCell"
       
       @IBOutlet weak var partImageView: UIImageView!
       
       func setImage(imageName: String){
           partImageView.image = UIImage(named: imageName)
       }
   ```

2. VC.swift에 Collection View를 구성할 배열 선언

   ```swift
       var banners:[String] = ["plan", "design", "server", "ios", "android", "web"]
   ```

3. VC.swift에 pageControl 초기 레이아웃 설정 메소드 정의 후 viewDidLoad()에서 호출

   ```swift
       func pageControlInitLayout(){
           bannerPageControl.numberOfPages = banners.count
           bannerPageControl.currentPageIndicatorTintColor = .systemYellow
       }
   ```

4. 두 프로토콜(UICollectionViewDataSource, UICollectionViewDelegateFlowLayout)를 채택하여 사용하는 extension 작성

   ```swift
   //DataSource
   extension CollectionViewTestVC: UICollectionViewDataSource {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return banners.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartBannerCell", for: indexPath) as? PartBannerCell else {
               return UICollectionViewCell()
           }
           cell.setImage(imageName: banners[indexPath.item])
           return cell
       }
   }
   
   //DelegateFlowLayout : CollectionViewCell의 사이즈를 AutoLayout에 의존하지 않고 동적으로 구현하기 위해 사용
   //UICollectionViewDelegate를 상속받은 프로토콜이기 때문에 따로 delegate 프로토콜을 채택하지 않아도 delegate 메소드 사용이 가능
   extension CollectionViewTestVC: UICollectionViewDelegateFlowLayout { 
       //Cell의 넓이, 높이 지정
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }
       //Cell간 위아래 간격지정
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       //Cell간 좌우간격 지정 
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       //CollectionView ContentInset 지정
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       }
   }
   
   ```

5. UIScrollViewDelegate의 메소드 - 스크롤 한 후 움직임이 점차 줄어들 때 호출하는 함수 구현

   ```swift
   extension CollectionViewTestVC{
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           bannerPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
       }
   }//ScrollView의 ContentsOffset과 frame 상의 너비를 비교하여 현재 Page를 구할 수 있음
   ```

6. 뷰 컨트롤러에 권한 위임 - viewDidLoad()

   ```swift
           partCollectionView.delegate = self
           partCollectionView.dataSource = self
   ```

   











