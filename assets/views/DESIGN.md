# DESIGN.html 구성

`docs/DESIGN.md` → `docs/DESIGN.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다.

DESIGN.html은 글로 옮긴 문서가 아니라 **DESIGN.md의 값을 실제로 그려 보여주는 견본집**이다. 견본 부품 안에서는 DESIGN.md의 실제 색·글꼴·수치를 쓴다(REPORT.md 2번 예외).

- **만드는 시점:** design-brandfit이 DESIGN.md를 우리 것으로 바꾼 뒤에만 만든다. 레퍼런스를 가져다 놓기만 한 상태에서는 만들지 않는다.
- **함께 읽는 md:** `docs/VOICE.md`, `docs/PRODUCT.md` — 글꼴 예시와 컴포넌트 미리보기 안의 문구를 VOICE.md의 실제 문구에서 가져오고, 없으면 PRODUCT.md의 기능 이름을 쓴다. 서비스 이름은 PRODUCT.md 제목.
- **판단은 DESIGN.md(와 VOICE.md)에 적힌 것으로만 한다.** DESIGN.md는 출처마다 형식이 다르다(값이 YAML·표·문장 속에 있다). **찾은 값만 그리고, 못 찾은 항목은 섹션째 생략한다.** 값을 짐작해 채우지 않는다.
- 본문 설명은 DESIGN.md가 영어여도 한국어로 짧게 쓴다(사람이 보는 화면이므로). 토큰 이름·값은 원문 그대로.

## 사이드바

Design이 `is-current`. 목차는 실제로 만든 섹션만, 이 순서로:

분위기(`#theme`) · 색(`#color`) · 쓰는 곳(`#boundaries`) · 글꼴(`#type`) · 간격·모양(`#shape`) · 미리보기(`#preview`) · 라이브러리(`#deps`) · Do · Don't(`#dos`) · 보이스(`#voice`)

## 본문 구성 (DESIGN.md → html)

