# 4주차 세미나

[💾 실습 프로젝트](https://github.com/27thONSOPT-iOS/JeongChoYi/tree/master/week-4/seminar/Seminar-4th)

## TabBarController

<img src="https://user-images.githubusercontent.com/28949235/98435831-ade07700-2119-11eb-8295-0f5c799e8e73.png" alt="image" width=400 />

* 서브 Content ViewController들이 수평적인 관계를 가짐 (!= Navigation Controller)
* UIViewController를 담을 수 있는 Container ViewController
* [Apple Developer Docs](https://developer.apple.com/documentation/uikit/uitabbarcontroller)



## Animation

* iOS에서 자주 사용하는 animation 구현 방법
  * UIKit의 Animation API 사용 - (오늘 배운 것)
  * 코어 애니메이션 사용

### Animate

* UIView에서 제공하는 Closure 기반의 메소드
* 애니메이션이 동작하는 동안 user interaction은 일시적으로 불가능해짐
* 애니메이션 가능한 속성 - frame, bounds, center, transform, alpha, backgroundColor...
* iOS 10 이상부터는 [UIViewPropertyAnimator](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator)라는 API 등장