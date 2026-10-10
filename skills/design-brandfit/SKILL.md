---
name: design-brandfit
description: 다른 곳에서 가져온 레퍼런스 DESIGN.md(디자인 시스템 문서)의 시각 표현은 그대로 유지하고, 메타정보·보이스·카피만 우리 브랜드에 맞게 부분 편집하는 스킬. docs/에서 DESIGN.md와 VOICE.md를 찾아 gap을 분석한 뒤, 색·간격·타이포 같은 시각 섹션은 건드리지 않고, VOICE.md·PRODUCT.md와 중복되는 전략·서사 섹션(Brand Narrative·Personas)은 섹션째 덜어내며, frontmatter·폰트/아이콘·이름·Voice&Tone·UI 카피만 브랜드 보이스에 맞춰 제자리 편집하고, 핵심 색·요소마다 "어디에 쓰고 어디엔 쓰지 않는지" 사용 경계를 추가한다(전면 재작성이 아니다). 결과는 색·글꼴·버튼을 실제로 그린 DESIGN.html 견본집으로도 만든다. 본문은 영어로, 실제 서비스에 들어갈 한국어 예시 문장·표현만 한국어로 보존한다. 사용자가 "가져온 DESIGN.md 우리 걸로 바꿔줘", "디자인 시스템 브랜드화", "DESIGN.md를 브랜드 보이스에 맞게", "레퍼런스 디자인 가져와서 우리 톤으로", "design.md 변환"이라고 할 때 사용한다. Vibe Studio 기획 플로우의 네 번째 단계다(brand-voice 다음, userflow-generator 앞).
---

# Design Brandfit

다른 서비스/디자인 시스템에서 **가져온 레퍼런스 `DESIGN.md`** 를 우리 것으로 만든다. 핵심 원칙은 하나다: **시각 표현(색값·간격·타이포·그림자·모션 수치)은 검증된 기반이므로 그대로 유지하고, 그 위에 얹힌 메타·보이스·카피만 우리 브랜드(`docs/VOICE.md`)에 맞게 변환한다.** 이 변환은 **전면 재작성이 아니라 바뀌는 섹션만 골라 편집하는 부분 편집**이며, VOICE.md·PRODUCT.md와 중복되는 전략·서사 섹션(Brand Narrative·Personas)은 변환하지 않고 섹션째 덜어낸다. 결과 문서의 본문은 영어로 쓰되, 실제 서비스 화면에 들어갈 한국어 카피·표현은 그 톤이 곧 브랜드의 문체이므로 한국어 그대로 보존한다.

이 스킬은 Vibe Studio 기획 플로우의 **네 번째 단계**로(brand-voice 다음, userflow-generator 앞), 디자인 시스템을 정비한다.

## 입력 / 산출물

docs 폴더 구조는 `<스킬경로>/../../assets/LAYOUT.md`를 따른다. 시작할 때 예전 구조로 저장된 문서(`docs/benchmark.md`, `docs/` 바로 아래의 html, `docs/SPEC.md` 등)가 보이면 그 문서의 "예전 구조에서 옮기기"대로 먼저 한 번 묻는다.

- **입력:**
  - `docs/DESIGN.md` — 외부에서 가져온 레퍼런스 디자인 시스템 문서. (Google Stitch DESIGN.md 9-섹션 포맷 + 필요 시 Voice/Narrative/Personas/States/Motion 등 확장 섹션을 포함하는 경우가 많다.)
  - `docs/VOICE.md` — brand-voice 스킬 산출물. 확정 서비스명·보이스·톤·금지선이 들어 있다.
- **산출물:**
  - 같은 `docs/DESIGN.md`. 시각 섹션은 그대로 두고, 불필요 섹션 삭제·frontmatter·폰트/아이콘·브랜드 텍스트 스팬·사용 경계(Usage Boundaries)만 제자리 편집한다(전면 재작성이 아니다).
  - `docs/report/DESIGN.html` — DESIGN.md의 색·글꼴·컴포넌트를 실제로 그려 보여주는 견본집. PRODUCT.html에도 디자인 요약이 붙는다.

