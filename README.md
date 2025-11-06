# Damoang Go Backend 

다모앙 차세대를 위한 [gofiber](https://github.com/gofiber/fiber) 기반 Auth 서버입니다.

# Quick start
```bash
go run cmd/main.go
```

# Project Structure

> [!NOTE]
> [Standard Go Project Layout](https://github.com/golang-standards/project-layout)

```
 /
 ├── api/
 │   └── openapi.yaml        # API 명세서 (Swagger/OpenAPI)
 ├── cmd/
 │   └── main.go             # 애플리케이션 시작점, 의존성 주입 및 서버 실행
 ├── internal/
 │   ├── config/             # 설정 파일을 읽고 관리하는 로직
 │   ├── routes/             # 라우트 그룹화 및 등록 관리
 │   ├── middleware/         # 미들웨어 함수(인증, 로깅 등)
 │   ├── service/            # 비즈니스 로직 (핵심 기능)
 │   ├── repository/         # 데이터베이스 상호작용 (CRUD)
 │   └── models/             # 핵심 데이터 구조 (Structs)
 ├── configs/                # 설정 파일 템플릿이나 기본 설정들
 ├── utils/                  # 공통 유틸리티 함수 모음
 └── testdata/               # 테스트 데이터
```
