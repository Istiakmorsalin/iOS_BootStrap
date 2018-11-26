//
//  ScreenList.swift
//   
//
//  Created by Istiak on 9/19/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

enum Screens: String {
    // home
    case hm01HomeScreen = "hm01_home_screen"
    
    // message
    case me01PhraseSelectionScreen = "me01_phrase_selection_screen"
    case me02PhotoSelectionScreen = "me02_photo_selection_screen"
    case me03PhotoSortScreen = "me03_photo_sort_screen"
    case me04TextPreviewScreen = "me04_text_preview_screen"
    case me05TextInputScreen = "me05_text_input_screen"
    case me06MessagePreviewScreen = "me06_message_review_screen"
    case me07MessageConfirmationScreen = "me07_message_confirmation_screen"
    case me08MessagePlaybackScreen = "me08_message_playback_screen"
    
    // mypage
    case my01MypageScreen = "my01_mypage_screen"
    
    // phrase
    case ph01PhrasePlaybackScreen = "ph01_phrase_playback_screen"
    case ph02HashtagEditScreen = "ph02_hashtag_edit_screen"
    case ph04PhrasePreviewScreen = "ph04_phrase_preview_screen"
    case ph05PhraseCreationCompletionScreen = "ph05_phrase_creation_completion_screen"
    
    case so01MusicPlaybackScreen = "so01_music_playback_screen"
    
    case sp01SpecialScreen = "sp01_special_screen"
    
    // sr
    case sr01SearchTopScreen = "sr01_search_top_screen"
    case sr02SearchResultScreen = "sr02_search_result_screen"
    case sr04HashTagDetailScreen = "sr04_hash_tag_detail_screen"
    
    // su
    case su04LicenseScreen = "su04_license_screen"
    case su05TermsOfServiceScreen = "su04_terms_of_service_screen"
    case su06PrivacyPolicyScreen = "su06_privacy_policy_screen"
    
    // tutorial
    case tu01InputNickNameScreen = "tu01_input_nick_name_screen"
    case tu02InputIconImageScreen = "tu02_input_icon_image_screen"
    case tu03InputGenderScreen = "tu03_input_gender_screen"
    case tu04InputBirthYearScreen = "tu03_input_birth_year_screen"
    case tu05PhraseTutorialScreen = "tu05_phrase_totorial_screen"
    case tu06PhotoSortTutorialScreen = "tu05_photo_sort_totorial_screen"

}
