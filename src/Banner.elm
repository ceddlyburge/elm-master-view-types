module Banner exposing (Banner(..), TextBannerProperties, Viewer, ArticlePreview, bannerHtml)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)

type alias TextBannerProperties =
    { headline : String
    , strapline : String 
    }

type alias Viewer =
    { avatar : String
    , userName : String}

type alias ArticlePreview =
    { title : String
    , datePublished : String}

type Banner =
    TextBanner TextBannerProperties
    | ViewerBanner Viewer
    | ArticleBanner Viewer ArticlePreview

bannerHtml : Banner ->  Html msg
bannerHtml banner = 
    case banner of 
        TextBanner textBannerProperties  ->
            textBanner textBannerProperties
        ViewerBanner viewer  ->
            viewerBanner viewer
        ArticleBanner viewer articlePreview  ->
            articleBanner viewer articlePreview

textBanner : TextBannerProperties -> Html msg
textBanner textBannerProperties =
    div [ class "banner" ]
        [ div [ class "container" ]
            [ h1 [ class "logo-font" ] [ text textBannerProperties.headline ]
            , p [] [ text textBannerProperties.strapline ]
            ]
        ]

viewerBanner : Viewer -> Html msg
viewerBanner viewer =
    div 
        [ class "profile-page" ]
        [ div 
            [ class "user-info" ]
            [ div [ class "container" ]
                [ div [ class "row" ]
                    [ div [ class "col-xs-12 col-md-10 offset-md-1" ]
                        [ img [ class "user-img", src viewer.avatar ] []
                        , h4 [] [ text viewer.userName ]
                        , p [] [ text "" ]
                        ]
                    ]
                ]
            ]
        ]

articleBanner : Viewer -> ArticlePreview -> Html msg
articleBanner viewer articlePreview =
    div [ class "article-page" ]
        [ div 
            [ class "banner" ]
            [ div [ class "container" ]
                [ h1 [] [ text articlePreview.title ]
                , div 
                    [ class "article-meta" ]
                    [ a 
                        [ ]
                        [ img [ src viewer.avatar ] [] ]
                        , div [ class "info" ]
                            [ a 
                                [ class "author" ]
                                [ text viewer.userName ]
                            , text articlePreview.datePublished
                            ]
                    ]
                ]
            ]
        ]
