# PRODUCT.html 구성

`docs/PRODUCT.md` → `docs/PRODUCT.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다. `report-template.html`의 예시 내용이 바로 PRODUCT.html의 모양이다.

**판단은 PRODUCT.md에 적힌 것으로만 한다.** 예: 포지셔닝이 비었는지, 이름이 확정됐는지는 PRODUCT.md를 보고 정한다.

**함께 읽는 md:** `docs/VOICE.md` — 있으면 맨 끝에 브랜드 요약 섹션(`#brand`)을 붙인다(아래 "브랜드 요약"). `docs/DESIGN.md` — `docs/DESIGN.html`이 있을 때만(= design-brandfit을 거친 뒤) 브랜드 다음에 디자인 요약 섹션(`#design`)을 붙인다(아래 "디자인 요약"). 레퍼런스를 가져다 놓기만 한 DESIGN.md로는 만들지 않는다.

**사이드바:** Product가 `is-current`. 목차는 컨셉(`#concept`) · 핵심 기능(`#features`) · 포지셔닝(`#positioning`) · 플랫폼(`#platform`) · 이름(`#naming`), VOICE.md가 있으면 뒤에 브랜드(`#brand`), DESIGN.html이 있으면 그 뒤에 디자인(`#design`).

**본문 구성 (PRODUCT.md → html)** — 섹션 제목(`h2`)은 템플릿 것을 그대로 쓴다.

| PRODUCT.md | html 부품 |
|---|---|
| 제목의 이름, 한 줄 컨셉 | 표지: `.eyebrow` = `Product`, `h1` = 서비스 이름, `.lead` = 한 줄 컨셉, `.tag` 3개 = ① `가칭` (이름 섹션에 `확정 이름:`이 있으면 `확정`) ② `{형태} · {기준 뷰포트}` (뷰포트는 이유 빼고 값만) ③ 작성일 |
| 문제 정의 / 타깃 사용자 / 핵심 솔루션 | `#concept`의 `.flow` 3칸: 문제 → 누구를 위해 → 솔루션. 각 칸은 md 내용을 2~3문장으로 줄여 담는다 |
| 핵심 기능 목록 | `#features`의 `.grid` > `.card`. `.num`은 01부터, `h3`는 기능 이름, `p`는 한 줄 설명 |
| 확장 아이디어 | 같은 섹션의 `.sub` "확장 아이디어" + `.card.is-muted`. 설명이 없는 아이디어는 `h3`만 쓴다. 확장 아이디어가 없으면 `.sub`째 생략 |
| 포지셔닝 | `#positioning`. PRODUCT.md의 포지셔닝 섹션이 주석뿐이면 아래 빈 상태, 내용이 있으면 아래 채워진 상태 |
| 플랫폼 | `#platform`의 `.kv`: 형태 / 기준 뷰포트(— 이유까지). "(기본)" 같은 괄호 메모는 뺀다 |
| 이름 후보 & 가칭 | `#naming`의 `.chips`. 확정 이름(없으면 가칭)이 `.chip.is-selected`, 나머지 후보는 `.chip`. 아래 `.source`에 확정 이름이 없으면 "가칭이에요. 이름은 brand-voice 단계에서 확정해요.", 있으면 "brand-voice에서 확정한 이름이에요." |

포지셔닝 빈 상태:
```html
<div class="callout is-empty">
  <p>벤치마크 리서치를 마치면 여기에 우리의 자리와 차별점이 채워져요.</p>
</div>
```

포지셔닝 채워진 상태 (PRODUCT.md 포지셔닝의 "우리의 자리 / 빈틈·기회 / 차별 포인트 / 근거"를 옮긴다):
```html
<div class="callout">
  <p class="big">{우리의 자리 한 문장}</p>
  <dl class="kv">
    <dt>빈틈 · 기회</dt><dd>{경쟁이 못 채운 지점}</dd>
    <dt>차별 포인트</dt><dd>{핵심 1~2개}</dd>
  </dl>
  <p class="source">근거: <a href="benchmark.html">벤치마크 리서치</a> ({조사일} 조사)</p>
</div>
```
`docs/benchmark.html`이 아직 없으면 링크 없이 `근거: docs/benchmark.md ({조사일} 조사)`로 적는다. 조사일은 PRODUCT.md 포지셔닝의 근거 줄에서 가져온다.

표지 태그 ③ 작성일은 PRODUCT.md 머리말의 작성일 그대로 쓴다. 다른 단계가 PRODUCT.md를 고쳐도 바꾸지 않는다.

## 브랜드 요약 (VOICE.md가 있을 때만)

`#naming` 다음에 붙인다. VOICE.md에서 세 가지만 가져온다: 한 줄 무드, Voice Summary, 핵심 성격 이름들. 자세한 내용은 VOICE.html로 보낸다.

```html
<section class="section" id="brand">
  <div class="section-label">Brand</div>
  <h2>브랜드</h2>
  <div class="callout">
    <p class="big">{VOICE.md 한 줄 무드}</p>
    <p>{Voice Summary}</p>
    <div class="chips">
      <span class="chip">{성격 1}</span><span class="chip">{성격 2}</span><span class="chip">{성격 3}</span>
    </div>
  </div>
  <p class="source"><a href="VOICE.html">보이스 가이드 자세히 보기 →</a></p>
</section>
```
`docs/VOICE.html`이 아직 없으면 마지막 줄은 `자세한 내용: docs/VOICE.md`로 적는다.

## 디자인 요약 (DESIGN.html이 있을 때만)

`#brand` 다음(브랜드 섹션이 없으면 `#naming` 다음)에 붙인다. DESIGN.md에서 대표 색 3~5개(브랜드·주요 버튼·배경·글자 색 위주), 본문 글꼴, 아이콘 라이브러리만 가져온다. 색 견본은 DESIGN.md의 실제 색을 쓴다(REPORT.md 2번 예외).

```html
<section class="section" id="design">
  <div class="section-label">Design</div>
  <h2>디자인</h2>
  <div class="swatches is-small">
    <div class="swatch"><i class="chip-color" style="background:{hex}"></i><strong>{이름}</strong><code>{hex}</code></div>
  </div>
  <dl class="kv">
    <dt>글꼴</dt><dd>{본문 글꼴}</dd>
    <dt>아이콘</dt><dd>{아이콘 라이브러리}</dd>
  </dl>
  <p class="source"><a href="DESIGN.html">디자인 시스템 자세히 보기 →</a></p>
</section>
```

