//
//  Show+Mock.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Foundation

extension Show {
    /// Набор мок-данных для превью/тестов, соответствующий моделям `Show`, `Season`, `Episode`.
    static let MockShows: [Show] = {
        // Вспомогательная функция для создания даты из компонентов
        func makeDate(_ year: Int, _ month: Int, _ day: Int) -> Date {
            var comps = DateComponents()
            comps.year = year
            comps.month = month
            comps.day = day
            return Calendar.current.date(from: comps) ?? Date()
        }

        // Пример сезонов/эпизодов
        let bbSeason1 = Season(episodes: [
            Episode(name: "Пилот", releaseDate: makeDate(2008, 1, 20)),
            Episode(name: "Кошелек или жизнь", releaseDate: makeDate(2008, 1, 27))
        ])
        let bbSeason2 = Season(episodes: [
            Episode(name: "Семь тридцать семь", releaseDate: makeDate(2009, 3, 8)),
            Episode(name: "Гриппозный", releaseDate: makeDate(2009, 3, 15))
        ])

        let gotSeason1 = Season(episodes: [
            Episode(name: "Зима близко", releaseDate: makeDate(2011, 4, 17)),
            Episode(name: "Дорога королей", releaseDate: makeDate(2011, 4, 24))
        ])

        let chernobylSeason1 = Season(episodes: [
            Episode(name: "1:23:45", releaseDate: makeDate(2019, 5, 6)),
            Episode(name: "Пожалуйста, оставайтесь спокойны", releaseDate: makeDate(2019, 5, 13))
        ])

        return [
            Show(
                name: "Во все тяжкие",
                description: "Учитель химии становится варщиком метамфетамина, чтобы обеспечить семью.",
                cover: URL(string: "https://kinopoisk-ru.clstorage.net/1V46vC217/1c1f52yH7/dE5RDVhNLyL_S700_lsTwsG-kCpi52hT5CWhFD4krpEPEz5fMzNbj7e6QdJVrnBh1fWGUTjwbg47CsdNo_9c1kVGXDgFMWoXkg7EAIMGTpuZxswHO_8xcqk11Vl_XdItz7P2-vurpy83C8TLbLIJEJCshgkNmXdyRhqKhBL2xEsoGuVVCAG-RouLYGiCN7MWBbdkIm4iyNvoJLkcpqSWbduXXlanI3eXfxfcuzw_EYSo2B4t4a0XDxqKfiDDkpjL_NYZRWQd5qoPV9hIKv87WlFXNLru8nxLbDjRaNqwxlWPC7IWv7Mv62fLWKfYp2XobLDy4Y2R98Mq-lIoB3rEG2h-8f3AVT5-n0c4WPpjE9YFV4wCojqIf5Cc_Xz6uKJ9m1OmGjM727_37yDHVCepVCwEJpn9oR_rusoCVFfW0MNovp0N9Almph_jwJQSl0-eacsUBtrS8I8wTL20ghiOnaOrSr6P92sX63-wU4D7bagwVPahoX3zw0ZWBjCzVoDDoNpB4RBZOgZv03gAxvPjFpUbtFrigjyH5NixHHq0rmmfk94y30czU4NrIFOg020wqCAaVT3ll-_WClrEe2rcgzReCeVsnb4Cb49AMLrLC5rtG4yG_pJ0D2xA9ZxCfKZV59O6-jvbS1MLz8xPEPMhNAgAvvE5OaNjRrpWGAeeGB8Y0nUB4L3C0isXWIj6exNy9VuwuvKKTGfo8DFoHkhKfet3flpjg1vH44PYk6w_6ewAXNp9HfG_27oybsxrogzbVLbxQXi5hlLr40BcnucP3v1b-LZO0oQTZDhJ_J44Bu0bY6LWzyN342-7IDt8t7VoEMgi_Rmdo-_mlo4gXzY8d_iewcnADdYuG1cUuJa_fwJdk4za0iqAq9ioJQSCuJ5d66N2Yo_HoxO_I7TTfOeVWIjQ6tVhEQtzzu6C1E_6wOMU1n31_In-2gc_7OymT-PqkY80piL-_EtUfAUoVoAisYsHYipT07efk4P0t7TXlXzwPD7RqQH_52Ja_tjT4iRD9A7xScyRTgKD__Qk3k9Dcm1LNB5CEnh7sMxB6D60GhV_a3YivwNf32O7rL9wS_WIFNAaUYkdP7seXsbIL_7cExTCDZ1MgSpe099ARNZvB_LBe-AKUvJ4d-BkNQiWrK59H4f2YgsjC5tPJ-wHYIelmOyEehF9kWPXspo2vM8qLIPIdlFR4BVSPlODtJCq-0s2FdPowjYKtH8o6EUUIoiKdXfv4hrPp0fLG2Ocg7h_gXDQyJ6NUe17azaeTpjrXigTOF5lFWidqqrPA6yoHuv7dgVnOKpCrnAPEPBRHNYwrt13u6rmu9cr4-PHUJ_06xEIbKgGFTlh5xsmjrpUJxKU53QuAclEEeoWD7ugzCpzYwZxe-CWWj48K0T4NSAyGDoRa4tSKstPT-9Lz1y7IK-NqFx0Zom1qZMXJgqCNHt-FE_0gulxcK063hfPmGyuiw82MW_AurK-hPsUsI2QCiQ6efN_auo_h8tPg-8ct7y3EQxsiKqRiV0PU87OTuwrHtwfyBpNGdiBhkavT0BQBtOT2ml7zF6mYoTDMFTdtHK4KjVnDzriAy9Hvy8j6B8AJ-kIdBCuLa21P1cu8oZ8355441g-PbkYIUaGYzvQwALHT5pl12Cuwua0C1CsDZSGVML9t-duriczfyuXM3TTIN-Z9JC0svmZue8fsnrKSHM2iPO4TmF5TDHejpNz3ICWS6NylXs4hs6GtAd4INls2jCi8fsfqjqv12Nfl3OoqwzXVfz8JIbRpQ0rC_ZqmuC3yjSb2H5lhWixNjaTU2iIJs9_uglnEPL-FoBHOHyFGL44og2TMzqWxzc_txOH4CP03-386ABmDe3l31t6VhIo0_JIb6SKdZXwCcIua1PchAbbv7bFF-DKPmoMAzTAIfRGfN7FG48qqpuHOz8HTzi3gCsJbCwEKtUNOY9TSlbq9D-isNssgs0B4M06nqtjlMxel-92CQ9gCvquEK8kWP0o_rTSQavvwkI_07s7i2PARwwjCWQMUDKRiaEPf3Z6ZuSrMiDzbFrJmQBFqhZnQ1QQHvt7noHPQMISetALEHgNqJaQ8s1br2Iyi0vjp48D3NN0X-X8_MQaIY2VL7_yilJwD-4ED6SagYFw5QJyK18QmII3O4rdewhGJqKwZ1xIAYgeXDadnwey0gNX6zef--inlEuJHCQAFplZGSvvXgJybENuxHcYCoGB2L22omP_GAgKfzteYQeENipicGdMHN2Q0vwCkXO_tuoncyNHw39YXzxLdRD0CJYhUV035z5ySsAjMkRzEE4BcdCBTk7_9xCYqvuDdskPGDKq6gBfWPhJDNYkLkG3E0JuI8NX33uD5AsUK3UUDFju5RkBKxdqwrrIM2ZY6-A-bbnMZbLKw4vUEIZTj_rJY7hO5hbo08RMKQS6rM4F6-PqQscz_2_jf-AvVDNt7Bws8ilpoffHNjbWwPdCMG8sCnk9FAGutgf_1KjOm3t27edIqt4-yMt4nHUk-sR2FXef5kqvzz8zQ2fAgwQv5ZgsVFqhvS3bS2q6tjwHNqj7MC4REeABdtLD_2zEpuOLbt2bLB4-ApwrNECNPE4UjmXr996iLxNTn3sLZJ9gOw2s5PD65dVtpxMeNm5s92asDzxa-WHIZS46E8_kFN5P-_4FS0jaet5gr_z4CbwOrDIZk69CvsM7W5eLm9Az8It92DiIJvWJjR9r2so-2I-qBNdoBoV5lMXyFmfzSCBWTw_G_efMGtZ6yEvgvMEEHgTGhVu_ekoXxye367M4wxDD2bj8rCJ5BbUnb0qytqDnojT_9CZFvUBh6k7D48yYFtezNrHbSBY-pniHZKAZcPKg0uFvf-biZ9e3AwuXrAMgPxU0eJgKqaFx8xdeQuJYq2pA4zRKyc3IVSqCg4OgWJ4XnxLdQzC2wv6A0zg0oVzK_CpJ8_dK9ouLd5cXZ9CLHH-VkHB8jpFR3RM3Mkbs")!,
                seasons: [bbSeason1, bbSeason2]
            ),
            Show(
                name: "Игра престолов",
                description: "Битва за Железный трон и судьбу Семи Королевств.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/dd78edfd-6a1f-486c-9a86-6acbca940418/600x900")!,
                seasons: [gotSeason1]
            ),
            Show(
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900")!,
                seasons: [chernobylSeason1]
            ),
            Show(
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900")!,
                seasons: [chernobylSeason1]
            ),
            Show(
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900")!,
                seasons: [chernobylSeason1]
            ),
            Show(
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900")!,
                seasons: [chernobylSeason1]
            ),
            Show(
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900")!,
                seasons: [chernobylSeason1]
            )
        ]
    }()

    static let MockShow = MockShows.first!
}
