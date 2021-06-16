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


SELECT username, char_name FROM users INNER JOIN characters ON characters.owner_id=users.id;
SELECT * FROM characters;
SELECT * FROM characters INNER JOIN users ON users.id=characters.owner_id;


INSERT INTO characters(owner_id,char_name,gamestate,char_level,xp_points,max_health,current_health,max_mana,current_mana,strength,stamina,defence,gold,inventory ) VALUES(2,'char_name','new',1,0,25,25,15,15,10,10,10,0,'e');



