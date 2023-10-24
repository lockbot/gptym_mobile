-- Create User table to store basic user information
CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    height REAL,
    weight REAL
);

-- Create Exercise table to store information about different exercises
CREATE TABLE exercise (
    id INTEGER PRIMARY KEY,
    exercise_name TEXT NOT NULL,
    description TEXT
);

-- Create UserExercise table to store the relationship between users and exercises
CREATE TABLE user_exercise (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    exercise_id INTEGER,
    sets INTEGER,
    repetitions INTEGER,
    weight REAL,
    CONSTRAINT fk_user_exercise_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_exercise_exercise FOREIGN KEY (exercise_id) REFERENCES exercise(id) ON DELETE CASCADE
);

-- Create ExerciseSeries table to group user_exercises and plan exercise series
CREATE TABLE exercise_series (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    creation_date DATE,
    finish_date DATE,
    CONSTRAINT fk_exercise_series_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Create ExerciseSeriesDetail table to associate user_exercises with exercise series
CREATE TABLE exercise_series_detail (
    id INTEGER PRIMARY KEY,
    series_id INTEGER,
    exercise_id INTEGER,
    CONSTRAINT fk_exercise_series_detail_series FOREIGN KEY (series_id) REFERENCES exercise_series(id) ON DELETE CASCADE,
    CONSTRAINT fk_exercise_series_detail_exercise FOREIGN KEY (exercise_id) REFERENCES user_exercise(id) ON DELETE CASCADE
);
