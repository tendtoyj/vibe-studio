# vibe-studio

바이브 코딩으로 신규 서비스를 기획하는 Claude Code / Codex 플러그인.

> 기존 [vibe-ux-skills](https://github.com/tendtoyj/vibe-ux-skills)(vibe-ux · vibe-build)의 통합 개편 버전입니다.

## 설치

### Claude Code

```
/plugin marketplace add tendtoyj/vibe-studio
/plugin install vibe-studio@vibe-studio
```

### Codex

Codex CLI에서 marketplace를 추가한 뒤 `/plugins`에서 `vibe-studio`를 설치합니다.

```
codex plugin marketplace add tendtoyj/vibe-studio
codex
/plugins
```

Codex app에서는 Plugins에서 추가된 marketplace를 열고 `Vibe Studio`를 설치합니다. 설치 후 새 thread에서 사용하는 것을 권장합니다.

## 기획 흐름

| 순서 | 스킬 | 만드는 파일 (`docs/`) |
|:---:|---|---|
| 1 | `brainstorming-idea` | `PRODUCT.md` — 컨셉·문제·타깃·핵심 기능 |
| 2 | `benchmark-research` | `benchmark.md` + `images/` — 경쟁사 리서치와 핵심 경쟁 화면 캡처. 결론은 `PRODUCT.md`의 포지셔닝 칸에 |
| 3 | `brand-voice` | `VOICE.md` — 확정 이름·보이스·톤 |
| 4 | `design-brandfit` | `DESIGN.md` — 가져온 레퍼런스 DESIGN.md를 우리 브랜드로 (레퍼런스는 직접 준비) |
| 5 | `userflow-generator` | `FLOWS.md` — 플로우 지도(Flow Map) + 핵심 플로우를 화면·상태·예외까지. 개발하면서 다시 불러 플로우를 하나씩 추가·갱신 |

- 단계마다 md와 함께 보기 좋은 html 리포트(`PRODUCT.html` 등)를 만듭니다. 왼쪽 사이드바로 문서 사이를 오갈 수 있습니다.
- 모든 단계는 사용자가 정한 것을 `DECISIONS.md`에 한 줄씩 쌓습니다. 다음 단계는 이 기록을 읽고 이미 정한 것을 다시 묻지 않습니다.

## 만들기 흐름

| 스킬 | 만드는 파일 (`docs/`) |
|---|---|
| `build-spec` | `SPEC.md` — 스택·데이터 방식·첫 버전에서 흉내 낼 기능을 정하고, 기획 완료된 플로우 하나를 눌러볼 수 있는 조각 3~6개로 쪼개 조각마다 확인 기준을 붙임. 플로우를 새로 만들 때마다 다시 부름 |

## 사용

Claude Code에서는 네임스페이스와 함께 호출합니다.

```
/vibe-studio:brainstorming-idea
/vibe-studio:benchmark-research
/vibe-studio:brand-voice
/vibe-studio:design-brandfit
/vibe-studio:userflow-generator
/vibe-studio:build-spec
```

Codex에서는 `$brainstorming-idea`처럼 `$`로 개별 스킬을 부르거나, "서비스 아이디어 잡아줘", "유저 플로우 그려줘", "이제 만들어보자"처럼 자연어로 요청하면 해당 스킬이 트리거됩니다.

## 라이선스

[MIT](./LICENSE)