| DESIGN.md | html | section-label / h2 |
|---|---|---|
| frontmatter `name`·`ds.name`, §1 분위기 | 표지: `.eyebrow` = `Design`, `h1` = 서비스 이름, `.lead` = §1 분위기를 한국어 한두 문장으로, `.tag` = ① 디자인 시스템 이름 ② `레퍼런스: {출처 이름}`(frontmatter `reference` 또는 변환 노트) ③ verified 날짜 | — |
| §1 Visual Theme & Atmosphere | `#theme`의 `p` 2~3개. 분위기와 그렇게 잡은 이유 | `Theme` / 분위기 |
| 색 팔레트·역할 | `#color`의 `.swatches` > `.swatch` (아래 예시). 역할별로 `.sub`로 나눈다. 그룹은 DESIGN.md의 역할을 따른다(예: 브랜드 / 배경·표면 / 글자 / 선 / 상태). 투명도가 있는 색(오버레이 등)은 이름 옆에 투명도를 적는다. `(unused — reference-specific)` 표시가 붙은 색은 맨 끝 `.sub` "쓰지 않는 색"으로 따로 모은다 | `Color` / 색 |
| Usage Boundaries | `#boundaries`의 `.table-wrap` 표: 요소(`tbody th`, 색이면 앞에 `i.dot`) / 쓰는 곳 / 쓰지 않는 곳 | `Boundaries` / 어디에 쓰고, 어디엔 쓰지 않나 |
| 타이포그래피 | `#type`의 `.type-scale`. 단계마다 `.type-row`, 예시 문장은 VOICE.md의 실제 문구 중 그 단계에 어울리는 것(제목급은 짧은 것) | `Type` / 글꼴 |
| 간격·모서리·그림자 | `#shape`의 `.sub` "간격" / "모서리" / "그림자" + `.token-rows` > `.token-row` (아래 예시). 있는 것만 | `Shape` / 간격 · 모서리 · 그림자 |
| 컴포넌트 수치 + 색·글꼴·모서리 | `#preview`의 `.ds-preview` (아래 예시) | `Preview` / 이렇게 보여요 |
| frontmatter `runtime_deps` | `#deps`의 `.kv`: 아이콘 / 글꼴 (+ 라이선스가 적혀 있으면) | `Libraries` / 아이콘 · 글꼴 |
| Do's and Don'ts | `#dos`의 `.compare` (`.is-do` = Do, `.is-dont` = Don't). 원문이 영어면 한국어로 짧게 옮긴다 | `Do · Don't` / 이렇게 쓰고, 이렇게 쓰지 않아요 |
| Voice & Tone | `#voice`: 금지 문구나 CTA 예시 2~3개만 `.say`로 보여주고 `<p class="source"><a href="VOICE.html">보이스 가이드 자세히 보기 →</a></p>`. 자세한 건 VOICE.html에 있으므로 반복하지 않는다 | `Voice` / 보이스 |

## 색 견본

```html
<div class="swatches">
  <div class="swatch">
    <i class="chip-color" style="background:#FF6F0F"></i>
    <strong>accent-500</strong>
    <code>#FF6F0F</code>
    <span class="note">주요 버튼, 선택 상태</span>
  </div>
</div>
```

## 간격·모서리·그림자 한 줄

```html
<div class="token-rows">
  <div class="token-row">
    <div class="token-box" style="border-radius:12px"></div>
    <div class="token-meta">카드 모서리<code>radius-lg · 12px</code></div>
  </div>
</div>
```
간격은 `.token-box.is-space`에 `style="width:{값}"`(높이는 고정 막대), 그림자는 `style="box-shadow:{값};background:#fff"`. 쓰임새 설명이 없는 토큰은 `.token-meta`에 토큰 이름과 값만 쓴다.

## 컴포넌트 미리보기

DESIGN.md에서 찾은 값만 `--ds-…` 변수로 넣는다. 못 찾은 변수는 빼면 템플릿 기본값으로 그려진다.

| 변수 | 가져올 값 |
|---|---|
| `--ds-font` | 본문 글꼴 패밀리 (스택 포함) |
| `--ds-bg` / `--ds-surface` / `--ds-border` | 배경 / 카드·표면 / 테두리 색 |
| `--ds-text` / `--ds-muted` | 기본 글자 / 보조 글자 색 |
| `--ds-secondary-border` | 보조 버튼 테두리 색 (없으면 `--ds-border`) |
| `--ds-primary` / `--ds-on-primary` / `--ds-primary-soft` | 주요 버튼 색 / 그 위 글자 색 / 옅은 강조 배경(없으면 빼둔다 — 주요 색을 옅게 섞어 자동으로 만든다) |
| `--ds-radius` / `--ds-btn-radius` / `--ds-input-radius` | 카드 모서리 / 버튼 모서리 / 입력창 모서리 |
| `--ds-shadow` | 카드 그림자 |
| `--ds-btn-pad` / `--ds-btn-size` / `--ds-title-size` | 버튼 안쪽 여백 / 버튼 글자 크기 / 카드 제목 크기 |

```html
<div class="ds-preview" style="--ds-font:Pretendard, sans-serif; --ds-primary:#FF6F0F; --ds-on-primary:#fff; --ds-radius:12px">
  <div>
    <p class="preview-label">버튼</p>
    <div class="ds-row">
      <button class="ds-btn">{VOICE.md의 CTA 문구}</button>
      <button class="ds-btn is-secondary">{보조 행동 문구}</button>
    </div>
  </div>
  <div>
    <p class="preview-label">카드</p>
    <div class="ds-card"><h4>{제목 문구}</h4><p>{설명 문구}</p></div>
  </div>
  <div>
    <p class="preview-label">입력창 · 칩</p>
    <div class="ds-row"><input class="ds-input" placeholder="{입력 안내 문구}" readonly><span class="ds-chip">{칩 문구}</span></div>
  </div>
</div>
```
문구는 VOICE.md(상황별 톤 예시, CTA 표현, Vocabulary의 쓰는 말)에서 가져온다. 맞는 문구가 없으면 PRODUCT.md의 기능 이름을 쓴다.
