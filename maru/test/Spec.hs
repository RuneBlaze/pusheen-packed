{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Main (main) where

import           Test.Hspec
import           Test.Hspec.Wai
import           Test.Hspec.Wai.JSON
import           Network.HTTP.Types.Header
import           Data.Aeson (Value(..), object, (.=), decode)

import           Example (app)
import           Card

main :: IO ()
main = hspec spec

aCard = [json|{
    "id": "82457245",
    "merchant": "Visa",
    "name": "Capital One Venture",
    "image": "https://techcase-cards-api.herokuapp.com/images/capitalOneVenture.jpeg",
    "tags": [
      "travel",
      "no_annual_fee",
      "zero_intro_apr"
    ],
    "intro_apr": {
      "months": 12,
      "rate": 0,
      "does_not_apply": false
    },
    "regular_apr": {
      "months": 0,
      "rate": 0.1599,
      "variable": true
    },
    "recommended_credit_scores": [
      {
        "name": "poor",
        "min": 390,
        "max": 560
      },
      {
        "name": "medium",
        "min": 550,
        "max": 675
      }
    ],
    "rates_and_fees": [
      {
        "name": "annual",
        "fee": 0,
        "caveat": ""
      },
      {
        "name": "intro balance transfer apr",
        "rate": 0.1099,
        "duration_months": 14
      }
    ],
    "features": [
      "No foriegn transactions fees",
      "No annual fee",
      "0% introductory apr",
      "Free credit score"
    ]
  }|]

spec :: Spec
spec = with app $ do
  describe "GET /" $ do
    it "responds with 200" $ do
      get "/" `shouldRespondWith` 200

    it "responds with 'hello'" $ do
      get "/" `shouldRespondWith` "hello"

    it "responds with 200 / 'hello'" $ do
      get "/" `shouldRespondWith` "hello" {matchStatus = 200}

    it "has 'Content-Type: text/plain; charset=utf-8'" $ do
      get "/" `shouldRespondWith` 200 {matchHeaders = ["Content-Type" <:> "text/plain; charset=utf-8"]}

  describe "GET /some-json" $ do
    it "responds with some JSON" $ do
      get "/some-json" `shouldRespondWith` expectedJsonResponse

  describe "Json to Card" $ do
    it "can parse an example card" $ do
      decode aCard :: Maybe Card `shouldBe` Nothing

expectedJsonResponse = 
  let ResponseMatcher status headers body = [json|{foo: 23, bar: 42}|]
  in ResponseMatcher status [hContentType <:> "application/json; charset=utf-8"] body
