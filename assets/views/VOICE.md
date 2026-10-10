# VOICE.html 구성

`docs/VOICE.md` → `docs/VOICE.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다.

**판단은 VOICE.md에 적힌 것으로만 한다.** 예시 문구도 VOICE.md에 있는 것만 쓰고 새로 짓지 않는다.

## 사이드바

Voice가 `is-current`. 목차는 아래 순서로, 실제로 만든 섹션만:

요약(`#summary`) · 성격(`#traits`) · 톤(`#tone`) · 어휘(`#vocab`) · 상황별 톤(`#context`) · 표기 규칙(`#style`) · Do · Don't(`#dos`)

## 본문 구성 (VOICE.md → html)

| VOICE.md | html | section-label / h2 |
|---|---|---|
| 제목, 확정 정보 | 표지: `.eyebrow` = `Voice`, `h1` = 확정 서비스 이름, `.lead` = 한 줄 무드, `.tag` = ① 글자 그대로 `확정 이름` ② 작성일 | — |
| 1. Voice Summary | `#summary`의 `.callout` 안 `p.big` 하나 | `Summary` / 이렇게 말해요 |
| 2. Core Personality Traits | `#traits`의 `.grid` > `.card`. 성격마다 카드 하나 (아래 예시) | `Traits` / 핵심 성격 |
| 3. Tone Spectrums | `#tone`의 `.spectrum`. 축마다 `.spectrum-row` 하나, md의 `●` 위치(1~5)가 `.is-on` (아래 예시). 양 끝 라벨은 md 그대로 | `Tone` / 톤 스펙트럼 |
| 4. Vocabulary Guide | `#vocab`의 `.compare`: `.is-do` = USE, `.is-dont` = AVOID. 단어는 `strong`, 메모는 `span.note`. h3는 `쓰는 말` / `피하는 말` | `Vocabulary` / 어휘 |
| 5. Tone Adaptation Rules | `#context`의 `.table-wrap` 표: 맥락(`tbody th`) / 톤 조절 / 예시 문구. 표 아래 규칙 문장이 있으면 `p` | `Context` / 상황별 톤 |
| 6. Style Rules | `#style`의 `.kv`. `라벨: 내용` 꼴이면 dt/dd로 나누고, 아니면 `ul.refs`처럼 목록으로 | `Style` / 표기 규칙 |
| 7. Do's and Don'ts | `#dos`의 `.compare`: `.is-do` h3 = `Do`, `.is-dont` h3 = `Don't` | `Do · Don't` / 이렇게 쓰고, 이렇게 쓰지 않아요 |

## 성격 카드

```html
<div class="card">
  <h3>{성격명}</h3>
  <dl class="kv">
    <dt>우리는</dt><dd>{We are}</dd>
    <dt>우리가 아닌 것</dt><dd>{We are not}</dd>
  </dl>
  <p class="say is-do">“{This sounds like}”</p>
  <p class="say is-dont">“{This does NOT sound like}”</p>
</div>
```

## 톤 스펙트럼 한 줄

md의 `Formal    [1]——[2]——[●3]——[4]——[5]  Casual` →

```html
<div class="spectrum-row">
  <span class="spectrum-label">Formal</span>
  <div class="spectrum-track"><i></i><i></i><i class="is-on"></i><i></i><i></i></div>
  <span class="spectrum-label">Casual</span>
</div>
```

## 어휘 한 줄

```html
<li><strong>{단어/표현}</strong><span class="note">{언제·왜}</span></li>
```
