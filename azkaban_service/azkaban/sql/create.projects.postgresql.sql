CREATE TABLE projects (
  id               INT         NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name             VARCHAR(64) NOT NULL,
  active           BOOLEAN,
  modified_time    BIGINT      NOT NULL,
  create_time      BIGINT      NOT NULL,
  version          INT,
  last_modified_by VARCHAR(64) NOT NULL,
  description      VARCHAR(2048),
  enc_type         SMALLINT,
  settings_blob    BYTEA
);

CREATE INDEX project_name
  ON projects (name);