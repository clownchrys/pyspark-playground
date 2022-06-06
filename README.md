# 개요
- S3와 연동되는 PySpark 실습 환경 제공을 위함
- 보안망으로 인한 이슈를 피하기 위해 이미지를 tar 파일로 빌드하여 푸시함 (git lfs 사용)

# 각 서비스 컨테이너 설명
- spark
    - 실제 개발 환경
    - 싱글 클러스터 Spark 환경 제공
    - PySpark 노트북 제공 (컨테이너 생성 후에 http://localhost:8888)
    - 필요한 로컬 파일은 `./spark/workspace` 디렉토리에 넣어 사용
    - 기타 추가 설치된 패키지: `boto3`
- localstack
    - S3 구현체
    - 최신 AWS SDK 의 S3 scheme 미지원으로 인해, S3 URI는 `s3a://bucket_name/path/to/file` 형태로 사용
    - 기본 버킷으로 `default` 를 자동 생성함
- dashboard
    - S3 버킷 및 파일 조회 (*삭제 및 생성 불가*) 를 위한 간단한 웹 서비스

# Makefile 지원
make 사용이 가능한 환경이라면, docker compose 명령어를 다음과 같이 축약 사용 가능
- `make up`: 컨테이너 생성
- `make down`: 컨테이너 제거
- `make status`: 컨테이너 상태 확인