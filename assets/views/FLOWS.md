# FLOWS.html 구성

`docs/FLOWS.md` → `docs/FLOWS.html`. 공통 규칙(`../REPORT.md`)을 먼저 따르고, 이 문서에 맞는 구성은 아래대로 한다.

- **함께 읽는 md:** `docs/DESIGN.md`(있으면 화면 카드를 이 디자인으로 그린다), `docs/PRODUCT.md`(서비스 이름, 기준 뷰포트).
- **판단은 FLOWS.md(와 위 두 파일)에 적힌 것으로만 한다.** 화면 카드 안의 요소와 문구는 FLOWS.md의 스케치·핵심 요소·문구에서만 가져온다. 없는 요소를 지어 넣지 않는다. 다만 **배치는 자유롭게** 그 화면답게 그린다(아래 "화면 그리기").

## 페이지 폭

FLOWS.html은 화면 스케치가 주인공이므로 **`<main class="is-wide">`**로 넓게 쓴다. 표지와 설명 글은 템플릿이 알아서 읽기 폭을 유지한다.

## 사이드바

Flows가 `is-current`. 목차: 지도(`#map`) · 화면 목록(`#screens`) · 그다음 **깊게 그린 플로우마다** `F1 첫 대여 요청`(`#f1`) … 순서대로. `후보` 상태 플로우는 목차에 넣지 않는다.

## 본문 구성

| FLOWS.md | html | section-label / h2 |
|---|---|---|
| 제목, 머리말 | 표지: `.eyebrow` = `Flows`, `h1` = 서비스 이름, `.lead` = `플로우 {전체 수}개 중 {후보가 아닌 수}개를 그렸어요.` + 깊게 그린 첫 플로우의 사용자의 한마디, `.tag` = ① 최종 수정일 ② 플랫폼 | — |
| Flow Map | `#map`의 `.board` (아래 예시). 열 4개는 항상 이 순서: 후보 / 기획 완료 / UI 구현 / 기능 구현(`.is-done`). 깊게 그린 플로우의 `.board-item`은 `a href="#f1"`로 감싼다. 뺐거나 합친 플로우는 보드에 넣지 않는다. 보드 아래 기능 커버리지 문장을 `p.source`로 | `Map` / 플로우 지도 |
| Screens | `#screens`의 `.table-wrap` 표: 화면(`tbody th`) / 등장 플로우 / 목적 / 상세(`F1 ①` → `#f1` 링크) | `Screens` / 화면 목록 |
| 깊게 그린 플로우 하나 | 플로우마다 `section#f{n}` (아래 "플로우 섹션") | `F{n} · {상태}` / `{이름}` |

## Flow Map 보드

```html
<div class="board">
  <div class="board-col"><h3>후보 <span class="count">2</span></h3>
    <div class="board-item"><span class="flow-id">F2</span><strong>반납하기</strong><p>"반납일이 언제였지?"</p></div>
  </div>
  <div class="board-col"><h3>기획 완료 <span class="count">1</span></h3>
    <a class="board-item" href="#f1"><span class="flow-id">F1</span><strong>첫 대여 요청</strong><p>"근처에 빌릴 책 있나?"</p></a>
  </div>
  <div class="board-col"><h3>UI 구현 <span class="count">0</span></h3></div>
  <div class="board-col is-done"><h3>기능 구현 <span class="count">0</span></h3></div>
</div>
```

## 플로우 섹션

순서: 목표 순간 → 화면 카드 → 단계 표 → 화면 상태 → 예외 → 첫 버전 범위 → 구현 점검 → 변경 기록. md에 없는 항목은 생략한다.

모든 블록 앞에 `.sub` 라벨을 단다: 화면 · 단계 · 화면 상태 · 예외 · 첫 버전 범위 · 구현 점검 · 변경 기록 (목표 순간은 라벨 없이 맨 위).

