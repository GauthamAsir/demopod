--
-- Class Article as table article
--

CREATE TABLE article (
  "id" serial,
  "title" text NOT NULL,
  "content" text NOT NULL,
  "authorName" text NOT NULL,
  "publishedOn" timestamp without time zone NOT NULL,
  "isPrime" boolean NOT NULL
);

ALTER TABLE ONLY article
  ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Class User as table userdata
--

CREATE TABLE userdata (
  "id" serial,
  "userName" text NOT NULL,
  "displayName" text,
  "firstName" text NOT NULL,
  "lastName" text,
  "dateOfBirth" timestamp without time zone NOT NULL,
  "registerDate" timestamp without time zone,
  "lastLoginDate" timestamp without time zone,
  "lastModified" timestamp without time zone,
  "email" text NOT NULL,
  "password" text
);

ALTER TABLE ONLY userdata
  ADD CONSTRAINT userdata_pkey PRIMARY KEY (id);

CREATE INDEX user_idx ON userdata USING btree ("email", "userName");


