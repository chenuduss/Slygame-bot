CREATE TABLE g_user (
    id bigint NOT NULL PRIMARY KEY,
    title varchar(200) NOT NULL   
);

CREATE TABLE chat (
    id bigint NOT NULL PRIMARY KEY,
    title varchar(200) NOT NULL   
);

CREATE TABLE game_state (
    id bigint NOT NULL PRIMARY KEY,
    ts timestamp with time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    chat_id bigint NOT NULL,
    beneficiary bigint NOT NULL,
    turn varchar,
    new_state text,
    score double precision,
    FOREIGN KEY (beneficiary) REFERENCES g_user (id),
    FOREIGN KEY (chat_id) REFERENCES chat (id)
);

CREATE INDEX idx_game_state_ts on game_state ("ts");
CREATE INDEX idx_game_state_chat_id on game_state ("chat_id");

INSERT INTO g_user (id, title) VALUES(1, 'BOT');




