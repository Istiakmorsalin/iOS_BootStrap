//
//  FirebaseEventList.swift
//   
//
//  Created by Istiak on 9/19/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

enum FirebaseEvents: String {
    case ph01BackButton = "ph01_back_button"
    case ph01SongInformationButton = "ph01_song_information_button"
    case ph01PhraseVideoArea = "ph01_phrase_video_area"
    case ph01PhraseLikeButton = "ph01_phrase_like_button"
    case ph01Lyrics = "ph01_lyrics"
    case ph01CreateMessageButton = "ph01_create_message_button"
    case ph01LinkToSongButton = "ph01_link_to_song_button"
    case ph01Hashtag = "ph01_hashtag"
    case ph01EditHashtagButton = "ph01_edit_hashtag_button"
    case ph01CloseSongInformationButton = "ph01_close_song_information_button"
    case ph01AdvertisementBanner = "ph01_advertisement_banner"
    
    case so01BackButton = "so01_back_button"
    case so01SongInformationButton = "so01_song_information_button"
    case so01SongVideoArea = "so01_song_video_area"
    case so01CreatePhraseButton = "so01_create_phrase_button"
    case so01PhraseListTab = "so01_phrase_list_tab"
    case so01LyricsTab = "so01_lyrics_tab"
    case so01Lyrics = "so01_lyrics"
    case so01Phrase = "so01_phrase"
    case so01CloseSongInformationButton = "so01_close_song_information_button"
    case so01AdvertisementBanner = "so01_advertisement_banner"
    
    case sp01BackButton = "sp01_back_button"

    // Tabbar
    enum Tabbar: String {
        case homeButton = "tabbar_home_button"
        case searchButton = "tabbar_search_button"
        case messageCreateButton = "tabbar_message_create_button"
        case messageConfirmationButton = "tabbar_message_confirmation_button"
        case mypageButton = "tabbar_mypage_button"
    }

    // Home
    enum Home: String {
        case messageArea = "hm01_message_area"
    }

    // Phrase Selection
    enum PhraseSelection: String {
        case backButton = "me01_back_button"
        case searchButton = "me01_search_button"
        case recommendedHashtag = "me01_recommended_hashtag"
        case popularPhraseTab = "me01_popular_phrase_tab"
        case likedPhraseTab = "me01_liked_phrase_tab"
        case phraseVideo = "me01_phrase_video"
        case linkToPhrasePlaybackButton = "me01_link_to_phrase_playback_button"
        case usePhraseButton = "me01_use_phrase_button"
    }

    // Hashtag Detail
    enum HashtagDetail: String {
        case backButton = "sr04_back_button"
        case phraseArea = "sr04_phrase_area"
        case advertisementVideo = "sr04_advertisement_video"
    }

    // Message Confirmation
    enum MessageConfirmation: String {
        case changeModeButton = "me07_change_mode_button"
        case viewedMessageTab = "me07_viewed_message_tab"
        case sentMessageTab = "me07_sent_message_tab"
        case draftMessageTab = "me07_draft_message_tab"
        case messageThumbnail = "me07_message_thumbnail"
        case deleteMessageButton = "me07_delete_message_button"

    }

    // Message Preview
    enum MessagePreview: String {
        case backButton = "me06_back_button"
        case messageArea = "me06_message_area"
        case publishButton = "me06_publish_button"
        case unpublishPutton = "me06_unpublish_button"
        case noPasswordButton = "me06_no_password_button"
        case passwordButton = "me06_password_button"
        case sendMessageButton = "me06_send_message_button"
        case saveDraftButton = "me06_save_draft_button"
        case chooseSNSButton = "me06_choose_sns_button"
        case cancelButton = "me06_cancel_send_button"
    }

    // Message Playback
    enum MessagePlayback: String {
        case backButton = "me08_back_button"
        case messageArea = "me08_message_area"
        case editButton = "me08_edit_button"
        case createMessageButton = "me08_create_message_button"
        case publishButton = "me08_publish_button"
        case unpublishPutton = "me08_unpublish_button"
        case noPasswordButton = "me08_no_password_button"
        case passwordButton = "me08_password_button"
        case submitPasswordButton = "me08_submit_password_button"
        case createReturnMessageButton = "me08_create_return_message_button"
        case linkToPhraseButton = "me08_link_to_phrase_button"
    }

    //SR01
    enum Search: String {
        case sr01SearchButton = "sr01_search_button"
        case sr01CampaignBanner = "sr01_campaign_banner"
        case sr01Hashtag = "sr01_hashtag"
        case sr01PhraseArea = "sr01_phrase_area"
    }
    
