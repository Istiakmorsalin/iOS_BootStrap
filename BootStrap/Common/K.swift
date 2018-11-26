//
//  K.swift
//   
//
//  Created by Istiak on 13/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

var randomNumber: String {
    var result = ""
    repeat {
        result = String(format:"%04d", arc4random_uniform(10000) )
    } while Set<Character>(result).count < 4
    return result
}

enum K {
    enum View {
        static let cornerRadius: CGFloat = 6.7
    }
}

func errorMessageForCode(_ code: Int) -> String {
    return Localised(Constants.Text.errorWithCode, values: ["__code__": "\(code)"])
}

enum Constants {
    static let id = "id"
    static let loginID = "loginID"
    static let accessToken = "access_token"
    static let refreshToken = "refresh_token"
    static let firstLaunchFlag = "firstLaunchFlag"
    static let permissionLevel = "permissionLevel"
    static let nickName = "nick_name"
    static let shareTextTop = "さんから、あなた宛てに大切なメッセージが届いています✨ チェックして！ #  \n\n"
    static let shareTextBottom = "\n\n. . . . .\n\n  リリンク - 音楽からはじまる、音楽と伝える。メッセージクリエイトアプリ"
    static let textInput = "text_input"
    static let selectedPhotoKey = "SelectedImageIndex"
    static let photoSelectionDialogTitlePhraseSelection = "写真の選択をやめる"
    static let photoSelectionDialogMessagePhraseSelection = "写真の選択をやめると、これまでの選択内容がすべて破棄されます。\n 写真の選択をやめますか？"
    static let photoSelectionDialogTitleOtherScreens = "メッセージ作成をやめる"
    static let photoSelectionDialogMessageOtherScreens = "メッセージの作成をやめると、これまでの編集内容がすべて破棄されます。\n メッセージの作成をやめますか？"
    
    static let photoUrl = "photo_url"

    struct Notifications {
        static let SessionDidExpire = NSNotification.Name(rawValue: "SessionDidExpire")
    }

    struct Text {
        static let success = Localised("Success")
        static let failed = Localised("Failed")
        static let errorWithCode = "Error with code: __code__"
    }

    struct Font {
        static let hiraginoSansW3 = "HiraginoSans-W3"
        static let hiraginoSansW6 = "HiraginoSans-W6"
    }
}
