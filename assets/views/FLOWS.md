# FLOWS.html 구성

`docs/FLOWS.md` → `docs/FLOWS.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다.

- **함께 읽는 md:** `docs/DESIGN.md`(있으면 화면 카드를 이 디자인으로 그린다), `docs/PRODUCT.md`(서비스 이름, 기준 뷰포트).
- **판단은 FLOWS.md(와 위 두 파일)에 적힌 것으로만 한다.** 화면 카드 안의 요소와 문구는 FLOWS.md의 스케치·핵심 요소·문구에서만 가져온다. 없는 요소를 지어 넣지 않는다.

## 사이드바

Flows가 `is-current`. 목차: 지도(`#map`) · 화면 목록(`#screens`) · 그다음 **깊게 그린 플로우마다** `F1 첫 대여 요청`(`#f1`) … 순서대로. `후보` 상태 플로우는 목차에 넣지 않는다.

## 본문 구성

| FLOWS.md | html | section-label / h2 |
|---|---|---|
| 제목, 머리말 | 표지: `.eyebrow` = `Flows`, `h1` = 서비스 이름, `.lead` = `플로우 {전체 수}개 중 {후보가 아닌 수}개를 그렸어요.` + 깊게 그린 첫 플로우의 사용자의 한마디, `.tag` = ① 최종 수정일 ② 플랫폼 | — |
| Flow Map | `#map`의 `.board` (아래 예시). 열 4개는 항상 이 순서: 후보 / 그림 완료 / 만드는 중 / 만듦(`.is-done`). 깊게 그린 플로우의 `.board-item`은 `a href="#f1"`로 감싼다. 뺐거나 합친 플로우는 보드에 넣지 않는다. 보드 아래 기능 커버리지 문장을 `p.source`로 | `Map` / 플로우 지도 |
| Screens | `#screens`의 `.table-wrap` 표: 화면(`tbody th`) / 등장 플로우 / 목적 / 상세(`F1 ①` → `#f1` 링크) | `Screens` / 화면 목록 |
| 깊게 그린 플로우 하나 | 플로우마다 `section#f{n}` (아래 "플로우 섹션") | `F{n} · {상태}` / `{이름}` |

## Flow Map 보드

```html
<div class="board">
  <div class="board-col"><h3>후보 <span class="count">2</span></h3>
    <div class="board-item"><span class="flow-id">F2</span><strong>반납하기</strong><p>"반납일이 언제였지?"</p></div>
  </div>
  <div class="board-col"><h3>그림 완료 <span class="count">1</span></h3>
    <a class="board-item" href="#f1"><span class="flow-id">F1</span><strong>첫 대여 요청</strong><p>"근처에 빌릴 책 있나?"</p></a>
  </div>
  <div class="board-col"><h3>만드는 중 <span class="count">0</span></h3></div>
  <div class="board-col is-done"><h3>만듦 <span class="count">0</span></h3></div>
</div>
```

## 플로우 섹션

순서: 목표 순간 → 화면 카드 → 단계 표 → 화면 상태 → 예외 → 첫 버전 범위 → 변경 기록. md에 없는 항목은 생략한다.

모든 블록 앞에 `.sub` 라벨을 단다: 화면 · 단계 · 화면 상태 · 예외 · 첫 버전 범위 · 변경 기록 (목표 순간은 라벨 없이 맨 위).

1. **목표 순간** — `.callout` 안 `p.big` = md의 "목표 순간" 줄, `.kv` = 진입 동기 / 상태 변화.
2. **화면 카드** — `.phones`(PRODUCT.md 기준 뷰포트가 데스크톱 우선이면 `.phones.is-desktop`). 단계마다 `.phone` 하나. 같은 화면이 두 단계에 나오면 카드도 두 번 그린다(순간이 다르므로).
   - `.phones`의 `style`에 DESIGN.md 값을 `--ds-…` 변수로 넣는다. 변수 목록과 찾는 법은 `DESIGN.md` 구성 문서(views/DESIGN.md)의 "컴포넌트 미리보기"와 같다. DESIGN.md가 없으면 `style` 없이 그린다(템플릿 기본 색).
   - `.phone-screen` 안은 그 화면의 **핵심 요소를 위에서 아래 순서대로**, 종류에 따라 옮긴다(종류는 스킬의 "핵심 요소 종류"):
     | 종류 | 부품 |
     |---|---|
     | 제목 | `p.ph-title` |
     | 라벨 | `p.ph-label` |
     | 글 | `p.ph-text` |
     | 이미지 | `.ph-img`(안에 내용 글자) |
     | 지도 | `.ph-img.is-map`(안에 내용 글자) |
     | 목록 | `.ph-list > .ph-item` (× 숫자만큼, 최대 3개) |
     | 카드 | `.ds-card` (h4 + p) |
     | 입력 | `input.ds-input` (`readonly`, 내용은 placeholder) |
     | 칩 | `.ph-chips > .ds-chip` (`(선택)` 표시가 있는 것만 `.is-on`) |
     | 버튼 / 보조 버튼 | `.ds-btn` / `.ds-btn.is-secondary` |
     | 시트 | `.ph-sheet` (안에 시트 내용을 같은 규칙으로) — 화면 맨 아래에 겹쳐 그린다 |
     | 탭바 | `.ph-bar` > span |
   - 문구는 md에 적힌 그대로 쓰되, `(임시)` 표시는 화면 카드 안에서는 뺀다(md와 표에는 남는다).
   - 같은 화면이 다른 플로우에서 이미 정의돼 "참고"로만 적혀 있으면, 그 플로우의 요소를 가져와 그린다.
   - `.phone-note` = 단계 표의 "주 행동" 칸 그대로.
3. **단계 표** — `.table-wrap`: 단계(`tbody th`) / 화면 / 기능 / 주 행동 / 핵심 결정.
4. **화면 상태** — `.table-wrap`: 화면(`tbody th`) / 빈 / 로딩 / 오류. 칸에는 상황과 문구를 짧게, 문구는 따옴표째. 해당 없으면 `—`. "F1 ① 참고"인 화면은 표에 넣지 않는다.
5. **예외** — `.table-wrap`: 단계 / 상황 / 어떻게 동작하나.
6. **첫 버전 범위** — `.compare`: `.compare-col.is-do` h3 = `첫 버전에 넣음`, 클래스 없는 `.compare-col` h3 = `나중에`. 건너뛴 기본값이 있으면 아래 `p.source`에 `기본값으로 둔 것: …`.
7. **변경 기록** — `.sub` "변경 기록" + `ul.refs`.

```html
<div class="phones" style="--ds-font:Pretendard, sans-serif; --ds-primary:#ff385c; --ds-radius:14px">
  <div class="phone">
    <div class="phone-step">①<strong>홈</strong></div>
    <div class="phone-screen">
      <p class="ph-title">우리 동네 책장을 구경해볼까요?</p>
      <div class="ph-list">
        <div class="ph-item">책 카드</div>
        <div class="ph-item">책 카드</div>
      </div>
      <div class="ph-bar"><span>홈</span><span>내 책장</span><span>알림</span></div>
    </div>
    <p class="phone-note">책 카드 탭 → ②</p>
  </div>
</div>
```