### 시작 시
1. `docs/DESIGN.md`가 있는지 확인한다. 없으면 "변환할 레퍼런스 DESIGN.md가 docs/에 없어요. 먼저 레퍼런스를 가져다 두실래요?"라고 안내하고 멈춘다.
2. `docs/VOICE.md`가 있는지 확인한다. 없으면 "브랜드 보이스 기준이 없으면 변환의 방향을 잡을 수 없어요. brand-voice 스킬을 먼저 돌릴까요?"라고 묻는다.
3. 두 파일을 모두 읽은 뒤 Step 1로 간다.

---

## 레퍼런스 형식은 제각각이다

레퍼런스 DESIGN.md는 출처마다 형식이 다르다. Google Stitch의 9섹션 형식(§1 Visual Theme & Atmosphere …)도 있고, awesome-design-md처럼 frontmatter에 YAML 토큰(`colors`, `typography`, `rounded`, `spacing`, `components`)을 두고 본문을 Overview / Colors / Typography / Layout / Elevation / Components …로 나눈 형식도 있다. 이 문서에 나오는 섹션 이름(§1, Principles, States, Motion 등)은 **역할 기준의 예시**다. 실제 문서에서 같은 역할을 하는 섹션을 찾아 적용하고, 해당하는 섹션이 없으면 그 편집은 건너뛴다.

| 이 문서의 이름 | 같은 역할의 예 |
|---|---|
| §1 Visual Theme & Atmosphere | Overview, Introduction, Brand Feel |
| Principles | Design Principles, 각 섹션 안의 Principles 하위 항목 |
| States / Motion | Interaction States, Animation, Elevation 안의 상태 설명 |

**토큰 값이 기준이다.** 레퍼런스의 설명 문장과 토큰 값이 서로 다르면(예: 설명은 "8px 단위", 토큰은 4px) 값은 고치지 않고 토큰을 따른다. 어긋난 지점은 Step 2 gap에서 알리고 변환 노트의 "Known inconsistencies"에 적는다.

## Step 1 — 두 문서 읽고 매핑

`DESIGN.md`와 `VOICE.md`를 끝까지 읽는다. 읽으면서 머릿속에 매핑한다:

- `VOICE.md`의 **핵심 성격·톤 스펙트럼·금지선·Vocabulary·Voice 샘플**이 무엇인지.
- `DESIGN.md`의 각 섹션이 **순수 시각인지 / 시각이지만 근거가 브랜드에 묶였는지 / 순수 메타·콘텐츠인지**.

이 매핑이 다음 단계 gap 분석의 재료다.

---

## Step 2 — Gap 분석 (먼저 보여주고 합의)

변환에 들어가기 전에, `DESIGN.md`의 각 섹션을 **유지 / 변환 / 삭제로 분류**해 사용자에게 gap을 보여준다. 바로 편집하지 않는다.

| 레이어 | 처리 | 전형적 위치 |
|--------|------|-------------|
| **순수 시각 (그대로 유지)** | 손대지 않음 | 색값, 타이포 스케일/weight/line-height, 간격/그리드, 컴포넌트 수치, 그림자, 반응형, 모션 duration/easing, 아이콘 *스타일 규칙*(stroke·사이즈·채움) |
| **시각이지만 '의미·근거'가 브랜드에 묶임** | 수치는 유지, 서사·명명·근거만 재해석 | 분위기 서사(§1), 색의 *이름/스토리*, Principles, 시그니처 모션 *설명* |
| **하이브리드 — 기술적 필요로 추천/치환** | 수치는 유지, 구체 선택만 추가/치환 (명시·확인) | **아이콘 라이브러리**(스타일 수치 유지 + 라이브러리 1개 추천), **폰트 패밀리**(스케일·weight는 신성 유지 + 패밀리는 기술적 필요시 치환) |
| **순수 메타·콘텐츠 (전면 교체)** | 브랜드로 변환 | frontmatter, Voice & Tone, States의 *카피 예시*, 모든 CTA·카피 샘플 |
| **잉여 전략·서사 (삭제)** | 섹션째 제거 | Brand Narrative, Personas — VOICE.md·PRODUCT.md와 중복되는 확장 섹션. 무드는 §1 Visual Theme & Atmosphere가 책임지므로 따로 남길 필요 없음 |

