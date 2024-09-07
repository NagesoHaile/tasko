CREATE TABLE UserInfo (
   theme TEXT,
);

CREATE TABLE Task (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    task_description TEXT,
    due_date TEXT,
    is_completed INTEGER
);

INSERT INTO UserInfo(
  theme,
) VALUES (
  'LIGHT'
  'SYSTEM'
);