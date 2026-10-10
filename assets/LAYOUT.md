# Vibe Studio docs 폴더 규칙

모든 스킬은 산출물을 이 구조대로 저장한다. 파일을 만들거나 찾을 때 경로는 여기를 기준으로 한다.

```
docs/
├─ PRODUCT.md  BENCHMARK.md  VOICE.md  DESIGN.md  FLOWS.md   ← 기획 원본 (에이전트가 읽는 md)
├─ DECISIONS.md                                              ← 결정 기록 (모든 스킬이 함께 씀)
├─ report/                                                   ← 사람이 보는 html
│  ├─ index.html       첫 화면으로 넘겨주는 입구
│  └─ PRODUCT.html  BENCHMARK.html  VOICE.html  DESIGN.html  FLOWS.html
├─ images/                                                   ← 벤치마크 화면 캡처
└─ build/                                                    ← 만들기 단계
   ├─ SETUP.md         모든 묶음이 같이 쓰는 것 (스택·데이터·흉내 낼 것·이번엔 안 함)
   ├─ LOG.md           작업 기록 — 조각 완료·고침·되돌림을 시간순으로 한 곳에
   └─ 01-f1-first-visit/   작업 묶음 하나 (build-spec 한 번 = 묶음 하나)
      ├─ SPEC.md       이 묶음의 목표와 조각 체크리스트
      ├─ REVIEW.md     이 묶음을 다 만든 뒤 써본 점검 기록 (최신이 위)
      └─ shots/        점검 스크린샷
```

## 파일별 주인

| 경로 | 만드는 스킬 | 고치는 스킬 |
|---|---|---|
| `PRODUCT.md` | brainstorming-idea | benchmark-research(포지셔닝), brand-voice(이름) |
| `BENCHMARK.md`, `images/` | benchmark-research | — |
| `VOICE.md` | brand-voice | — |
| `DESIGN.md` | design-brandfit | — |
| `FLOWS.md` | userflow-generator | userflow-generator |
| `DECISIONS.md` | 처음 결정을 남기는 스킬 | 모든 스킬(한 줄씩 추가) |
| `report/*.html` | md를 만든 스킬 (`REPORT.md` 절차) | md를 고친 스킬 |
| `build/SETUP.md` | build-spec | build-spec |
| `build/LOG.md` | build-slice | build-slice |
| `build/NN-이름/SPEC.md` | build-spec | build-slice(체크 표시만) |
| `build/NN-이름/REVIEW.md`, `shots/` | build-check | build-check |

## 작업 묶음 (build/ 아래 폴더)

build-spec을 한 번 부를 때마다 묶음이 하나 생긴다. 묶음은 **목표 하나와 조각 3~6개**이고, 다 만들면 build-check로 점검하는 단위다. 플로우 하나와 같을 때가 많지만 꼭 그렇지는 않다.

| 예 | 폴더 이름 |
|---|---|
| F1 첫 방문을 화면으로 (목표: UI 구현) | `01-f1-first-visit` |
| F1을 진짜로 동작하게 (목표: 기능 구현) | `02-f1-real` |
| 프로토타입에서 Next.js로 옮기기 | `03-move-to-nextjs` |
| F1·F2에 걸친 로그인을 진짜로 | `04-real-login` |

- **이름:** `{두 자리 순번}-{짧은 영문 소문자 이름}`. 단어는 `-`로 잇는다. 순번은 build/ 안의 가장 큰 순번 + 1.
- **플로우 하나에 해당하면** 이름 앞에 `f1-`처럼 플로우 ID를 붙인다. 여러 플로우에 걸치거나 플로우와 무관하면 붙이지 않는다. 어느 플로우와 관련 있는지는 SPEC.md 머리말의 `관련 플로우:`가 기준이다.
- **한 번 만든 폴더 이름은 바꾸지 않는다.** 플로우 이름이 FLOWS.md에서 바뀌어도 그대로 둔다. 묶음은 그때 한 작업의 기록이다.
- 영문으로 쓰는 이유: 한글 폴더 이름은 git에서 깨진 글자로 보일 때가 있다.

**지금 할 묶음** — build-slice는 **순번이 가장 낮고 체크 안 된 조각이 남은 묶음**을 이어서 만든다. build-check는 **조각이 다 체크된 묶음 중 순번이 가장 높은 것**을 점검한다.

## 예전 구조에서 옮기기

스킬을 시작할 때 docs/에 아래 중 하나가 있으면 예전 버전이 만든 구조다. 하던 일을 시작하기 전에 한 번 묻는다: "예전 폴더 구조로 저장된 문서가 있어요. 새 구조로 옮길까요?" 사용자가 원하지 않으면 예전 파일은 그대로 두고, 이번에 만드는 파일만 새 구조로 저장한다.

| 예전 | 새 위치 | 옮기는 법 |
|---|---|---|
| `docs/benchmark.md` | `docs/BENCHMARK.md` | 이름만 바꾼다. 다른 md 안의 `docs/benchmark.md` 표기도 바꾼다 |
| `docs/*.html` | `docs/report/` | 옮긴 뒤 `REPORT.md` 3번의 사이드바 갱신을 한 번 하고, BENCHMARK.html은 이미지 경로를 `../images/`로 고친다 |
| `docs/SPEC.md` | `docs/build/` | `## 정해둔 것` → `SETUP.md`. 플로우 섹션 하나(`## F1 · …`, `## F1 · … — 진짜로 동작하게`)마다 묶음 폴더 하나를 순서대로 만들어 `SPEC.md`로. `## 작업 기록` → `LOG.md`(각 줄 앞에 묶음 이름을 붙인다) |
| `docs/REVIEW.md`, `docs/review/` | 각 묶음의 `REVIEW.md`, `shots/` | 점검 섹션마다 제목의 플로우·목표가 맞는 묶음으로. 스크린샷도 함께 옮기고 이미지 경로를 `shots/…`로 고친다 |

- 파일은 `git mv`로 옮겨 기록이 이어지게 한다. 지우지 않는다.
- 옮긴 뒤 무엇을 어디로 옮겼는지 한두 줄로 알리고, 커밋한다(`문서 폴더 정리: 새 구조로 옮김`).
