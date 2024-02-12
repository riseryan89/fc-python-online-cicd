# 기본 이미지를 설정합니다. AWS에서 제공하는 Python 3.11 런타임 환경을 사용합니다.
FROM public.ecr.aws/lambda/python:3.11

# 작업 디렉토리를 설정합니다.
WORKDIR /var/task

# 종속성 파일을 복사하고 설치합니다.
COPY last_chapter/model_creator/requirements.txt .
RUN python -m pip install -r requirements.txt

# Lambda 함수 코드를 복사합니다.
COPY last_chapter/model_creator/lambda_function.py .

# Lambda 함수 핸들러를 설정합니다.
CMD ["lambda_function.lambda_handler"]
