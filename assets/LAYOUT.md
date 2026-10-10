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
└─ work/                                                     ← 만들기 단계
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
| `work/SETUP.md` | build-spec | build-spec |
| `work/LOG.md` | build-slice | build-slice |
| `work/NN-이름/SPEC.md` | build-spec | build-slice(체크 표시만) |
| `work/NN-이름/REVIEW.md`, `shots/` | build-check | build-check |

## 작업 묶음 (work/ 아래 폴더)

build-spec을 한 번 부를 때마다 묶음이 하나 생긴다. 묶음은 **목표 하나와 조각 3~6개**이고, 다 만들면 build-check로 점검하는 단위다. 플로우 하나와 같을 때가 많지만 꼭 그렇지는 않다.

| 예 | 폴더 이름 |
|---|---|
| F1 첫 방문을 화면으로 (목표: UI 구현) | `01-f1-first-visit` |
| F1을 진짜로 동작하게 (목표: 기능 구현) | `02-f1-real` |
| 프로토타입에서 Next.js로 옮기기 | `03-move-to-nextjs` |
| F1·F2에 걸친 로그인을 진짜로 | `04-real-login` |

- **이름:** `{두 자리 순번}-{짧은 영문 소문자 이름}`. 단어는 `-`로 잇는다. 순번은 work/ 안의 가장 큰 순번 + 1.
- **플로우 하나에 해당하면** 이름 앞에 `f1-`처럼 플로우 ID를 붙인다. 여러 플로우에 걸치거나 플로우와 무관하면 붙이지 않는다. 어느 플로우와 관련 있는지는 SPEC.md 머리말의 `관련 플로우:`가 기준이다.
- **한 번 만든 폴더 이름은 바꾸지 않는다.** 플로우 이름이 FLOWS.md에서 바뀌어도 그대로 둔다. 묶음은 그때 한 작업의 기록이다.
- 영문으로 쓰는 이유: 한글 폴더 이름은 git에서 깨진 글자로 보일 때가 있다.
- 만들기 폴더 이름이 `build/`가 아니라 `work/`인 이유: `build/`는 흔한 `.gitignore` 템플릿에 들어 있어서, 그 이름이면 기록이 커밋에서 통째로 빠질 수 있다.

**지금 할 묶음** — build-slice는 **순번이 가장 낮고 체크 안 된 조각이 남은 묶음**을 이어서 만든다. build-check는 **조각이 다 체크된 묶음 중 순번이 가장 높은 것**을 점검한다.