그런 다음 **VOICE.md와 정면 충돌하는 지점**, 그리고 **기술적으로 메워야 할 gap**을 우선순위로 짚는다. 흔한 충돌·gap:
- **이모지 정책** — 레퍼런스가 "이모지 허용"인데 VOICE.md가 금지하면 충돌.
- **CTA 톤** — 레퍼런스의 명령형 vs VOICE.md의 제안형/금지조.
- **Forbidden phrases** — 레퍼런스 금지어를 VOICE.md의 금지선으로 교체.
- **Voice & Tone** — 거의 항상 100% 교체 대상. **Brand Narrative·Personas** — 거의 항상 삭제 대상(VOICE.md·PRODUCT.md와 중복, 무드는 §1이 담당).
- **브랜드 고유 명명** — 레퍼런스의 색 토큰명·시스템명·제품명(예: `carrot-*`, 특정 서비스명)은 메타이므로 변환 대상.
- **폰트 가용성·한글 커버리지** — 레퍼런스 폰트가 무료/라이선스 웹폰트로 없거나 한글을 지원하지 않으면(Vibe Studio는 항상 한국어 카피가 실제 화면에 들어간다) 한글 지원 웹폰트로 치환이 필요한 gap.
- **아이콘 스펙이 특정 라이브러리를 강제** — 레퍼런스가 duotone·멀티 weight를 요구하면 Phosphor만 충족하는 등, 스타일 스펙 자체가 라이브러리를 좁힌다.

이미 **정렬되어 손댈 필요 없는 부분**(예: 둘 다 무이모지, 둘 다 차분한 elevation)도 함께 알려줘 사용자가 변환 범위를 신뢰하게 한다.

**사용 경계(Usage Boundaries)를 제안한다.** 레퍼런스는 값(색·크기)은 주지만 "이걸 어디에만 쓰고 어디엔 쓰지 않는지"는 빠져 있는 경우가 많다. 이게 없으면 바이브 코딩에서 에이전트가 값은 지키면서 엉뚱한 곳에 쓴다(강조색으로 배경을 칠하는 식). 그래서 핵심 요소 4~6개에 대해 **값 → 의도 → 경계**를 한 줄씩 제안한다.
- **대상:** DESIGN.md에 실제로 있는 요소만. 우선순위는 강조/브랜드 색 → 상태 색(오류·성공) → 큰 제목 글꼴(display) → 그림자·elevation → 시그니처 모서리·모션.
- **근거:** ① 레퍼런스에 이미 있는 사용 규칙(있으면 그대로 옮긴다) ② VOICE.md의 성격·톤(예: "느긋한·차분한" → 강조색은 화면당 주요 행동 하나에만) ③ 아래 "색 결정 원칙". 근거 없이 지어내지 않는다.
- **형태:** `요소(토큰·값) / 쓰는 곳 / 쓰지 않는 곳`. 예: `accent-500 #FF6F0F / 화면당 주요 버튼 하나, 선택 상태 / 배경 면, 본문 글자, 장식`.
- 레퍼런스에 이미 충분한 경계 규칙이 있으면 "이미 있어요"라고 알리고 새로 만들지 않는다.

gap 분석·경계 제안·아이콘 추천·폰트 치환을 **한 번에 묶어** 짧게 보고하고, "이대로 변환할까요? 아니면 색·톤 같은 결정부터 합의할까요?"라고 한 번 확인한 뒤 Step 3로 간다. 항목마다 따로 묻지 않는다.

---

## Step 3 — 부분 편집 (시각 섹션은 건드리지 않는다)

합의되면 `DESIGN.md`를 **새로 쓰지 않는다.** 시각 섹션은 그대로 두고, 바꿔야 할 스팬만 골라 편집한다. 이 스킬이 하는 일은 딱 다섯 가지 편집뿐이다:

