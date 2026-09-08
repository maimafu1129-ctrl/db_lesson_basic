-- Q1 部署テーブル追加
create table `departments`(
   department_id INT unsigned not null auto_increment PRIMARY KEY,
   name VARCHAR(20) not null,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
   );



-- Q2 peopleテーブルに部署カラムを追加
 ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
 DESC people;


-- Q3-1 departmentsテーブルに営業、開発、経理、人事、情報システムのレコードを追加
INSERT INTO department (name)
    values
    ('営業'),
    ('開発'),
    ('経理'),
    ('人事'),
    ('情報システム');

 


-- Q3-2 10人分のレコードを追加する,人数比率は営業3人、開発4人、経理1人、人事1人、情報システム1人
-- 存在する部署のIDが割り振られること/どう割り振るかは指定しませんが、必ずWHEREを使って条件を絞ってください
INSERT INTO people (name, email, age, gender,departments)
VALUES
('佐々木一郎', 'sasaki@gizumo.jp', 29, 1, 1),
('小林あかり', 'kobayashi@gizumo.jp', 26, 2, 2),
('中村大輔', 'nakamura@gizumo.jp', 38, 1, 4),
('加藤美香', 'kato@gizumo.jp', 34, 2, 2),
('早坂てつお', 'hayasaka@gizumo.co.jp', 61, 1, 1),
('吉田翔太','yoshida@gizumo.jp', 27, 1, 3),
('山田花子', 'hyamada@gizumo.jp', 28, 2, 2),
('佐藤健一', 'sato@gizumo.jp', 35, 1, 5),
('高橋美咲', 'takahashi@gizumo.jp', 24, 2, 2),
('伊藤直樹', 'ito@gizumo.jp', 42, 1, 1),




-- Q3-3 10件の日報を追加する
 INSERT INTO reports (person_id, content)
    VALUES
    (1, '本日は午前中に商品データの確認を行いました。午後は入力作業を進めました。'),
    (2, ' 本日はメールの確認と資料の整理を行いました。予定していた作業を完了しました'),
    (3, '本日はデータの更新作業を行いました。入力内容に間違いがないか確認しました。'),
    (4, '本日はチームで作業内容の確認を行いました。その後、担当している作業を進めました。'),
    (6, '本日はデータベースの確認を行いました。いくつかのデータを修正しました。'),
    (7, '本日は午前中に資料を作成し、午後は内容の確認と修正を行いました。'),
    (8,'本日は新しい作業の手順を確認しました。実際に作業を行い、基本的な流れを理解しました。'),
    (9, '本日は登録されている情報を確認しました。不要なデータを整理して作業環境を整えました。'),
    (10, '本日は担当している作業を予定通り進めました。最後に今日の作業内容を確認しました。');

   

-- Q4　department_id NULLを確認
UPDATE people SET department_id = 1 WHERE person_id IN (1);
UPDATE people SET department_id = 1 WHERE person_id IN (2);
UPDATE people SET department_id = 4 WHERE person_id IN (3); 
UPDATE people SET department_id = 2 WHERE person_id IN (4); 
UPDATE people SET department_id = 3 WHERE person_id IN (6);

SELECT * FROM people WHERE department_id IS NULL;

-- Q5　年齢の降順で男性の名前と年齢を取得してください。
SELECT name ,age  from people where gender = 1  ORDER BY age DESC;


-- Q6　テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明
-- 問題文
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
-- 回答
-- peopleテーブルにあるdepartment_idカラムが1（営業）のレコードを取得し、レコードの’name’’email’’age’カラムをcreated_atカラムの時間が古い順に表示してください。

-- Q7 20代の女性と40代の男性の名前一覧を取得
SELECT name FROM people WHERE gender = 2 AND age >= 20 and age < 30 OR gender = 1 AND age >= 40 AND age < 50;


-- Q8 営業部に所属する人だけを年齢の昇順で取得
 SELECT age FROM people WHERE department_id = 1 ORDER BY age ASC;


-- Q9 開発部に所属している女性の平均年齢を取得
SELECT AVG(age) as average_age FROM people WHERE gender = 2 AND department_id = 2;


-- Q10 名前と部署名とその人が提出した日報の内容を同時に取得 NULLは含めない
SELECT people. name, department. name, reports.content FROM people INNER JOIN department ON people.department_id = department.department_id INNER JOIN reports USING(person_id);


-- Q11　日報を一つも提出していない人の名前一覧を取得
SELECT p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id)WHERE r.person_id IS NULL;


