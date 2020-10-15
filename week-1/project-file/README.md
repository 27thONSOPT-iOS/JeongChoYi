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

* Textfield, Switch, Stepper
* keyboard type
* Optional binding