1. **불필요 섹션 삭제** — Brand Narrative, Personas 등 VOICE.md·PRODUCT.md와 중복되는 전략·서사 확장 섹션을 블록째 잘라낸다.
2. **frontmatter 작성** — 메타와 `runtime_deps`를 우리 서비스로 채운다.
3. **폰트/아이콘 교체** — 타이포의 font-family 토큰과 아이콘 라이브러리 결정만 치환하고 `runtime_deps`에 기록한다.
4. **브랜드 변환** — VOICE.md에 묶인 텍스트 스팬(Voice & Tone, §1의 *왜*, 색 이름/스토리, Principles 근거, States/Motion 카피 예시, CTA 샘플)만 다시 쓴다.
5. **사용 경계 추가** — Step 2에서 합의한 경계를 표로 추가한다. 디자인 전체 원칙을 담은 독립 섹션(Principles 등)이 있으면 그 끝에, 없으면 색 섹션 바로 뒤에 `### Usage Boundaries`를 둔다. (타이포그래피 안의 Principles 같은 하위 항목은 해당하지 않는다.) 수치는 바꾸지 않고 규칙 문장만 더하는 편집이다. 본문 언어 정책(Step 4)대로 영어로 쓴다.
   ```markdown
   ### Usage Boundaries
   | Element | Use for | Never use for |
   |---|---|---|
   | accent-500 (#FF6F0F) | One primary action per screen; selected state | Background fills, body text, decoration |
   ```

**편집하지 않는다 — 그래서 보존된다**
아래는 애초에 Edit 대상이 아니므로 byte-for-byte 그대로 남는다. "안 바꾸려고 노력"하는 게 아니라 "건드리지 않아서" 보존되는 것이다.
- 모든 색 **값**(hex/rgba), 타이포 사이즈·weight·line-height, 4px 간격 체계, radius 스케일, 그림자 정의, 브레이크포인트·터치 타깃, 모션 duration/easing 토큰 값.
- 컴포넌트 수치, 아이코노그래피 *스타일* 규칙, Document Policies 구조.

**변환 — 브랜드로 다시 쓴다**
- **frontmatter:** 레퍼런스 frontmatter에 **있는 메타 필드만** 우리 서비스로 바꾼다(`name`, `description`, `id`, `ds.name` 등). 레퍼런스에 없는 필드는 아래 세 개만 추가한다: `verified`(오늘 날짜), `reference`(레퍼런스 출처 — 이름과 URL), `runtime_deps`. `homepage`·`logo`처럼 채울 값이 없는 필드는 만들지 않는다. 토큰(YAML의 colors·typography 등)은 이름 변경 외에는 건드리지 않는다.
- **frontmatter `runtime_deps`:** 추천 확정된 아이콘 패키지와 치환 확정된 폰트 패밀리를, 다운스트림(프로토타이핑·바이브 코딩)이 산문을 읽지 않고 프론트매터만 보고 `import`할 수 있도록 machine-readable 블록으로 기록한다. `icons`에는 아래 표의 **npm 패키지명**(라이브러리 이름이 아니라 `lucide-react` 같은 실제 패키지)을, `fonts`에는 폰트 **패밀리명** 배열을 넣는다. (React 기준.)
  ```yaml
  runtime_deps:
    icons: lucide-react              # 아이콘 표의 npm 패키지명
    fonts: [Pretendard, "Noto Serif KR"]   # 치환 확정된 패밀리명
  ```
- **명명:** 레퍼런스 고유 토큰명(예: `carrot-*` → `accent-*`), 색 이름(예: "Karrot Orange" → 우리 브랜드 색명), 디자인 시스템명, 제품명 전부 교체. *렌더링은 동일하되 이름만 탈(脫)레퍼런스화.*
- **§1 Visual Theme & Atmosphere:** 무드 묘사 자체(시각)는 두고, 분위기를 *왜* 그렇게 잡았는지 **근거·메타포만** VOICE.md로 재해석한다. 여기에 히스토리·지표 같은 없는 사실을 끌어오지 않는다 — 신규 서비스면 철학 서술로만.
- **Voice & Tone:** 레퍼런스에 이 섹션이 있으면 VOICE.md의 컨텍스트 표·금지선·Voice 샘플로 전면 교체한다. **없으면 새로 만들지 않는다** — 보이스는 VOICE.md가 맡는다.
- **CTA·UI 카피 예시:** 레퍼런스 본문의 카피 예시는 VOICE.md에 있는 실제 문구(상황별 톤 예시, 쓰는 말)로 바꾼다. 맞는 문구가 없으면 PRODUCT.md의 기능 이름을 쓴다. 새 문구를 지어내지 않는다.
- **레퍼런스 업종 전용 요소:** 레퍼런스 서비스에만 있는 컴포넌트·토큰(예: 숙소 예약 카드, 가격 표시, 호스트 배지, 서브브랜드 색)은 값과 구조는 그대로 둔다. 우리 기능에 대응되면 이름과 설명을 그 기능으로 바꾸고(예: `rating-display` → 빌려준 권수 표시), 대응이 없으면 이름 옆에 `(unused — reference-specific)`을 붙인다. 바이브 코딩 때 그대로 따라 만들지 않게 하기 위해서다.
- **States/Principles/Motion 설명:** 구조·수치는 유지, **근거와 예시 카피만** 브랜드로 재해석. (예: spring 금지 근거를 "마켓 신뢰"에서 우리 톤으로.)

