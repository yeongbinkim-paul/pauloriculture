---
title: "[Dune] NFT Market Overview Chart Review (KR)"
tags:
- Blockchain
- NFT
- SQL
- Dune
- KR
---


## Market Overview 차트 리뷰
작성 일자 : 2023년 3월 22일

[NFT Market Overview](https://dune.com/hildobby/NFTs)를 리뷰해봤습니다.

### Overview

![Screenshot](/notes/dune_nft/images/market_overview/01_overview.png)

**거래량 / 거래 횟수 / 거래자 수**를 이용해 파이차트를 구성한 것을 확인할 수 있습니다.

데이터 양이 기본적으로 많고, 최신 데이터가 Trading에 좀 더 유의미하다는 점을 감안해, 최근 1주 데이터를 보여줍니다.
하단 **NFT Collection Ranked by Volume** 차트의 Trade는 실제 trade 가능한 웹사이트의 링크라서 큰 의미는 없습니다.

### 1. Volume

![Screenshot](/notes/dune_nft/images/market_overview/02_volume.png)

거래량은 Bar Chart와 Stacked Area Chart로 구성되어 있고, 각각은 Daily Volume과 Weekly Volume을 볼 수 있습니다.

Bar Chart는 거래량 총합을 확인할 수 있다는 점에서 전반적인 거래량 추이와 시계열로 Marketplace 별 점유율을 가늠할 수 있습니다.
Stacked Area Chart는 이 Bar Chart에서 확인한 점유율을 직관적으로 표현한 것입니다.

### 2. Transactions

![Screenshot](/notes/dune_nft/images/market_overview/03_transactions.png)

거래 횟수는 거래량 차트와 동일하게 구성되어 있고, 각 차트의 수치는 거래 횟수를 의미합니다.

거래 횟수 차트를 거래량 차트와 비교해서 보면, 최근 Blur의 거래량이 급등해 Opensea의 거래량을 크게 넘어섰지만, 그것이 거래 횟수까지 이어지지는 않은 것을 알 수 있습니다. 아직 Opensea의 활성화 유저가 많이 남아있음을 추측할 수 있습니다.

### 3. Traders

![Screenshot](/notes/dune_nft/images/market_overview/04_traders.png)

이 Chart는 NFT를 거래한 지갑의 수 추이를 보여줍니다.

이 경우에는 Stacked Area Chart 대신, Line Chart를 사용했는데, Stacked Area Chart를 사용하는 것이 더 좋다는 생각이 들어 비교해 보고자 직접 Chart를 작성해 봤습니다.

![Screenshot](/notes/dune_nft/images/market_overview/04_1_traders_area.png)

이러한 결과를 볼 수 있었는데, 이 차트와 기존 차트를 비교해 보고 몇 가지 takeaway를 얻을 수 있었습니다.
1. Stacked Area Chart를 사용하면 점유율을 시각화 하는 것에 장점이 있다.
2. Line Chart를 사용하면 점유율을 시각화하는 동시에, 시계열에 따른 값 변화 차이를 잘 볼 수 있다. 예를 들어, 3월에 급격히 거래자 수가 급감한 시기를 관찰하는 것이 가능하다.
3. 다만 Traders 차트는 다른 차트와 달리 주의할 점이 있었는데, Bar Chart의 경우는 날짜별 거래 지갑 수를 센 반면, Line Chart에서는 Marketplace 별로 거래 지갑 수를 세고 있다. 여러 Marketplace를 동시에 이용한 지갑이 존재할 수 있기 때문에, 차트 구성 시 유의하면 좋다.

![Screenshot](/notes/dune_nft/images/market_overview/04_2_traders_area_2.png)
위 스크린샷과 Dashboard의 Bar Chart를 비교해보면 y축의 값이 다른 것을 알 수 있습니다.

### 4. Token Standards

![Screenshot](/notes/dune_nft/images/market_overview/05_token_standards.png)

Token Standard 별로 Volume, Trade Count, Trader Count를 표기한 것입니다.

여기에서 궁금증이 생겼습니다.
EERC721의 경우에는 token id 별로 1개만 거래 가능한 데에 반해, ERC1155는 여러 개를 거래할 수 있습니다.RC721의 경우에는 1개만 거래하는 데에 반해, ERC1155는 여러개를 거래할 수 있습니다.
더불어, Opensea의 경우, Bundle 거래가 가능해 그 거래 Volume을 어떻게 잡는 지 궁금했습니다.

그래서 Spellbook을 조사해봤습니다. [링크](https://dune.com/spellbook#!/model/model.spellbook.seaport_v2_ethereum_trades)
![Screenshot](/notes/dune_nft/images/market_overview/06_spellbook_opensea.png)

위 스크린샷에서 볼 수 있듯이, 특정 거래에서 nft가 여러 개 거래되는 경우에는 bundle 거래로 분류한 다음, 거래 대금을 균등하게 나누는 것을 확인할 수 있었습니다.
이를 통해 다음과 같은 사실을 알 수 있습니다.

- Dune에서 사용하는 nft trades dataset에 포함된 opensea 거래는 한 거래에 포함된 nft들의 개별 구매 대금을 전체 대금에서 거래에 포함된 nft의 개수로 나눠서 계산한다.
- 따라서, 일부 거래 대금 데이터는 부정확하게 계산되었다.
- 다만, 실제로도 Bundle 거래가 일어날 경우에는 판매자 역시 Bundle에 포함된 NFT들의 개별 가격을 추정한 다음 합산해서 판매하고, 이는 구매자 입장에서도 동일하게 적용되기 때문에, 실제 판매자와 구매자 입장에서는 회계 처리가 필요한 상황이 아니라면 본 데이터를 사용하는 것에 큰 문제가 없다.

### 5. Further Study

Spellbook을 조사하는 과정에서 좀 더 조사하고 싶은 것이 생겼습니다.
Opensea에서 발생한 Bundle 거래는 정확한 구매 대금을 추정하기 어렵다는 사실은 확인했는데,
Gem, Blur와 같은 Market Aggregator에서 여러 Marketplace의 Listing을 Sweep하는 거래의 경우는 어떻게 구매 대금을 산정하는 지 확인해보려고 합니다.
