DROP TABLE users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT
);

DROP TABLE characters;

CREATE TABLE characters (
    char_id SERIAL PRIMARY KEY,
    owner_id INTEGER,
    char_name TEXT,
    gamestate TEXT,
    char_level INTEGER,
    xp_points INTEGER,
    max_health INTEGER,
    current_health INTEGER,
    max_mana INTEGER,
    current_mana INTEGER, 
    strength INTEGER,
    stamina INTEGER,
    defence INTEGER,
    gold INTEGER,
    inventory TEXT
);