**삭제 — 통째로 잘라낸다**
- **Brand Narrative / Personas** 같은 전략·서사 확장 섹션: VOICE.md와 PRODUCT.md가 이미 다루므로 디자인 시스템 문서에선 덜어낸다. 레퍼런스에 있어도 변환하지 말고 섹션째 제거한다. (무드는 §1 Visual Theme & Atmosphere가 책임지므로 따로 남길 필요 없다.)

**하이브리드 — 수치 유지 + 근거 재해석**
- Principles, 시그니처 모션, Whitespace 철학처럼 "값은 맞지만 *왜*가 레퍼런스에 묶인" 항목은 수치를 두고 설명 문장만 바꾼다.

**아이콘 라이브러리 추천 (스타일 수치는 유지, 구체 라이브러리만 추가):**
레퍼런스의 아이콘 **스타일 규칙**(stroke 굵기·사이즈·아웃라인/채움·corner)은 시각이므로 그대로 둔다. 다만 레퍼런스가 보통 *구체 라이브러리*는 안 정하는데 바이브 코딩은 `import`할 패키지가 필요하므로, **VOICE.md 성격 × 레퍼런스 아이콘 스타일 스펙**에 맞춰 아래 4개 중 1개를 근거 한 줄과 함께 추천한다. (자동 확정하지 않고 Step 2 gap에서 확인.)

| 라이브러리 | npm 패키지 (React) | 성격 | 잘 맞는 브랜드 |
|---|---|---|---|
| **Lucide** | `lucide-react` | 균일 2px 아웃라인, 중립·깔끔, ~1500개. 사실상 디폴트 | 대부분의 무난·신뢰 톤 |
| **Phosphor** | `@phosphor-icons/react` | 6 weight(thin~fill·duotone), 둥근 join, 방대 | 따뜻함·친근·플레이풀 |
| **Heroicons** | `@heroicons/react` | outline/solid/mini, 약간 기하학적, ~300 | Tailwind 스택, 정갈 |
| **Radix** | `@radix-ui/react-icons` | 15px 미니멀·기하, ~300 | 밀도 높은 pro/dev 툴, 정밀 |

레퍼런스 스타일 스펙이 라이브러리를 강제하면(예: duotone·멀티 weight → Phosphor만 충족) 그 제약을 명시한다. 넷 다 MIT/오픈. 확정한 라이브러리의 **npm 패키지명**을 frontmatter `runtime_deps.icons`에 그대로 기록한다(Step 3 frontmatter 참조).

**폰트 패밀리 치환 (기술적 필요 한정 예외):**
타이포의 **스케일·weight·line-height·letter-spacing은 신성하게 유지한다.** 다만 폰트 *패밀리*는 두 조건일 때만 치환한다: ① 레퍼런스 폰트가 무료/라이선스 웹폰트로 존재하지 않거나, ② 한글을 지원하지 않을 때(Vibe Studio는 한국어 카피가 실제 화면에 들어가므로 한글 지원이 사실상 필수). 치환 시 레퍼런스 폰트의 **personality(기하학/휴머니스트/세리프)에 가장 가까운 한국어 웹폰트로 매칭**하고, 변환 노트에 "레퍼런스 X → 한글 지원 위해 Y로 치환"을 명시한 뒤 Step 2 gap에서 확인한다.

| 레퍼런스 느낌 | 1순위 | 대안 |
|---|---|---|
| Inter/Geist/기하학 sans (가장 흔함) | **Pretendard** (Inter류 Latin + 우수한 한글, variable, OFL) | Wanted Sans, SUIT |
| 최대 호환·안전 baseline | **Noto Sans KR** (구글 호스팅, 전 글리프, 다중 weight) | — |
| 중립·휴머니스트 UI | **Spoqa Han Sans Neo** | Noto Sans KR |
| 세리프/에디토리얼 | **Noto Serif KR** | 나눔명조, Gowun Batang |

