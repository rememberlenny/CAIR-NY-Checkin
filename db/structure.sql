--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: auth_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_tokens (
    id integer NOT NULL,
    checkin_id integer,
    token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: auth_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_tokens_id_seq OWNED BY auth_tokens.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255) NOT NULL,
    proid character varying(255) NOT NULL,
    token character varying(255),
    refresh_token character varying(255),
    secret character varying(255),
    expires_at timestamp without time zone,
    username character varying(255),
    image_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentications_id_seq OWNED BY authentications.id;


--
-- Name: checkins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE checkins (
    id integer NOT NULL,
    hex_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    interview_location character varying,
    interview_date character varying,
    interview_time character varying,
    account_id uuid,
    name_first character varying,
    name_middle character varying,
    name_last character varying,
    address_line_one character varying,
    address_line_two character varying,
    address_city character varying,
    address_state character varying,
    address_zip character varying,
    alt_phone_number character varying,
    contact_one_name_first character varying,
    contact_two_name_first character varying,
    contact_one_name_last character varying,
    contact_two_name_last character varying,
    contact_one_phone_number character varying,
    contact_two_phone_number character varying,
    contact_one_prefered_languag character varying,
    contact_two_prefered_languag character varying
);


--
-- Name: checkins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE checkins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: checkins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE checkins_id_seq OWNED BY checkins.id;


--
-- Name: conversation_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE conversation_responses (
    id integer NOT NULL,
    statement text,
    trigger character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: conversation_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conversation_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversation_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE conversation_responses_id_seq OWNED BY conversation_responses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE messages (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    account_id uuid,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    direction character varying
);


--
-- Name: oauth_caches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oauth_caches (
    authentication_id integer NOT NULL,
    data_json text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rails_admin_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: shortened_urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shortened_urls (
    id integer NOT NULL,
    owner_id integer,
    owner_type character varying(20),
    url text NOT NULL,
    unique_key character varying(10) NOT NULL,
    label character varying,
    string character varying,
    use_count integer DEFAULT 0 NOT NULL,
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: shortened_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shortened_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortened_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shortened_urls_id_seq OWNED BY shortened_urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    image_url character varying(255),
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_admin boolean
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_tokens ALTER COLUMN id SET DEFAULT nextval('auth_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications ALTER COLUMN id SET DEFAULT nextval('authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY checkins ALTER COLUMN id SET DEFAULT nextval('checkins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY conversation_responses ALTER COLUMN id SET DEFAULT nextval('conversation_responses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shortened_urls ALTER COLUMN id SET DEFAULT nextval('shortened_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: auth_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_tokens
    ADD CONSTRAINT auth_tokens_pkey PRIMARY KEY (id);


--
-- Name: authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: checkins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY checkins
    ADD CONSTRAINT checkins_pkey PRIMARY KEY (id);


--
-- Name: conversation_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conversation_responses
    ADD CONSTRAINT conversation_responses_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: shortened_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shortened_urls
    ADD CONSTRAINT shortened_urls_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_authentications_on_provider; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authentications_on_provider ON authentications USING btree (provider);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_shortened_urls_on_label; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shortened_urls_on_label ON shortened_urls USING btree (label);


--
-- Name: index_shortened_urls_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shortened_urls_on_owner_id_and_owner_type ON shortened_urls USING btree (owner_id, owner_type);


--
-- Name: index_shortened_urls_on_unique_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_shortened_urls_on_unique_key ON shortened_urls USING btree (unique_key);


--
-- Name: index_shortened_urls_on_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shortened_urls_on_url ON shortened_urls USING btree (url);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_lower_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_email_index ON users USING btree (lower((email)::text));


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20130909170542');

INSERT INTO schema_migrations (version) VALUES ('20130909194719');

INSERT INTO schema_migrations (version) VALUES ('20131020063216');

INSERT INTO schema_migrations (version) VALUES ('20131021224642');

INSERT INTO schema_migrations (version) VALUES ('20140204233100');

INSERT INTO schema_migrations (version) VALUES ('20140204233952');

INSERT INTO schema_migrations (version) VALUES ('20170110033450');

INSERT INTO schema_migrations (version) VALUES ('20170110033516');

INSERT INTO schema_migrations (version) VALUES ('20170110053256');

INSERT INTO schema_migrations (version) VALUES ('20170110153931');

INSERT INTO schema_migrations (version) VALUES ('20170110155343');

INSERT INTO schema_migrations (version) VALUES ('20170110190610');

INSERT INTO schema_migrations (version) VALUES ('20170110210255');

INSERT INTO schema_migrations (version) VALUES ('20170110220058');

INSERT INTO schema_migrations (version) VALUES ('20170228213633');

INSERT INTO schema_migrations (version) VALUES ('20170228214550');

INSERT INTO schema_migrations (version) VALUES ('20170228215937');

INSERT INTO schema_migrations (version) VALUES ('20170301065743');

INSERT INTO schema_migrations (version) VALUES ('20170301154443');

INSERT INTO schema_migrations (version) VALUES ('20170301154444');

INSERT INTO schema_migrations (version) VALUES ('20170302154549');

INSERT INTO schema_migrations (version) VALUES ('20170302155904');

INSERT INTO schema_migrations (version) VALUES ('20170302171727');

INSERT INTO schema_migrations (version) VALUES ('20170302172714');