    case ph03BackButton = "ph03_back_button"
    case ph03PhrasePreviewButton = "ph03_phrase_preview_button"
    case ph03LinkToPhraseButton = "ph03_link_to_phrase_button"

    //SR02
    enum SearchResult: String {
        case sr02BackButton = "sr02_back_button"
        case sr02Search = "sr02_search"
        case sr02PhrasaeTab  = "sr02_phrasae_tab"
        case sr02SongTab = "sr02_song_tab"
        case sr02HashtagTab = "sr02_hashtag_tab"
        case sr02PhraseArea = "sr02_phrase_area"
        case sr02SongArea = "sr02_song_area"
        case sr02HashtagArea = "sr02_hashtag_area"
        case sr02DeleteAllSearchHistory = "sr02_delete_all_search_history"
        case sr02SearchHistory = "sr02_search_history"
        case sr02DeleteSearchHistory = "sr02_delete_search_history"
        case sr02DeleteSearchWord = "sr02_delete_search_word"
        case sr02SuggestedWord = "sr02_suggested_word"
    }
    
    //ME04
    enum TextPreview: String {
       case me04BackButton = "me04_back_button"
       case me04NextButton = "me04_next_button"
       case me04EditTextButton = "me04_edit_text_button"
       case me04Filter = "me04_filter"
       case me04AdvertisementBanner = "me04_advertisement_banner"
    }
    
    //ME05
    enum TextInput: String {
        case me05BackButton = "me05_back_button"
        case me05FinishEditingButton = "me05_finish_editing_button"
    }
    
    case ph04BackButton = "ph04_back_button"
    case ph04PhraseVideoArea = "ph04_phrase_video_area"
    case ph04Lyrics = "ph04_lyrics"
    case ph04EditHashtagButton = "ph04_edit_hashtag_button"
    case ph04CreatePhraseButton = "ph04_create_phrase_button"

    //PH02
    enum HashtagEdit: String {
        case ph01CancelEditingHashtagButton = "ph01_cancel_editing_hashtag_button"
        case ph01FinishEditingHashtagButton = "ph01_finish_editing_hashtag_button"
        case ph01SuggestedHashtag = "ph01_suggested_hashtag"
        case ph01AdvertisementBanner = "ph01_advertisement_banner"
    }
    
    case ph05CreateMessageButton = "ph05_create_message_button"
    case ph05LinkToPhrasePlayback = "ph05_link_to_phrase_playback"
    case ph05OtherArea = "ph05_other_area"

    //TU01~04
    enum Tutorial: String {
        case tu04BirthYearDropdownList = "tu04_birth_year_dropdown_list"
        case tu04StartButton = "tu04_start_button"
        case tu04SkipButton = "tu04_skip_button"
        case tu04LinkToServiceTerm = "tu04_link_to_service_term"
        case tu03GenderIcon = "tu03_gender_icon"
        case tu03NextButton = "tu03_next_button"
        case tu03SkipButton = "tu03_skip_button"
        case tu02IconButton = "tu02_icon_button"
        case tu02NextButton = "tu02_next_button"
        case tu02SkipButton = "tu02_skip_button"
        case tu01NextButton = "tu01_next_button"
        case tu01SkipButton = "tu01_skip_button"
        case tu01LinkToServiceTerm = "tu01_link_to_service_term"
        case tu01LinkToPrivacyPolicy = "tu01_link_to_privacy_policy"
    }
    
    case me03BackButton = "me03_back_button"
    case me03NextButton = "me03_next_button"
    case me03AdvertisementBanner = "me03_advertisement_banner"

   //ME02
    enum PhotoSelection: String {
        case me02BackButton = "me02_back_button"
        case me02LeaveMessageCreation = "me02_leave_message_creation"
        case me02ToNextButton = "me02_to_next_button"
        case me02Photo = "me02_photo"
        case me02AdvertisementBanner = "me02_advertisement_banner"
    }
    
    case su04BackButton = "su04_back_button"
    case su05BackButton = "su05_back_button"
    case su06BackButton = "su06_back_button"
    case tu05TutorialImage = "tu05_tutorial_image"
    case tu06TutorialImage = "tu06_tutorial_image"
    
    // MyPage
    enum MyPage: String {
        case my01LinkedPhraseTab = "my01_liked_phrase_tab"
        case my01DeleteiNckname = "my01_delete_nickname"
    }
}