기본은 **Pretendard 우선, 케이스별 조정**(세리프/특수 personality면 매칭 우선, 최대 호환 필요하면 Noto). 폰트 스택은 `Pretendard, -apple-system, ..., sans-serif`처럼 fallback과 시스템 폰트까지 명시하고 라이선스(OFL)를 한 줄 적는다.

**색 결정 원칙:** 사용자가 "시각 유지"를 요청한 이상 **색값은 바꾸지 않는다.** 색의 *이름·근거*만 브랜드 메타포로 재해석한다. 브랜드 톤과 색이 긴장 관계면(예: 차분한 보이스 vs 비비드한 액센트) "액센트는 의도적으로 희소" 같은 원칙으로 관리하도록 문서에 명시하고, 색 자체를 바꾸고 싶은지는 **별도로** 묻는다.

---

## Step 4 — 언어 정책 (본문 영어 + 한국어 카피 보존)

변환된 문서는 **본문(설명·구조·서사)을 영어로** 쓴다. 단, **실제 서비스에 들어갈 한국어 예시 문장·표현은 그 자체가 브랜드의 문체이므로 한국어 그대로 둔다.**

**한국어로 보존하는 것 (실제 문체):**
- Voice 샘플 — 온보딩·빈 상태·성공·에러·푸시·랜딩 등 실제 카피 문장.
- Voice & Tone 컨텍스트 표의 **괄호 안 예시 문구**.
- **Forbidden phrases** — 실제 금지 문구 (분류 라벨은 영어).
- **CTA 레이블** — 버튼에 실제로 들어갈 한국어(예: `오늘 칸 열기`).
- **States 표의 실제 UI 카피 문자열**.
- 존댓말 어미·화법(`~해요`, `~할까요` 등 보이스 정의에 필요한 표현).
- **브랜드 고유 어휘** — 서사 본문에선 영어로 풀되 첫 등장 시 `frame (칸)`처럼 한국어 병기.

**영어로 쓰는 것:** §1~9 본문, Voice/Principles/States/Motion의 설명·근거, treatment 서술, 변환 노트·footer. 아이콘 라이브러리명(Lucide 등)·폰트명(Pretendard 등)은 고유명사이므로 영어 표기 그대로 둔다(병기 불필요).

**고유명사 병기:** 서비스명은 첫 등장 시 `BrandName (브랜드명)`처럼 한글+로마자 병기. (병기는 문체 보존이 아니라 고유명사 표기 규칙.)

> 변환 노트(주석 블록)와 footer에는 "시각 토큰은 레퍼런스에서 유지, 메타·보이스는 VOICE.md 기반 재작성", voice 샘플의 검증 상태(신규 서비스면 미검증 기획 카피), 색 결정 근거를 영어로 남긴다. 변환 노트 맨 위에는 **레퍼런스 출처(이름·URL)** 를 꼭 적는다(DESIGN.html 표지가 이 값을 쓴다).

---

## Step 5 — 저장 & 보고

편집은 **`docs/DESIGN.md`에 제자리로 적용한다** — 시각 섹션은 그대로 둔 채 바뀐 스팬만 반영된다. ("저장할까요?"라고 묻지 않는다 — 적용이 결과물이다.)

적용 후 짧게 보고한다:
- **유지한 것** (시각 토큰 한 줄 요약),
- **삭제한 것** (Brand Narrative·Personas 등 덜어낸 섹션),
- **변환한 것** (섹션별: frontmatter·명명·§1 근거·Voice·States),
- **추가한 사용 경계** (몇 개, 핵심 한 줄),
- **추천·치환한 것** (추천한 아이콘 라이브러리, 폰트 치환 내역: 레퍼런스 X → Y와 이유) — **프론트매터 `runtime_deps`에 패키지명·폰트 패밀리로 기록했음을 명시**,
- **한국어로 보존한 카피**,
- **짚어둘 판단** (특히 색값 유지 결정, 미검증 voice 샘플 등),
- 이어서: "다음은 **userflow-generator**로 핵심 기능의 화면 흐름을 그려요. 이 DESIGN.md는 그 화면들과 이후 바이브 코딩의 기준이 돼요."

