import XCTest

class WeatherAppTests: XCTestCase {
    
    
    let dataString = """
{
    "response": {
        "count": 21,
        "items": [
            {
                "id": 67059,
                "first_name": "Маша",
                "last_name": "Балтаева",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c625318/v625318059/22a02/qU55W2dqQsA.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c625318/v625318059/22a01/CjYynmkIhpU.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c625318/v625318059/229fe/1G6uA0LqDHY.jpg?ava=1",
                "online": 0
            },
            {
                "id": 1540749,
                "first_name": "Дмитрий",
                "last_name": "Сорокин",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c322521/v322521749/906a/RuofXH5buSE.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c322521/v322521749/9069/3VRGWvOAlqk.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c322521/v322521749/9066/EmWfjC_y6gk.jpg?ava=1",
                "online": 0
            },
            {
                "id": 2722506,
                "first_name": "Евгений",
                "last_name": "Герасимов",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c624324/v624324506/1d555/D4qJKP_3Ls0.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c624324/v624324506/1d554/GDm9_kzPC58.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c624324/v624324506/1d551/pGfe9htvJ3E.jpg?ava=1",
                "online": 0
            },
            {
                "id": 3836956,
                "first_name": "Дмитрий",
                "last_name": "Микшаков",
                "is_closed": true,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c10290/u3836956/e_06f12713.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c10290/u3836956/d_021110ce.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c10290/u3836956/a_983b5492.jpg?ava=1",
                "online": 0
            },
            {
                "id": 4542461,
                "first_name": "Анастасия",
                "last_name": "Коврижкина",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/MADIul3sjMfY7byYjBbEYYIULieiyd16UHDpvA/6mMZafJ-SiA.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/sJ1hkyKIYQm2dxXwVD-O0S44fHWt32neGBoHwA/R_oytjm7Ey4.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/oAw5VPAoEhKJrHXtKhmSovOiRub1wwfXxi6cvw/IWhH5f-aKoY.jpg?ava=1",
                "online": 0
            },
            {
                "id": 5077361,
                "first_name": "Лариса",
                "last_name": "Черей",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c846324/v846324265/1baf79/aGA6Dycsrt8.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c846324/v846324265/1baf78/muoAUwPbzYk.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c846324/v846324265/1baf76/vl37HsNPsYk.jpg?ava=1",
                "online": 0
            },
            {
                "id": 9318344,
                "first_name": "Алина",
                "last_name": "Имаева",
                "is_closed": true,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c840639/v840639973/767cf/U4jKRVun2as.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c840639/v840639973/767ce/PlKjpnJDKxk.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c840639/v840639973/767cc/5W5YsCHeVGk.jpg?ava=1",
                "online": 0
            },
            {
                "id": 20407954,
                "first_name": "Мария",
                "last_name": "Панкратьева",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c639623/v639623954/7b66/TYRTh21uSQs.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c639623/v639623954/7b65/_x3e9XWYvvI.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c639623/v639623954/7b62/MEgpkA_oQQE.jpg?ava=1",
                "online": 0
            },
            {
                "id": 22099374,
                "first_name": "Леся",
                "last_name": "Карпеченко",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c830408/v830408047/174e58/Va0S2X7A1mg.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c830408/v830408047/174e57/3Ktcl_dmAT0.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c830408/v830408047/174e56/MRXPD81spHk.jpg?ava=1",
                "online": 0
            },
            {
                "id": 23507268,
                "first_name": "Владимир",
                "last_name": "Тантлевский",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c10041/u23507268/e_af704470.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c10041/u23507268/d_7d1673d0.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c10041/u23507268/a_2f9fc636.jpg?ava=1",
                "online": 0
            },
            {
                "id": 29930258,
                "first_name": "Светлана",
                "last_name": "Зобанова",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c850036/v850036845/1205d5/bmBRSzDm08I.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c850036/v850036845/1205d4/wajIYgPpaNE.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c850036/v850036845/1205d3/Upp98yR41yU.jpg?ava=1",
                "online": 0
            },
            {
                "id": 39190393,
                "first_name": "Максим",
                "last_name": "Гагаро",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/eK8Xb4uEGtXX5FIemArlOlLrR8Cdoizg30iwBQ/lWlv_1qRDZQ.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/rSRRKF_WJKSnr9EEunQtMoMHFplAh9VyHE-Lmg/rxsal08hv74.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/0-o_eJAaeIhizqCJKAO0X2wH5q7botuxukG4uw/RmWhrIyi41k.jpg?ava=1",
                "online": 0
            },
            {
                "id": 69203424,
                "first_name": "Валерий",
                "last_name": "Хильченко",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c844724/v844724138/173d07/H1E5-lYUH6A.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c844724/v844724138/173d06/_XKmFdVjMU8.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c844724/v844724138/173d05/nB65OmT4KTo.jpg?ava=1",
                "online": 0
            },
            {
                "id": 152815990,
                "first_name": "Daytrader",
                "last_name": "Kyiv",
                "deactivated": "banned",
                "photo_50": "https://vk.com/images/deactivated_50.png",
                "photo_100": "https://vk.com/images/deactivated_100.png",
                "photo_200_orig": "https://vk.com/images/deactivated_200.png",
                "online": 0
            },
            {
                "id": 158496402,
                "first_name": "Сергей",
                "last_name": "Денин",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c831408/v831408998/d8783/FmtO3vXTTfE.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c831408/v831408998/d8782/MAl5LK7xdBY.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c831408/v831408998/d877f/lFyWVrFoR7g.jpg?ava=1",
                "online": 0
            },
            {
                "id": 170017776,
                "first_name": "Ирина",
                "last_name": "Смирнова",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c10566/u170017776/e_06d1f05a.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c10566/u170017776/d_c2fef0f5.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c10566/u170017776/a_c9831882.jpg?ava=1",
                "online": 0
            },
            {
                "id": 171422902,
                "first_name": "Good",
                "last_name": "Online",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c10948/u171422902/e_8c6a2d0f.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c10948/u171422902/d_3889d6de.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c10948/u171422902/a_46b8bd6a.jpg?ava=1",
                "online": 0
            },
            {
                "id": 220032970,
                "first_name": "Александр",
                "last_name": "Грачёв",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c840236/v840236235/665ff/G_aLSkSGpWE.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c840236/v840236235/665fe/_LLstQBCpTs.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c840236/v840236235/665fc/T9pF1if4bwM.jpg?ava=1",
                "online": 0
            },
            {
                "id": 263325969,
                "first_name": "Ольга",
                "last_name": "Герасина",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c854020/v854020421/1c66/6FZmoR3U9Sc.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c854020/v854020421/1c65/-KU7iKJnna8.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c854020/v854020421/1c64/5rVgacoSy08.jpg?ava=1",
                "online": 0
            },
            {
                "id": 302667835,
                "first_name": "Владимир",
                "last_name": "Тантлевский",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c622716/v622716835/41f90/DAGT2TesFqY.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c622716/v622716835/41f8f/vhAndDp1pFg.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c622716/v622716835/41f8c/4WMAGXAbZmI.jpg?ava=1",
                "online": 0
            },
            {
                "id": 420287931,
                "first_name": "Wersom",
                "last_name": "Fro",
                "is_closed": false,
                "can_access_closed": true,
                "photo_50": "https://pp.userapi.com/c849124/v849124117/11741a/lUxH2oSAXh0.jpg?ava=1",
                "photo_100": "https://pp.userapi.com/c849124/v849124117/117419/_GSO8Lbi4B0.jpg?ava=1",
                "photo_200_orig": "https://pp.userapi.com/c852132/v852132049/9c620/2XcWMwBVh_w.jpg?ava=1",
                "online": 0
            }
        ]
    }
}
"""
    
    func testExample() {
        let data = self.dataString.data(using: .utf8)
        
        let getFriendsResponse: FriendsGet? = Parser.parseFriendsGet(data: data)
        
        print("getFriendsResponse:")
        print("items = \(getFriendsResponse?.response.items)")
        
        XCTAssertNotNil(getFriendsResponse)
    }
}