1. **목표 순간** — `.callout` 안 `p.big` = md의 "목표 순간" 줄, `.kv` = 진입 동기 / 상태 변화.
2. **화면 카드** — `.phones`(PRODUCT.md 기준 뷰포트가 데스크톱 우선이면 `.phones.is-desktop`). 단계마다 `.phone` 하나. 같은 화면이 두 단계에 나오면 카드도 두 번 그린다(순간이 다르므로).
   - `.phones`의 `style`에 DESIGN.md 값을 `--ds-…` 변수로 넣는다. 변수 목록과 찾는 법은 `DESIGN.md` 구성 문서(views/DESIGN.md)의 "컴포넌트 미리보기"와 같다. DESIGN.md가 없으면 `style` 없이 그린다(템플릿 기본 색).
   - `.phone-screen` 안은 **그 화면을 직접 그린다**(아래 "화면 그리기").
   - 문구는 md에 적힌 그대로 쓰되, `(임시)` 표시는 화면 카드 안에서는 뺀다(md와 표에는 남는다).
   - 같은 화면이 다른 플로우에서 이미 정의돼 "참고"로만 적혀 있으면, 그 플로우의 요소를 가져와 그린다.
   - `.phone-note` = 단계 표의 "주 행동" 칸 그대로.
3. **단계 표** — `.table-wrap`: 단계(`tbody th`) / 화면 / 기능 / 주 행동 / 핵심 결정.
4. **화면 상태** — `.table-wrap`: 화면(`tbody th`) / 빈 / 로딩 / 오류. 칸에는 상황과 문구를 짧게, 문구는 따옴표째. 해당 없으면 `—`. "F1 ① 참고"인 화면은 표에 넣지 않는다.
5. **예외** — `.table-wrap`: 단계 / 상황 / 어떻게 동작하나.
6. **첫 버전 범위** — `.compare`: `.compare-col.is-do` h3 = `첫 버전에 넣음`, 클래스 없는 `.compare-col` h3 = `나중에`. 건너뛴 기본값이 있으면 아래 `p.source`에 `기본값으로 둔 것: …`.
7. **구현 점검** — 있을 때만. `.table-wrap`: 단계(`tbody th`) / 화면 있음 / 실제 동작 / 근거. ✓·✗는 md 그대로.
8. **변경 기록** — `.sub` "변경 기록" + `ul.refs`.

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

## 화면 그리기

화면 카드는 정해진 부품에 끼워 맞추지 않는다. **화면마다 FLOWS.md의 스케치와 핵심 요소를 보고, 그 배치 그대로 직접 html·css로 그린다.** 가로로 이어지는 사진 줄, 격자, 겹친 카드, 지도 위 핀, 아래에서 올라온 시트 — 스케치에 있는 모양이면 무엇이든 그 모양으로 그린다.

- **수준:** 간이 화면이다. 사진·지도·아이콘 자리는 옅은 면이나 단순한 도형으로, 글자는 md의 실제 문구로. 정교한 장식보다 **무엇이 어디에 어떤 모양으로 있는지**가 한눈에 보이면 된다.
- **디자인 값:** 색·글꼴·모서리·그림자는 `.phones`에 넣은 `--ds-…` 변수(`var(--ds-primary)` 등)로 쓴다. 새 색을 직접 쓰지 않는다. DESIGN.md가 없으면 템플릿 색을 쓴다.
- **스타일 쓰는 곳:** 화면별 css는 템플릿 `<style>` 아래 추가 `<style>` 블록 하나에 모은다. 다른 섹션에 번지지 않게 화면마다 고유 class로 감싼다(예: `.scr-f1-home …`). 간단한 건 `style=""`도 된다. `.ph-*`·`.ds-*` 부품은 필요하면 가져다 써도 되지만 꼭 쓸 필요는 없다.
- **틀:** 넓은 페이지에서 화면 카드 폭은 모바일 약 300px(실제 390px의 약 3/4), 데스크톱 약 640px이다. 그 안에서 그리고 밖으로 넘치지 않게 한다. 실제 화면을 조금 줄여 그린 것이므로 글자·간격도 그 비율로 쓴다(본문 약 12~13px, 제목 약 18~20px).
- **지어내지 않는다:** md에 없는 요소·문구는 넣지 않는다. 목록·칸 개수처럼 md가 정하지 않은 반복 수는 화면이 이해될 만큼만(보통 3~8개) 그린다.
- **확인:** 다 그린 뒤 html을 열어(또는 캡처해) 화면 카드가 스케치와 같은 모양인지 본다.