### DESIGN.html 만들기

DESIGN.md 편집을 적용한 뒤 `<스킬경로>/../../assets/REPORT.md`의 절차대로 html을 만든다. html은 대화 내용이 아니라 **저장된 md 파일만** 보고 채운다.

1. `docs/report/DESIGN.html`을 만든다(구성: `assets/views/DESIGN.md`). DESIGN.md의 실제 색·글꼴·수치로 견본과 컴포넌트 미리보기를 그린다.
2. 새 html이 생겼으므로 `docs/`의 다른 html 사이드바를 REPORT.md 규칙대로 갱신한다.
3. `docs/report/PRODUCT.html`이 있으면 다시 만들어 디자인 요약 섹션을 붙인다(구성: `assets/views/PRODUCT.md`). 곧 통째로 다시 만들어지므로 2번에서 PRODUCT.html은 건너뛰어도 된다.

보고 끝에 "브라우저로 `docs/report/DESIGN.html`을 열면 우리 서비스의 색·글꼴·버튼을 실제로 볼 수 있어요"를 덧붙인다.

### 결정 기록 — docs/DECISIONS.md

적용 후 Step 2 gap에서 사용자가 확인한 결정을 `docs/DECISIONS.md`에 한 줄씩 추가한다:
- 레퍼런스 DESIGN.md 출처 (어느 서비스·디자인 시스템을 기반으로 했는지)
- 아이콘 라이브러리 (추천 근거, 검토한 다른 후보)
- 폰트 치환 (레퍼런스 X → Y, 이유) — 치환하지 않았으면 생략
- 색값 유지/변경 결정
- 덜어낸 섹션 (Brand Narrative·Personas 등)
- 사용 경계 중 핵심 1~2개 (특히 강조색)

파일이 없으면 헤더째 만든다. 형식:

```markdown
| ID | 날짜 | 단계 | 결정 | 이유 · 버린 대안 | 상태 |
|----|------|------|------|-----------------|------|
| D-00N | <YYYY-MM-DD> | design-brandfit | 아이콘: Lucide (`lucide-react`) | <근거> · 검토: Phosphor | 유효 |
```

사용자가 고르거나 확인한 것만 적고(이유도 대화에서 나온 것만, 없으면 `—`. 버린 대안이 없으면 그 부분은 뺀다), ID는 이어서 매기며, 기존 줄은 지우지 않는다(바뀌면 새 줄 추가 + 기존 줄 상태를 `번복 → D-00N`으로).

## 원칙
- **새로 쓰지 않고 고친다.** 이 스킬은 DESIGN.md를 재생성하지 않는다 — 불필요 섹션 삭제·frontmatter·폰트/아이콘·브랜드 스팬만 부분 편집하고, 시각 섹션은 Edit 대상에서 빼서 그대로 보존한다.
- **시각은 신성하다.** 색값·수치는 검증된 기반 — 사용자가 명시적으로 바꾸자고 하기 전엔 손대지 않는다. **단 폰트 패밀리는 유일한 예외**로, 웹 가용성·한글 커버리지라는 기술적 필요에 한해 personality를 보존하며 치환할 수 있다(명시·확인 필수). 스케일·weight·line-height 등 수치는 폰트에서도 여전히 신성하다.
- **빈 곳은 메우되 덮어쓰지 않는다.** 아이콘 라이브러리·폰트 패밀리처럼 레퍼런스에 비어 있고 바이브 코딩에 필요한 결정은 추천으로 채우되, 자동 확정하지 않고 gap에서 확인한다.
- **사실을 지어내지 않는다.** 레퍼런스의 연혁·지표를 우리 것으로 위조하지 않는다. 신규 서비스는 철학 서술로.
- **문체는 보존한다.** 실제 한국어 카피는 번역하지 않는다 — 그게 브랜드의 목소리다.
- **gap을 먼저 보여준다.** 덮어쓰기 전에 무엇을 유지/변환하는지 합의한다.
- **값만이 아니라 경계까지.** 수치는 레퍼런스를 따르되, "어디에 쓰고 어디엔 안 쓰는지"가 비어 있으면 합의해서 채운다.
