CREATE TABLE triggers (
  trigger_id     INT    NOT NULL GENERATED ALWAYS AS IDENTITY,
  trigger_source VARCHAR(128),
  modify_time    BIGINT NOT NULL,
  enc_type       SMALLINT,
  data           BYTEA,
  PRIMARY KEY (trigger_id)
);
