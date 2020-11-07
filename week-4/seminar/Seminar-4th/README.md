# 4주차 세미나 실습 파일

## TabBarController

`Embed In...` - `Tab Bar Controller`

* 하위 뷰컨 추가

  TabBarController --> NewVC `view controllers`

* Nav - Tab - View -(push)-> View 일 경우

  * push로 불러온 view에서는 tabbar 위에 VC가 생겨서 탭바가 사라짐

<img src="https://user-images.githubusercontent.com/28949235/98435909-4545ca00-211a-11eb-86aa-cb86ee671f89.png" alt="image" width=300px />

## TabBarController - with code

* `UITabBarController` - CustomTabBarController
* `UIViewController 1` - YellowVC
* `UIViewController 2` - BlueVC

- **func setViewControllers([UIViewController]?, animated: Bool)**  
  함수를 통해 TabBar를 구성하는 VC들을 지정해보기  - CustomTabBarController.swift

  ```swift
  override func viewDidLoad() {
          super.viewDidLoad()
  
          // Do any additional setup after loading the view.
          setTabs()
      }
      
      func setTabs(){
          guard let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowVC") as? YellowVC,
                let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
          else{
              return
          }
          
          yellowVC.tabBarItem.title = "YELLOW"
          yellowVC.tabBarItem.image = UIImage(systemName: "house")
          yellowVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
          
          blueVC.tabBarItem.title = "BLUE"
          blueVC.tabBarItem.image = UIImage(systemName: "person")
          blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
          
          setViewControllers([yellowVC, blueVC], animated: true)
      }
  ```



## Animation

* iOS에서 자주 사용하는 animation 구현 방법
  * UIKit의 Animation API 사용 - (오늘 배운 것)
  * 코어 애니메이션 사용

### Animate

* UIView에서 제공하는 Closure 기반의 메소드
* 애니메이션이 동작하는 동안 user interaction은 일시적으로 불가능해짐
* 애니메이션 가능한 속성 - frame, bounds, center, transform, alpha, backgroundColor...
* iOS 10 이상부터는 [UIViewPropertyAnimator](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator)라는 API 등장



* **func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)**

  * duration: 애니메이션 수행 시간
  * animations: 수행될 애니메이션 클로저 블럭

  ```swift
  UIView.animate(withDuration: 2.0, animations: {
      self.cowImageView.alpha = 0
  })
  ```

* **func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)**

  * completion: 애니메이션 수행 완료 후 수행할 클로저 블럭

  ```swift
  let newPosition = CGRect(x: 0, y: 0, width: 240, height: 240)
  
  UIView.animate(withDuration: 1.0, animations: {
      self.cowImageView.alpha = 0
      self.cowImageView.frame = newPosition
  }) { finished in //finished에 animation이 끝났는지 아닌지를 bool값으로 받아옴.
      UIView.animate(withDuration: 1.0, animations: {
        //completion 내에도 애니메이션 사용 가능:꼬리에 꼬리를 무는 animation 구현 가능
          self.cowImageView.alpha = 1
          self.initPosition()
      }) { (finish) in
          if finish {
              print("FINISH!!!")//모든 애니메이션 끝나면 출력
          }
      }
  }
  ```

  

* **func animate(withDuration duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIView.AnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)**

  * delay: 애니메이션이 시작되기 전 지연되는 시간
  * usingSpringWithDamping: 스프링 애니메이션이 정지상태에 근접할 때의 damping 비율
  * initialSpringVelocity: 스프링의 속도
  * options: 애니메이션에게 지정해 줄 수 있는 [다양한 옵션](https://developer.apple.com/documentation/uikit/uiview/animationoptions)들을 배열을 통해 지정

  ```swift
  UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .curveEaseIn) {
      self.cowImageView.alpha = 0
      self.cowImageView.frame = newPosition
  } completion: { (finish) in
      self.cowImageView.alpha = 1
      self.initPosition()
  }
  ```

  

### CGAffineTransform

* frame을 옮기는 방식은 오토레이아웃을 잡으면 제대로 동작 안 함 - [CGAffineTransform](https://developer.apple.com/documentation/coregraphics/cgaffinetransform) 이용

* 3가지 이동 메소드

  * 이동 Translate

    * CGAffineTransform(scaleX: CGFloat, y: CGFloat)

    * 조절하고자 하는 뷰의 현재 넓이와 높이 에서 *ScaleX, *y 만큼 크기를 지정

    * 현재값에 얼마를 곱할건지

      ```swift
      self.cowImageView.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
      ```

  * 조절 Scale

    * CGAffineTransform(translationX tx: CGFloat, y ty: CGFloat)

    * 조절하고자 하는 뷰의 현재 x,y좌표에서 이동하고 싶은 거리를 지정

    * 현재 x,y좌표에서 이동을 얼마나 시킬건지

      ```swift
      self.cowImageView.transform = CGAffineTransform(translationX: 100, y: 100)
      ```

  * 회전 Rotate

    * CGAffineTransform(rotationAngle: CGFloat)

    * 조절하고자 하는 뷰의 현재 각도에서 회전하고 싶은 각도만큼을 지정

    * 현재 각도에서 회전을 얼마만큼 시킬건지

      ```swift
      self.cowImageView.transform = CGAffineTransform(rotationAngle: .pi)
      ```

* 위 세가지 메소드를 **concatenating**을 통해 한번에 실행하기

  ```swift
  let scale = CGAffineTransform(scaleX: 2.0, y: 0.5)
  let rotate = CGAffineTransform(rotationAngle: .pi)
  let move = CGAffineTransform(translationX: 100, y: 100)
              
  let combine = scale.concatenating(move).concatenating(rotate).concatenating(move)
              
  UIView.animate(withDuration: 1.0, delay: 0) {
      self.cowImageView.transform = combine
  } completion: { finished in
      UIView.animate(withDuration: 1.0) {
          // .identity 속성 사용해서 모든 변환을 제거하기
          self.cowImageView.transform = .identity
      }
  }
  ```



## Cocoapods

생략 ~ ~ 끝

