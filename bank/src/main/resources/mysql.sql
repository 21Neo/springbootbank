
-- bank script of bank

-- 用户表
CREATE TABLE user
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100),
    email VARCHAR(100),
    enabled INT,    -- 1 启用 0 禁用
    last_password_reset_date DATETIME,
    login_time DATETIME
);

-- 角色表
CREATE TABLE AUTHORITY
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    descn VARCHAR(100)
);

-- 用户角色表
CREATE TABLE USER_AUTHORITY
(
    user_id BIGINT,
    authority_id BIGINT,
    CONSTRAINT UA_USER_fk FOREIGN KEY (user_id) REFERENCES user (id),
    CONSTRAINT UA_AUTHORITY_fk FOREIGN KEY (authority_id) REFERENCES authority (id)
);

-- 初始化数据

-- 角色表
INSERT INTO employee.authority (id, name, descn) VALUES (1, 'ROLE_ADMIN', '系统管理员');
INSERT INTO employee.authority (id, name, descn) VALUES (2, 'ROLE_MANAGER', '经理');
INSERT INTO employee.authority (id, name, descn) VALUES (3, 'ROLE_CLERK', '办事员');

-- 用户表
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (1, 'admin', '$2a$10$tF9D2kwlpgyJrLE09kxPz.vyd085b/o6pP8ETOounyq.VJKimjNpm', 'admin@email.com', 1, '2018-04-10 07:03:37', '2018-04-12 07:03:56');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (2, 'king', '$2a$10$4pbZt1dh4UQVKF1Wfk0Wr.QLOqpl0dTT789gDNtW3DTdAmWQdTgVm', 'king@gmail.com', 1, '2018-04-09 07:05:41', '2018-04-10 07:05:46');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (3, 'smith', '$2a$10$dwhYNHJvTdntkicQjaLWBuTd0ClbRRpQszfpal6VI8jnf3qakSo8O', 'smith@qq.com', 0, '2018-04-08 07:06:11', '2018-04-12 07:06:20');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (4, 'jones', '$2a$10$r3KjcrPBkCJGpu8EKJO16e9/8MjeCpTOOUKeV.InqSBTa7Mc.bFRm', 'jones@email.com', 1, '2018-04-09 07:06:45', '2018-04-11 07:06:54');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (5, 'james', '$2a$10$MES77Oei.P36xJ8W78fn2OAaMC49NiZDJTrrxQ1gcB/GsOvkEHS9e', 'james@email.com', 1, '2018-04-11 07:07:32', '2018-04-12 07:07:39');

-- 用户角色表
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (2, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (3, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (5, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 3);

COMMIT;