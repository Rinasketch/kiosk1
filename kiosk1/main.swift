import Foundation

// 타입: 문자열로 저장
struct MenuItem {
    var name: String
    var description: String
}

// 선택한 음식을 저장하기 위한 배열
// 사용자가 선택한 메뉴가 배열에 추가됨
// 이 배열은 사용자가 선택한 여러 메뉴를 차례로 저장하여 나중에 주문 내역을 확인하거나 처리하는 데에 사용
var order: [MenuItem] = []

// 무한 루프 (조건이 항상 참(true)이기 때문에 루프가 끝나지 않고 계속 실행)
// 사용자가 메뉴를 고르기 전까지 계속해서 메뉴를 보여주고 주문을 처리하는 코드
// 사용자가 0을 입력하면 루프가 종료됨
while true {
    print("음식 메뉴:")
    print("1. Burgers | 앵거스 비프 통살을 다져만든 버거")
    print("2. Frozen Custard | 매장에서 신선하게 만드는 아이스크림")
    print("3. Drinks | 매장에서 직접 만드는 음료")
    print("4. Beer | 뉴욕 브루클린 브루어리에서 양조한 맥주")
    print("0. 종료 | 프로그램 종료")
    print("메뉴 번호를 입력하세요 (0은 종료):")
    
    // 특정조건에서 false가 실행되게 하면 무한 루프 안됨 case 안에 break 넣으면 됨
    // 반복되는 메뉴 하나로 뭉쳐보기
    
    // 옵셔널 바인딩, 사용자의 입력을 텍스트 형태로 받아옴, 주문을 처리하기 위해 텍스트 형태를 정수로 변환함
    if let userInput = readLine(), let selectedNumber = Int(userInput) {
        switch selectedNumber {
        case 1...4:
            
            let selectedMenu = [
                MenuItem(name: "Burgers", description: "앵거스 비프 통살을 다져만든 버거"),
                MenuItem(name: "Frozen Custard", description: "매장에서 신선하게 만드는 아이스크림"),
                MenuItem(name: "Drinks", description: "매장에서 직접 만드는 음료"),
                MenuItem(name: "Beer", description: "뉴욕 브루클린 브루어리에서 양조한 맥주")
            ][selectedNumber - 1] // -1의 이유: 배열의 인덱스는 0부터 시작하는데 메뉴는 1부터 시작해서 1을 누르면 menu2가 선택되기 때문에
            print("선택한 메뉴: \(selectedMenu.name) | \(selectedMenu.description)")
            order.append(selectedMenu)

            // 추가 주문 여부 확인
            print("추가 주문하시겠습니까? (y/n)")
            if let additionalOrderInput = readLine(), additionalOrderInput.lowercased() == "n" {
                print("계산 화면으로 이동합니다. ")
                print("카드를 준비해주세요.")
                exit(0)
            }
        case 0:
            print("주문을 종료합니다.")
            exit(0)
        default:
            print("잘못된 번호입니다. 다시 시도하세요.")
        }
      // 사용자가 숫자를 입력하지 않았을 때 출력(readline()이 nil 일 때)
    } else {
        print("메뉴 번호를 입력해주세요.")
    }
}

