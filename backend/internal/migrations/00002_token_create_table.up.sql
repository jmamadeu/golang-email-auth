CREATE TYPE "tokens_type_enum" AS ENUM ("email", "api")

CREATE TABLE tokens (
  "id" VARCHAR PRIMARY KEY,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (now()),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT (now()),
  "type" tokens_type_enum,
  "email_token" VARCHAR,
  "valid" BOOLEAN,
  "expiration" DATE,
  "userId" VARCHAR NOT NULL,
  "user_id" VARCHAR NOT NULL,
);

ALTER TABLE 
  "tokens"
ADD
  CONSTRAINT "fk_users_tokens" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
  ON DELETE CASCADE ON UPDATE CASCADE;