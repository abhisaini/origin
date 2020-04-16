PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2020-04-10 15:20:59.324930');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2020-04-10 15:20:59.537336');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2020-04-10 15:20:59.783652');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2020-04-10 15:21:00.029595');
INSERT INTO "django_migrations" VALUES(5,'admin','0003_logentry_add_action_flag_choices','2020-04-10 15:21:00.339200');
INSERT INTO "django_migrations" VALUES(6,'contenttypes','0002_remove_content_type_name','2020-04-10 15:21:00.588465');
INSERT INTO "django_migrations" VALUES(7,'auth','0002_alter_permission_name_max_length','2020-04-10 15:21:00.789893');
INSERT INTO "django_migrations" VALUES(8,'auth','0003_alter_user_email_max_length','2020-04-10 15:21:01.003660');
INSERT INTO "django_migrations" VALUES(9,'auth','0004_alter_user_username_opts','2020-04-10 15:21:01.201444');
INSERT INTO "django_migrations" VALUES(10,'auth','0005_alter_user_last_login_null','2020-04-10 15:21:01.378935');
INSERT INTO "django_migrations" VALUES(11,'auth','0006_require_contenttypes_0002','2020-04-10 15:21:01.468665');
INSERT INTO "django_migrations" VALUES(12,'auth','0007_alter_validators_add_error_messages','2020-04-10 15:21:01.599352');
INSERT INTO "django_migrations" VALUES(13,'auth','0008_alter_user_username_max_length','2020-04-10 15:21:01.799309');
INSERT INTO "django_migrations" VALUES(14,'auth','0009_alter_user_last_name_max_length','2020-04-10 15:21:01.978282');
INSERT INTO "django_migrations" VALUES(15,'sessions','0001_initial','2020-04-10 15:21:02.133788');
INSERT INTO "django_migrations" VALUES(16,'app','0001_initial','2020-04-10 15:31:19.789575');
INSERT INTO "django_migrations" VALUES(17,'app','0002_auto_20200410_1549','2020-04-10 15:49:59.548748');
INSERT INTO "django_migrations" VALUES(18,'app','0003_auto_20200411_0932','2020-04-11 09:38:15.167698');
INSERT INTO "django_migrations" VALUES(19,'app','0004_paper_q_type','2020-04-11 10:55:58.111211');
INSERT INTO "django_migrations" VALUES(20,'app','0005_auto_20200412_0825','2020-04-12 08:25:52.802399');
INSERT INTO "django_migrations" VALUES(21,'app','0006_paper_soln_file','2020-04-13 15:28:33.272787');
INSERT INTO "django_migrations" VALUES(22,'app','0007_profile_u_type','2020-04-14 08:10:27.509216');
INSERT INTO "django_migrations" VALUES(23,'app','0008_auto_20200415_0845','2020-04-15 08:45:39.585669');
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'2020-04-14 09:27:45.604313','12','Paper object (12)','[{"changed": {"fields": ["author", "answer_key"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES(2,'2020-04-15 06:38:44.642260','14','Attempt object (14)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(3,'2020-04-15 06:38:44.972245','12','Attempt object (12)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(4,'2020-04-15 06:38:45.120571','11','Attempt object (11)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(5,'2020-04-15 06:38:45.320538','10','Attempt object (10)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(6,'2020-04-15 06:38:45.475508','9','Attempt object (9)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(7,'2020-04-15 06:38:45.659421','8','Attempt object (8)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(8,'2020-04-15 06:38:45.782528','7','Attempt object (7)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(9,'2020-04-15 06:38:45.881545','6','Attempt object (6)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(10,'2020-04-15 06:38:45.948286','5','Attempt object (5)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(11,'2020-04-15 06:38:46.059913','4','Attempt object (4)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(12,'2020-04-15 06:38:46.149026','3','Attempt object (3)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(13,'2020-04-15 06:38:46.237515','2','Attempt object (2)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(14,'2020-04-15 06:38:46.338105','1','Attempt object (1)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(15,'2020-04-15 06:39:14.425155','13','Attempt object (13)','',8,2,3);
INSERT INTO "django_admin_log" VALUES(16,'2020-04-15 06:39:39.961992','13','Paper object (13)','[{"changed": {"fields": ["answer_key"]}}]',9,2,2);
INSERT INTO "django_admin_log" VALUES(17,'2020-04-15 06:40:00.665869','12','Paper object (12)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(18,'2020-04-15 06:40:00.782420','11','Paper object (11)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(19,'2020-04-15 06:40:00.923809','10','Paper object (10)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(20,'2020-04-15 06:40:01.045888','9','Paper object (9)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(21,'2020-04-15 06:40:01.145595','8','Paper object (8)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(22,'2020-04-15 06:40:01.270255','7','Paper object (7)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(23,'2020-04-15 06:40:01.378979','6','Paper object (6)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(24,'2020-04-15 06:40:01.479262','5','Paper object (5)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(25,'2020-04-15 06:40:01.556183','4','Paper object (4)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(26,'2020-04-15 06:40:01.668321','3','Paper object (3)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(27,'2020-04-15 06:40:01.767887','2','Paper object (2)','',9,2,3);
INSERT INTO "django_admin_log" VALUES(28,'2020-04-15 06:40:01.867218','1','Paper object (1)','',9,2,3);
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','user');
INSERT INTO "django_content_type" VALUES(4,'auth','group');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'app','profile');
INSERT INTO "django_content_type" VALUES(8,'app','attempt');
INSERT INTO "django_content_type" VALUES(9,'app','paper');
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES(5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES(9,3,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(10,3,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(11,3,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(12,3,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES(13,4,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(14,4,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(15,4,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(16,4,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES(21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES(25,7,'add_profile','Can add profile');
INSERT INTO "auth_permission" VALUES(26,7,'change_profile','Can change profile');
INSERT INTO "auth_permission" VALUES(27,7,'delete_profile','Can delete profile');
INSERT INTO "auth_permission" VALUES(28,7,'view_profile','Can view profile');
INSERT INTO "auth_permission" VALUES(29,8,'add_attempt','Can add attempt');
INSERT INTO "auth_permission" VALUES(30,8,'change_attempt','Can change attempt');
INSERT INTO "auth_permission" VALUES(31,8,'delete_attempt','Can delete attempt');
INSERT INTO "auth_permission" VALUES(32,8,'view_attempt','Can view attempt');
INSERT INTO "auth_permission" VALUES(33,9,'add_paper','Can add paper');
INSERT INTO "auth_permission" VALUES(34,9,'change_paper','Can change paper');
INSERT INTO "auth_permission" VALUES(35,9,'delete_paper','Can delete paper');
INSERT INTO "auth_permission" VALUES(36,9,'view_paper','Can view paper');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_name" varchar(150) NOT NULL);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$120000$hTB3UeQptphE$t3yBc0aSUQlgZPBQGloMT3NubayzVjJU3YbB1+7iMfM=',NULL,0,'alpha','Alpha','',0,1,'2020-04-10 15:48:51.950324','Go');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$120000$SHrbY12RTdVR$iSDGbYnaoCCWMyDH57l9e78tMHJjgTzI3rYBy+SFJzY=','2020-04-14 17:48:53.854772',1,'abhi','','abhi@abhi.ab',1,1,'2020-04-10 15:50:35.453503','');
INSERT INTO "auth_user" VALUES(3,'pbkdf2_sha256$120000$WQVOqXyJMGP7$j1pqsCeicqJiDiv26Dsa3OGyQ3WbsYJIkLXlP8QWMps=','2020-04-12 14:51:18.142423',0,'abhisaini','Abhi','',0,1,'2020-04-11 08:54:42.891094','Saini');
INSERT INTO "auth_user" VALUES(4,'pbkdf2_sha256$120000$HHwPhXQIrOl4$YPZ0kX9QIt6jIC+wI5RBK9j2A+HDdjpcFKx2sU8u7yM=','2020-04-12 14:52:30.892058',0,'abhiabhi','Abhishek','',0,1,'2020-04-12 14:51:54.971454','Saini');
INSERT INTO "auth_user" VALUES(5,'pbkdf2_sha256$120000$krSwGlR3EmGZ$DWigHLYgL+g7vioTpMr6Ft8JJAnSno5OB/xURXNXv+A=','2020-04-15 14:58:47.788453',0,'rishabh','Rishabh','',0,1,'2020-04-14 08:19:28.315146','Saini');
INSERT INTO "auth_user" VALUES(6,'pbkdf2_sha256$120000$BneVfKYNSXs8$I9/cVKZO6YMNYvKHYbTIvuDRzYF//tWwNoFsqTTXB2E=','2020-04-15 09:25:36.181812',0,'abhi_saini','Abhishek','',0,1,'2020-04-14 08:33:32.885602','Saini');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('8hdqp0m0fmeduwgecsai252hu4kyoakc','Y2UxMzVjOTRmN2Q3NzEyZGExZDZhNDNmZTU1MzFjOTA1YmE5MGNkMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGJmZTQwMTkyZjkwNjQwNGJjYWY3NzAxODE3NmRlOGEyNzNiMjM3ZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2020-04-24 15:50:39.424013');
INSERT INTO "django_session" VALUES('ze3v2maj38d0jqoxvdz7z50gi1jy2rb2','OTk2YjE2MWE5ZmJiN2JjNzY3OTM2N2RmOWY2MjI4MzliMTgwYmNhNjp7fQ==','2020-04-26 14:51:18.051673');
INSERT INTO "django_session" VALUES('kq603ws5dbnpt72x8pf8bo85pgjr00ms','OTk2YjE2MWE5ZmJiN2JjNzY3OTM2N2RmOWY2MjI4MzliMTgwYmNhNjp7fQ==','2020-04-26 14:52:07.681144');
INSERT INTO "django_session" VALUES('p6otd1ftbvqm0971gdt20e60m5gfiu90','ZDczMmFkM2Y4YmI0ZjdlOWY3NzUzZGVmNzUxOTVmMDNkYzQ5ZjgyMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YmZlNDAxOTJmOTA2NDA0YmNhZjc3MDE4MTc2ZGU4YTI3M2IyMzdlIn0=','2020-04-28 08:19:44.442973');
INSERT INTO "django_session" VALUES('uv7ebhxubp3zuhu3iuhicv5l5ft7tuf4','ODAzOTk3OTQxODE1ZmI4ZTE0OTQyODBlZjFhNDMyYThiOTFhMWUxMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwODE0MWFmMmY1NDgzNDIwZmZhMjg4YjE2YzNkMmNiOTQ3NDMxM2UiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2020-04-28 10:53:26.158145');
INSERT INTO "django_session" VALUES('ggxkfwglg54yjn7vh73sbku8j6wt2e5c','NWNmNjIyOTE1ZjJmM2YwZTkwNjc5NTM3ZWM5MTFkMjc2MDczYWM3Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGJmZTQwMTkyZjkwNjQwNGJjYWY3NzAxODE3NmRlOGEyNzNiMjM3ZSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2020-04-28 17:48:54.040583');
INSERT INTO "django_session" VALUES('4n28nrkx1ar6jleobbys99ur11m56mvc','MDAzOWNkMzU3YmNlMmQyNWFlM2M5YWIxYjNlZDkxZTkxNWUwNTk5Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjIzOTZhYjVhNWQ3Nzc0MDdkZDhkYTc4NTdiMTJkN2Q5MjI2M2Y3MyIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2020-04-29 06:47:02.543814');
INSERT INTO "django_session" VALUES('de93ev7ag0q5ksgg4ifckg2f0aasoi48','MTI4MTY2ZjY3OTZlYjk2ZTQ3ODg1MGVmOGUwNTJjMjZjNDZiM2U5Yzp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9oYXNoIjoiMjIzOTZhYjVhNWQ3Nzc0MDdkZDhkYTc4NTdiMTJkN2Q5MjI2M2Y3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2020-04-29 09:25:36.364130');
INSERT INTO "django_session" VALUES('3uvawaikpjvqe2ieh2zwa3imh7e4n61x','ODAzOTk3OTQxODE1ZmI4ZTE0OTQyODBlZjFhNDMyYThiOTFhMWUxMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwODE0MWFmMmY1NDgzNDIwZmZhMjg4YjE2YzNkMmNiOTQ3NDMxM2UiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2020-04-29 14:58:47.977471');
CREATE TABLE "app_profile" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "u_type" varchar(1) NOT NULL);
INSERT INTO "app_profile" VALUES(1,2,'S');
INSERT INTO "app_profile" VALUES(2,3,'S');
INSERT INTO "app_profile" VALUES(3,4,'S');
INSERT INTO "app_profile" VALUES(4,5,'S');
INSERT INTO "app_profile" VALUES(5,6,'T');
CREATE TABLE "app_attempt" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "response" varchar(2000) NOT NULL, "q_result" varchar(200) NOT NULL, "marks" integer NULL, "paper_id" integer NOT NULL REFERENCES "app_paper" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "created_at" datetime NOT NULL);
INSERT INTO "app_attempt" VALUES(15,'X|A|B|_|C|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_','010_1_____________________',7,14,2,'2020-04-15 08:45:39.053083');
CREATE TABLE "app_paper" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL, "qpaper_file" varchar(100) NOT NULL, "q_count" integer NULL, "answer_key" varchar(2000) NOT NULL, "marking_scheme" varchar(200) NOT NULL, "negative_marking_scheme" varchar(200) NOT NULL, "syllabus" varchar(500) NOT NULL, "subject" varchar(3) NOT NULL, "description" varchar(2000) NOT NULL, "duration" integer NULL, "max_marks" integer NULL, "q_type" varchar(200) NOT NULL, "author_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "soln_file" varchar(100) NOT NULL, "created_at" datetime NOT NULL);
INSERT INTO "app_paper" VALUES(13,'Origin Paper-1','papers/Origin-N-1.pdf',30,'X|A|B|A|A|B|C|A|A|B|B|B|C|B|B|A|D|A|A|D|A|B|B|D|B|D|D|D|B|B|B','4444444444444444444444444444444','1111111111111111111111111111111','Vector, Unit & Dimensions, Kinematics','PCM','Marking: +4/ -1',60,120,'MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ',6,'papers/Origin-N-1-soln.pdf','2020-04-15 08:45:39.183457');
INSERT INTO "app_paper" VALUES(14,'Origin Paper-2','papers/Origin-N-2_.pdf',25,'X|A|C|B|C|C|D|B|B|D|A|D|C|C|D|C|C|B|D|B|C|C|B|D|B|C','44444444444444444444444444','11111111111111111111111111','Quadratic Equation','M','Marking : +4/ -1
									Duration: 60 mins',60,100,'MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ|MCQ',6,'papers/Origin-N-2_Sol.pdf','2020-04-15 08:45:39.183457');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('django_migrations',23);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',28);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',9);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',36);
INSERT INTO "sqlite_sequence" VALUES('auth_user',6);
INSERT INTO "sqlite_sequence" VALUES('app_profile',5);
INSERT INTO "sqlite_sequence" VALUES('app_attempt',15);
INSERT INTO "sqlite_sequence" VALUES('app_paper',14);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "app_attempt_paper_id_ae2733a5" ON "app_attempt" ("paper_id");
CREATE INDEX "app_attempt_user_id_4fd814a7" ON "app_attempt" ("user_id");
CREATE INDEX "app_paper_author_id_662ef34a" ON "app_paper" ("author_id");
COMMIT;