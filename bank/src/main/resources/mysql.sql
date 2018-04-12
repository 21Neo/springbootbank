
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

