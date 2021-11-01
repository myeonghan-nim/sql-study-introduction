# SQL과 django ORM

## 기본 준비 사항

* https://bit.do/djangoorm에서 csv 파일 다운로드

* django app

  * `django_extensions` 설치

  * `users` app 생성

  * csv 파일에 맞춰 `models.py` 작성 및 migrate

    아래의 명령어를 통해서 실제 쿼리문 확인

    ```bash
    $ python manage.py sqlmigrate users 0001
    ```

* `db.sqlite3` 활용

  * `sqlite3`  실행

    ```bash
    $ ls
    db.sqlite3 manage.py ...
    $ sqlite3 db.sqlite3
    ```

  * csv 파일 data 로드

    ```sqlite
    sqlite > .tables
    auth_group                  django_admin_log
    auth_group_permissions      django_content_type
    auth_permission             django_migrations
    auth_user                   django_session
    auth_user_groups            auth_user_user_permissions  
    users_user
    sqlite > .mode csv
    sqlite > .import users.csv users_user
    sqlite > SELECT COUNT(*) FROM users_user;
    100
    ```

* 확인

  * sqlite3에서 스키마 확인

    ```sqlite
    sqlite > .schema users_user
    CREATE TABLE IF NOT EXISTS "users_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "first_name" varchar(10) NOT NULL, "last_name" varchar(10) NOT NULL, "age" integer NOT NULL, "country" varchar(10) NOT NULL, "phone" varchar(15) NOT NULL, "balance" integer NOT NULL);
    ```

    

## 문제

> 아래의 문제들을 sql문과 대응되는 orm을 작성 하세요.

### 기본 CRUD 로직

1. 모든 user 레코드 조회

   ```python
   User.objects.all()
   ```

   ```sql
   SELECT * FROM users_user;
   ```

2. user 레코드 생성

   ```python
   User.objects.create(
      first_name='나다',
      last_name='가',
      age=31,
      country='경기도',
      phone='010-4567-4567',
      balance=101000
   )
   ```

   ```sql
   INSERT INTO users_user
   VALUES (101, '길동', '홍', 30, '제주특별자치도', '010-1234-1234', 100000);
   ```

   * 하나의 레코드를 빼고 작성 후 `NOT NULL` constraint 오류를 orm과 sql에서 모두 확인 해보세요.

3. 해당 user 레코드 조회

   ```python
   User.objects.get(id=102)
   ```

   ```sql
   SELECT * FROM users_user WHERE rowid=102;
   ```

4. 해당 user 레코드 수정

   ```python
   user = User.objects.get(id=102)
   user.age = 26
   user.save()
   ```

   ```sql
   UPDATE users_user
   SET last_name='라'
   WHERE id=102;
   ```

5. 해당 user 레코드 삭제

   ```python
   user = User.objects.get(id=102)
   user.delete()
   # same as User.objects.get(id=102).delete()
   ```

   ```sql
   DELETE users_user WHERE id=102;
   ```

### 조건에 따른 쿼리문

1. 전체 인원 수 

   ```python
   User.objects.all().count()
   # same as User.objects.count() or len(User.objects.all())
   ```

   ```sql
   SELECT COUNT(*) FROM users_user;
   ```

2. 나이가 30인 사람의 이름

   ```python
   User.objects.filter(age=30).values('first_name')
   ```

   ```sql
   SELECT first_name FROM users_user WHERE age=30;
   ```

3. 나이가 30살 이상인 사람의 인원 수

   ```python
   User.objects.filter(age__gte=30).count()
   ```

   ```sql
   SELECT COUNT(*) FROM users_user WHERE age>=30;
   ```

4. 나이가 30이면서 성이 김씨인 사람의 인원 수

   ```python
   User.objects.filter(age=30, last_name='김').count()
   # same as User.objects.filter(age=30).filter(last_name='김').count()
   ```

   ```sql
   SELECT COUNT(*) FROM users_user
   WHERE age=30 AND last_name='김';
   ```

5. 지역번호가 02인 사람의 인원 수

   ```python
   User.objects.filter(phone__startswith='02-').count()
   ```

   ```sql
   SELECT COUNT(*) FROM users_user
   WHERE phone LIKE '02-%';
   ```

6. 거주 지역이 강원도이면서 성이 황씨인 사람의 이름

   ```python
   User.objects.filter(country='강원도', last_name='황')[0].first_name
   ```

   ```sql
   SELECT first_name FROM users_user
   WHERE country='강원도' AND last_name='황';
   ```



### 정렬 및 LIMIT, OFFSET

1. 나이가 많은 사람 10명

   ```python
   User.objects.order_by('-age')[:10].values()
   ```

   ```sql
   SELECT * FROM users_user ORDER BY age DESC LIMIT 10;
   ```

2. 잔액이 적은 사람 10명

   ```python
   User.objects.order_by('balance')[:10].values()
   ```

   ```sql
   SELECT * FROM users_user ORDER BY balance ASC LIMIT 10;
   ```

3. 성, 이름 내림차순 순으로 5번째 있는 사람

   ```python
   User.objects.order_by('-last_name', '-first_name')[4]
   ```

   ```sql
   SELECT * FROM users_user
   ORDER BY last_name DESC, first_name DESC
   LIMIT 1 OFFSET 4;
   ```



### 표현식
> 이하 모든 명령어는 다음의 명령어를 처리한 뒤 진행해야 합니다.
> `from django.db.models import Avg, Min, Max, Sum`

1. 전체 평균 나이

   ```python
   from django.db.models import Avg, Min, Max, Sum
   User.objects.aggregate(Avg('age'))
   ```

   ```sql
   SELECT AVG(age) FROM users_user;
   ```

2. 김씨의 평균 나이

   ```python
   User.objects.filter(last_name='김').aggregate(Avg('age'))
   ```

   ```sql
   SELECT AVG(age) FROM users_user WHERE last_name='김';
   ```

3. 계좌 잔액 중 가장 높은 값

   ```python
   User.objects.aggregate(Max('balance'))
   ```

   ```sql
   SELECT MAX(balance) FROM users_user;
   ```

4. 계좌 잔액 총액

   ```python
   User.objects.aggregate(Sum('balance'))
   ```

   ```sql
   SELECT SUM(balance) FROM users_user;
   ```