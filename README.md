# vibe-studio

바이브 코딩으로 신규 서비스를 기획하는 Claude Code 플러그인.

> 기존 [vibe-ux-skills](https://github.com/tendtoyj/vibe-ux-skills)(vibe-ux · vibe-build)의 통합 개편 버전입니다.

## 설치

```
/plugin marketplace add tendtoyj/vibe-studio
/plugin install vibe-studio@vibe-studio
```

## 기획 흐름

| 순서 | 스킬 | 만드는 파일 (`docs/`) |
|:---:|---|---|
| 1 | `brainstorming-idea` | `PRODUCT.md` — 컨셉·문제·타깃·핵심 기능 |
| 2 | `benchmark-research` | `benchmark.md` + `images/` — 경쟁사 리서치와 핵심 경쟁 화면 캡처. 결론은 `PRODUCT.md`의 포지셔닝 칸에 |
| 3 | `brand-voice` | `VOICE.md` — 확정 이름·보이스·톤 |
| 4 | `design-brandfit` | `DESIGN.md` — 가져온 레퍼런스 DESIGN.md를 우리 브랜드로 (레퍼런스는 직접 준비) |
| 5 | `userflow-generator` | `userflow.md` — 핵심 유저 플로우·화면 |

- 단계마다 md와 함께 보기 좋은 html 리포트(`PRODUCT.html` 등)를 만듭니다. 왼쪽 사이드바로 문서 사이를 오갈 수 있습니다.
- 모든 단계는 사용자가 정한 것을 `DECISIONS.md`에 한 줄씩 쌓습니다. 다음 단계는 이 기록을 읽고 이미 정한 것을 다시 묻지 않습니다.
