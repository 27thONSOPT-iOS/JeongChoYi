# 1주차 세미나 실습 파일

### UI 구성하기

* view controller에 label과 button 올리기
* IBOutlet, IBAction 연결



### 화면 전환하기

* segue로 구현
  * Present Modally
  * Show
  * Navigation bar - push, pop
* code로 구현
  * Cocoa Touch Class 생성, 연결

  * **Present Modally**

    ```swift
    guard let dvc = self.storyboard?.instantiateViewController(identifier: "YellowViewController") else {
         return
    }
    self.present(dvc, animated: true, completion: nil)
    ```

  * Navigation bar - **push**

    ```swift
    guard let dvc = self.storyboard?.instantiateViewController(identifier: "YellowViewController") else{
         return
    }
    self.navigationController?.pushViewController(dvc, animated: true)
    ```

  * **dismiss** - present에만 해당

    ```swift
    //present로 띄운 view를 없애는 메소드
    self.dismiss(animated: true, completion: nil)
    ```

  * Navigation bar - **pop**

    ```swift
    //네비게이션스택의 최상위 뷰컨트롤러 없애줌
    self.navigationController?.popViewController(animated: true)
    ```

  * Transition Style, Presentation



### 화면 간 데이터 전달

* 데이터를 보낼 뷰 (전달 전 뷰)

```swift
//guard-let 사용 - 빠른 종료
guard let dvc = self.storyboard?.instantiateViewController(identifier:
	"SecondDataViewController") as? SecondDataViewController else {
		return
	}
// 결과 화면에 데이터를 전달
dvc.email = self.emailTextField.text
dvc.isAutoUpdate = self.updateStateSwitch.isOn
dvc.updateInterval = Int(self.updateIntervalStepper.value)
// modal 스타일 변경
dvc.modalPresentationStyle = .fullScreen
//transition
self.present(dvc, animated: true, completion: nil)
```

```swift
//if-let 사용 - dvc는 gurad 내부에서만 사용
//as로 type-casting
if let dvc = self.storyboard?.instantiateViewController(identifier: "SecondDataViewController") as? SecondDataViewController {
	// 결과 화면에 데이터를 전달
	dvc.email = self.emailTextField.text
	dvc.isAutoUpdate = self.updateStateSwitch.isOn
	dvc.updateInterval = Int(self.updateIntervalStepper.value)
 //transition
	self.present(dvc, animated: true, completion: nil)
}
```



* 데이터를 받을 뷰 (전달 후 뷰)

```swift
//IBOutlet 연결
@IBOutlet weak var emailLabel: UILabel!
@IBOutlet weak var updateStateLabel: UILabel!
@IBOutlet weak var updateIntervalLabel: UILabel!
    
// 변수 선언 (데이터를 보낼 view에서 dvc.아래변수이름)
var email: String?
var isAutoUpdate: Bool?
var updateInterval: Int?

func setLabel() {
	// 옵셔널 바인딩
  // ,는 &&연산자와 같은 의미로 사용
  if let email = self.email,
  let isAutoUpdate = self.isAutoUpdate,
  let updateInterval = self.updateInterval {
    // Label에 값을 대입
    self.emailLabel.text = email
    self.emailLabel.sizeToFit()
    self.updateStateLabel.text = isAutoUpdate ? "On" : "Off"
    self.updateIntervalLabel.text = "\(updateInterval)분" }
}
    
override func viewDidLoad() {
  super.viewDidLoad()
  setLabel()
}

```



* Textfield, Switch, Stepper
* keyboard type
* Optional binding