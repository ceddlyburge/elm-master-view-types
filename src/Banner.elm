module Banner exposing (Banner)

import Html exposing (..)
import Html.Attributes exposing (src, class, classList)
import Html.Events exposing (onClick)
import Route exposing (..)

type alias TextBannerProperties =
    { headline : String
    , strapline : String}

type alias Viewer =
    { avatar : String
    , userName : String}

type alias ArticePreview =
    { title : String
    , datePublished : String}

type Banner =
    TextBanner TextBannerProperties
    | ViewerBanner Viewer
    | ArticleBanner Viewer ArticlePreview
