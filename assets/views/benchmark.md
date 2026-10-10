# benchmark.html 구성

`docs/benchmark.md` → `docs/benchmark.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다.

**판단은 benchmark.md에 적힌 것으로만 한다.** 심화 리서치를 했는지, 캡처가 있는지, 캡처 크기가 무엇인지 모두 benchmark.md를 보고 정한다.

**순서가 md와 다르다.** md는 결론(차별 프레이밍)이 맨 끝이지만, html은 사람이 읽는 리포트라 **결론을 맨 앞에** 둔다.

## 사이드바

Benchmark가 `is-current`. 목차는 아래 섹션 중 **실제로 만든 섹션만**, 이 순서로:

결론(`#conclusion`) · 경쟁 서비스(`#landscape`) · 화면 캡처(`#screens`) · 기능 비교(`#compare`) · 관찰(`#observations`) · 메시징·가격(`#messaging`, 심화) · 디자인(`#design`, 심화) · 출처(`#sources`)

## 본문 구성 (benchmark.md → html)

| benchmark.md | html | section-label / h2 |
|---|---|---|
| 제목, 한 줄 요약, 머리말 | 표지: `.eyebrow` = `Benchmark`, `h1` = 서비스 이름, `.lead` = 한 줄 요약, `.tag` = ① `조사일 {날짜}` ② `직접 경쟁 {N} · 간접·참고 {M}` ③ 심화 섹션이 하나라도 있으면 `심화 리서치` | — |
| 우리의 차별 프레이밍 | `#conclusion`: `.callout` 안에 `.big` = 우리의 자리, `.kv` = 빈틈 · 기회 / 차별 포인트. 섹션 앞머리 서술(2~4줄)은 "우리의 자리"와 겹치므로 html에는 넣지 않는다 | `Conclusion` / 우리의 자리 |
| 직접 경쟁 표 | `#landscape`의 `.sub` "직접 경쟁" + `.table-wrap` 표. `#` 열과 URL 열은 빼고, 서비스 이름(`tbody th`, 첫 열)에 URL 링크를 건다 | `Landscape` / 경쟁·참고 서비스 |
| 간접 경쟁·대체재 / 참고 표 | 같은 섹션의 `.sub` "간접 경쟁 · 참고" + `.table-wrap` 표. 링크 처리는 위와 같다 | |
| 화면 캡처 (핵심 경쟁) | `#screens`의 `.shots` > `figure.shot` (아래 예시). 머리말 캡처 크기가 모바일이면 `.shots.is-mobile`. md에 "캡처 없음: <이유>"만 있으면 `.callout.is-empty`에 그 이유 | `Screens` / 핵심 경쟁 화면 |
| 핵심 기능 비교 | `#compare`의 `.table-wrap` 표. 첫 열(기능/측면)은 `tbody th`. 앞머리 서술이 있으면 표 위 `p` | `Compare` / 핵심 기능 비교 |
| 관찰 — 잘하는 점 / 아쉬운 점 | `#observations`의 `.grid` > `.card`. 서비스마다 카드 하나: `h3` = 서비스 이름, `.kv` = 잘하는 점 / 아쉬운 점 | `Observations` / 잘하는 점 · 아쉬운 점 |
| 사이트 메시징·가격 상세 (심화) | 있을 때만 `#messaging`. 서비스마다 `.card`: `h3` = 서비스, `.kv` = 헤드라인 / 서브카피 · CTA / 가격 모델 | `Messaging · 심화` / 사이트 메시징 · 가격 |
| 디자인·화면 관찰 (심화) | 있을 때만 `#design`. 서비스마다 `.card`: `h3` = 서비스, `.kv` = 분위기 · 컬러 / 레이아웃 · 핵심 동선. 스크린샷은 `#screens`에 이미 있으면 다시 넣지 않는다 | `Design · 심화` / 디자인 · 화면 관찰 |
| 출처 | `#sources`의 `ul.refs`. 각 항목은 링크 | `Sources` / 출처 |

- 표의 빈칸이나 md의 `—`는 그대로 `—`로 둔다.
- md에 있는 표는 열을 임의로 빼거나 합치지 않는다. (예외: 위에 적힌 `#` 열·URL 열)

## 화면 캡처 카드

이미지 경로는 md의 `images/...`를 그대로 쓴다(html이 `docs/`에 있으므로 `docs/images/`를 가리킨다).

```html
<div class="shots">
  <figure class="shot">
    <img src="images/daangn-home.png" alt="당근 · 메인 화면">
    <figcaption>
      <strong>당근 · 메인</strong>
      <p>{인상적인 점}</p>
      <p class="source"><a href="{URL}">{도메인}</a> · {캡처일}</p>
    </figcaption>
  </figure>
</div>
```

캡처가 없을 때:

```html
<div class="callout is-empty"><p>캡처한 화면이 없어요 — {md에 적힌 이유}</p></div>
```

## 결론 박스

```html
<div class="callout">
  <p class="big">{우리의 자리(포지셔닝) 한 문장}</p>
  <dl class="kv">
    <dt>빈틈 · 기회</dt><dd>{빈틈/기회}</dd>
    <dt>차별 포인트</dt><dd>{차별 포인트}</dd>
  </dl>
</div>
```
