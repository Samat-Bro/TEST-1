--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Debian 14.9-1.pgdg120+1)
-- Dumped by pg_dump version 14.9 (Debian 14.9-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: oc_accounts; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_accounts (
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    data text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.oc_accounts OWNER TO oc_andmi;

--
-- Name: oc_accounts_data; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_accounts_data (
    id bigint NOT NULL,
    uid character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    value character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.oc_accounts_data OWNER TO oc_andmi;

--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_accounts_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_accounts_data_id_seq OWNER TO oc_andmi;

--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_accounts_data_id_seq OWNED BY public.oc_accounts_data.id;


--
-- Name: oc_activity; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_activity (
    activity_id bigint NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    type character varying(255) DEFAULT NULL::character varying,
    "user" character varying(64) DEFAULT NULL::character varying,
    affecteduser character varying(64) NOT NULL,
    app character varying(32) NOT NULL,
    subject character varying(255) NOT NULL,
    subjectparams text NOT NULL,
    message character varying(255) DEFAULT NULL::character varying,
    messageparams text,
    file character varying(4000) DEFAULT NULL::character varying,
    link character varying(4000) DEFAULT NULL::character varying,
    object_type character varying(255) DEFAULT NULL::character varying,
    object_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_activity OWNER TO oc_andmi;

--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_activity_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_activity_activity_id_seq OWNER TO oc_andmi;

--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_activity_activity_id_seq OWNED BY public.oc_activity.activity_id;


--
-- Name: oc_activity_mq; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_activity_mq (
    mail_id bigint NOT NULL,
    amq_timestamp integer DEFAULT 0 NOT NULL,
    amq_latest_send integer DEFAULT 0 NOT NULL,
    amq_type character varying(255) NOT NULL,
    amq_affecteduser character varying(64) NOT NULL,
    amq_appid character varying(32) NOT NULL,
    amq_subject character varying(255) NOT NULL,
    amq_subjectparams text,
    object_type character varying(255) DEFAULT NULL::character varying,
    object_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_activity_mq OWNER TO oc_andmi;

--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_activity_mq_mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_activity_mq_mail_id_seq OWNER TO oc_andmi;

--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_activity_mq_mail_id_seq OWNED BY public.oc_activity_mq.mail_id;


--
-- Name: oc_addressbookchanges; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_addressbookchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    addressbookid bigint NOT NULL,
    operation smallint NOT NULL
);


ALTER TABLE public.oc_addressbookchanges OWNER TO oc_andmi;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_addressbookchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_addressbookchanges_id_seq OWNER TO oc_andmi;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_addressbookchanges_id_seq OWNED BY public.oc_addressbookchanges.id;


--
-- Name: oc_addressbooks; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_addressbooks (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_addressbooks OWNER TO oc_andmi;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_addressbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_addressbooks_id_seq OWNER TO oc_andmi;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_addressbooks_id_seq OWNED BY public.oc_addressbooks.id;


--
-- Name: oc_appconfig; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_appconfig (
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text
);


ALTER TABLE public.oc_appconfig OWNER TO oc_andmi;

--
-- Name: oc_authorized_groups; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_authorized_groups (
    id integer NOT NULL,
    group_id character varying(200) NOT NULL,
    class character varying(200) NOT NULL
);


ALTER TABLE public.oc_authorized_groups OWNER TO oc_andmi;

--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_authorized_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_authorized_groups_id_seq OWNER TO oc_andmi;

--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_authorized_groups_id_seq OWNED BY public.oc_authorized_groups.id;


--
-- Name: oc_authtoken; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_authtoken (
    id bigint NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    login_name character varying(255) DEFAULT ''::character varying NOT NULL,
    password text,
    name text DEFAULT ''::text NOT NULL,
    token character varying(200) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT 0,
    remember smallint DEFAULT 0,
    last_activity integer DEFAULT 0,
    last_check integer DEFAULT 0,
    scope text,
    expires integer,
    private_key text,
    public_key text,
    version smallint DEFAULT 1 NOT NULL,
    password_invalid boolean DEFAULT false,
    password_hash character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_authtoken OWNER TO oc_andmi;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_authtoken_id_seq OWNER TO oc_andmi;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_authtoken_id_seq OWNED BY public.oc_authtoken.id;


--
-- Name: oc_bruteforce_attempts; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_bruteforce_attempts (
    id bigint NOT NULL,
    action character varying(64) DEFAULT ''::character varying NOT NULL,
    occurred integer DEFAULT 0 NOT NULL,
    ip character varying(255) DEFAULT ''::character varying NOT NULL,
    subnet character varying(255) DEFAULT ''::character varying NOT NULL,
    metadata character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_bruteforce_attempts OWNER TO oc_andmi;

--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_bruteforce_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_bruteforce_attempts_id_seq OWNER TO oc_andmi;

--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_bruteforce_attempts_id_seq OWNED BY public.oc_bruteforce_attempts.id;


--
-- Name: oc_calendar_invitations; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_invitations (
    id bigint NOT NULL,
    uid character varying(255) NOT NULL,
    recurrenceid character varying(255) DEFAULT NULL::character varying,
    attendee character varying(255) NOT NULL,
    organizer character varying(255) NOT NULL,
    sequence bigint,
    token character varying(60) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.oc_calendar_invitations OWNER TO oc_andmi;

--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_invitations_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_invitations_id_seq OWNED BY public.oc_calendar_invitations.id;


--
-- Name: oc_calendar_reminders; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_reminders (
    id bigint NOT NULL,
    calendar_id bigint NOT NULL,
    object_id bigint NOT NULL,
    is_recurring smallint,
    uid character varying(255) NOT NULL,
    recurrence_id bigint,
    is_recurrence_exception smallint NOT NULL,
    event_hash character varying(255) NOT NULL,
    alarm_hash character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    is_relative smallint NOT NULL,
    notification_date bigint NOT NULL,
    is_repeat_based smallint NOT NULL
);


ALTER TABLE public.oc_calendar_reminders OWNER TO oc_andmi;

--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_reminders_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_reminders_id_seq OWNED BY public.oc_calendar_reminders.id;


--
-- Name: oc_calendar_resources; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_resources (
    id bigint NOT NULL,
    backend_id character varying(64) DEFAULT NULL::character varying,
    resource_id character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    group_restrictions character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_resources OWNER TO oc_andmi;

--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_resources_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_resources_id_seq OWNED BY public.oc_calendar_resources.id;


--
-- Name: oc_calendar_resources_md; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_resources_md (
    id bigint NOT NULL,
    resource_id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_resources_md OWNER TO oc_andmi;

--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_resources_md_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_resources_md_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_resources_md_id_seq OWNED BY public.oc_calendar_resources_md.id;


--
-- Name: oc_calendar_rooms; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_rooms (
    id bigint NOT NULL,
    backend_id character varying(64) DEFAULT NULL::character varying,
    resource_id character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    group_restrictions character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_rooms OWNER TO oc_andmi;

--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_rooms_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_rooms_id_seq OWNED BY public.oc_calendar_rooms.id;


--
-- Name: oc_calendar_rooms_md; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendar_rooms_md (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_rooms_md OWNER TO oc_andmi;

--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendar_rooms_md_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendar_rooms_md_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendar_rooms_md_id_seq OWNED BY public.oc_calendar_rooms_md.id;


--
-- Name: oc_calendarchanges; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendarchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    calendarid bigint NOT NULL,
    operation smallint NOT NULL,
    calendartype integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_calendarchanges OWNER TO oc_andmi;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendarchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarchanges_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendarchanges_id_seq OWNED BY public.oc_calendarchanges.id;


--
-- Name: oc_calendarobjects; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendarobjects (
    id bigint NOT NULL,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    calendarid bigint NOT NULL,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL,
    componenttype character varying(8) DEFAULT NULL::character varying,
    firstoccurence bigint,
    lastoccurence bigint,
    uid character varying(255) DEFAULT NULL::character varying,
    classification integer DEFAULT 0,
    calendartype integer DEFAULT 0 NOT NULL,
    deleted_at integer
);


ALTER TABLE public.oc_calendarobjects OWNER TO oc_andmi;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendarobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarobjects_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendarobjects_id_seq OWNED BY public.oc_calendarobjects.id;


--
-- Name: oc_calendarobjects_props; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendarobjects_props (
    id bigint NOT NULL,
    calendarid bigint DEFAULT 0 NOT NULL,
    objectid bigint DEFAULT 0 NOT NULL,
    name character varying(64) DEFAULT NULL::character varying,
    parameter character varying(64) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    calendartype integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_calendarobjects_props OWNER TO oc_andmi;

--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendarobjects_props_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarobjects_props_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendarobjects_props_id_seq OWNED BY public.oc_calendarobjects_props.id;


--
-- Name: oc_calendars; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendars (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    timezone text,
    components character varying(64) DEFAULT NULL::character varying,
    transparent smallint DEFAULT 0 NOT NULL,
    deleted_at integer
);


ALTER TABLE public.oc_calendars OWNER TO oc_andmi;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendars_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendars_id_seq OWNED BY public.oc_calendars.id;


--
-- Name: oc_calendarsubscriptions; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_calendarsubscriptions (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(100) DEFAULT NULL::character varying,
    refreshrate character varying(10) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    striptodos smallint,
    stripalarms smallint,
    stripattachments smallint,
    lastmodified integer,
    synctoken integer DEFAULT 1 NOT NULL,
    source text
);


ALTER TABLE public.oc_calendarsubscriptions OWNER TO oc_andmi;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_calendarsubscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_calendarsubscriptions_id_seq OWNER TO oc_andmi;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_calendarsubscriptions_id_seq OWNED BY public.oc_calendarsubscriptions.id;


--
-- Name: oc_cards; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_cards (
    id bigint NOT NULL,
    addressbookid bigint DEFAULT 0 NOT NULL,
    carddata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified bigint,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL,
    uid character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_cards OWNER TO oc_andmi;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_cards_id_seq OWNER TO oc_andmi;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_cards_id_seq OWNED BY public.oc_cards.id;


--
-- Name: oc_cards_properties; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_cards_properties (
    id bigint NOT NULL,
    addressbookid bigint DEFAULT 0 NOT NULL,
    cardid bigint DEFAULT 0 NOT NULL,
    name character varying(64) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    preferred integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_cards_properties OWNER TO oc_andmi;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_cards_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_cards_properties_id_seq OWNER TO oc_andmi;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_cards_properties_id_seq OWNED BY public.oc_cards_properties.id;


--
-- Name: oc_circles_circle; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_circle (
    id integer NOT NULL,
    unique_id character varying(31) NOT NULL,
    name character varying(127) NOT NULL,
    display_name character varying(255) DEFAULT ''::character varying,
    sanitized_name character varying(127) DEFAULT ''::character varying,
    instance character varying(255) DEFAULT ''::character varying,
    config integer,
    source integer,
    settings text,
    description text,
    creation timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    contact_addressbook integer,
    contact_groupname character varying(127) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_circle OWNER TO oc_andmi;

--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_circle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_circle_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_circle_id_seq OWNED BY public.oc_circles_circle.id;


--
-- Name: oc_circles_event; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_event (
    token character varying(63) NOT NULL,
    instance character varying(255) NOT NULL,
    event text,
    result text,
    interface integer DEFAULT 0 NOT NULL,
    severity integer,
    retry integer,
    status integer,
    updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creation bigint
);


ALTER TABLE public.oc_circles_event OWNER TO oc_andmi;

--
-- Name: oc_circles_member; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_member (
    id integer NOT NULL,
    single_id character varying(31) DEFAULT NULL::character varying,
    circle_id character varying(31) NOT NULL,
    member_id character varying(31) DEFAULT NULL::character varying,
    user_id character varying(127) NOT NULL,
    user_type smallint DEFAULT 1 NOT NULL,
    instance character varying(255) DEFAULT ''::character varying,
    invited_by character varying(31) DEFAULT NULL::character varying,
    level smallint NOT NULL,
    status character varying(15) DEFAULT NULL::character varying,
    note text,
    cached_name character varying(255) DEFAULT ''::character varying,
    cached_update timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    contact_id character varying(127) DEFAULT NULL::character varying,
    contact_meta text,
    joined timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_circles_member OWNER TO oc_andmi;

--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_member_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_member_id_seq OWNED BY public.oc_circles_member.id;


--
-- Name: oc_circles_membership; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_membership (
    circle_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    level integer NOT NULL,
    inheritance_first character varying(31) NOT NULL,
    inheritance_last character varying(31) NOT NULL,
    inheritance_depth integer NOT NULL,
    inheritance_path text NOT NULL
);


ALTER TABLE public.oc_circles_membership OWNER TO oc_andmi;

--
-- Name: oc_circles_mount; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_mount (
    id integer NOT NULL,
    mount_id character varying(31) NOT NULL,
    circle_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    token character varying(63) DEFAULT NULL::character varying,
    parent integer,
    mountpoint text,
    mountpoint_hash character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_mount OWNER TO oc_andmi;

--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_mount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_mount_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_mount_id_seq OWNED BY public.oc_circles_mount.id;


--
-- Name: oc_circles_mountpoint; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_mountpoint (
    id integer NOT NULL,
    mount_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    mountpoint text,
    mountpoint_hash character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_mountpoint OWNER TO oc_andmi;

--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_mountpoint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_mountpoint_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_mountpoint_id_seq OWNED BY public.oc_circles_mountpoint.id;


--
-- Name: oc_circles_remote; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_remote (
    id integer NOT NULL,
    type character varying(15) DEFAULT 'Unknown'::character varying NOT NULL,
    interface integer DEFAULT 0 NOT NULL,
    uid character varying(20) DEFAULT NULL::character varying,
    instance character varying(127) DEFAULT NULL::character varying,
    href character varying(254) DEFAULT NULL::character varying,
    item text,
    creation timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_circles_remote OWNER TO oc_andmi;

--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_remote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_remote_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_remote_id_seq OWNED BY public.oc_circles_remote.id;


--
-- Name: oc_circles_share_lock; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_share_lock (
    id integer NOT NULL,
    item_id character varying(31) NOT NULL,
    circle_id character varying(31) NOT NULL,
    instance character varying(127) NOT NULL
);


ALTER TABLE public.oc_circles_share_lock OWNER TO oc_andmi;

--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_share_lock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_share_lock_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_share_lock_id_seq OWNED BY public.oc_circles_share_lock.id;


--
-- Name: oc_circles_token; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_circles_token (
    id integer NOT NULL,
    share_id integer,
    circle_id character varying(31) DEFAULT NULL::character varying,
    single_id character varying(31) DEFAULT NULL::character varying,
    member_id character varying(31) DEFAULT NULL::character varying,
    token character varying(31) DEFAULT NULL::character varying,
    password character varying(127) DEFAULT NULL::character varying,
    accepted integer
);


ALTER TABLE public.oc_circles_token OWNER TO oc_andmi;

--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_circles_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_circles_token_id_seq OWNER TO oc_andmi;

--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_circles_token_id_seq OWNED BY public.oc_circles_token.id;


--
-- Name: oc_collres_accesscache; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_collres_accesscache (
    user_id character varying(64) NOT NULL,
    collection_id bigint DEFAULT 0 NOT NULL,
    resource_type character varying(64) DEFAULT ''::character varying NOT NULL,
    resource_id character varying(64) DEFAULT ''::character varying NOT NULL,
    access boolean DEFAULT false
);


ALTER TABLE public.oc_collres_accesscache OWNER TO oc_andmi;

--
-- Name: oc_collres_collections; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_collres_collections (
    id bigint NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.oc_collres_collections OWNER TO oc_andmi;

--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_collres_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_collres_collections_id_seq OWNER TO oc_andmi;

--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_collres_collections_id_seq OWNED BY public.oc_collres_collections.id;


--
-- Name: oc_collres_resources; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_collres_resources (
    collection_id bigint NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(64) NOT NULL
);


ALTER TABLE public.oc_collres_resources OWNER TO oc_andmi;

--
-- Name: oc_comments; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_comments (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    topmost_parent_id bigint DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    actor_type character varying(64) DEFAULT ''::character varying NOT NULL,
    actor_id character varying(64) DEFAULT ''::character varying NOT NULL,
    message text,
    verb character varying(64) DEFAULT NULL::character varying,
    creation_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    latest_child_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL,
    reference_id character varying(64) DEFAULT NULL::character varying,
    reactions character varying(4000) DEFAULT NULL::character varying,
    expire_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_comments OWNER TO oc_andmi;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_comments_id_seq OWNER TO oc_andmi;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_comments_id_seq OWNED BY public.oc_comments.id;


--
-- Name: oc_comments_read_markers; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_comments_read_markers (
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL,
    marker_datetime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_comments_read_markers OWNER TO oc_andmi;

--
-- Name: oc_dav_cal_proxy; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_dav_cal_proxy (
    id bigint NOT NULL,
    owner_id character varying(64) NOT NULL,
    proxy_id character varying(64) NOT NULL,
    permissions integer
);


ALTER TABLE public.oc_dav_cal_proxy OWNER TO oc_andmi;

--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_dav_cal_proxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_dav_cal_proxy_id_seq OWNER TO oc_andmi;

--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_dav_cal_proxy_id_seq OWNED BY public.oc_dav_cal_proxy.id;


--
-- Name: oc_dav_shares; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_dav_shares (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    access smallint,
    resourceid bigint NOT NULL,
    publicuri character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_dav_shares OWNER TO oc_andmi;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_dav_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_dav_shares_id_seq OWNER TO oc_andmi;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_dav_shares_id_seq OWNED BY public.oc_dav_shares.id;


--
-- Name: oc_direct_edit; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_direct_edit (
    id bigint NOT NULL,
    editor_id character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    share_id bigint,
    "timestamp" bigint NOT NULL,
    accessed boolean DEFAULT false,
    file_path character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_direct_edit OWNER TO oc_andmi;

--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_direct_edit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_direct_edit_id_seq OWNER TO oc_andmi;

--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_direct_edit_id_seq OWNED BY public.oc_direct_edit.id;


--
-- Name: oc_directlink; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_directlink (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    file_id bigint NOT NULL,
    token character varying(60) DEFAULT NULL::character varying,
    expiration bigint NOT NULL
);


ALTER TABLE public.oc_directlink OWNER TO oc_andmi;

--
-- Name: oc_directlink_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_directlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_directlink_id_seq OWNER TO oc_andmi;

--
-- Name: oc_directlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_directlink_id_seq OWNED BY public.oc_directlink.id;


--
-- Name: oc_federated_reshares; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_federated_reshares (
    share_id bigint NOT NULL,
    remote_id character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.oc_federated_reshares OWNER TO oc_andmi;

--
-- Name: oc_file_locks; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_file_locks (
    id bigint NOT NULL,
    lock integer DEFAULT 0 NOT NULL,
    key character varying(64) NOT NULL,
    ttl integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.oc_file_locks OWNER TO oc_andmi;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_file_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_file_locks_id_seq OWNER TO oc_andmi;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_file_locks_id_seq OWNED BY public.oc_file_locks.id;


--
-- Name: oc_file_metadata; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_file_metadata (
    id bigint NOT NULL,
    group_name character varying(50) NOT NULL,
    value text DEFAULT ''::text
);


ALTER TABLE public.oc_file_metadata OWNER TO oc_andmi;

--
-- Name: oc_filecache; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_filecache (
    fileid bigint NOT NULL,
    storage bigint DEFAULT 0 NOT NULL,
    path character varying(4000) DEFAULT NULL::character varying,
    path_hash character varying(32) DEFAULT ''::character varying NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    name character varying(250) DEFAULT NULL::character varying,
    mimetype bigint DEFAULT 0 NOT NULL,
    mimepart bigint DEFAULT 0 NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    mtime bigint DEFAULT 0 NOT NULL,
    storage_mtime bigint DEFAULT 0 NOT NULL,
    encrypted integer DEFAULT 0 NOT NULL,
    unencrypted_size bigint DEFAULT 0 NOT NULL,
    etag character varying(40) DEFAULT NULL::character varying,
    permissions integer DEFAULT 0,
    checksum character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_filecache OWNER TO oc_andmi;

--
-- Name: oc_filecache_extended; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_filecache_extended (
    fileid bigint NOT NULL,
    metadata_etag character varying(40) DEFAULT NULL::character varying,
    creation_time bigint DEFAULT 0 NOT NULL,
    upload_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_filecache_extended OWNER TO oc_andmi;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_filecache_fileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_filecache_fileid_seq OWNER TO oc_andmi;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_filecache_fileid_seq OWNED BY public.oc_filecache.fileid;


--
-- Name: oc_files_reminders; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_files_reminders (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    notified boolean DEFAULT false
);


ALTER TABLE public.oc_files_reminders OWNER TO oc_andmi;

--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_files_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_files_reminders_id_seq OWNER TO oc_andmi;

--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_files_reminders_id_seq OWNED BY public.oc_files_reminders.id;


--
-- Name: oc_files_trash; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_files_trash (
    auto_id bigint NOT NULL,
    id character varying(250) DEFAULT ''::character varying NOT NULL,
    "user" character varying(64) DEFAULT ''::character varying NOT NULL,
    "timestamp" character varying(12) DEFAULT ''::character varying NOT NULL,
    location character varying(512) DEFAULT ''::character varying NOT NULL,
    type character varying(4) DEFAULT NULL::character varying,
    mime character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_files_trash OWNER TO oc_andmi;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_files_trash_auto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_files_trash_auto_id_seq OWNER TO oc_andmi;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_files_trash_auto_id_seq OWNED BY public.oc_files_trash.auto_id;


--
-- Name: oc_files_versions; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_files_versions (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    "timestamp" bigint NOT NULL,
    size bigint NOT NULL,
    mimetype bigint NOT NULL,
    metadata json NOT NULL
);


ALTER TABLE public.oc_files_versions OWNER TO oc_andmi;

--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_files_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_files_versions_id_seq OWNER TO oc_andmi;

--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_files_versions_id_seq OWNED BY public.oc_files_versions.id;


--
-- Name: oc_flow_checks; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_flow_checks (
    id integer NOT NULL,
    class character varying(256) DEFAULT ''::character varying NOT NULL,
    operator character varying(16) DEFAULT ''::character varying NOT NULL,
    value text,
    hash character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_flow_checks OWNER TO oc_andmi;

--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_flow_checks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_flow_checks_id_seq OWNER TO oc_andmi;

--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_flow_checks_id_seq OWNED BY public.oc_flow_checks.id;


--
-- Name: oc_flow_operations; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_flow_operations (
    id integer NOT NULL,
    class character varying(256) DEFAULT ''::character varying NOT NULL,
    name character varying(256) DEFAULT ''::character varying,
    checks text,
    operation text,
    entity character varying(256) DEFAULT 'OCA\WorkflowEngine\Entity\File'::character varying NOT NULL,
    events text DEFAULT '[]'::text NOT NULL
);


ALTER TABLE public.oc_flow_operations OWNER TO oc_andmi;

--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_flow_operations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_flow_operations_id_seq OWNER TO oc_andmi;

--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_flow_operations_id_seq OWNED BY public.oc_flow_operations.id;


--
-- Name: oc_flow_operations_scope; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_flow_operations_scope (
    id bigint NOT NULL,
    operation_id integer DEFAULT 0 NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    value character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_flow_operations_scope OWNER TO oc_andmi;

--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_flow_operations_scope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_flow_operations_scope_id_seq OWNER TO oc_andmi;

--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_flow_operations_scope_id_seq OWNED BY public.oc_flow_operations_scope.id;


--
-- Name: oc_group_admin; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_group_admin (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_admin OWNER TO oc_andmi;

--
-- Name: oc_group_user; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_group_user (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_user OWNER TO oc_andmi;

--
-- Name: oc_groups; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_groups (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    displayname character varying(255) DEFAULT 'name'::character varying NOT NULL
);


ALTER TABLE public.oc_groups OWNER TO oc_andmi;

--
-- Name: oc_jobs; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_jobs (
    id bigint NOT NULL,
    class character varying(255) DEFAULT ''::character varying NOT NULL,
    argument character varying(4000) DEFAULT ''::character varying NOT NULL,
    last_run integer DEFAULT 0,
    last_checked integer DEFAULT 0,
    reserved_at integer DEFAULT 0,
    execution_duration integer DEFAULT 0,
    argument_hash character varying(32) DEFAULT NULL::character varying,
    time_sensitive smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_jobs OWNER TO oc_andmi;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_jobs_id_seq OWNER TO oc_andmi;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_jobs_id_seq OWNED BY public.oc_jobs.id;


--
-- Name: oc_known_users; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_known_users (
    id bigint NOT NULL,
    known_to character varying(255) NOT NULL,
    known_user character varying(255) NOT NULL
);


ALTER TABLE public.oc_known_users OWNER TO oc_andmi;

--
-- Name: oc_known_users_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_known_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_known_users_id_seq OWNER TO oc_andmi;

--
-- Name: oc_known_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_known_users_id_seq OWNED BY public.oc_known_users.id;


--
-- Name: oc_login_flow_v2; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_login_flow_v2 (
    id bigint NOT NULL,
    "timestamp" bigint NOT NULL,
    started smallint DEFAULT 0 NOT NULL,
    poll_token character varying(255) NOT NULL,
    login_token character varying(255) NOT NULL,
    public_key text NOT NULL,
    private_key text NOT NULL,
    client_name character varying(255) NOT NULL,
    login_name character varying(255) DEFAULT NULL::character varying,
    server character varying(255) DEFAULT NULL::character varying,
    app_password character varying(1024) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_login_flow_v2 OWNER TO oc_andmi;

--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_login_flow_v2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_login_flow_v2_id_seq OWNER TO oc_andmi;

--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_login_flow_v2_id_seq OWNED BY public.oc_login_flow_v2.id;


--
-- Name: oc_migrations; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_migrations (
    app character varying(255) NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE public.oc_migrations OWNER TO oc_andmi;

--
-- Name: oc_mimetypes; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_mimetypes (
    id bigint NOT NULL,
    mimetype character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_mimetypes OWNER TO oc_andmi;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_mimetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_mimetypes_id_seq OWNER TO oc_andmi;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_mimetypes_id_seq OWNED BY public.oc_mimetypes.id;


--
-- Name: oc_mounts; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_mounts (
    id bigint NOT NULL,
    storage_id bigint NOT NULL,
    root_id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    mount_point character varying(4000) NOT NULL,
    mount_id bigint,
    mount_provider_class character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mounts OWNER TO oc_andmi;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_mounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_mounts_id_seq OWNER TO oc_andmi;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_mounts_id_seq OWNED BY public.oc_mounts.id;


--
-- Name: oc_notifications; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_notifications (
    notification_id integer NOT NULL,
    app character varying(32) NOT NULL,
    "user" character varying(64) NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    object_type character varying(64) NOT NULL,
    object_id character varying(64) NOT NULL,
    subject character varying(64) NOT NULL,
    subject_parameters text,
    message character varying(64) DEFAULT NULL::character varying,
    message_parameters text,
    link character varying(4000) DEFAULT NULL::character varying,
    icon character varying(4000) DEFAULT NULL::character varying,
    actions text
);


ALTER TABLE public.oc_notifications OWNER TO oc_andmi;

--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_notifications_notification_id_seq OWNER TO oc_andmi;

--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_notifications_notification_id_seq OWNED BY public.oc_notifications.notification_id;


--
-- Name: oc_notifications_pushhash; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_notifications_pushhash (
    id integer NOT NULL,
    uid character varying(64) NOT NULL,
    token integer DEFAULT 0 NOT NULL,
    deviceidentifier character varying(128) NOT NULL,
    devicepublickey character varying(512) NOT NULL,
    devicepublickeyhash character varying(128) NOT NULL,
    pushtokenhash character varying(128) NOT NULL,
    proxyserver character varying(256) NOT NULL,
    apptype character varying(32) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.oc_notifications_pushhash OWNER TO oc_andmi;

--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_notifications_pushhash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_notifications_pushhash_id_seq OWNER TO oc_andmi;

--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_notifications_pushhash_id_seq OWNED BY public.oc_notifications_pushhash.id;


--
-- Name: oc_notifications_settings; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_notifications_settings (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    batch_time integer DEFAULT 0 NOT NULL,
    last_send_id bigint DEFAULT 0 NOT NULL,
    next_send_time integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_notifications_settings OWNER TO oc_andmi;

--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_notifications_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_notifications_settings_id_seq OWNER TO oc_andmi;

--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_notifications_settings_id_seq OWNED BY public.oc_notifications_settings.id;


--
-- Name: oc_oauth2_access_tokens; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_oauth2_access_tokens (
    id integer NOT NULL,
    token_id integer NOT NULL,
    client_id integer NOT NULL,
    hashed_code character varying(128) NOT NULL,
    encrypted_token character varying(786) NOT NULL
);


ALTER TABLE public.oc_oauth2_access_tokens OWNER TO oc_andmi;

--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_oauth2_access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_oauth2_access_tokens_id_seq OWNER TO oc_andmi;

--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_oauth2_access_tokens_id_seq OWNED BY public.oc_oauth2_access_tokens.id;


--
-- Name: oc_oauth2_clients; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_oauth2_clients (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    redirect_uri character varying(2000) NOT NULL,
    client_identifier character varying(64) NOT NULL,
    secret character varying(512) NOT NULL
);


ALTER TABLE public.oc_oauth2_clients OWNER TO oc_andmi;

--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_oauth2_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_oauth2_clients_id_seq OWNER TO oc_andmi;

--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_oauth2_clients_id_seq OWNED BY public.oc_oauth2_clients.id;


--
-- Name: oc_open_local_editor; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_open_local_editor (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    path_hash character varying(64) NOT NULL,
    expiration_time bigint NOT NULL,
    token character varying(128) NOT NULL
);


ALTER TABLE public.oc_open_local_editor OWNER TO oc_andmi;

--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_open_local_editor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_open_local_editor_id_seq OWNER TO oc_andmi;

--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_open_local_editor_id_seq OWNED BY public.oc_open_local_editor.id;


--
-- Name: oc_photos_albums; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_photos_albums (
    album_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "user" character varying(255) NOT NULL,
    created bigint NOT NULL,
    location character varying(255) NOT NULL,
    last_added_photo bigint NOT NULL
);


ALTER TABLE public.oc_photos_albums OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_photos_albums_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_photos_albums_album_id_seq OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_photos_albums_album_id_seq OWNED BY public.oc_photos_albums.album_id;


--
-- Name: oc_photos_albums_collabs; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_photos_albums_collabs (
    id bigint NOT NULL,
    album_id bigint NOT NULL,
    collaborator_id character varying(64) NOT NULL,
    collaborator_type integer NOT NULL
);


ALTER TABLE public.oc_photos_albums_collabs OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_photos_albums_collabs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_photos_albums_collabs_id_seq OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_photos_albums_collabs_id_seq OWNED BY public.oc_photos_albums_collabs.id;


--
-- Name: oc_photos_albums_files; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_photos_albums_files (
    album_file_id bigint NOT NULL,
    album_id bigint NOT NULL,
    file_id bigint NOT NULL,
    added bigint NOT NULL,
    owner character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_photos_albums_files OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_photos_albums_files_album_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_photos_albums_files_album_file_id_seq OWNER TO oc_andmi;

--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_photos_albums_files_album_file_id_seq OWNED BY public.oc_photos_albums_files.album_file_id;


--
-- Name: oc_preferences; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_preferences (
    userid character varying(64) DEFAULT ''::character varying NOT NULL,
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text
);


ALTER TABLE public.oc_preferences OWNER TO oc_andmi;

--
-- Name: oc_privacy_admins; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_privacy_admins (
    id integer NOT NULL,
    displayname character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_privacy_admins OWNER TO oc_andmi;

--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_privacy_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_privacy_admins_id_seq OWNER TO oc_andmi;

--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_privacy_admins_id_seq OWNED BY public.oc_privacy_admins.id;


--
-- Name: oc_profile_config; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_profile_config (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    config text NOT NULL
);


ALTER TABLE public.oc_profile_config OWNER TO oc_andmi;

--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_profile_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_profile_config_id_seq OWNER TO oc_andmi;

--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_profile_config_id_seq OWNED BY public.oc_profile_config.id;


--
-- Name: oc_properties; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_properties (
    id bigint NOT NULL,
    userid character varying(64) DEFAULT ''::character varying NOT NULL,
    propertypath character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyname character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyvalue text NOT NULL,
    valuetype smallint DEFAULT 1
);


ALTER TABLE public.oc_properties OWNER TO oc_andmi;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_properties_id_seq OWNER TO oc_andmi;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_properties_id_seq OWNED BY public.oc_properties.id;


--
-- Name: oc_ratelimit_entries; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_ratelimit_entries (
    id bigint NOT NULL,
    hash character varying(128) NOT NULL,
    delete_after timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.oc_ratelimit_entries OWNER TO oc_andmi;

--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_ratelimit_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_ratelimit_entries_id_seq OWNER TO oc_andmi;

--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_ratelimit_entries_id_seq OWNED BY public.oc_ratelimit_entries.id;


--
-- Name: oc_reactions; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_reactions (
    id bigint NOT NULL,
    parent_id bigint NOT NULL,
    message_id bigint NOT NULL,
    actor_type character varying(64) DEFAULT ''::character varying NOT NULL,
    actor_id character varying(64) DEFAULT ''::character varying NOT NULL,
    reaction character varying(32) NOT NULL
);


ALTER TABLE public.oc_reactions OWNER TO oc_andmi;

--
-- Name: oc_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_reactions_id_seq OWNER TO oc_andmi;

--
-- Name: oc_reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_reactions_id_seq OWNED BY public.oc_reactions.id;


--
-- Name: oc_recent_contact; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_recent_contact (
    id integer NOT NULL,
    actor_uid character varying(64) NOT NULL,
    uid character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    federated_cloud_id character varying(255) DEFAULT NULL::character varying,
    card bytea NOT NULL,
    last_contact integer NOT NULL
);


ALTER TABLE public.oc_recent_contact OWNER TO oc_andmi;

--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_recent_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_recent_contact_id_seq OWNER TO oc_andmi;

--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_recent_contact_id_seq OWNED BY public.oc_recent_contact.id;


--
-- Name: oc_schedulingobjects; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_schedulingobjects (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL
);


ALTER TABLE public.oc_schedulingobjects OWNER TO oc_andmi;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_schedulingobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_schedulingobjects_id_seq OWNER TO oc_andmi;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_schedulingobjects_id_seq OWNED BY public.oc_schedulingobjects.id;


--
-- Name: oc_share; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_share (
    id bigint NOT NULL,
    share_type smallint DEFAULT 0 NOT NULL,
    share_with character varying(255) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT NULL::character varying,
    uid_owner character varying(64) DEFAULT ''::character varying NOT NULL,
    uid_initiator character varying(64) DEFAULT NULL::character varying,
    parent bigint,
    item_type character varying(64) DEFAULT ''::character varying NOT NULL,
    item_source character varying(255) DEFAULT NULL::character varying,
    item_target character varying(255) DEFAULT NULL::character varying,
    file_source bigint,
    file_target character varying(512) DEFAULT NULL::character varying,
    permissions smallint DEFAULT 0 NOT NULL,
    stime bigint DEFAULT 0 NOT NULL,
    accepted smallint DEFAULT 0 NOT NULL,
    expiration timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    token character varying(32) DEFAULT NULL::character varying,
    mail_send smallint DEFAULT 0 NOT NULL,
    share_name character varying(64) DEFAULT NULL::character varying,
    password_by_talk boolean DEFAULT false,
    note text,
    hide_download smallint DEFAULT 0,
    label character varying(255) DEFAULT NULL::character varying,
    attributes json,
    password_expiration_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_share OWNER TO oc_andmi;

--
-- Name: oc_share_external; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_share_external (
    id bigint NOT NULL,
    parent bigint DEFAULT '-1'::integer,
    share_type integer,
    remote character varying(512) NOT NULL,
    remote_id character varying(255) DEFAULT ''::character varying,
    share_token character varying(64) NOT NULL,
    password character varying(64) DEFAULT NULL::character varying,
    name character varying(4000) NOT NULL,
    owner character varying(64) NOT NULL,
    "user" character varying(64) NOT NULL,
    mountpoint character varying(4000) NOT NULL,
    mountpoint_hash character varying(32) NOT NULL,
    accepted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_share_external OWNER TO oc_andmi;

--
-- Name: oc_share_external_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_share_external_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_share_external_id_seq OWNER TO oc_andmi;

--
-- Name: oc_share_external_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_share_external_id_seq OWNED BY public.oc_share_external.id;


--
-- Name: oc_share_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_share_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_share_id_seq OWNER TO oc_andmi;

--
-- Name: oc_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_share_id_seq OWNED BY public.oc_share.id;


--
-- Name: oc_storages; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_storages (
    numeric_id bigint NOT NULL,
    id character varying(64) DEFAULT NULL::character varying,
    available integer DEFAULT 1 NOT NULL,
    last_checked integer
);


ALTER TABLE public.oc_storages OWNER TO oc_andmi;

--
-- Name: oc_storages_credentials; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_storages_credentials (
    id bigint NOT NULL,
    "user" character varying(64) DEFAULT NULL::character varying,
    identifier character varying(64) NOT NULL,
    credentials text
);


ALTER TABLE public.oc_storages_credentials OWNER TO oc_andmi;

--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_storages_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_storages_credentials_id_seq OWNER TO oc_andmi;

--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_storages_credentials_id_seq OWNED BY public.oc_storages_credentials.id;


--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_storages_numeric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_storages_numeric_id_seq OWNER TO oc_andmi;

--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_storages_numeric_id_seq OWNED BY public.oc_storages.numeric_id;


--
-- Name: oc_systemtag; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_systemtag (
    id bigint NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    visibility smallint DEFAULT 1 NOT NULL,
    editable smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_systemtag OWNER TO oc_andmi;

--
-- Name: oc_systemtag_group; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_systemtag_group (
    systemtagid bigint DEFAULT 0 NOT NULL,
    gid character varying(255) NOT NULL
);


ALTER TABLE public.oc_systemtag_group OWNER TO oc_andmi;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_systemtag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_systemtag_id_seq OWNER TO oc_andmi;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_systemtag_id_seq OWNED BY public.oc_systemtag.id;


--
-- Name: oc_systemtag_object_mapping; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_systemtag_object_mapping (
    objectid character varying(64) DEFAULT ''::character varying NOT NULL,
    objecttype character varying(64) DEFAULT ''::character varying NOT NULL,
    systemtagid bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_systemtag_object_mapping OWNER TO oc_andmi;

--
-- Name: oc_text_documents; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_text_documents (
    id bigint NOT NULL,
    current_version bigint DEFAULT 0,
    last_saved_version bigint DEFAULT 0,
    last_saved_version_time bigint NOT NULL,
    last_saved_version_etag character varying(64) DEFAULT ''::character varying,
    base_version_etag character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_text_documents OWNER TO oc_andmi;

--
-- Name: oc_text_sessions; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_text_sessions (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    guest_name character varying(64) DEFAULT NULL::character varying,
    color character varying(7) DEFAULT NULL::character varying,
    token character varying(64) NOT NULL,
    document_id bigint NOT NULL,
    last_contact bigint NOT NULL,
    last_awareness_message text DEFAULT ''::text
);


ALTER TABLE public.oc_text_sessions OWNER TO oc_andmi;

--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_text_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_text_sessions_id_seq OWNER TO oc_andmi;

--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_text_sessions_id_seq OWNED BY public.oc_text_sessions.id;


--
-- Name: oc_text_steps; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_text_steps (
    id bigint NOT NULL,
    document_id bigint NOT NULL,
    session_id bigint NOT NULL,
    data text NOT NULL,
    version bigint DEFAULT 0
);


ALTER TABLE public.oc_text_steps OWNER TO oc_andmi;

--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_text_steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_text_steps_id_seq OWNER TO oc_andmi;

--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_text_steps_id_seq OWNED BY public.oc_text_steps.id;


--
-- Name: oc_textprocessing_tasks; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_textprocessing_tasks (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    input text NOT NULL,
    output text,
    status integer DEFAULT 0,
    user_id character varying(64) DEFAULT NULL::character varying,
    app_id character varying(32) DEFAULT ''::character varying NOT NULL,
    identifier character varying(255) DEFAULT ''::character varying NOT NULL,
    last_updated integer DEFAULT 0
);


ALTER TABLE public.oc_textprocessing_tasks OWNER TO oc_andmi;

--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_textprocessing_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_textprocessing_tasks_id_seq OWNER TO oc_andmi;

--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_textprocessing_tasks_id_seq OWNED BY public.oc_textprocessing_tasks.id;


--
-- Name: oc_trusted_servers; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_trusted_servers (
    id integer NOT NULL,
    url character varying(512) NOT NULL,
    url_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    token character varying(128) DEFAULT NULL::character varying,
    shared_secret character varying(256) DEFAULT NULL::character varying,
    status integer DEFAULT 2 NOT NULL,
    sync_token character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_trusted_servers OWNER TO oc_andmi;

--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_trusted_servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_trusted_servers_id_seq OWNER TO oc_andmi;

--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_trusted_servers_id_seq OWNED BY public.oc_trusted_servers.id;


--
-- Name: oc_twofactor_backupcodes; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_twofactor_backupcodes (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    code character varying(128) NOT NULL,
    used smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_twofactor_backupcodes OWNER TO oc_andmi;

--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_twofactor_backupcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_twofactor_backupcodes_id_seq OWNER TO oc_andmi;

--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_twofactor_backupcodes_id_seq OWNED BY public.oc_twofactor_backupcodes.id;


--
-- Name: oc_twofactor_providers; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_twofactor_providers (
    provider_id character varying(32) NOT NULL,
    uid character varying(64) NOT NULL,
    enabled smallint NOT NULL
);


ALTER TABLE public.oc_twofactor_providers OWNER TO oc_andmi;

--
-- Name: oc_user_status; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_user_status (
    id bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    status_timestamp integer NOT NULL,
    is_user_defined boolean,
    message_id character varying(255) DEFAULT NULL::character varying,
    custom_icon character varying(255) DEFAULT NULL::character varying,
    custom_message text,
    clear_at integer,
    is_backup boolean DEFAULT false
);


ALTER TABLE public.oc_user_status OWNER TO oc_andmi;

--
-- Name: oc_user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_user_status_id_seq OWNER TO oc_andmi;

--
-- Name: oc_user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_user_status_id_seq OWNED BY public.oc_user_status.id;


--
-- Name: oc_user_transfer_owner; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_user_transfer_owner (
    id bigint NOT NULL,
    source_user character varying(64) NOT NULL,
    target_user character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    node_name character varying(255) NOT NULL
);


ALTER TABLE public.oc_user_transfer_owner OWNER TO oc_andmi;

--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_user_transfer_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_user_transfer_owner_id_seq OWNER TO oc_andmi;

--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_user_transfer_owner_id_seq OWNED BY public.oc_user_transfer_owner.id;


--
-- Name: oc_users; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_users (
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    displayname character varying(64) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT ''::character varying NOT NULL,
    uid_lower character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_users OWNER TO oc_andmi;

--
-- Name: oc_vcategory; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_vcategory (
    id bigint NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL,
    category character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory OWNER TO oc_andmi;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_vcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_vcategory_id_seq OWNER TO oc_andmi;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_vcategory_id_seq OWNED BY public.oc_vcategory.id;


--
-- Name: oc_vcategory_to_object; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_vcategory_to_object (
    objid bigint DEFAULT 0 NOT NULL,
    categoryid bigint DEFAULT 0 NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory_to_object OWNER TO oc_andmi;

--
-- Name: oc_webauthn; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_webauthn (
    id integer NOT NULL,
    uid character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    public_key_credential_id character varying(255) NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.oc_webauthn OWNER TO oc_andmi;

--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_webauthn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_webauthn_id_seq OWNER TO oc_andmi;

--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_webauthn_id_seq OWNED BY public.oc_webauthn.id;


--
-- Name: oc_whats_new; Type: TABLE; Schema: public; Owner: oc_andmi
--

CREATE TABLE public.oc_whats_new (
    id integer NOT NULL,
    version character varying(64) DEFAULT '11'::character varying NOT NULL,
    etag character varying(64) DEFAULT ''::character varying NOT NULL,
    last_check integer DEFAULT 0 NOT NULL,
    data text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.oc_whats_new OWNER TO oc_andmi;

--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_andmi
--

CREATE SEQUENCE public.oc_whats_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_whats_new_id_seq OWNER TO oc_andmi;

--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_andmi
--

ALTER SEQUENCE public.oc_whats_new_id_seq OWNED BY public.oc_whats_new.id;


--
-- Name: oc_accounts_data id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_accounts_data ALTER COLUMN id SET DEFAULT nextval('public.oc_accounts_data_id_seq'::regclass);


--
-- Name: oc_activity activity_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_activity ALTER COLUMN activity_id SET DEFAULT nextval('public.oc_activity_activity_id_seq'::regclass);


--
-- Name: oc_activity_mq mail_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_activity_mq ALTER COLUMN mail_id SET DEFAULT nextval('public.oc_activity_mq_mail_id_seq'::regclass);


--
-- Name: oc_addressbookchanges id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_addressbookchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbookchanges_id_seq'::regclass);


--
-- Name: oc_addressbooks id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_addressbooks ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbooks_id_seq'::regclass);


--
-- Name: oc_authorized_groups id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_authorized_groups ALTER COLUMN id SET DEFAULT nextval('public.oc_authorized_groups_id_seq'::regclass);


--
-- Name: oc_authtoken id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_authtoken ALTER COLUMN id SET DEFAULT nextval('public.oc_authtoken_id_seq'::regclass);


--
-- Name: oc_bruteforce_attempts id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_bruteforce_attempts ALTER COLUMN id SET DEFAULT nextval('public.oc_bruteforce_attempts_id_seq'::regclass);


--
-- Name: oc_calendar_invitations id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_invitations ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_invitations_id_seq'::regclass);


--
-- Name: oc_calendar_reminders id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_reminders ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_reminders_id_seq'::regclass);


--
-- Name: oc_calendar_resources id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_resources ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_resources_id_seq'::regclass);


--
-- Name: oc_calendar_resources_md id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_resources_md ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_resources_md_id_seq'::regclass);


--
-- Name: oc_calendar_rooms id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_rooms ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_rooms_id_seq'::regclass);


--
-- Name: oc_calendar_rooms_md id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_rooms_md ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_rooms_md_id_seq'::regclass);


--
-- Name: oc_calendarchanges id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarchanges_id_seq'::regclass);


--
-- Name: oc_calendarobjects id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarobjects_id_seq'::regclass);


--
-- Name: oc_calendarobjects_props id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarobjects_props ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarobjects_props_id_seq'::regclass);


--
-- Name: oc_calendars id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendars ALTER COLUMN id SET DEFAULT nextval('public.oc_calendars_id_seq'::regclass);


--
-- Name: oc_calendarsubscriptions id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarsubscriptions ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarsubscriptions_id_seq'::regclass);


--
-- Name: oc_cards id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_cards ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_id_seq'::regclass);


--
-- Name: oc_cards_properties id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_cards_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_properties_id_seq'::regclass);


--
-- Name: oc_circles_circle id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_circle ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_circle_id_seq'::regclass);


--
-- Name: oc_circles_member id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_member ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_member_id_seq'::regclass);


--
-- Name: oc_circles_mount id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_mount ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_mount_id_seq'::regclass);


--
-- Name: oc_circles_mountpoint id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_mountpoint ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_mountpoint_id_seq'::regclass);


--
-- Name: oc_circles_remote id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_remote ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_remote_id_seq'::regclass);


--
-- Name: oc_circles_share_lock id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_share_lock ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_share_lock_id_seq'::regclass);


--
-- Name: oc_circles_token id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_token ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_token_id_seq'::regclass);


--
-- Name: oc_collres_collections id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_collres_collections ALTER COLUMN id SET DEFAULT nextval('public.oc_collres_collections_id_seq'::regclass);


--
-- Name: oc_comments id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_comments ALTER COLUMN id SET DEFAULT nextval('public.oc_comments_id_seq'::regclass);


--
-- Name: oc_dav_cal_proxy id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_dav_cal_proxy ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_cal_proxy_id_seq'::regclass);


--
-- Name: oc_dav_shares id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_dav_shares ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_shares_id_seq'::regclass);


--
-- Name: oc_direct_edit id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_direct_edit ALTER COLUMN id SET DEFAULT nextval('public.oc_direct_edit_id_seq'::regclass);


--
-- Name: oc_directlink id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_directlink ALTER COLUMN id SET DEFAULT nextval('public.oc_directlink_id_seq'::regclass);


--
-- Name: oc_file_locks id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_file_locks ALTER COLUMN id SET DEFAULT nextval('public.oc_file_locks_id_seq'::regclass);


--
-- Name: oc_filecache fileid; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_filecache ALTER COLUMN fileid SET DEFAULT nextval('public.oc_filecache_fileid_seq'::regclass);


--
-- Name: oc_files_reminders id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_reminders ALTER COLUMN id SET DEFAULT nextval('public.oc_files_reminders_id_seq'::regclass);


--
-- Name: oc_files_trash auto_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_trash ALTER COLUMN auto_id SET DEFAULT nextval('public.oc_files_trash_auto_id_seq'::regclass);


--
-- Name: oc_files_versions id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_versions ALTER COLUMN id SET DEFAULT nextval('public.oc_files_versions_id_seq'::regclass);


--
-- Name: oc_flow_checks id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_checks ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_checks_id_seq'::regclass);


--
-- Name: oc_flow_operations id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_operations ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_operations_id_seq'::regclass);


--
-- Name: oc_flow_operations_scope id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_operations_scope ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_operations_scope_id_seq'::regclass);


--
-- Name: oc_jobs id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_jobs ALTER COLUMN id SET DEFAULT nextval('public.oc_jobs_id_seq'::regclass);


--
-- Name: oc_known_users id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_known_users ALTER COLUMN id SET DEFAULT nextval('public.oc_known_users_id_seq'::regclass);


--
-- Name: oc_login_flow_v2 id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_login_flow_v2 ALTER COLUMN id SET DEFAULT nextval('public.oc_login_flow_v2_id_seq'::regclass);


--
-- Name: oc_mimetypes id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_mimetypes ALTER COLUMN id SET DEFAULT nextval('public.oc_mimetypes_id_seq'::regclass);


--
-- Name: oc_mounts id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_mounts ALTER COLUMN id SET DEFAULT nextval('public.oc_mounts_id_seq'::regclass);


--
-- Name: oc_notifications notification_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.oc_notifications_notification_id_seq'::regclass);


--
-- Name: oc_notifications_pushhash id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications_pushhash ALTER COLUMN id SET DEFAULT nextval('public.oc_notifications_pushhash_id_seq'::regclass);


--
-- Name: oc_notifications_settings id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications_settings ALTER COLUMN id SET DEFAULT nextval('public.oc_notifications_settings_id_seq'::regclass);


--
-- Name: oc_oauth2_access_tokens id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_oauth2_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oc_oauth2_access_tokens_id_seq'::regclass);


--
-- Name: oc_oauth2_clients id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_oauth2_clients ALTER COLUMN id SET DEFAULT nextval('public.oc_oauth2_clients_id_seq'::regclass);


--
-- Name: oc_open_local_editor id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_open_local_editor ALTER COLUMN id SET DEFAULT nextval('public.oc_open_local_editor_id_seq'::regclass);


--
-- Name: oc_photos_albums album_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums ALTER COLUMN album_id SET DEFAULT nextval('public.oc_photos_albums_album_id_seq'::regclass);


--
-- Name: oc_photos_albums_collabs id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums_collabs ALTER COLUMN id SET DEFAULT nextval('public.oc_photos_albums_collabs_id_seq'::regclass);


--
-- Name: oc_photos_albums_files album_file_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums_files ALTER COLUMN album_file_id SET DEFAULT nextval('public.oc_photos_albums_files_album_file_id_seq'::regclass);


--
-- Name: oc_privacy_admins id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_privacy_admins ALTER COLUMN id SET DEFAULT nextval('public.oc_privacy_admins_id_seq'::regclass);


--
-- Name: oc_profile_config id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_profile_config ALTER COLUMN id SET DEFAULT nextval('public.oc_profile_config_id_seq'::regclass);


--
-- Name: oc_properties id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_properties_id_seq'::regclass);


--
-- Name: oc_ratelimit_entries id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_ratelimit_entries ALTER COLUMN id SET DEFAULT nextval('public.oc_ratelimit_entries_id_seq'::regclass);


--
-- Name: oc_reactions id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_reactions ALTER COLUMN id SET DEFAULT nextval('public.oc_reactions_id_seq'::regclass);


--
-- Name: oc_recent_contact id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_recent_contact ALTER COLUMN id SET DEFAULT nextval('public.oc_recent_contact_id_seq'::regclass);


--
-- Name: oc_schedulingobjects id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_schedulingobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_schedulingobjects_id_seq'::regclass);


--
-- Name: oc_share id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_share ALTER COLUMN id SET DEFAULT nextval('public.oc_share_id_seq'::regclass);


--
-- Name: oc_share_external id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_share_external ALTER COLUMN id SET DEFAULT nextval('public.oc_share_external_id_seq'::regclass);


--
-- Name: oc_storages numeric_id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_storages ALTER COLUMN numeric_id SET DEFAULT nextval('public.oc_storages_numeric_id_seq'::regclass);


--
-- Name: oc_storages_credentials id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_storages_credentials ALTER COLUMN id SET DEFAULT nextval('public.oc_storages_credentials_id_seq'::regclass);


--
-- Name: oc_systemtag id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_systemtag ALTER COLUMN id SET DEFAULT nextval('public.oc_systemtag_id_seq'::regclass);


--
-- Name: oc_text_sessions id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_text_sessions ALTER COLUMN id SET DEFAULT nextval('public.oc_text_sessions_id_seq'::regclass);


--
-- Name: oc_text_steps id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_text_steps ALTER COLUMN id SET DEFAULT nextval('public.oc_text_steps_id_seq'::regclass);


--
-- Name: oc_textprocessing_tasks id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_textprocessing_tasks ALTER COLUMN id SET DEFAULT nextval('public.oc_textprocessing_tasks_id_seq'::regclass);


--
-- Name: oc_trusted_servers id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_trusted_servers ALTER COLUMN id SET DEFAULT nextval('public.oc_trusted_servers_id_seq'::regclass);


--
-- Name: oc_twofactor_backupcodes id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_twofactor_backupcodes ALTER COLUMN id SET DEFAULT nextval('public.oc_twofactor_backupcodes_id_seq'::regclass);


--
-- Name: oc_user_status id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_user_status ALTER COLUMN id SET DEFAULT nextval('public.oc_user_status_id_seq'::regclass);


--
-- Name: oc_user_transfer_owner id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_user_transfer_owner ALTER COLUMN id SET DEFAULT nextval('public.oc_user_transfer_owner_id_seq'::regclass);


--
-- Name: oc_vcategory id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_vcategory ALTER COLUMN id SET DEFAULT nextval('public.oc_vcategory_id_seq'::regclass);


--
-- Name: oc_webauthn id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_webauthn ALTER COLUMN id SET DEFAULT nextval('public.oc_webauthn_id_seq'::regclass);


--
-- Name: oc_whats_new id; Type: DEFAULT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_whats_new ALTER COLUMN id SET DEFAULT nextval('public.oc_whats_new_id_seq'::regclass);


--
-- Data for Name: oc_accounts; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_accounts (uid, data) FROM stdin;
andmi	{"displayname":{"value":"andmi","scope":"v2-federated","verified":"0"},"address":{"value":"","scope":"v2-local","verified":"0"},"website":{"value":"","scope":"v2-local","verified":"0"},"email":{"value":null,"scope":"v2-federated","verified":"0"},"avatar":{"scope":"v2-federated"},"phone":{"value":"","scope":"v2-local","verified":"0"},"twitter":{"value":"","scope":"v2-local","verified":"0"},"fediverse":{"value":"","scope":"v2-local","verified":"0"},"organisation":{"value":"","scope":"v2-local"},"role":{"value":"","scope":"v2-local"},"headline":{"value":"","scope":"v2-local"},"biography":{"value":"","scope":"v2-local"},"profile_enabled":{"value":"1"}}
\.


--
-- Data for Name: oc_accounts_data; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_accounts_data (id, uid, name, value) FROM stdin;
1	andmi	displayname	andmi
2	andmi	address	
3	andmi	website	
4	andmi	email	
5	andmi	phone	
6	andmi	twitter	
7	andmi	fediverse	
8	andmi	organisation	
9	andmi	role	
10	andmi	headline	
11	andmi	biography	
12	andmi	profile_enabled	1
\.


--
-- Data for Name: oc_activity; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_activity (activity_id, "timestamp", priority, type, "user", affecteduser, app, subject, subjectparams, message, messageparams, file, link, object_type, object_id) FROM stdin;
1	1713644797	30	file_created	andmi	andmi	files	created_self	[{"7":"\\/Documents"}]		[]	/Documents	http://localhost/index.php/apps/files/?dir=/	files	7
2	1713644797	30	file_created	andmi	andmi	files	created_self	[{"8":"\\/Documents\\/Readme.md"}]		[]	/Documents/Readme.md	http://localhost/index.php/apps/files/?dir=/Documents	files	8
3	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"8":"\\/Documents\\/Readme.md"}]		[]	/Documents/Readme.md	http://localhost/index.php/apps/files/?dir=/Documents	files	8
4	1713644797	30	file_created	andmi	andmi	files	created_self	[{"9":"\\/Documents\\/Welcome to Nextcloud Hub.docx"}]		[]	/Documents/Welcome to Nextcloud Hub.docx	http://localhost/index.php/apps/files/?dir=/Documents	files	9
5	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"9":"\\/Documents\\/Welcome to Nextcloud Hub.docx"}]		[]	/Documents/Welcome to Nextcloud Hub.docx	http://localhost/index.php/apps/files/?dir=/Documents	files	9
6	1713644797	30	file_created	andmi	andmi	files	created_self	[{"10":"\\/Documents\\/Example.md"}]		[]	/Documents/Example.md	http://localhost/index.php/apps/files/?dir=/Documents	files	10
7	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"10":"\\/Documents\\/Example.md"}]		[]	/Documents/Example.md	http://localhost/index.php/apps/files/?dir=/Documents	files	10
8	1713644797	30	file_created	andmi	andmi	files	created_self	[{"11":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	http://localhost/index.php/apps/files/?dir=/Documents	files	11
9	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"11":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	http://localhost/index.php/apps/files/?dir=/Documents	files	11
10	1713644797	30	file_created	andmi	andmi	files	created_self	[{"12":"\\/Reasons to use Nextcloud.pdf"}]		[]	/Reasons to use Nextcloud.pdf	http://localhost/index.php/apps/files/?dir=/	files	12
11	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"12":"\\/Reasons to use Nextcloud.pdf"}]		[]	/Reasons to use Nextcloud.pdf	http://localhost/index.php/apps/files/?dir=/	files	12
12	1713644797	30	file_created	andmi	andmi	files	created_self	[{"13":"\\/Templates"}]		[]	/Templates	http://localhost/index.php/apps/files/?dir=/	files	13
13	1713644797	30	file_created	andmi	andmi	files	created_self	[{"14":"\\/Templates\\/Mindmap.odg"}]		[]	/Templates/Mindmap.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	14
14	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"14":"\\/Templates\\/Mindmap.odg"}]		[]	/Templates/Mindmap.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	14
15	1713644797	30	file_created	andmi	andmi	files	created_self	[{"15":"\\/Templates\\/Party invitation.odt"}]		[]	/Templates/Party invitation.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	15
16	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"15":"\\/Templates\\/Party invitation.odt"}]		[]	/Templates/Party invitation.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	15
17	1713644797	30	file_created	andmi	andmi	files	created_self	[{"16":"\\/Templates\\/Timesheet.ods"}]		[]	/Templates/Timesheet.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	16
18	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"16":"\\/Templates\\/Timesheet.ods"}]		[]	/Templates/Timesheet.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	16
19	1713644797	30	file_created	andmi	andmi	files	created_self	[{"17":"\\/Templates\\/Photo book.odt"}]		[]	/Templates/Photo book.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	17
20	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"17":"\\/Templates\\/Photo book.odt"}]		[]	/Templates/Photo book.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	17
21	1713644797	30	file_created	andmi	andmi	files	created_self	[{"18":"\\/Templates\\/Letter.odt"}]		[]	/Templates/Letter.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	18
22	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"18":"\\/Templates\\/Letter.odt"}]		[]	/Templates/Letter.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	18
23	1713644797	30	file_created	andmi	andmi	files	created_self	[{"19":"\\/Templates\\/Business model canvas.ods"}]		[]	/Templates/Business model canvas.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	19
24	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"19":"\\/Templates\\/Business model canvas.ods"}]		[]	/Templates/Business model canvas.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	19
25	1713644797	30	file_created	andmi	andmi	files	created_self	[{"20":"\\/Templates\\/Syllabus.odt"}]		[]	/Templates/Syllabus.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	20
26	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"20":"\\/Templates\\/Syllabus.odt"}]		[]	/Templates/Syllabus.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	20
27	1713644797	30	file_created	andmi	andmi	files	created_self	[{"21":"\\/Templates\\/Modern company.odp"}]		[]	/Templates/Modern company.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	21
28	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"21":"\\/Templates\\/Modern company.odp"}]		[]	/Templates/Modern company.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	21
29	1713644797	30	file_created	andmi	andmi	files	created_self	[{"22":"\\/Templates\\/Gotong royong.odp"}]		[]	/Templates/Gotong royong.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	22
30	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"22":"\\/Templates\\/Gotong royong.odp"}]		[]	/Templates/Gotong royong.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	22
31	1713644797	30	file_created	andmi	andmi	files	created_self	[{"23":"\\/Templates\\/Impact effort matrix.whiteboard"}]		[]	/Templates/Impact effort matrix.whiteboard	http://localhost/index.php/apps/files/?dir=/Templates	files	23
32	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"23":"\\/Templates\\/Impact effort matrix.whiteboard"}]		[]	/Templates/Impact effort matrix.whiteboard	http://localhost/index.php/apps/files/?dir=/Templates	files	23
33	1713644797	30	file_created	andmi	andmi	files	created_self	[{"24":"\\/Templates\\/Yellow idea.odp"}]		[]	/Templates/Yellow idea.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	24
34	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"24":"\\/Templates\\/Yellow idea.odp"}]		[]	/Templates/Yellow idea.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	24
35	1713644797	30	file_created	andmi	andmi	files	created_self	[{"25":"\\/Templates\\/Diagram & table.ods"}]		[]	/Templates/Diagram & table.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	25
36	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"25":"\\/Templates\\/Diagram & table.ods"}]		[]	/Templates/Diagram & table.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	25
37	1713644797	30	file_created	andmi	andmi	files	created_self	[{"26":"\\/Templates\\/Readme.md"}]		[]	/Templates/Readme.md	http://localhost/index.php/apps/files/?dir=/Templates	files	26
38	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"26":"\\/Templates\\/Readme.md"}]		[]	/Templates/Readme.md	http://localhost/index.php/apps/files/?dir=/Templates	files	26
39	1713644797	30	file_created	andmi	andmi	files	created_self	[{"27":"\\/Templates\\/Simple.odp"}]		[]	/Templates/Simple.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	27
40	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"27":"\\/Templates\\/Simple.odp"}]		[]	/Templates/Simple.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	27
41	1713644797	30	file_created	andmi	andmi	files	created_self	[{"28":"\\/Templates\\/Invoice.odt"}]		[]	/Templates/Invoice.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	28
42	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"28":"\\/Templates\\/Invoice.odt"}]		[]	/Templates/Invoice.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	28
43	1713644797	30	file_created	andmi	andmi	files	created_self	[{"29":"\\/Templates\\/Product plan.md"}]		[]	/Templates/Product plan.md	http://localhost/index.php/apps/files/?dir=/Templates	files	29
44	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"29":"\\/Templates\\/Product plan.md"}]		[]	/Templates/Product plan.md	http://localhost/index.php/apps/files/?dir=/Templates	files	29
45	1713644797	30	file_created	andmi	andmi	files	created_self	[{"30":"\\/Templates\\/Flowchart.odg"}]		[]	/Templates/Flowchart.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	30
46	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"30":"\\/Templates\\/Flowchart.odg"}]		[]	/Templates/Flowchart.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	30
47	1713644797	30	file_created	andmi	andmi	files	created_self	[{"31":"\\/Templates\\/Mother's day.odt"}]		[]	/Templates/Mother's day.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	31
48	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"31":"\\/Templates\\/Mother's day.odt"}]		[]	/Templates/Mother's day.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	31
49	1713644797	30	file_created	andmi	andmi	files	created_self	[{"32":"\\/Templates\\/Expense report.ods"}]		[]	/Templates/Expense report.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	32
50	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"32":"\\/Templates\\/Expense report.ods"}]		[]	/Templates/Expense report.ods	http://localhost/index.php/apps/files/?dir=/Templates	files	32
51	1713644797	30	file_created	andmi	andmi	files	created_self	[{"33":"\\/Templates\\/Business model canvas.odg"}]		[]	/Templates/Business model canvas.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	33
52	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"33":"\\/Templates\\/Business model canvas.odg"}]		[]	/Templates/Business model canvas.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	33
53	1713644797	30	file_created	andmi	andmi	files	created_self	[{"34":"\\/Templates\\/SWOT analysis.whiteboard"}]		[]	/Templates/SWOT analysis.whiteboard	http://localhost/index.php/apps/files/?dir=/Templates	files	34
54	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"34":"\\/Templates\\/SWOT analysis.whiteboard"}]		[]	/Templates/SWOT analysis.whiteboard	http://localhost/index.php/apps/files/?dir=/Templates	files	34
55	1713644797	30	file_created	andmi	andmi	files	created_self	[{"35":"\\/Templates\\/Meeting notes.md"}]		[]	/Templates/Meeting notes.md	http://localhost/index.php/apps/files/?dir=/Templates	files	35
56	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"35":"\\/Templates\\/Meeting notes.md"}]		[]	/Templates/Meeting notes.md	http://localhost/index.php/apps/files/?dir=/Templates	files	35
57	1713644797	30	file_created	andmi	andmi	files	created_self	[{"36":"\\/Templates\\/Resume.odt"}]		[]	/Templates/Resume.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	36
58	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"36":"\\/Templates\\/Resume.odt"}]		[]	/Templates/Resume.odt	http://localhost/index.php/apps/files/?dir=/Templates	files	36
59	1713644797	30	file_created	andmi	andmi	files	created_self	[{"37":"\\/Templates\\/Org chart.odg"}]		[]	/Templates/Org chart.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	37
60	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"37":"\\/Templates\\/Org chart.odg"}]		[]	/Templates/Org chart.odg	http://localhost/index.php/apps/files/?dir=/Templates	files	37
61	1713644797	30	file_created	andmi	andmi	files	created_self	[{"38":"\\/Templates\\/Elegant.odp"}]		[]	/Templates/Elegant.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	38
62	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"38":"\\/Templates\\/Elegant.odp"}]		[]	/Templates/Elegant.odp	http://localhost/index.php/apps/files/?dir=/Templates	files	38
63	1713644797	30	file_created	andmi	andmi	files	created_self	[{"39":"\\/Photos"}]		[]	/Photos	http://localhost/index.php/apps/files/?dir=/	files	39
64	1713644797	30	file_created	andmi	andmi	files	created_self	[{"40":"\\/Photos\\/Frog.jpg"}]		[]	/Photos/Frog.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	40
65	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"40":"\\/Photos\\/Frog.jpg"}]		[]	/Photos/Frog.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	40
66	1713644797	30	file_created	andmi	andmi	files	created_self	[{"41":"\\/Photos\\/Library.jpg"}]		[]	/Photos/Library.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	41
67	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"41":"\\/Photos\\/Library.jpg"}]		[]	/Photos/Library.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	41
68	1713644797	30	file_created	andmi	andmi	files	created_self	[{"42":"\\/Photos\\/Toucan.jpg"}]		[]	/Photos/Toucan.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	42
69	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"42":"\\/Photos\\/Toucan.jpg"}]		[]	/Photos/Toucan.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	42
70	1713644797	30	file_created	andmi	andmi	files	created_self	[{"43":"\\/Photos\\/Steps.jpg"}]		[]	/Photos/Steps.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	43
71	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"43":"\\/Photos\\/Steps.jpg"}]		[]	/Photos/Steps.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	43
72	1713644797	30	file_created	andmi	andmi	files	created_self	[{"44":"\\/Photos\\/Readme.md"}]		[]	/Photos/Readme.md	http://localhost/index.php/apps/files/?dir=/Photos	files	44
73	1713644797	30	file_changed	andmi	andmi	files	changed_self	[{"44":"\\/Photos\\/Readme.md"}]		[]	/Photos/Readme.md	http://localhost/index.php/apps/files/?dir=/Photos	files	44
74	1713644798	30	file_created	andmi	andmi	files	created_self	[{"45":"\\/Photos\\/Nextcloud community.jpg"}]		[]	/Photos/Nextcloud community.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	45
75	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"45":"\\/Photos\\/Nextcloud community.jpg"}]		[]	/Photos/Nextcloud community.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	45
76	1713644798	30	file_created	andmi	andmi	files	created_self	[{"46":"\\/Photos\\/Birdie.jpg"}]		[]	/Photos/Birdie.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	46
77	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"46":"\\/Photos\\/Birdie.jpg"}]		[]	/Photos/Birdie.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	46
78	1713644798	30	file_created	andmi	andmi	files	created_self	[{"47":"\\/Photos\\/Gorilla.jpg"}]		[]	/Photos/Gorilla.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	47
79	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"47":"\\/Photos\\/Gorilla.jpg"}]		[]	/Photos/Gorilla.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	47
80	1713644798	30	file_created	andmi	andmi	files	created_self	[{"48":"\\/Photos\\/Vineyard.jpg"}]		[]	/Photos/Vineyard.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	48
81	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"48":"\\/Photos\\/Vineyard.jpg"}]		[]	/Photos/Vineyard.jpg	http://localhost/index.php/apps/files/?dir=/Photos	files	48
82	1713644798	30	file_created	andmi	andmi	files	created_self	[{"49":"\\/Readme.md"}]		[]	/Readme.md	http://localhost/index.php/apps/files/?dir=/	files	49
83	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"49":"\\/Readme.md"}]		[]	/Readme.md	http://localhost/index.php/apps/files/?dir=/	files	49
84	1713644798	30	file_created	andmi	andmi	files	created_self	[{"50":"\\/Templates credits.md"}]		[]	/Templates credits.md	http://localhost/index.php/apps/files/?dir=/	files	50
85	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"50":"\\/Templates credits.md"}]		[]	/Templates credits.md	http://localhost/index.php/apps/files/?dir=/	files	50
86	1713644798	30	file_created	andmi	andmi	files	created_self	[{"51":"\\/Nextcloud.png"}]		[]	/Nextcloud.png	http://localhost/index.php/apps/files/?dir=/	files	51
87	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"51":"\\/Nextcloud.png"}]		[]	/Nextcloud.png	http://localhost/index.php/apps/files/?dir=/	files	51
88	1713644798	30	file_created	andmi	andmi	files	created_self	[{"52":"\\/Nextcloud Manual.pdf"}]		[]	/Nextcloud Manual.pdf	http://localhost/index.php/apps/files/?dir=/	files	52
89	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"52":"\\/Nextcloud Manual.pdf"}]		[]	/Nextcloud Manual.pdf	http://localhost/index.php/apps/files/?dir=/	files	52
90	1713644798	30	file_created	andmi	andmi	files	created_self	[{"53":"\\/Nextcloud intro.mp4"}]		[]	/Nextcloud intro.mp4	http://localhost/index.php/apps/files/?dir=/	files	53
91	1713644798	30	file_changed	andmi	andmi	files	changed_self	[{"53":"\\/Nextcloud intro.mp4"}]		[]	/Nextcloud intro.mp4	http://localhost/index.php/apps/files/?dir=/	files	53
92	1713644798	30	calendar	andmi	andmi	dav	calendar_add_self	{"actor":"andmi","calendar":{"id":1,"uri":"personal","name":"Personal"}}		[]			calendar	1
93	1713644798	30	contacts	andmi	andmi	dav	addressbook_add_self	{"actor":"andmi","addressbook":{"id":1,"uri":"contacts","name":"Contacts"}}		[]			addressbook	1
94	1713645765	30	file_created	andmi	andmi	files	created_self	[{"232":"\\/Photos\\/5e09727676e20ddddb9cd6d7555564ce.webp"}]		[]	/Photos/5e09727676e20ddddb9cd6d7555564ce.webp	http://localhost:8080/apps/files/?dir=/Photos	files	232
95	1713645789	30	file_changed	andmi	andmi	files	changed_self	[{"44":"\\/Photos\\/Readme.md"}]		[]	/Photos/Readme.md	http://localhost:8080/apps/files/?dir=/Photos	files	44
\.


--
-- Data for Name: oc_activity_mq; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_activity_mq (mail_id, amq_timestamp, amq_latest_send, amq_type, amq_affecteduser, amq_appid, amq_subject, amq_subjectparams, object_type, object_id) FROM stdin;
\.


--
-- Data for Name: oc_addressbookchanges; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_addressbookchanges (id, uri, synctoken, addressbookid, operation) FROM stdin;
\.


--
-- Data for Name: oc_addressbooks; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_addressbooks (id, principaluri, displayname, uri, description, synctoken) FROM stdin;
1	principals/users/andmi	Contacts	contacts	\N	1
\.


--
-- Data for Name: oc_appconfig; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_appconfig (appid, configkey, configvalue) FROM stdin;
core	installedat	1713644784.6115
core	lastupdatedat	1713644784.6128
core	vendor	nextcloud
sharebymail	installed_version	1.17.0
sharebymail	types	filesystem
sharebymail	enabled	yes
workflowengine	installed_version	2.9.0
workflowengine	types	filesystem
workflowengine	enabled	yes
theming	installed_version	2.2.0
theming	types	logging
theming	enabled	yes
files_rightclick	installed_version	1.6.0
files_rightclick	types	
files_rightclick	enabled	yes
related_resources	installed_version	1.2.0
related_resources	types	
related_resources	enabled	yes
serverinfo	installed_version	1.17.0
serverinfo	types	
serverinfo	enabled	yes
firstrunwizard	installed_version	2.16.0
firstrunwizard	types	logging
firstrunwizard	enabled	yes
text	installed_version	3.8.0
text	types	dav
text	enabled	yes
files_sharing	installed_version	1.19.0
core	public_files	files_sharing/public.php
files_sharing	types	filesystem
files_sharing	enabled	yes
recommendations	installed_version	1.6.0
recommendations	types	
recommendations	enabled	yes
updatenotification	installed_version	1.17.0
updatenotification	types	
updatenotification	enabled	yes
privacy	installed_version	1.11.0
privacy	types	
privacy	enabled	yes
files_trashbin	installed_version	1.17.0
files_trashbin	types	filesystem,dav
files_trashbin	enabled	yes
files_reminders	installed_version	1.0.0
files_reminders	types	
files_reminders	enabled	yes
notifications	installed_version	2.15.0
notifications	types	logging
notifications	enabled	yes
viewer	installed_version	2.1.0
viewer	types	
viewer	enabled	yes
weather_status	installed_version	1.7.0
weather_status	types	
weather_status	enabled	yes
logreader	installed_version	2.12.0
logreader	types	logging
logreader	enabled	yes
dav	installed_version	1.27.0
core	public_webdav	dav/appinfo/v1/publicwebdav.php
dav	types	filesystem
dav	enabled	yes
survey_client	installed_version	1.15.0
survey_client	types	
survey_client	enabled	yes
systemtags	installed_version	1.17.0
systemtags	types	logging
systemtags	enabled	yes
federation	installed_version	1.17.0
federation	types	authentication
federation	enabled	yes
user_status	installed_version	1.7.0
user_status	types	
user_status	enabled	yes
support	installed_version	1.10.0
support	types	session
support	enabled	yes
provisioning_api	installed_version	1.17.0
provisioning_api	types	prevent_group_restriction
provisioning_api	enabled	yes
activity	installed_version	2.19.0
activity	types	filesystem
activity	enabled	yes
comments	installed_version	1.17.0
comments	types	logging
comments	enabled	yes
nextcloud_announcements	installed_version	1.16.0
nextcloud_announcements	types	logging
nextcloud_announcements	enabled	yes
dashboard	installed_version	7.7.0
dashboard	types	
dashboard	enabled	yes
files	installed_version	1.22.0
files	types	filesystem
files	enabled	yes
files_versions	installed_version	1.20.0
files_versions	types	filesystem,dav
files_versions	enabled	yes
oauth2	installed_version	1.15.1
oauth2	types	authentication
oauth2	enabled	yes
federatedfilesharing	installed_version	1.17.0
federatedfilesharing	types	
federatedfilesharing	enabled	yes
cloud_federation_api	installed_version	1.10.0
cloud_federation_api	types	filesystem
cloud_federation_api	enabled	yes
circles	installed_version	27.0.1
circles	types	filesystem,dav
circles	enabled	yes
settings	installed_version	1.9.0
settings	types	
settings	enabled	yes
files_pdfviewer	installed_version	2.8.0
files_pdfviewer	types	
files_pdfviewer	enabled	yes
contactsinteraction	installed_version	1.8.0
contactsinteraction	types	dav
contactsinteraction	enabled	yes
twofactor_backupcodes	installed_version	1.16.0
twofactor_backupcodes	types	
twofactor_backupcodes	enabled	yes
photos	installed_version	2.3.0
photos	types	dav,authentication
photos	enabled	yes
lookup_server_connector	installed_version	1.15.0
lookup_server_connector	types	authentication
lookup_server_connector	enabled	yes
password_policy	installed_version	1.17.0
password_policy	types	authentication
password_policy	enabled	yes
circles	loopback_tmp_scheme	http
serverinfo	cached_count_filecache	63
serverinfo	cached_count_storages	2
backgroundjob	lastjob	8
core	lastcron	1713645832
\.


--
-- Data for Name: oc_authorized_groups; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_authorized_groups (id, group_id, class) FROM stdin;
\.


--
-- Data for Name: oc_authtoken; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_authtoken (id, uid, login_name, password, name, token, type, remember, last_activity, last_check, scope, expires, private_key, public_key, version, password_invalid, password_hash) FROM stdin;
2	andmi	andmi	RdyOyRJpLqSeC7g1tSun/jvikRy9GacfpS4FMC9ZijCQsyiYV4k3AQSoCpoeiRLRCccX7EbH7PG3XqB+eCEho+gF5DNEZtGMKFmqs4SumEEiJzOZrUY101flB+wthQLrI7avhwm5s94RQRxy+YJLT929wN66fk7xvRBsXDKt/UcZXBhzDT01XAaw0exSqRIoxVsWOtjvtkK+tKQuLMHL1U/kz0aXn/fLBamvUrd7gJIsa3UfS5fA60ydhO2sMohCEY+dYB68iBSdKd5hFY0x5UiieKTPcI4xAXc/Dce6r5jNTstGJBacB/FTIFLayQ+Z2jOfpUgaqeD6LDyX0dHu7Q==	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	e49087007d62cd8895151a2232b2bda2297b3fd5b3bcb832f94079d4589ffa19c84a0612e684442ddeed3ec823eaa6a01a59fdcee8a9267d56f239d84ddeaea0	0	1	1713648328	1713648268	\N	\N	3a8f5e91feea0d037a6ffff94e608bca2a6c8a1c95e4d4d311971e9f12d2c9fbde89c84800f079fd311221f40c05126afd35fc004a06667a906feaa91755b5966495f84231c1c05c77f6bccfe7f4f297cae34ba0f3df98dbcbf0d4be28f8513991ac5478dcdb6b17c425319891e1478880731738863606bab95442b7b42d2ccc0de933fabc5b3e8cfe561b78a7e6cbd8121d50ee9b8b5dd2b77eb8a9a8aefc92f0cb07a6c767c20d8f22fd60b43d8ac52ae1c9072e5fc0594951fbd3c025634c435cda4e03e8ace2403a1b67e3b5094978af2972107de44f3899093da311a474157a98c2df30666f790b5dcc4b30586db39210b5d268c7adb36238b937e21cafed26ba54e55883646a049ef8e4b8e3ed984875f5e23095ea700324eb601967252713ed9dc627cae87296e3c9d6044431c48d2b3e2c68b11c38b2287eb41531854b9c5660f1760cc2d01a73862fe9cde367eb227b1e54db68e6df95f5554776e8d8a8597ef2627b9ef974ab6cbf568f0ea823b10c4e25f30bf16dead63e5c1f341dc26f2762737aed571cf0d1a6415397e6fcf6e866a3b65df659e16489c2721a4749fca0fd87831f0231dad845fe71d848ef4c9f11b1b452507007156d24ca1274cc6a255e60cd2556dd569fe1a8c300b1f9f282834fa2fc40564077fe3fc17bc393088ff31623f6ad77673b5afa9b42f9eb9a2364eeafcc6135161109da1914b1a0cb4ca333d858937d7a6548d57fbda57aadbc8d78dded4a8f4d12ddbb5345424c3068c09836a677a81fc133049e2ba06b59282cba119689d31405c511badc6406770fc588a9d8fa5a1e23acdf5ca35fba5048628b5d66dfd7fd1efd66bf19364dad26342701d3b26622439e24c3669cb9aa004c2dbc75784a87f663ee163dc381741be1ddc7dcf9a298e27b41ce514c3cfa4dd7bd3ab3dc01721d5991082c7e8d7dfcac65005b9e8568defa1ccbb0a469f94d310e66197800db0942fef2a82334c51733a2f05994daf80a36b6e50722c21103e47b010be7de1d5026339cf6491285e79c1c72fee5983bf7d50ae07cbd977fd92950c622e2593ff4b85c0fea5590b8d5d445db9d299014bccfd0b65e2b361aec2068705c47c61a06f077cdaddc6272d45bfa32b0ff95c1a20cb7c8546f09f6ed11ad8ef0418c90f175532135831bbad935ec42b9a07ce06615eaf9ee8b143ae16f30cb077df4ad2f6609c4c2d28c62b7d56ddd163c44302af91a4db6b78340b62b9bac489cf93a8ef59cb8219958928da03b123578b51a97e001f4570717522859d039c5202fe616f3ddab481c872ca09a436e0c04380d05b0fc2f3acb6bd0588b38b3600ec6cabd0f51a5536699ba50a3ad894ea185931f62fc6d5afc3cee73b2589fdddb0e2143c4f96b6c308ccb6048e502ed9ae1cd8f19b541212c9b0f4788aa8897fac259c1c809d106d58782d4cbeabf39988f9ecdccf06647ccebd955c050d16170f75ce0739570d491730b08818f451ea39bd49fac1909df0d1c56628c212ed09ef54fce909dc04c751a4c0310166235d3ef8eb2c7262d0d8d7c79d1eb358fa61da7bad2cbdcfcef6bc7f5eaa26840c62f658a9a2dd0982309287a39376b277924c9b630f8c2db6ecfe8377abb87c286e3f6f1f38ead4c5b7b2f5600b187f5adaeddfa89d305a80df9c91005b4d49e5c9694284dca89ce7b2aa074548f792f8cc7c980903850147c8b2c5d73965b29288d80f044d935c9e7abb7a551cb61525790a32816a68e4446fc2155082a49132f4edd386e91def08b360e7f6ea7ba406f98e8568c9249c845d65f96dfaca7abfafceba33b0fc7e05763cfb678d080dffe600c9961532e9b589a29d379542a0e929e2c7681a170f8f00c3a35b3e8adf1256245f82ea0b883488d7de670f0f845cb94b5a879f7e8dec6aee6791d3f5fba78f27d260a05c5c7a827828b61e9d54fe9ae892461ac0bdb1508089c57fa7899c106175ee21b87fe317c343b4fde7c87c733af020e1fe9915c400a566e1d59fab474a4694c26407e7d44c0653eeff00c4854ad50d389588f96dbd95dd90d417097080b4923a71674e398882673c6bd562bfcc5230e97a7b3f0aeed0c281aa862ffc83803938c2499aeb631ace24be7dd6cef90941680a0655cc46ef528838ef12014453d6313e56ad867d701ea72fa8dcec5339e0150c3741cac5077d8402a5bfdb03838cdaf2968853a328c379803b4bbbd8ebaecffec51d7796e052e4baa4ba0963829a6d3485450fb0b4ec31b5e4d74cc8a4e1714fd8a1579d3e005c7697ed80b5cae19c6246d59e9d280a527f105b508c245e77b508d988bd9e211f07d5c4ed70226131eaa1a34dcfcc74b1eb984ae15a966c5b17a8dbacaf02b22ef8ee300b7422ea1636111796daa823cc4d22207811620b912fc6f93|f60ecfa6aec3a0c6b63dbb90cc982887|75ba6a564c2657bd5444613e0eed9ab254b157e8a047eb78df12297ebea5dd581949685730338e1b50b9f5b2aee5200b587372a6017d2755dc5eed0e8f80ba79|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqYOvHDnAZPGhkPzQeZ8r\nL+HlT8A3Sp77WtCG1kpYZ/paOTdn+qS6S2RKoO9YKSrQP0xkUfirSGoK10i1HZ80\nDuKSk48KQORgw5wcSoeiYc7qoLpPQQ+VzdysbA5H9IemXW9R2mex+PennPsX+iNa\ncNFFePFHlLhvvbFYQdxKaqkeG3zd5CIv6Z5YsDUrRchFvJCZhsulVlML67nXgOpE\ng2RV8WZ3nM7ANGIQ2Lt/7frIlHiPnstPbK+K6zMEE+XXolrOQhmSgGXue4dEQ4XG\n9TLAND36TgeBsbyxPhMs3auuXzo2cpEAQFC+f/FiPqoj2TZKlsXwEjfWaZli4I3/\nwQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$V0c5RjYyY0YvYlprLzVNaA$UXRcjXaYHcTT1nhdQCvA8PAlwg7ef8H8HgIjvZkLCRo
\.


--
-- Data for Name: oc_bruteforce_attempts; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_bruteforce_attempts (id, action, occurred, ip, subnet, metadata) FROM stdin;
\.


--
-- Data for Name: oc_calendar_invitations; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_invitations (id, uid, recurrenceid, attendee, organizer, sequence, token, expiration) FROM stdin;
\.


--
-- Data for Name: oc_calendar_reminders; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_reminders (id, calendar_id, object_id, is_recurring, uid, recurrence_id, is_recurrence_exception, event_hash, alarm_hash, type, is_relative, notification_date, is_repeat_based) FROM stdin;
\.


--
-- Data for Name: oc_calendar_resources; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_resources (id, backend_id, resource_id, email, displayname, group_restrictions) FROM stdin;
\.


--
-- Data for Name: oc_calendar_resources_md; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_resources_md (id, resource_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_calendar_rooms; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_rooms (id, backend_id, resource_id, email, displayname, group_restrictions) FROM stdin;
\.


--
-- Data for Name: oc_calendar_rooms_md; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendar_rooms_md (id, room_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_calendarchanges; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendarchanges (id, uri, synctoken, calendarid, operation, calendartype) FROM stdin;
\.


--
-- Data for Name: oc_calendarobjects; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendarobjects (id, calendardata, uri, calendarid, lastmodified, etag, size, componenttype, firstoccurence, lastoccurence, uid, classification, calendartype, deleted_at) FROM stdin;
\.


--
-- Data for Name: oc_calendarobjects_props; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendarobjects_props (id, calendarid, objectid, name, parameter, value, calendartype) FROM stdin;
\.


--
-- Data for Name: oc_calendars; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendars (id, principaluri, displayname, uri, synctoken, description, calendarorder, calendarcolor, timezone, components, transparent, deleted_at) FROM stdin;
1	principals/users/andmi	Personal	personal	1	\N	0	#0082c9	\N	VEVENT	0	\N
\.


--
-- Data for Name: oc_calendarsubscriptions; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_calendarsubscriptions (id, uri, principaluri, displayname, refreshrate, calendarorder, calendarcolor, striptodos, stripalarms, stripattachments, lastmodified, synctoken, source) FROM stdin;
\.


--
-- Data for Name: oc_cards; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_cards (id, addressbookid, carddata, uri, lastmodified, etag, size, uid) FROM stdin;
\.


--
-- Data for Name: oc_cards_properties; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_cards_properties (id, addressbookid, cardid, name, value, preferred) FROM stdin;
\.


--
-- Data for Name: oc_circles_circle; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_circle (id, unique_id, name, display_name, sanitized_name, instance, config, source, settings, description, creation, contact_addressbook, contact_groupname) FROM stdin;
1	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	user:andmi:WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	andmi			1	1	[]		2024-04-20 20:26:37	0	
2	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	app:circles:a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	Circles			8193	10001	[]		2024-04-20 20:26:37	0	
\.


--
-- Data for Name: oc_circles_event; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_event (token, instance, event, result, interface, severity, retry, status, updated, creation) FROM stdin;
\.


--
-- Data for Name: oc_circles_member; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_member (id, single_id, circle_id, member_id, user_id, user_type, instance, invited_by, level, status, note, cached_name, cached_update, contact_id, contact_meta, joined) FROM stdin;
1	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	circles	10000		\N	9	Member	[]	Circles	2024-04-20 20:26:37		\N	2024-04-20 20:26:37
2	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	andmi	1		a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	9	Member	[]	andmi	2024-04-20 20:26:37		\N	2024-04-20 20:26:37
\.


--
-- Data for Name: oc_circles_membership; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_membership (circle_id, single_id, level, inheritance_first, inheritance_last, inheritance_depth, inheritance_path) FROM stdin;
a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	9	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx	1	["a9H3Q5JLegyntNdJ8gXKkhabjLgkoQx"]
WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	9	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB	1	["WnqnJP5MCVJBPBo2xcX7SZfDzZNYjSB"]
\.


--
-- Data for Name: oc_circles_mount; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_mount (id, mount_id, circle_id, single_id, token, parent, mountpoint, mountpoint_hash) FROM stdin;
\.


--
-- Data for Name: oc_circles_mountpoint; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_mountpoint (id, mount_id, single_id, mountpoint, mountpoint_hash) FROM stdin;
\.


--
-- Data for Name: oc_circles_remote; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_remote (id, type, interface, uid, instance, href, item, creation) FROM stdin;
\.


--
-- Data for Name: oc_circles_share_lock; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_share_lock (id, item_id, circle_id, instance) FROM stdin;
\.


--
-- Data for Name: oc_circles_token; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_circles_token (id, share_id, circle_id, single_id, member_id, token, password, accepted) FROM stdin;
\.


--
-- Data for Name: oc_collres_accesscache; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_collres_accesscache (user_id, collection_id, resource_type, resource_id, access) FROM stdin;
\.


--
-- Data for Name: oc_collres_collections; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_collres_collections (id, name) FROM stdin;
\.


--
-- Data for Name: oc_collres_resources; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_collres_resources (collection_id, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: oc_comments; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_comments (id, parent_id, topmost_parent_id, children_count, actor_type, actor_id, message, verb, creation_timestamp, latest_child_timestamp, object_type, object_id, reference_id, reactions, expire_date) FROM stdin;
\.


--
-- Data for Name: oc_comments_read_markers; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_comments_read_markers (user_id, object_type, object_id, marker_datetime) FROM stdin;
\.


--
-- Data for Name: oc_dav_cal_proxy; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_dav_cal_proxy (id, owner_id, proxy_id, permissions) FROM stdin;
\.


--
-- Data for Name: oc_dav_shares; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_dav_shares (id, principaluri, type, access, resourceid, publicuri) FROM stdin;
\.


--
-- Data for Name: oc_direct_edit; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_direct_edit (id, editor_id, token, file_id, user_id, share_id, "timestamp", accessed, file_path) FROM stdin;
\.


--
-- Data for Name: oc_directlink; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_directlink (id, user_id, file_id, token, expiration) FROM stdin;
\.


--
-- Data for Name: oc_federated_reshares; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_federated_reshares (share_id, remote_id) FROM stdin;
\.


--
-- Data for Name: oc_file_locks; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_file_locks (id, lock, key, ttl) FROM stdin;
\.


--
-- Data for Name: oc_file_metadata; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_file_metadata (id, group_name, value) FROM stdin;
40	size	{"width":1600,"height":1067}
41	size	{"width":1600,"height":1066}
42	size	{"width":1600,"height":1067}
43	size	{"width":1200,"height":1800}
45	size	{"width":3000,"height":2000}
46	size	{"width":1600,"height":1067}
47	size	{"width":1600,"height":1067}
48	size	{"width":1920,"height":1281}
51	size	{"width":500,"height":500}
232	size	{"width":500,"height":500}
\.


--
-- Data for Name: oc_filecache; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_filecache (fileid, storage, path, path_hash, parent, name, mimetype, mimepart, size, mtime, storage_mtime, encrypted, unencrypted_size, etag, permissions, checksum) FROM stdin;
64	1	cache	0fea6a13c52b4d4725368f24b045ca84	1	cache	2	1	0	1713644913	1713644913	0	0	662425710e866	31	
5	2	appdata_oc2umat4fcst/photos	6ada9368994b572073182507c5aa3399	4	photos	2	1	0	1713644797	1713644797	0	0	662424fd12b82	31	
6	2	appdata_oc2umat4fcst/photos/geonames	df7c98befa173755a6576baa536c1623	5	geonames	2	1	0	1713644797	1713644797	0	0	662424fd13903	31	
1	1		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	37604501	1713645789	1713645789	0	0	662428dd217aa	23	
4	2	appdata_oc2umat4fcst	a53f0a4bc7b42ed98ed52619828909fb	3	appdata_oc2umat4fcst	2	1	-1	1713645754	1713645754	0	0	662424fd117b1	31	
3	2		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	-1	1713645752	1713645752	0	0	662428b83b4fa	23	
8	1	files/Documents/Readme.md	51ec9e44357d147dd5c212b850f6910f	7	Readme.md	4	3	136	1713644797	1713644797	0	0	85bb1f3acbc74e272ec387012af0efa7	27	
11	1	files/Documents/Nextcloud flyer.pdf	9c5b4dc7182a7435767708ac3e8d126c	7	Nextcloud flyer.pdf	7	5	1083339	1713644797	1713644797	0	0	1f14e493d4898c05fbff17d5d2b39284	27	
9	1	files/Documents/Welcome to Nextcloud Hub.docx	b44cb84f22ceddc4ca2826e026038091	7	Welcome to Nextcloud Hub.docx	6	5	24295	1713644797	1713644797	0	0	faaa6234363b753331d0719bb8baec7c	27	
17	1	files/Templates/Photo book.odt	ea35993988e2799424fef3ff4f420c24	13	Photo book.odt	9	5	5155877	1713644797	1713644797	0	0	51121ff50371e6d6a664bd3246f57ac3	27	
10	1	files/Documents/Example.md	efe0853470dd0663db34818b444328dd	7	Example.md	4	3	1095	1713644797	1713644797	0	0	bdb9449e1593c9aaad95094ed2291e5d	27	
15	1	files/Templates/Party invitation.odt	439f95f734be87868374b1a5a312c550	13	Party invitation.odt	9	5	868111	1713644797	1713644797	0	0	3d12d0855a2755f13c05a6dac2bbf0b1	27	
12	1	files/Reasons to use Nextcloud.pdf	418b19142a61c5bef296ea56ee144ca3	2	Reasons to use Nextcloud.pdf	7	5	976625	1713644797	1713644797	0	0	6b60431c1ec0cf778bc712b65d080cf9	27	
14	1	files/Templates/Mindmap.odg	74cff798fc1b9634ee45380599b2a6da	13	Mindmap.odg	8	5	13653	1713644797	1713644797	0	0	f720816aae9318cd423508e5eb924b55	27	
18	1	files/Templates/Letter.odt	15545ade0e9863c98f3a5cc0fbf2836a	13	Letter.odt	9	5	15961	1713644797	1713644797	0	0	4598763f8b277e86518e2f2f4598b401	27	
16	1	files/Templates/Timesheet.ods	cb79c81e41d3c3c77cd31576dc7f1a3a	13	Timesheet.ods	10	5	88394	1713644797	1713644797	0	0	c8b73a3ab09c92a25ba1526c42e2388f	27	
21	1	files/Templates/Modern company.odp	96ad2c06ebb6a79bcdf2f4030421dee3	13	Modern company.odp	11	5	317015	1713644797	1713644797	0	0	06149c773380462c250407ee61796836	27	
19	1	files/Templates/Business model canvas.ods	86c10a47dedf156bf4431cb75e0f76ec	13	Business model canvas.ods	10	5	52843	1713644797	1713644797	0	0	0c02abb26c8e84d69e87911f0ef6e0c0	27	
20	1	files/Templates/Syllabus.odt	03b3147e6dae00674c1d50fe22bb8496	13	Syllabus.odt	9	5	30354	1713644797	1713644797	0	0	9d81c53017d55708525ad427dae529f4	27	
24	1	files/Templates/Yellow idea.odp	3a57051288d7b81bef3196a2123f4af5	13	Yellow idea.odp	11	5	81196	1713644797	1713644797	0	0	1effc54cf225ffca59159573f5ccf843	27	
23	1	files/Templates/Impact effort matrix.whiteboard	c5e3b589ec8f9dd6afdebe0ac6feeac8	13	Impact effort matrix.whiteboard	12	5	52674	1713644797	1713644797	0	0	cd4e1626c412243df380bb1c2ac144f3	27	
22	1	files/Templates/Gotong royong.odp	14b958f5aafb7cfd703090226f3cbd1b	13	Gotong royong.odp	11	5	3509628	1713644797	1713644797	0	0	29476868276fd06808d71dacc11b3dea	27	
25	1	files/Templates/Diagram & table.ods	0a89f154655f6d4a0098bc4e6ca87367	13	Diagram & table.ods	10	5	13378	1713644797	1713644797	0	0	e319bea05b16b9824a0cabf2f57be1c9	27	
26	1	files/Templates/Readme.md	71fa2e74ab30f39eed525572ccc3bbec	13	Readme.md	4	3	554	1713644797	1713644797	0	0	0235332eb6042fcab654cc1734522146	27	
27	1	files/Templates/Simple.odp	a2c90ff606d31419d699b0b437969c61	13	Simple.odp	11	5	14810	1713644797	1713644797	0	0	f8505e346783bfb61546ed538b21b6ea	27	
28	1	files/Templates/Invoice.odt	40fdccb51b6c3e3cf20532e06ed5016e	13	Invoice.odt	9	5	17276	1713644797	1713644797	0	0	a99f9ce47721fd54300cbfb4295982b0	27	
29	1	files/Templates/Product plan.md	a9fbf58bf31cebb8143f7ad3a5205633	13	Product plan.md	4	3	573	1713644797	1713644797	0	0	7cdcd20ca1a060614efdf543cd8bd985	27	
30	1	files/Templates/Flowchart.odg	832942849155883ceddc6f3cede21867	13	Flowchart.odg	8	5	11836	1713644797	1713644797	0	0	e29681880dc28456cdc4c504e010e8b1	27	
31	1	files/Templates/Mother's day.odt	cb66c617dbb4acc9b534ec095c400b53	13	Mother's day.odt	9	5	340061	1713644797	1713644797	0	0	ecd044ecfc1758d26885151dbaa7d89a	27	
7	1	files/Documents	0ad78ba05b6961d92f7970b2b3922eca	2	Documents	2	1	1108865	1713644797	1713644797	0	0	662424fd32864	31	
13	1	files/Templates	530b342d0b8164ff3b4754c2273a453e	2	Templates	2	1	10721152	1713644797	1713644797	0	0	662424fdcc48e	31	
54	2	appdata_oc2umat4fcst/js	b7cde6c0ac44cd5a306757623735ba1b	4	js	2	1	0	1713645748	1713645748	0	0	66242544d8753	31	
247	2	appdata_oc2umat4fcst/preview/f/7/1/7/7/1/6/44	7127cfc24e68128adf23f44d4d0b42de	223	44	2	1	0	1713645834	1713645834	0	0	66242909d72f4	31	
32	1	files/Templates/Expense report.ods	d0a4025621279b95d2f94ff4ec09eab3	13	Expense report.ods	10	5	13441	1713644797	1713644797	0	0	89b04b631f72cfb6954c006d1a07136f	27	
44	1	files/Photos/Readme.md	2a4ac36bb841d25d06d164f291ee97db	39	Readme.md	4	3	149	1713645789	1713645789	0	0	152b5e5ee9cc6a55cb8b2d9dda463582	27	
39	1	files/Photos	d01bb67e7b71dd49fd06bad922f521c9	2	Photos	2	1	5711456	1713645789	1713645765	0	0	662428dd217aa	31	
40	1	files/Photos/Frog.jpg	d6219add1a9129ed0c1513af985e2081	39	Frog.jpg	14	13	457744	1713644797	1713644797	0	0	0cb50a261dc4857a8928bd841f4f2526	27	
33	1	files/Templates/Business model canvas.odg	6a8f3e02bdf45c8b0671967969393bcb	13	Business model canvas.odg	8	5	16988	1713644797	1713644797	0	0	ecb37874448288788da65838f626b717	27	
34	1	files/Templates/SWOT analysis.whiteboard	3fd0e44b3e6f0e7144442ef6fc71a663	13	SWOT analysis.whiteboard	12	5	38605	1713644797	1713644797	0	0	b3566413a32203cddc4a3b49325ce89b	27	
35	1	files/Templates/Meeting notes.md	c0279758bb570afdcdbc2471b2f16285	13	Meeting notes.md	4	3	326	1713644797	1713644797	0	0	3fa112db3774866900595e1576642ebb	27	
36	1	files/Templates/Resume.odt	ace8f81202eadb2f0c15ba6ecc2539f5	13	Resume.odt	9	5	39404	1713644797	1713644797	0	0	5a9c61c4a5fd7f6b2c90c7d2e4b91d34	27	
37	1	files/Templates/Org chart.odg	fd846bc062b158abb99a75a5b33b53e7	13	Org chart.odg	8	5	13878	1713644797	1713644797	0	0	4a45000516bff5a335ef7e6767e6b71a	27	
38	1	files/Templates/Elegant.odp	f3ec70ed694c0ca215f094b98eb046a7	13	Elegant.odp	11	5	14316	1713644797	1713644797	0	0	982d1f5157c142624c4e9190e9eda260	27	
41	1	files/Photos/Library.jpg	0b785d02a19fc00979f82f6b54a05805	39	Library.jpg	14	13	2170375	1713644797	1713644797	0	0	363bed3b65f1c27cfd617b3ac0179777	27	
47	1	files/Photos/Gorilla.jpg	6d5f5956d8ff76a5f290cebb56402789	39	Gorilla.jpg	14	13	474653	1713644798	1713644798	0	0	8851cfdbaacb6c5079ce59882b3ba524	27	
42	1	files/Photos/Toucan.jpg	681d1e78f46a233e12ecfa722cbc2aef	39	Toucan.jpg	14	13	167989	1713644797	1713644797	0	0	5d4566819c626789488d71b8c48f4f1e	27	
45	1	files/Photos/Nextcloud community.jpg	b9b3caef83a2a1c20354b98df6bcd9d0	39	Nextcloud community.jpg	14	13	797325	1713644798	1713644798	0	0	1c3d4b9b517a45e4d1f312e0759a75da	27	
43	1	files/Photos/Steps.jpg	7b2ca8d05bbad97e00cbf5833d43e912	39	Steps.jpg	14	13	567689	1713644797	1713644797	0	0	5a3ccd342943fb7fb50b30736d9f527a	27	
50	1	files/Templates credits.md	f7c01e3e0b55bb895e09dc08d19375b3	2	Templates credits.md	4	3	2403	1713644798	1713644798	0	0	ef5b1a159ce3430432240e87f2b7302d	27	
46	1	files/Photos/Birdie.jpg	cd31c7af3a0ec6e15782b5edd2774549	39	Birdie.jpg	14	13	593508	1713644798	1713644798	0	0	925768348c48b03682089568415f29ec	27	
48	1	files/Photos/Vineyard.jpg	14e5f2670b0817614acd52269d971db8	39	Vineyard.jpg	14	13	427030	1713644798	1713644798	0	0	8f8dd523d46c32037d52efac4ff37081	27	
53	1	files/Nextcloud intro.mp4	e4919345bcc87d4585a5525daaad99c0	2	Nextcloud intro.mp4	17	16	3963036	1713644798	1713644798	0	0	aab9423ca0d4f0f49ac97419f6f33eaf	27	
51	1	files/Nextcloud.png	2bcc0ff06465ef1bfc4a868efde1e485	2	Nextcloud.png	15	13	50598	1713644798	1713644798	0	0	c13f466b7959c5b65f8a732cf7811b5d	27	
49	1	files/Readme.md	49af83716f8dcbfa89aaf835241c0b9f	2	Readme.md	4	3	206	1713644798	1713644798	0	0	5b3c8bf9a429736064add2e04c5ab21b	27	
52	1	files/Nextcloud Manual.pdf	2bc58a43566a8edde804a4a97a9c7469	2	Nextcloud Manual.pdf	7	5	15070010	1713644798	1713644798	0	0	3f56ba37fb1c1074f5cbfa0a15ee6541	27	
55	2	appdata_oc2umat4fcst/js/core	cfb466c96694f4620ed3cfde491bfa19	54	core	2	1	0	1713644868	1713644868	0	0	66242544da7ba	31	
56	2	appdata_oc2umat4fcst/js/core/merged-template-prepend.js	be7ff9124ec56ad204083cb3f6e6f9da	55	merged-template-prepend.js	18	5	12238	1713644868	1713644868	0	0	99f3bd1dda2baef46beef0e2aa6bb81e	27	
57	2	appdata_oc2umat4fcst/js/core/merged-template-prepend.js.deps	7fc7187604fe0efcd75c945e17a9b6bc	55	merged-template-prepend.js.deps	12	5	246	1713644868	1713644868	0	0	30160c2a543f1a919560e0fc2121d1df	27	
58	2	appdata_oc2umat4fcst/js/core/merged-template-prepend.js.gzip	1f5c7de61ec7526c8c402c3ac505c360	55	merged-template-prepend.js.gzip	19	5	3098	1713644868	1713644868	0	0	dd89e7a9c04108b961150ff2748828f0	27	
59	2	appdata_oc2umat4fcst/theming	dbd28db22bbf4bf101304052500d9bd3	4	theming	2	1	0	1713644870	1713644870	0	0	66242546966dc	31	
60	2	appdata_oc2umat4fcst/theming/global	5362231e66ef66b6a359ea107caa59a0	59	global	2	1	0	1713644870	1713644870	0	0	6624254697c68	31	
62	2	appdata_oc2umat4fcst/theming/global/0/favIcon-core#0082c9	d75687450c538076fb5128740f45adc6	61	favIcon-core#0082c9	12	5	90022	1713644870	1713644870	0	0	5582622e0865e791a868cafcbff7b4ee	27	
63	2	appdata_oc2umat4fcst/theming/global/0/touchIcon-core#0082c9	5e377bff538d1a34d0ac16b6284094ef	61	touchIcon-core#0082c9	12	5	25247	1713644870	1713644870	0	0	0dee38a4e572f583bf8d7c705a7fdb99	27	
65	2	appdata_oc2umat4fcst/avatar	37f2bd5c1a3f474f96fe067de692fcf9	4	avatar	2	1	0	1713644917	1713644917	0	0	662425757995a	31	
71	2	appdata_oc2umat4fcst/preview	a4f8500173be50b3cf98dd275ca30d93	4	preview	2	1	-1	1713645765	1713645765	0	0	66242909ceae9	31	
72	2	appdata_oc2umat4fcst/preview/d	a8fe00b36cff6aa0b27c3c3cbb83407f	71	d	2	1	-1	1713645598	1713645598	0	0	66242909d2e91	31	
67	2	appdata_oc2umat4fcst/avatar/andmi/avatar-dark.png	5e6ef0f77de686b19a74bb7840a62fa1	66	avatar-dark.png	15	13	18975	1713644918	1713644918	0	0	def369b87b2cda417578c002bfbb2bfa	27	
66	2	appdata_oc2umat4fcst/avatar/andmi	d6d97000ba5822a800392ce7a1cd7f55	65	andmi	2	1	0	1713644918	1713644918	0	0	662425757b9f9	31	
68	2	appdata_oc2umat4fcst/avatar/andmi/generated	1e3236a0bb292c09d700efdbe964d744	66	generated	12	5	0	1713644918	1713644918	0	0	2116672c7ea20c971d51298a602cf9a2	27	
69	2	appdata_oc2umat4fcst/avatar/andmi/avatar-dark.64.png	f8438f74d89b797419459e4d63c8de1e	66	avatar-dark.64.png	15	13	973	1713644918	1713644918	0	0	ea8cbbde2ac6cf8fb0f142b2f1aa6e33	27	
70	2	appdata_oc2umat4fcst/theming/global/0/icon-core-#0082c9filetypes_video.svg	92e9b7155feff3215d8867d56cab8dba	61	icon-core-#0082c9filetypes_video.svg	20	13	277	1713644918	1713644918	0	0	b2bd0d8c4e6b32688bc4088ff98db139	27	
73	2	appdata_oc2umat4fcst/preview/6	d274f7c6e3caa14a7185aa5ed909cf76	71	6	2	1	-1	1713644918	1713644918	0	0	66242576a8bd3	31	
74	2	appdata_oc2umat4fcst/preview/6/c	ed65331f0b90dd148bac09354e3b7fbf	73	c	2	1	-1	1713644918	1713644918	0	0	66242576a83bf	31	
75	2	appdata_oc2umat4fcst/preview/d/9	2cb512429bb82c36ae651618cd2a2172	72	9	2	1	-1	1713644918	1713644918	0	0	66242576a8810	31	
76	2	appdata_oc2umat4fcst/preview/6/7	1fc3aa43ea0ca05ab3f90aa07e347c54	73	7	2	1	-1	1713644918	1713644918	0	0	66242576a8914	31	
77	2	appdata_oc2umat4fcst/preview/d/9/d	8f06e7e67754610908f44ffcb8c0a8ca	75	d	2	1	-1	1713644918	1713644918	0	0	66242576a8604	31	
78	2	appdata_oc2umat4fcst/preview/6/7/c	5a1050bdca6548feae62a7643360ac0e	76	c	2	1	-1	1713644918	1713644918	0	0	66242576a84fe	31	
79	2	appdata_oc2umat4fcst/preview/6/c/8	d13509f611dc3ee318d6300d2cce538d	74	8	2	1	-1	1713644918	1713644918	0	0	66242576a825c	31	
80	2	appdata_oc2umat4fcst/preview/6/c/8/3	844620744ffc2b13acf9651427e6ce12	79	3	2	1	-1	1713644918	1713644918	0	0	66242576a805f	31	
81	2	appdata_oc2umat4fcst/preview/d/9/d/4	a98efec8f5adfe15980cfad31fa8e252	77	4	2	1	-1	1713644918	1713644918	0	0	66242576a78db	31	
82	2	appdata_oc2umat4fcst/preview/6/7/c/6	9ead288075f8d16f90a85cc980035a3c	78	6	2	1	-1	1713644918	1713644918	0	0	66242576a77ff	31	
83	2	appdata_oc2umat4fcst/preview/6/c/8/3/4	d7e681fb836be2a0d8f68ff0062328fc	80	4	2	1	-1	1713644918	1713644918	0	0	66242576a7eec	31	
84	2	appdata_oc2umat4fcst/preview/6/4	7f9aa25617aacb9c5561c1fd83ceadb2	73	4	2	1	-1	1713644918	1713644918	0	0	66242576a9cc6	31	
85	2	appdata_oc2umat4fcst/preview/d/9/d/4/f	47a4bf094c4d4328a460a425aae22a77	81	f	2	1	-1	1713644918	1713644918	0	0	66242576a7549	31	
86	2	appdata_oc2umat4fcst/preview/6/7/c/6/a	13f42d3786d9084508f444fe1ea7458b	82	a	2	1	-1	1713644918	1713644918	0	0	66242576a7641	31	
87	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9	a99e3a6c33b88fb917f23c9e480bdb57	83	9	2	1	-1	1713644918	1713644918	0	0	66242576a7d87	31	
88	2	appdata_oc2umat4fcst/preview/6/4/2	bdefdd15dc68e2c15cecddc7f7e02b34	84	2	2	1	-1	1713644918	1713644918	0	0	66242576a9982	31	
89	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c	ecc85b18228f31f1632609d8fad8ba45	87	c	2	1	-1	1713644918	1713644918	0	0	66242576a7b9e	31	
90	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4	e636223ab2927c9965416d7757bbb11a	85	4	2	1	-1	1713644918	1713644918	0	0	66242576a729e	31	
91	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1	9d2e939ab4602bb575ad800973a94ecf	86	1	2	1	-1	1713644918	1713644918	0	0	66242576a737e	31	
92	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9	5f356fc88ed878bad9db5796a424e61f	90	9	2	1	-1	1713644918	1713644918	0	0	66242576a6f6e	31	
93	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e	0e892a85e0980a9a78f308c7ed0e8313	91	e	2	1	-1	1713644918	1713644918	0	0	66242576a70a0	31	
97	2	appdata_oc2umat4fcst/preview/6/4/2/e	54b60e2f9d1cdbf5e19504d31a0d8440	88	e	2	1	-1	1713644918	1713644918	0	0	66242576a842d	31	
102	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/3000-2000-max.jpg	503d307a37e86caa8ad47cd66c976b77	94	3000-2000-max.jpg	14	13	808212	1713644919	1713644919	0	0	64d4c05605b1ee1c7a7e2958bc94a4f2	27	
103	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46/1600-1067-max.jpg	3e6f1213a753e49ed376e644a2b67bd5	95	1600-1067-max.jpg	14	13	165982	1713644919	1713644919	0	0	4e023201039637d9e4fa3e686b563190	27	
104	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/1600-1067-max.jpg	a4a7e09ca84af4f580042118b5e55790	96	1600-1067-max.jpg	14	13	232378	1713644919	1713644919	0	0	1d289b14efe04cd1764c08a57e082582	27	
152	2	appdata_oc2umat4fcst/preview/3	27afdaa457d7cf3ab25e525236d8a888	71	3	2	1	-1	1713645597	1713645597	0	0	6624281d693c8	31	
61	2	appdata_oc2umat4fcst/theming/global/0	08808ec81b10eb18e7aa298fa98fdfc5	60	0	2	1	0	1713645755	1713645755	0	0	662425469ae92	31	
98	2	appdata_oc2umat4fcst/preview/6/4/2/e/9	8bc2b06acc8e201cabf608ec69b4d690	97	9	2	1	-1	1713644918	1713644918	0	0	66242576a8164	31	
99	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2	d79002337698e4ccb67f9e5e5a80a20c	98	2	2	1	-1	1713644918	1713644918	0	0	66242576a7f6b	31	
100	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e	223878d1560d5970d2a380027182ac15	99	e	2	1	-1	1713644918	1713644918	0	0	66242576a7c6c	31	
248	2	appdata_oc2umat4fcst/preview/f/7/1/7/7/1/6/44/4096-4096-max.png	bd0be46f2bde31f9be782d24ffd4d91e	247	4096-4096-max.png	15	13	36192	1713645834	1713645834	0	0	3620a3bb434148079ff2a2afef688b64	27	
249	2	appdata_oc2umat4fcst/preview/f/7/1/7/7/1/6/44/256-256.png	a909981c93d0b88cc917626c10008f59	247	256-256.png	15	13	6477	1713645834	1713645834	0	0	452a6cb87bee96a74cbc6151a08fb77f	27	
105	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48/1920-1281-max.jpg	2f622f55d7aae1522628949b62367b84	101	1920-1281-max.jpg	14	13	294390	1713644919	1713644919	0	0	5cf34df3340e188ae332e2eacd95d5c8	27	
121	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48/256-256-crop.jpg	0ff5bb3c898f87b19e09947c3f032f5b	101	256-256-crop.jpg	14	13	15761	1713644919	1713644919	0	0	03f10dfb0d892892f19512798aa7697d	27	
101	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48	b35f6870d8566653af09e9683215f540	100	48	2	1	0	1713645759	1713645759	0	0	66242576a6320	31	
106	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46/256-256-crop.jpg	9e56c3b1cc82d4a9f2415384a6e8b420	95	256-256-crop.jpg	14	13	13183	1713644919	1713644919	0	0	81968314a0b32bfd0002e59ae6aa2789	27	
95	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46	aaabac3124211202252b044e9195b609	92	46	2	1	0	1713645758	1713645758	0	0	66242576a6d56	31	
107	2	appdata_oc2umat4fcst/preview/c	37d93205ac658081eae768722a360018	71	c	2	1	-1	1713644919	1713644919	0	0	6624257756f09	31	
108	2	appdata_oc2umat4fcst/preview/c/0	f365b06a22d8bfaef6bd59833cb693d9	107	0	2	1	-1	1713644919	1713644919	0	0	6624257756d82	31	
109	2	appdata_oc2umat4fcst/preview/c/0/c	fdfef7357f5af0d98d33934e7aca23b0	108	c	2	1	-1	1713644919	1713644919	0	0	6624257756b56	31	
110	2	appdata_oc2umat4fcst/preview/c/0/c/7	01177a97074d251f88d7184dc5e4bd2c	109	7	2	1	-1	1713644919	1713644919	0	0	6624257754fa4	31	
111	2	appdata_oc2umat4fcst/preview/c/0/c/7/c	e63d751d569ef807965d4aaa8b0dd79f	110	c	2	1	-1	1713644919	1713644919	0	0	6624257754e32	31	
112	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7	4ac0c8bef4cf38237b32070d5aaf9201	111	7	2	1	-1	1713644919	1713644919	0	0	6624257754cbf	31	
113	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7/6	ccdc94c745274d632eb31bf705d04f45	112	6	2	1	-1	1713644919	1713644919	0	0	6624257754a53	31	
115	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/256-256-crop.jpg	6c2e5f2bb896664215048adc05fed919	96	256-256-crop.jpg	14	13	13880	1713644919	1713644919	0	0	51044c7c02ee45488c8542623c62da58	27	
128	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7/6/50/4096-4096-max.png	c533b96394f9cd04a8bfd0be6d584df0	114	4096-4096-max.png	15	13	185668	1713644919	1713644919	0	0	084235f56ed75ac70e20fa1a58643ac0	27	
129	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7/6/50/256-256-crop.png	7777a035127b2fa514a57620b872d70f	114	256-256-crop.png	15	13	31444	1713644920	1713644920	0	0	795951d9a2fc54247e2890b26e16c88b	27	
114	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7/6/50	67257442d7677cc81b1b508d606d3e6f	113	50	2	1	0	1713645754	1713645754	0	0	6624257752c7f	31	
96	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47	f71fec89c87b065e7271e17efb99e682	93	47	2	1	0	1713645759	1713645759	0	0	66242576a69eb	31	
116	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/256-256-crop.jpg	a1f6799b983c83b63d4cf6bd0a59df22	94	256-256-crop.jpg	14	13	21315	1713644919	1713644919	0	0	88fc5002f66c4a6e000c3deeccac5226	27	
117	2	appdata_oc2umat4fcst/preview/2	2d0a3d731bd6eede6ba40b865183ac50	71	2	2	1	-1	1713644919	1713644919	0	0	66242577805c9	31	
118	2	appdata_oc2umat4fcst/preview/2/8	a58fc6e001a7e11813f1d49a686053bf	117	8	2	1	-1	1713644919	1713644919	0	0	6624257780347	31	
119	2	appdata_oc2umat4fcst/preview/2/8/3	cc368ad30538c95037fca0a0823d9ac4	118	3	2	1	-1	1713644919	1713644919	0	0	662425777ffba	31	
120	2	appdata_oc2umat4fcst/preview/2/8/3/8	899efebed961f25641bd9c71dffb17cc	119	8	2	1	-1	1713644919	1713644919	0	0	662425777fd29	31	
122	2	appdata_oc2umat4fcst/preview/2/8/3/8/0	843491aea54094c0617fb5d4a9ff35b0	120	0	2	1	-1	1713644919	1713644919	0	0	662425777efb1	31	
123	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2	cda2ba3949ba9cdf785dd268fc34a2e3	122	2	2	1	-1	1713644919	1713644919	0	0	662425777e9ed	31	
124	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3	25a4040447015aa10072257b3b6a4ed9	123	3	2	1	-1	1713644919	1713644919	0	0	662425777d0fb	31	
126	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3/51/500-500-max.png	3551d73b865b44cf2980d30c4eef8ff0	125	500-500-max.png	15	13	50545	1713644919	1713644919	0	0	665891403a1b35e1dcf36d58258ebe4f	27	
127	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3/51/256-256-crop.png	4067947b4b547c208937a6529124c302	125	256-256-crop.png	15	13	24388	1713644919	1713644919	0	0	31e5d26836016f27dc2a11bc71fa439f	27	
130	2	appdata_oc2umat4fcst/theming/global/0/favIcon-dashboard#0082c9	5d2e5dc7c431645c8e61c693c2bed39c	61	favIcon-dashboard#0082c9	12	5	90022	1713644920	1713644920	0	0	4c0cf9472dc369a5b23c3c078a602ec5	27	
131	2	appdata_oc2umat4fcst/theming/global/0/touchIcon-dashboard#0082c9	10c0a480d4b6738b5c37db19fbcf863e	61	touchIcon-dashboard#0082c9	12	5	7556	1713644920	1713644920	0	0	6b76d0d27f6ae787a5341fbd9db2032f	27	
132	2	appdata_oc2umat4fcst/theming/global/0/favIcon-photos#0082c9	47081545ee257c6e76979e0e4cb56d55	61	favIcon-photos#0082c9	12	5	90022	1713645595	1713645595	0	0	fdd517441413acaf8279c8fbe66ca0e3	27	
133	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3/51/64-64.png	1c6e33ef19356986022200af69ef345d	125	64-64.png	15	13	3895	1713645595	1713645595	0	0	f6a46ab6c67dbaad37c30fa209391bed	27	
134	2	appdata_oc2umat4fcst/theming/global/0/touchIcon-photos#0082c9	ffcd722e38f5435dc2b1386024859528	61	touchIcon-photos#0082c9	12	5	7264	1713645595	1713645595	0	0	c16b3ccc1df9413fb195d868f8a2a7d8	27	
135	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46/1024-683.jpg	cdbc67f2583dd905067eb96809e1eda3	95	1024-683.jpg	14	13	84185	1713645595	1713645595	0	0	e63685a27cc43c52911566bb979ef3bc	27	
136	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48/1024-683.jpg	e0f6e0e7e053a6cb0739aa25b589ab2f	101	1024-683.jpg	14	13	101397	1713645596	1713645596	0	0	15613ef0b0138a561623e6d40742669b	27	
137	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48/64-43.jpg	4a7c12e98dfd2b17900c26e443fefe39	101	64-43.jpg	14	13	1559	1713645596	1713645596	0	0	1ce914f3fe7cbe2232709b16fe571862	27	
138	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/64-43.jpg	cbfb7e4f1b80a8472b073145c6ddc264	96	64-43.jpg	14	13	1279	1713645596	1713645596	0	0	44c657b735fa1fcdd5806f4f6b681c4f	27	
139	2	appdata_oc2umat4fcst/preview/1	b993ccb9eba2ad31bd5ba8ee91aadd60	71	1	2	1	-1	1713645596	1713645596	0	0	6624281cb47b7	31	
140	2	appdata_oc2umat4fcst/preview/1/7	def0ea5f720c7cb8b8819ec1a68a9fa7	139	7	2	1	-1	1713645596	1713645596	0	0	6624281cb3762	31	
141	2	appdata_oc2umat4fcst/preview/1/7/e	4850e83459b7b92f6cce8a6f3d0fb6c3	140	e	2	1	-1	1713645596	1713645596	0	0	6624281cb2fe9	31	
142	2	appdata_oc2umat4fcst/preview/1/7/e/6	273e504ac4f945a71c2296bdbf8f5cc6	141	6	2	1	-1	1713645596	1713645596	0	0	6624281cb1b5b	31	
143	2	appdata_oc2umat4fcst/preview/1/7/e/6/2	841d8610eafa347079b1357e3f1e3ac4	142	2	2	1	-1	1713645596	1713645596	0	0	6624281cb14b8	31	
144	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1	c92073a28d86fe074c30d8b69aeed6d2	143	1	2	1	-1	1713645596	1713645596	0	0	6624281cb0fd9	31	
145	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6	cee0b5255107cae6a9aa69bfbd938a03	144	6	2	1	-1	1713645596	1713645596	0	0	6624281cb0916	31	
147	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/64-43.jpg	d1dd089cf5243cfcf208d30ee1f43ca7	94	64-43.jpg	14	13	1750	1713645596	1713645596	0	0	9b0e8eeee0cc0c2b298bd4ddbbf37077	27	
148	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6/43/1200-1800-max.jpg	4090f32faea28c0fed210f0691d79f89	146	1200-1800-max.jpg	14	13	207095	1713645597	1713645597	0	0	8d81f47ba218088b8eb2cfe2e701e39f	27	
149	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46/64-43.jpg	ade0ad1f6fa1e0540bd753c62676ac91	95	64-43.jpg	14	13	1564	1713645597	1713645597	0	0	068de0500a2dd9002c1b470e1b5c99e3	27	
150	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/1024-683.jpg	aff12ccd0f7fb100250adcfcb03cc9e2	96	1024-683.jpg	14	13	100650	1713645597	1713645597	0	0	8822968eeb845c0824596ac5a083c69e	27	
151	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6/43/43-64.jpg	1dbbf8773df935d42a7692f0a411e4f3	146	43-64.jpg	14	13	1196	1713645597	1713645597	0	0	822a3e1c0d28970016b260e5aac8226c	27	
146	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6/43	111c4005196794ec780ac6c0713f074d	145	43	2	1	0	1713645759	1713645759	0	0	6624281caaeee	31	
153	2	appdata_oc2umat4fcst/preview/3/4	f43f8f32c551f1425d93beed86fd967d	152	4	2	1	-1	1713645597	1713645597	0	0	6624281d6656c	31	
154	2	appdata_oc2umat4fcst/preview/3/4/1	fcd94d5d0ef78ee01d378ea98cacd7cc	153	1	2	1	-1	1713645597	1713645597	0	0	6624281d651a2	31	
155	2	appdata_oc2umat4fcst/preview/3/4/1/6	243591364e51f5adabadd6627d81811a	154	6	2	1	-1	1713645597	1713645597	0	0	6624281d60a6c	31	
156	2	appdata_oc2umat4fcst/preview/3/4/1/6/a	53d0032950b4d1782050c54035e0e4a0	155	a	2	1	-1	1713645597	1713645597	0	0	6624281d5f7af	31	
157	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7	5d4f09eba8986eaa153f636aa00c6345	156	7	2	1	-1	1713645597	1713645597	0	0	6624281d5f494	31	
158	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5	c33850fbba5c9d8d29f9626a284cc7cc	157	5	2	1	-1	1713645597	1713645597	0	0	6624281d5b1f9	31	
160	2	appdata_oc2umat4fcst/preview/a	49a020eaf8964f877ff5ddbd92c22cbb	71	a	2	1	-1	1713645597	1713645597	0	0	6624281d79469	31	
161	2	appdata_oc2umat4fcst/preview/a/1	a1da0ec7a0e9402053c003d09a8812bf	160	1	2	1	-1	1713645597	1713645597	0	0	6624281d79228	31	
162	2	appdata_oc2umat4fcst/preview/a/1/d	165ecf3df6d088a872565c0ffc299300	161	d	2	1	-1	1713645597	1713645597	0	0	6624281d78d5a	31	
163	2	appdata_oc2umat4fcst/preview/a/1/d/0	b67bfd6d3ef294e158f0117388c6ccb3	162	0	2	1	-1	1713645597	1713645597	0	0	6624281d76ffd	31	
164	2	appdata_oc2umat4fcst/preview/a/1/d/0/c	299fb2f1f1b59e7fc69ef56692f7e305	163	c	2	1	-1	1713645597	1713645597	0	0	6624281d755f1	31	
165	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6	5a83e906c6f1fc92540c34a9fa9f0af6	164	6	2	1	-1	1713645597	1713645597	0	0	6624281d74cbd	31	
166	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e	55ee9e0980bff5d81e4f22ae05f6f91d	165	e	2	1	-1	1713645597	1713645597	0	0	6624281d738f0	31	
168	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6/43/683-1024.jpg	88800d213734bcdd2cf3e867bd3ba661	146	683-1024.jpg	14	13	67033	1713645597	1713645597	0	0	bdcef33fc8f2ddadf3b59546a3094f9e	27	
169	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/1024-683.jpg	5779637a3571706305c643c30520b66f	94	1024-683.jpg	14	13	170187	1713645597	1713645597	0	0	31eee9370f3a62d8df9eb87e4efb1177	27	
170	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e/42/1600-1067-max.jpg	8354cac63add4845b62cf719b5f1c6f1	167	1600-1067-max.jpg	14	13	137923	1713645598	1713645598	0	0	f09aa4f640132fa12930abdb7ec9db37	27	
172	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e/42/64-43.jpg	87ca74506a4702f649ec018ecf7b5e02	167	64-43.jpg	14	13	1784	1713645598	1713645598	0	0	5903add278a61a5d5dcfcd9b3c086e5d	27	
173	2	appdata_oc2umat4fcst/preview/d/6	671a25e06ba3af3dd532de0cff7c4ef4	72	6	2	1	-1	1713645598	1713645598	0	0	6624281e13939	31	
174	2	appdata_oc2umat4fcst/preview/d/6/4	a32914d883ba5a912c8740e86d5a5376	173	4	2	1	-1	1713645598	1713645598	0	0	6624281e13799	31	
175	2	appdata_oc2umat4fcst/preview/d/6/4/5	9cdc74818dc91e1acfbadf253ccee552	174	5	2	1	-1	1713645598	1713645598	0	0	6624281e1360a	31	
176	2	appdata_oc2umat4fcst/preview/d/6/4/5/9	120f14f0b58a573aeb203837e7eca41a	175	9	2	1	-1	1713645598	1713645598	0	0	6624281e1344b	31	
177	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2	0087cdfd8b5ce9bb6dcb7da8828fecd7	176	2	2	1	-1	1713645598	1713645598	0	0	6624281e132b2	31	
178	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0	2e6bf7c009684f0c482f010ed88f56af	177	0	2	1	-1	1713645598	1713645598	0	0	6624281e130f4	31	
180	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5/41/64-43.jpg	358af6f5961335b1663177ea8f123948	159	64-43.jpg	14	13	1551	1713645598	1713645598	0	0	161a231d23945b1cebc2b40c0ebb1ba9	27	
171	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5/41/1600-1066-max.jpg	4eef9828fc0558af06792442130b956c	159	1600-1066-max.jpg	14	13	351167	1713645598	1713645598	0	0	cd91d6159e4a44cd2793ec400553d0f6	27	
181	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0/40/1600-1067-max.jpg	2269dc4752e2cef0fdc38a816c02391a	179	1600-1067-max.jpg	14	13	147631	1713645598	1713645598	0	0	f15f0bee427f38de067e98a097b0a9db	27	
182	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e/42/1024-683.jpg	fc27d2947c27c0ba5a979923bdaa4d68	167	1024-683.jpg	14	13	85857	1713645598	1713645598	0	0	0de3cccf14f1c496da6a3bea1fb0dc20	27	
183	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0/40/64-43.jpg	66cbfa7c4c8b74251d092332b3b395f5	179	64-43.jpg	14	13	1296	1713645598	1713645598	0	0	144d28d2b2e3bd9457e14e9dc62ae42c	27	
184	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5/41/1024-682.jpg	72bef007aef65363281d4f8a7f61d614	159	1024-682.jpg	14	13	151897	1713645598	1713645598	0	0	30baa182fa698b4f74909fdec40ef9fe	27	
185	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0/40/1024-683.jpg	d9c7c7c4f7848cabee3938f4a7453a0f	179	1024-683.jpg	14	13	57466	1713645598	1713645598	0	0	0db01444edc07cf83d92130cc82f4182	27	
159	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5/41	a1a38fe66d0e1a76d0ec043547fda88d	158	41	2	1	0	1713645758	1713645758	0	0	6624281d5a41a	31	
179	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0/40	2b42b805bc2d56cacfebfa5bf803c5ce	178	40	2	1	0	1713645758	1713645758	0	0	6624281e12ecb	31	
167	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e/42	2a77eef03e21464dc968c78f0f5e4acd	166	42	2	1	0	1713645759	1713645759	0	0	6624281d719fd	31	
186	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/1536-1024.jpg	3e45d9f27121855b7a3951b79eca1a3d	96	1536-1024.jpg	14	13	197828	1713645599	1713645599	0	0	5379b426014c8b5cbfbe9a24ffefa130	27	
187	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/1536-1024.jpg	0d5c522e6e00dc5c2b2e9894bdcef12b	94	1536-1024.jpg	14	13	331988	1713645599	1713645599	0	0	4886a0e52b090507fa9713b74b28fe29	27	
197	2	appdata_oc2umat4fcst/preview/f	43ebb9e8b0bbaa46304418745b353733	71	f	2	1	-1	1713645759	1713645759	0	0	66242909d2d30	31	
188	2	appdata_oc2umat4fcst/js/files	3e941601a1fbf9bd9c2256849cbfbb7f	54	files	2	1	0	1713645748	1713645748	0	0	662428b4716c4	31	
189	2	appdata_oc2umat4fcst/js/files/merged-index.js	9d3a09e5d1f01b014de8e3fb90e7e521	188	merged-index.js	18	5	423846	1713645748	1713645748	0	0	a7e8bf150b8e96d0acd637c41fb17747	27	
190	2	appdata_oc2umat4fcst/js/files/merged-index.js.deps	1c34a5a203826b2b94ce00a23535abaf	188	merged-index.js.deps	12	5	2030	1713645748	1713645748	0	0	dc408beb901cc32f6d7218358f159523	27	
191	2	appdata_oc2umat4fcst/js/files/merged-index.js.gzip	b8c714037857635f658e3e905cbe2992	188	merged-index.js.gzip	19	5	95975	1713645748	1713645748	0	0	846c28467317ffdc2970b07495555da8	27	
193	2	appdata_oc2umat4fcst/theming/global/0/icon-core-#0082c9filetypes_text.svg	17b8ea7aa6bae75df67707c7f13a8c37	61	icon-core-#0082c9filetypes_text.svg	20	13	295	1713645753	1713645753	0	0	adcad42302f6c94977a2d1bc63b351e1	27	
194	2	appdata_oc2umat4fcst/theming/global/0/icon-core-#0082c9filetypes_image.svg	d329121d60dcf811e8e461f106b3af83	61	icon-core-#0082c9filetypes_image.svg	20	13	352	1713645753	1713645753	0	0	f7f66032f281e3a5d28e5fad50d83be8	27	
195	2	appdata_oc2umat4fcst/theming/global/0/icon-core-#0082c9filetypes_folder.svg	d1e30c378cbaad4cc1d93fda6bf374f8	61	icon-core-#0082c9filetypes_folder.svg	20	13	255	1713645753	1713645753	0	0	b84cc450225f0cf08aee062d2419e0ff	27	
196	2	appdata_oc2umat4fcst/theming/global/0/icon-core-#0082c9filetypes_application-pdf.svg	cc0ac24072f5c8bde66b3ef1d787c4f6	61	icon-core-#0082c9filetypes_application-pdf.svg	20	13	1038	1713645753	1713645753	0	0	9f88e0102b372a3639df8f1195e26aa8	27	
198	2	appdata_oc2umat4fcst/preview/f/4	02709174c20889cac2783a79e9219f75	197	4	2	1	-1	1713645753	1713645753	0	0	662428b9cb73d	31	
199	2	appdata_oc2umat4fcst/preview/f/4/5	3901e574046a7e852ede197d648bf563	198	5	2	1	-1	1713645753	1713645753	0	0	662428b9cb53b	31	
200	2	appdata_oc2umat4fcst/preview/f/4/5/7	6e1b9c13c2b904bb562fb0d8171ab52f	199	7	2	1	-1	1713645753	1713645753	0	0	662428b9cb3e3	31	
201	2	appdata_oc2umat4fcst/preview/f/4/5/7/c	e7d515d5fbad42d65734ee4bdb62615f	200	c	2	1	-1	1713645753	1713645753	0	0	662428b9cb29a	31	
202	2	appdata_oc2umat4fcst/preview/f/4/5/7/c/5	4d341c3f00396f9c43dc3898f36e32fc	201	5	2	1	-1	1713645753	1713645753	0	0	662428b9cb142	31	
203	2	appdata_oc2umat4fcst/preview/f/4/5/7/c/5/4	fd5a3e80347197654989ba218a6f7f1f	202	4	2	1	-1	1713645753	1713645753	0	0	662428b9cafdc	31	
205	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3/51/256-256.png	6271de7048e7b0de11bdd93984840839	125	256-256.png	15	13	24388	1713645753	1713645753	0	0	4b7686045483b2d0630e4dd2eb3a7fed	27	
125	2	appdata_oc2umat4fcst/preview/2/8/3/8/0/2/3/51	5b4d9dceec1607c43780f5bf7c88b402	124	51	2	1	0	1713645753	1713645753	0	0	662425777bf0d	31	
206	2	appdata_oc2umat4fcst/preview/f/4/5/7/c/5/4/49/4096-4096-max.png	d4083709bf5f4ed91a435eb65093ddac	204	4096-4096-max.png	15	13	49006	1713645754	1713645754	0	0	f583c27774d781bc42553e30c8805d9f	27	
204	2	appdata_oc2umat4fcst/preview/f/4/5/7/c/5/4/49	a0987ee12f1926863c03cd6ea209fb39	203	49	2	1	0	1713645754	1713645754	0	0	662428b9cadc7	31	
207	2	appdata_oc2umat4fcst/preview/c/0/c/7/c/7/6/50/256-256.png	ae34edc1a837ec307168284b8ed585f6	114	256-256.png	15	13	31444	1713645754	1713645754	0	0	9f1bd1bb67b3b49d15f02bcd39c56517	27	
208	2	appdata_oc2umat4fcst/preview/f/4/5/7/c/5/4/49/256-256.png	fc8967e07d1bb4cba2c7f13ec1c5add9	204	256-256.png	15	13	8790	1713645754	1713645754	0	0	e07a0a72e48bcc9d0d05e446f360a153	27	
209	2	appdata_oc2umat4fcst/text	295e64ac01013507be0346d2238e6254	4	text	2	1	0	1713645754	1713645754	0	0	662428bac3420	31	
211	2	appdata_oc2umat4fcst/theming/global/0/favIcon-files#0082c9	531164f1ad4d469365756b80dcc5840a	61	favIcon-files#0082c9	12	5	90022	1713645755	1713645755	0	0	5006c0c5bdaac5748d112410100ad36f	27	
212	2	appdata_oc2umat4fcst/theming/global/0/touchIcon-files#0082c9	60d57ce124d2fc9c5fce065802cc9041	61	touchIcon-files#0082c9	12	5	5886	1713645755	1713645755	0	0	92b8083434be66456dd554e41bb94058	27	
213	2	appdata_oc2umat4fcst/text/documents/49.yjs	43d56d89697676ff41ab9e62cd5036ce	210	49.yjs	12	5	580	1713645758	1713645758	0	0	087638d7c565ed680a11c2d1367af9e4	27	
214	2	appdata_oc2umat4fcst/preview/3/4/1/6/a/7/5/41/256-171.jpg	42b7db899c24104081c2d008d294c597	159	256-171.jpg	14	13	12787	1713645758	1713645758	0	0	d62575d7ea23dcfd7f5609bdc7572879	27	
215	2	appdata_oc2umat4fcst/preview/d/6/4/5/9/2/0/40/256-171.jpg	b2c7a0409a6ef798157422e8b0c1d3fc	179	256-171.jpg	14	13	6422	1713645758	1713645758	0	0	2d1ef258c60246bb615cae9fc47b22c9	27	
231	2	appdata_oc2umat4fcst/appstore/apps.json	e859b4ae6c67ec3dbf1e2326d5a49422	192	apps.json	24	5	2489785	1713645762	1713645762	0	0	74000d14b3479eee7daa48c43971dba9	27	
210	2	appdata_oc2umat4fcst/text/documents	abd31054edb7d598f82f9acbbffed939	209	documents	2	1	0	1713645789	1713645789	0	0	662428bac56f7	31	
216	2	appdata_oc2umat4fcst/preview/d/9/d/4/f/4/9/46/256-171.jpg	00b2f4807c1111750779053a2b0e2333	95	256-171.jpg	14	13	10337	1713645758	1713645758	0	0	ab0697f7c3a509f91f4ba060bfe5d78e	27	
217	2	appdata_oc2umat4fcst/preview/6/7/c/6/a/1/e/47/256-171.jpg	9295ef2ac1bc38a0cd575cbaac864dde	96	256-171.jpg	14	13	8931	1713645759	1713645759	0	0	74010e58a4e156834bab0d4fc27fd3f9	27	
223	2	appdata_oc2umat4fcst/preview/f/7/1/7/7/1/6	655943c341d2e8c88f271027f13674fd	222	6	2	1	0	1713645833	1713645833	0	0	662428bf32fc4	31	
225	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45/256-171.jpg	27ac6070db622cb29ccd465c1044a1f6	94	256-171.jpg	14	13	15014	1713645759	1713645759	0	0	a0888cf791e44414b35f2e2a18c8b9ae	27	
94	2	appdata_oc2umat4fcst/preview/6/c/8/3/4/9/c/45	9120286ebc4f38c53c5ff6e3d2fd1038	89	45	2	1	0	1713645759	1713645759	0	0	66242576a608a	31	
226	2	appdata_oc2umat4fcst/preview/a/1/d/0/c/6/e/42/256-171.jpg	2f67f81df5918576ecfe933cf4baaef6	167	256-171.jpg	14	13	11140	1713645759	1713645759	0	0	c91fb8af9f119ee6f540ee15858d4a2d	27	
228	2	appdata_oc2umat4fcst/preview/1/7/e/6/2/1/6/43/171-256.jpg	3ccd8518f5063b0b79d911719d0694b8	146	171-256.jpg	14	13	6355	1713645759	1713645759	0	0	1ad518e8c9018ec91d1543b965964dfd	27	
229	2	appdata_oc2umat4fcst/preview/6/4/2/e/9/2/e/48/256-171.jpg	2b4ec39d38eb4d1f4ca663393f13f4f1	101	256-171.jpg	14	13	11263	1713645759	1713645759	0	0	f48be6eb15e65872c1a4fa8dc4f4a7b9	27	
222	2	appdata_oc2umat4fcst/preview/f/7/1/7/7/1	ba8b5a421e87b66b39040e3a220e0382	221	1	2	1	0	1713645759	1713645759	0	0	662428bf34409	31	
221	2	appdata_oc2umat4fcst/preview/f/7/1/7/7	e1de4d217f260bc4a66ca3b5d85cea9b	220	7	2	1	0	1713645759	1713645759	0	0	662428bf354e9	31	
220	2	appdata_oc2umat4fcst/preview/f/7/1/7	aab10eed77a546f3438d5c3ab4fcf7d4	219	7	2	1	0	1713645759	1713645759	0	0	662428bf36e95	31	
219	2	appdata_oc2umat4fcst/preview/f/7/1	491f6024756c51c23f183b897663d575	218	1	2	1	0	1713645759	1713645759	0	0	662428bf3802d	31	
218	2	appdata_oc2umat4fcst/preview/f/7	41aef5e184eb885f901b7924ce9372e1	197	7	2	1	0	1713645759	1713645759	0	0	662428bf3961a	31	
192	2	appdata_oc2umat4fcst/appstore	9cfaf33e7b2238add30b2ea549a96763	4	appstore	2	1	0	1713645762	1713645762	0	0	662428b7d460d	31	
232	1	files/Photos/5e09727676e20ddddb9cd6d7555564ce.webp	072ffd491503798fd414f4fe5e72388e	39	5e09727676e20ddddb9cd6d7555564ce.webp	22	13	54994	1713645661	1713645661	0	0	922f511ef122efad4b3837e9e70e3cbd	27	
233	2	appdata_oc2umat4fcst/preview/b	be0735ef1ce9828063945ac9732705d1	71	b	2	1	-1	1713645765	1713645765	0	0	662428c549cd2	31	
234	2	appdata_oc2umat4fcst/preview/b/e	2db72f034371b5a4123d28ae42f2aaf9	233	e	2	1	-1	1713645765	1713645765	0	0	662428c549b88	31	
235	2	appdata_oc2umat4fcst/preview/b/e/8	76b0a6d95a8aef54568ee0e36e5291bd	234	8	2	1	-1	1713645765	1713645765	0	0	662428c549a3b	31	
236	2	appdata_oc2umat4fcst/preview/b/e/8/3	5a389176a7765ddf30d41533fcd01099	235	3	2	1	-1	1713645765	1713645765	0	0	662428c5498dc	31	
237	2	appdata_oc2umat4fcst/preview/b/e/8/3/a	341c5f85df4cb1c458cb98f4d0d60354	236	a	2	1	-1	1713645765	1713645765	0	0	662428c549787	31	
238	2	appdata_oc2umat4fcst/preview/b/e/8/3/a/b	22f5b300b90654ce5b8a30aaef496bd4	237	b	2	1	-1	1713645765	1713645765	0	0	662428c54962d	31	
239	2	appdata_oc2umat4fcst/preview/b/e/8/3/a/b/3	b3d6afce1a8655edf828b4374034f62d	238	3	2	1	-1	1713645765	1713645765	0	0	662428c5494b0	31	
240	2	appdata_oc2umat4fcst/preview/b/e/8/3/a/b/3/232	7512261c28ce2fcc2212a4f814e8f0e6	239	232	2	1	0	1713645765	1713645765	0	0	662428c5492e6	31	
241	2	appdata_oc2umat4fcst/preview/b/e/8/3/a/b/3/232/500-500-max.png	f773182c7f4a20ac63bbe8aeb771b3eb	240	500-500-max.png	15	13	472754	1713645765	1713645765	0	0	c9121e50df3ab837ef006614dc9fcd50	27	
242	2	appdata_oc2umat4fcst/preview/b/e/8/3/a/b/3/232/256-256.png	9d551053e0710169b382e3e5c82a740c	240	256-256.png	15	13	137699	1713645765	1713645765	0	0	8cecb1389ca441e948af81722adec892	27	
245	1	files_versions/Photos/Readme.md.v1713644797	85504a3b151ac421a5f9148fa7abe82f	244	Readme.md.v1713644797	4	3	150	1713645789	1713645789	0	0	7b01998ac97f16bfe22371b490d0efcf	27	
244	1	files_versions/Photos	745595fc1c6eb42d923e37526197a3db	243	Photos	2	1	150	1713645789	1713645789	0	0	662428dd20694	31	
243	1	files_versions	9692aae50022f45f1098646939b287b1	1	files_versions	2	1	150	1713645789	1713645789	0	0	662428dd20694	31	
2	1	files	45b963397aa40d4a0063e0d85e4fe7a1	1	files	2	1	37604351	1713645789	1713644798	0	0	662428dd217aa	31	
246	2	appdata_oc2umat4fcst/text/documents/44.yjs	94fb118fa3e6af3ba25900238933b744	210	44.yjs	12	5	484	1713645789	1713645789	0	0	f5c4525267d3f44decfc53736aed7b0c	27	
\.


--
-- Data for Name: oc_filecache_extended; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_filecache_extended (fileid, metadata_etag, creation_time, upload_time) FROM stdin;
232	\N	0	1713645765
\.


--
-- Data for Name: oc_files_reminders; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_files_reminders (id, user_id, file_id, due_date, updated_at, created_at, notified) FROM stdin;
\.


--
-- Data for Name: oc_files_trash; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_files_trash (auto_id, id, "user", "timestamp", location, type, mime) FROM stdin;
\.


--
-- Data for Name: oc_files_versions; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_files_versions (id, file_id, "timestamp", size, mimetype, metadata) FROM stdin;
1	8	1713644797	136	4	[]
2	9	1713644797	24295	6	[]
3	10	1713644797	1095	4	[]
4	11	1713644797	1083339	7	[]
5	12	1713644797	976625	7	[]
6	14	1713644797	13653	8	[]
7	15	1713644797	868111	9	[]
8	16	1713644797	88394	10	[]
9	17	1713644797	5155877	9	[]
10	18	1713644797	15961	9	[]
11	19	1713644797	52843	10	[]
12	20	1713644797	30354	9	[]
13	21	1713644797	317015	11	[]
14	22	1713644797	3509628	11	[]
15	23	1713644797	52674	12	[]
16	24	1713644797	81196	11	[]
17	25	1713644797	13378	10	[]
18	26	1713644797	554	4	[]
19	27	1713644797	14810	11	[]
20	28	1713644797	17276	9	[]
21	29	1713644797	573	4	[]
22	30	1713644797	11836	8	[]
23	31	1713644797	340061	9	[]
24	32	1713644797	13441	10	[]
25	33	1713644797	16988	8	[]
26	34	1713644797	38605	12	[]
27	35	1713644797	326	4	[]
28	36	1713644797	39404	9	[]
29	37	1713644797	13878	8	[]
30	38	1713644797	14316	11	[]
31	40	1713644797	457744	14	[]
32	41	1713644797	2170375	14	[]
33	42	1713644797	167989	14	[]
34	43	1713644797	567689	14	[]
35	44	1713644797	150	4	[]
36	45	1713644797	0	14	[]
37	45	1713644798	797325	14	[]
38	46	1713644798	593508	14	[]
39	47	1713644798	474653	14	[]
40	48	1713644798	427030	14	[]
41	49	1713644798	206	4	[]
42	50	1713644798	2403	4	[]
43	51	1713644798	50598	15	[]
44	52	1713644798	15070010	7	[]
45	53	1713644798	3963036	17	[]
46	232	1713645661	54994	22	[]
47	44	1713645789	149	4	[]
\.


--
-- Data for Name: oc_flow_checks; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_flow_checks (id, class, operator, value, hash) FROM stdin;
\.


--
-- Data for Name: oc_flow_operations; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_flow_operations (id, class, name, checks, operation, entity, events) FROM stdin;
\.


--
-- Data for Name: oc_flow_operations_scope; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_flow_operations_scope (id, operation_id, type, value) FROM stdin;
\.


--
-- Data for Name: oc_group_admin; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_group_admin (gid, uid) FROM stdin;
\.


--
-- Data for Name: oc_group_user; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_group_user (gid, uid) FROM stdin;
admin	andmi
\.


--
-- Data for Name: oc_groups; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_groups (gid, displayname) FROM stdin;
admin	admin
\.


--
-- Data for Name: oc_jobs; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_jobs (id, class, argument, last_run, last_checked, reserved_at, execution_duration, argument_hash, time_sensitive) FROM stdin;
9	OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders	null	0	1713644787	0	0	37a6259cc0c1dae299a7866489dff0bd	1
10	OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications	null	0	1713644787	0	0	37a6259cc0c1dae299a7866489dff0bd	1
11	OCA\\Notifications\\BackgroundJob\\GenerateUserSettings	null	0	1713644787	0	0	37a6259cc0c1dae299a7866489dff0bd	1
12	OCA\\Notifications\\BackgroundJob\\SendNotificationMails	null	0	1713644787	0	0	37a6259cc0c1dae299a7866489dff0bd	1
13	OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
14	OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
15	OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
16	OCA\\DAV\\BackgroundJob\\EventReminderJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
17	OCA\\DAV\\BackgroundJob\\CalendarRetentionJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
18	OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob	null	0	1713644788	0	0	37a6259cc0c1dae299a7866489dff0bd	1
19	OCA\\Federation\\SyncJob	null	0	1713644789	0	0	37a6259cc0c1dae299a7866489dff0bd	1
20	OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob	null	0	1713644789	0	0	37a6259cc0c1dae299a7866489dff0bd	1
21	OCA\\Support\\BackgroundJobs\\CheckSubscription	null	0	1713644789	0	0	37a6259cc0c1dae299a7866489dff0bd	1
22	OCA\\Activity\\BackgroundJob\\EmailNotification	null	0	1713644790	0	0	37a6259cc0c1dae299a7866489dff0bd	1
23	OCA\\Activity\\BackgroundJob\\ExpireActivities	null	0	1713644790	0	0	37a6259cc0c1dae299a7866489dff0bd	1
24	OCA\\Activity\\BackgroundJob\\DigestMail	null	0	1713644790	0	0	37a6259cc0c1dae299a7866489dff0bd	1
25	OCA\\NextcloudAnnouncements\\Cron\\Crawler	null	0	1713644790	0	0	37a6259cc0c1dae299a7866489dff0bd	1
26	OCA\\Files\\BackgroundJob\\ScanFiles	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
27	OCA\\Files\\BackgroundJob\\DeleteOrphanedItems	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
28	OCA\\Files\\BackgroundJob\\CleanupFileLocks	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
29	OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
30	OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
31	OCA\\Files_Versions\\BackgroundJob\\ExpireVersions	null	0	1713644791	0	0	37a6259cc0c1dae299a7866489dff0bd	1
32	OCA\\Circles\\Cron\\Maintenance	null	0	1713644794	0	0	37a6259cc0c1dae299a7866489dff0bd	1
33	OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob	null	0	1713644795	0	0	37a6259cc0c1dae299a7866489dff0bd	1
34	OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob	null	0	1713644796	0	0	37a6259cc0c1dae299a7866489dff0bd	1
35	OC\\Authentication\\Token\\TokenCleanupJob	null	0	1713644796	0	0	37a6259cc0c1dae299a7866489dff0bd	1
36	OC\\Log\\Rotate	null	0	1713644796	0	0	37a6259cc0c1dae299a7866489dff0bd	1
37	OC\\Preview\\BackgroundCleanupJob	null	0	1713644796	0	0	37a6259cc0c1dae299a7866489dff0bd	1
38	OC\\TextProcessing\\RemoveOldTasksBackgroundJob	null	0	1713644796	0	0	37a6259cc0c1dae299a7866489dff0bd	1
39	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[40]	0	1713644797	0	0	d0cc5b1aae3d1675296a6603c5aedb73	1
40	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[41]	0	1713644797	0	0	45abaffafbda99ff2e039e4b9b01c542	1
41	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[42]	0	1713644797	0	0	b358e7d6ea3cae2a7ca29ee59888f401	1
42	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[43]	0	1713644797	0	0	d85b47f828db75d3f00f54487a448cb4	1
43	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[45]	0	1713644798	0	0	8e29f2a9a666962a7c818a1a4ee43f9d	1
44	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[46]	0	1713644798	0	0	4b02d4206ae857f693cd3bcd88ea23b5	1
45	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[47]	0	1713644798	0	0	d7fa8e2d1a08f1e2fa2fb8b241356aa1	1
46	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[48]	0	1713644798	0	0	04c55adbf5ccb7188f18412ccdd556c5	1
47	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[51]	0	1713644798	0	0	93c1722fd3e9777991d5518fa756557e	1
48	OCA\\FirstRunWizard\\Notification\\BackgroundJob	{"uid":"andmi"}	0	1713644914	0	0	e28952f9a42760aaf6695b69c4730b64	1
1	OCA\\WorkflowEngine\\BackgroundJobs\\Rotate	null	1713644870	1713644870	0	0	37a6259cc0c1dae299a7866489dff0bd	1
2	OCA\\ServerInfo\\Jobs\\UpdateStorageStats	null	1713644877	1713644877	0	0	37a6259cc0c1dae299a7866489dff0bd	1
3	OCA\\Text\\Cron\\Cleanup	null	1713644884	1713644884	0	0	37a6259cc0c1dae299a7866489dff0bd	1
4	OCA\\Files_Sharing\\DeleteOrphanedSharesJob	null	1713644917	1713644917	0	0	37a6259cc0c1dae299a7866489dff0bd	1
5	OCA\\Files_Sharing\\ExpireSharesJob	null	1713645594	1713645594	0	0	37a6259cc0c1dae299a7866489dff0bd	0
7	OCA\\UpdateNotification\\Notification\\BackgroundJob	null	1713645751	1713645751	0	11	37a6259cc0c1dae299a7866489dff0bd	1
6	OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob	null	1713645610	1713645610	0	0	37a6259cc0c1dae299a7866489dff0bd	1
8	OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash	null	1713645832	1713645832	0	0	37a6259cc0c1dae299a7866489dff0bd	1
49	OCA\\Photos\\Jobs\\MapMediaToPlaceJob	[232]	0	1713645765	0	0	d77f52cb487c8167a9e9d5456eaef33f	1
50	OC\\Command\\CommandJob	"O:33:\\"OCA\\\\Files_Versions\\\\Command\\\\Expire\\":2:{s:43:\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000fileName\\";s:17:\\"\\/Photos\\/Readme.md\\";s:39:\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000user\\";s:5:\\"andmi\\";}"	0	1713645789	0	0	5290ce5a747ee48fd813b06c7814ca36	1
\.


--
-- Data for Name: oc_known_users; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_known_users (id, known_to, known_user) FROM stdin;
\.


--
-- Data for Name: oc_login_flow_v2; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_login_flow_v2 (id, "timestamp", started, poll_token, login_token, public_key, private_key, client_name, login_name, server, app_password) FROM stdin;
\.


--
-- Data for Name: oc_migrations; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_migrations (app, version) FROM stdin;
core	13000Date20170705121758
core	13000Date20170718121200
core	13000Date20170814074715
core	13000Date20170919121250
core	13000Date20170926101637
core	14000Date20180129121024
core	14000Date20180404140050
core	14000Date20180516101403
core	14000Date20180518120534
core	14000Date20180522074438
core	14000Date20180626223656
core	14000Date20180710092004
core	14000Date20180712153140
core	15000Date20180926101451
core	15000Date20181015062942
core	15000Date20181029084625
core	16000Date20190207141427
core	16000Date20190212081545
core	16000Date20190427105638
core	16000Date20190428150708
core	17000Date20190514105811
core	18000Date20190920085628
core	18000Date20191014105105
core	18000Date20191204114856
core	19000Date20200211083441
core	20000Date20201109081915
core	20000Date20201109081918
core	20000Date20201109081919
core	20000Date20201111081915
core	21000Date20201120141228
core	21000Date20201202095923
core	21000Date20210119195004
core	21000Date20210309185126
core	21000Date20210309185127
core	22000Date20210216080825
core	23000Date20210721100600
core	23000Date20210906132259
core	23000Date20210930122352
core	23000Date20211203110726
core	23000Date20211213203940
core	24000Date20211210141942
core	24000Date20211213081506
core	24000Date20211213081604
core	24000Date20211222112246
core	24000Date20211230140012
core	24000Date20220131153041
core	24000Date20220202150027
core	24000Date20220404230027
core	24000Date20220425072957
core	25000Date20220515204012
core	25000Date20220602190540
core	25000Date20220905140840
core	25000Date20221007010957
core	27000Date20220613163520
core	27000Date20230309104325
core	27000Date20230309104802
core	28000Date20230616104802
core	28000Date20230728104802
core	28000Date20230803221055
workflowengine	2000Date20190808074233
workflowengine	2200Date20210805101925
text	010000Date20190617184535
text	030001Date20200402075029
text	030201Date20201116110353
text	030201Date20201116123153
text	030501Date20220202101853
text	030701Date20230207131313
files_sharing	11300Date20201120141438
files_sharing	21000Date20201223143245
files_sharing	22000Date20210216084241
files_sharing	24000Date20220208195521
files_sharing	24000Date20220404142216
privacy	100Date20190217131943
files_trashbin	1010Date20200630192639
files_reminders	10000Date20230725162149
notifications	2004Date20190107135757
notifications	2010Date20210218082811
notifications	2010Date20210218082855
notifications	2011Date20210930134607
notifications	2011Date20220826074907
dav	1004Date20170825134824
dav	1004Date20170919104507
dav	1004Date20170924124212
dav	1004Date20170926103422
dav	1005Date20180413093149
dav	1005Date20180530124431
dav	1006Date20180619154313
dav	1006Date20180628111625
dav	1008Date20181030113700
dav	1008Date20181105104826
dav	1008Date20181105104833
dav	1008Date20181105110300
dav	1008Date20181105112049
dav	1008Date20181114084440
dav	1011Date20190725113607
dav	1011Date20190806104428
dav	1012Date20190808122342
dav	1016Date20201109085907
dav	1017Date20210216083742
dav	1018Date20210312100735
dav	1024Date20211221144219
dav	1027Date20230504122946
federation	1010Date20200630191302
user_status	0001Date20200602134824
user_status	0002Date20200902144824
user_status	1000Date20201111130204
user_status	2301Date20210809144824
activity	2006Date20170808154933
activity	2006Date20170808155040
activity	2006Date20170919095939
activity	2007Date20181107114613
activity	2008Date20181011095117
activity	2010Date20190416112817
activity	2011Date20201006132544
activity	2011Date20201006132545
activity	2011Date20201006132546
activity	2011Date20201006132547
activity	2011Date20201207091915
files	11301Date20191205150729
files	12101Date20221011153334
files_versions	1020Date20221114144058
oauth2	010401Date20181207190718
oauth2	010402Date20190107124745
oauth2	011601Date20230522143227
federatedfilesharing	1010Date20200630191755
federatedfilesharing	1011Date20201120125158
circles	0022Date20220526111723
circles	0022Date20220526113601
circles	0022Date20220703115023
circles	0023Date20211216113101
circles	0024Date20220203123901
circles	0024Date20220203123902
circles	0024Date20220317190331
circles	0028Date20230705222601
contactsinteraction	010000Date20200304152605
twofactor_backupcodes	1002Date20170607104347
twofactor_backupcodes	1002Date20170607113030
twofactor_backupcodes	1002Date20170919123342
twofactor_backupcodes	1002Date20170926101419
twofactor_backupcodes	1002Date20180821043638
photos	20000Date20220727125801
photos	20001Date20220830131446
photos	20003Date20221102170153
photos	20003Date20221103094628
\.


--
-- Data for Name: oc_mimetypes; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_mimetypes (id, mimetype) FROM stdin;
1	httpd
2	httpd/unix-directory
3	text
4	text/markdown
5	application
6	application/vnd.openxmlformats-officedocument.wordprocessingml.document
7	application/pdf
8	application/vnd.oasis.opendocument.graphics
9	application/vnd.oasis.opendocument.text
10	application/vnd.oasis.opendocument.spreadsheet
11	application/vnd.oasis.opendocument.presentation
12	application/octet-stream
13	image
14	image/jpeg
15	image/png
16	video
17	video/mp4
18	application/javascript
19	application/gzip
20	image/svg+xml
21	image/heic
22	image/webp
23	video/quicktime
24	application/json
\.


--
-- Data for Name: oc_mounts; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_mounts (id, storage_id, root_id, user_id, mount_point, mount_id, mount_provider_class) FROM stdin;
1	1	1	andmi	/andmi/	\N	OC\\Files\\Mount\\LocalHomeMountProvider
\.


--
-- Data for Name: oc_notifications; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_notifications (notification_id, app, "user", "timestamp", object_type, object_id, subject, subject_parameters, message, message_parameters, link, icon, actions) FROM stdin;
1	firstrunwizard	andmi	1713644914	app	recognize	apphint-recognize	[]		[]			[]
2	firstrunwizard	andmi	1713644914	app	groupfolders	apphint-groupfolders	[]		[]			[]
3	firstrunwizard	andmi	1713644914	app	forms	apphint-forms	[]		[]			[]
4	firstrunwizard	andmi	1713644914	app	deck	apphint-deck	[]		[]			[]
5	firstrunwizard	andmi	1713644914	app	tasks	apphint-tasks	[]		[]			[]
\.


--
-- Data for Name: oc_notifications_pushhash; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_notifications_pushhash (id, uid, token, deviceidentifier, devicepublickey, devicepublickeyhash, pushtokenhash, proxyserver, apptype) FROM stdin;
\.


--
-- Data for Name: oc_notifications_settings; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_notifications_settings (id, user_id, batch_time, last_send_id, next_send_time) FROM stdin;
1	andmi	0	0	0
\.


--
-- Data for Name: oc_oauth2_access_tokens; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_oauth2_access_tokens (id, token_id, client_id, hashed_code, encrypted_token) FROM stdin;
\.


--
-- Data for Name: oc_oauth2_clients; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_oauth2_clients (id, name, redirect_uri, client_identifier, secret) FROM stdin;
\.


--
-- Data for Name: oc_open_local_editor; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_open_local_editor (id, user_id, path_hash, expiration_time, token) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_photos_albums (album_id, name, "user", created, location, last_added_photo) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums_collabs; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_photos_albums_collabs (id, album_id, collaborator_id, collaborator_type) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums_files; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_photos_albums_files (album_file_id, album_id, file_id, added, owner) FROM stdin;
\.


--
-- Data for Name: oc_preferences; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_preferences (userid, appid, configkey, configvalue) FROM stdin;
andmi	activity	configured	yes
andmi	notifications	sound_notification	no
andmi	notifications	sound_talk	no
andmi	password_policy	failedLoginAttempts	0
andmi	core	templateDirectory	Templates/
andmi	core	timezone	Europe/Moscow
andmi	dashboard	firstRun	0
andmi	firstrunwizard	apphint	18
andmi	core	lang	ru
andmi	avatar	generated	true
andmi	firstrunwizard	show	0
andmi	login_token	ra7eTDx34XZhw57Da3q4j63LJe/uFW4t	1713645827
andmi	login	lastLogin	1713645828
\.


--
-- Data for Name: oc_privacy_admins; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_privacy_admins (id, displayname) FROM stdin;
\.


--
-- Data for Name: oc_profile_config; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_profile_config (id, user_id, config) FROM stdin;
\.


--
-- Data for Name: oc_properties; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_properties (id, userid, propertypath, propertyname, propertyvalue, valuetype) FROM stdin;
\.


--
-- Data for Name: oc_ratelimit_entries; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_ratelimit_entries (id, hash, delete_after) FROM stdin;
\.


--
-- Data for Name: oc_reactions; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_reactions (id, parent_id, message_id, actor_type, actor_id, reaction) FROM stdin;
\.


--
-- Data for Name: oc_recent_contact; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_recent_contact (id, actor_uid, uid, email, federated_cloud_id, card, last_contact) FROM stdin;
\.


--
-- Data for Name: oc_schedulingobjects; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_schedulingobjects (id, principaluri, calendardata, uri, lastmodified, etag, size) FROM stdin;
\.


--
-- Data for Name: oc_share; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_share (id, share_type, share_with, password, uid_owner, uid_initiator, parent, item_type, item_source, item_target, file_source, file_target, permissions, stime, accepted, expiration, token, mail_send, share_name, password_by_talk, note, hide_download, label, attributes, password_expiration_time) FROM stdin;
\.


--
-- Data for Name: oc_share_external; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_share_external (id, parent, share_type, remote, remote_id, share_token, password, name, owner, "user", mountpoint, mountpoint_hash, accepted) FROM stdin;
\.


--
-- Data for Name: oc_storages; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_storages (numeric_id, id, available, last_checked) FROM stdin;
1	home::andmi	1	\N
2	local::/var/www/html/data/	1	\N
\.


--
-- Data for Name: oc_storages_credentials; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_storages_credentials (id, "user", identifier, credentials) FROM stdin;
\.


--
-- Data for Name: oc_systemtag; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_systemtag (id, name, visibility, editable) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_group; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_systemtag_group (systemtagid, gid) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_object_mapping; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_systemtag_object_mapping (objectid, objecttype, systemtagid) FROM stdin;
\.


--
-- Data for Name: oc_text_documents; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_text_documents (id, current_version, last_saved_version, last_saved_version_time, last_saved_version_etag, base_version_etag) FROM stdin;
49	0	2	1713644798	5b3c8bf9a429736064add2e04c5ab21b	5b3c8bf9a429736064add2e04c5ab21b
44	0	2	1713645789	152b5e5ee9cc6a55cb8b2d9dda463582	abe6976f3b44675a72dacdd2d3612e13
\.


--
-- Data for Name: oc_text_sessions; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_text_sessions (id, user_id, guest_name, color, token, document_id, last_contact, last_awareness_message) FROM stdin;
46	andmi	\N	#ddcb55	JnMRie4lfS5xeEJWTewdZEoSd32/C9JJSHMI1v8Mm5GrfVK0k8am/KTCAUiAf/Nc	44	1713648329	
\.


--
-- Data for Name: oc_text_steps; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_text_steps (id, document_id, session_id, data, version) FROM stdin;
1	49	1	["AALcAgEK6f+6ngoABwEHZGVmYXVsdAMHaGVhZGluZwcA6f+6ngoABgQA6f+6ngoBJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KADp\\/7qeCgAFbGV2ZWwBfQEoAOn\\/up4KAAJpZAF\\/KADp\\/7qeCgAEdXVpZAF\\/h+n\\/up4KAAMJcGFyYWdyYXBoBwDp\\/7qeCiMGBADp\\/7qeCiSkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3Auh+n\\/up4KIwMJcGFyYWdyYXBoAA==","AAJgAQLp\\/7qeCsoBqOn\\/up4KIQF3Fmgtd2VsY29tZS10by1uZXh0Y2xvdWSo6f+6ngoiAXckYzJiMTkzNzgtZDQ0Ni00MzYyLWE5NjAtNDAxMGQ4OTA1Y2JhAen\\/up4KASEC"]	2
2	44	2	["AAKjAgEK1fL6rAUABwEHZGVmYXVsdAMHaGVhZGluZwcA1fL6rAUABgQA1fL6rAUBBlBob3RvcygA1fL6rAUABWxldmVsAX0BKADV8vqsBQACaWQBfygA1fL6rAUABHV1aWQBf4fV8vqsBQADCXBhcmFncmFwaAcA1fL6rAULBgQA1fL6rAUMiwFTb21lIG5pY2UgZXhhbXBsZSBwaG90b3MsIGxpY2Vuc2VkIHVuZGVyIENyZWF0aXZlIENvbW1vbnMgQXR0cmlidXRpb24uIFRyeSBzd2l0Y2hpbmcgdG8gZ3JpZCB2aWV3IG9yIG9wZW4gdGhlbSBpbiB0aGUgYnJhbmQgbmV3IFBob3RvcyBhcHAhh9Xy+qwFCwMJcGFyYWdyYXBoAA==","AAJSAQLV8vqsBZkBqNXy+qwFCQF3CGgtcGhvdG9zqNXy+qwFCgF3JGZmY2I4NTlhLWM2MWItNGYyNS1iMWQyLWVmYzcwMzQ3MDcyOAHV8vqsBQEJAg=="]	2
\.


--
-- Data for Name: oc_textprocessing_tasks; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_textprocessing_tasks (id, type, input, output, status, user_id, app_id, identifier, last_updated) FROM stdin;
\.


--
-- Data for Name: oc_trusted_servers; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_trusted_servers (id, url, url_hash, token, shared_secret, status, sync_token) FROM stdin;
\.


--
-- Data for Name: oc_twofactor_backupcodes; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_twofactor_backupcodes (id, user_id, code, used) FROM stdin;
\.


--
-- Data for Name: oc_twofactor_providers; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_twofactor_providers (provider_id, uid, enabled) FROM stdin;
backup_codes	andmi	0
\.


--
-- Data for Name: oc_user_status; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_user_status (id, user_id, status, status_timestamp, is_user_defined, message_id, custom_icon, custom_message, clear_at, is_backup) FROM stdin;
1	andmi	away	1713645585	t	\N	\N	\N	\N	f
\.


--
-- Data for Name: oc_user_transfer_owner; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_user_transfer_owner (id, source_user, target_user, file_id, node_name) FROM stdin;
\.


--
-- Data for Name: oc_users; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_users (uid, displayname, password, uid_lower) FROM stdin;
andmi	\N	3|$argon2id$v=19$m=65536,t=4,p=1$ekIwTFZXMnY3L2JCaUkzMA$9FTDsA3TP8Gdw1q0c8weLwkJBHaRiZcqW1dc4FQhGdo	andmi
\.


--
-- Data for Name: oc_vcategory; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_vcategory (id, uid, type, category) FROM stdin;
\.


--
-- Data for Name: oc_vcategory_to_object; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_vcategory_to_object (objid, categoryid, type) FROM stdin;
\.


--
-- Data for Name: oc_webauthn; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_webauthn (id, uid, name, public_key_credential_id, data) FROM stdin;
\.


--
-- Data for Name: oc_whats_new; Type: TABLE DATA; Schema: public; Owner: oc_andmi
--

COPY public.oc_whats_new (id, version, etag, last_check, data) FROM stdin;
\.


--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_accounts_data_id_seq', 12, true);


--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_activity_activity_id_seq', 95, true);


--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_activity_mq_mail_id_seq', 1, false);


--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_addressbookchanges_id_seq', 1, false);


--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_addressbooks_id_seq', 1, true);


--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_authorized_groups_id_seq', 1, false);


--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_authtoken_id_seq', 2, true);


--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_bruteforce_attempts_id_seq', 1, false);


--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_invitations_id_seq', 1, false);


--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_reminders_id_seq', 1, false);


--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_resources_id_seq', 1, false);


--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_resources_md_id_seq', 1, false);


--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_rooms_id_seq', 1, false);


--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendar_rooms_md_id_seq', 1, false);


--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendarchanges_id_seq', 1, false);


--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendarobjects_id_seq', 1, false);


--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendarobjects_props_id_seq', 1, false);


--
-- Name: oc_calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendars_id_seq', 1, true);


--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_calendarsubscriptions_id_seq', 1, false);


--
-- Name: oc_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_cards_id_seq', 1, false);


--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_cards_properties_id_seq', 1, false);


--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_circle_id_seq', 2, true);


--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_member_id_seq', 2, true);


--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_mount_id_seq', 1, false);


--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_mountpoint_id_seq', 1, false);


--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_remote_id_seq', 1, false);


--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_share_lock_id_seq', 1, false);


--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_circles_token_id_seq', 1, false);


--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_collres_collections_id_seq', 1, false);


--
-- Name: oc_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_comments_id_seq', 1, false);


--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_dav_cal_proxy_id_seq', 1, false);


--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_dav_shares_id_seq', 1, false);


--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_direct_edit_id_seq', 1, false);


--
-- Name: oc_directlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_directlink_id_seq', 1, false);


--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_file_locks_id_seq', 1, false);


--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_filecache_fileid_seq', 249, true);


--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_files_reminders_id_seq', 1, false);


--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_files_trash_auto_id_seq', 1, false);


--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_files_versions_id_seq', 47, true);


--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_flow_checks_id_seq', 1, false);


--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_flow_operations_id_seq', 1, false);


--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_flow_operations_scope_id_seq', 1, false);


--
-- Name: oc_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_jobs_id_seq', 50, true);


--
-- Name: oc_known_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_known_users_id_seq', 1, false);


--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_login_flow_v2_id_seq', 1, false);


--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_mimetypes_id_seq', 24, true);


--
-- Name: oc_mounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_mounts_id_seq', 1, true);


--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_notifications_notification_id_seq', 5, true);


--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_notifications_pushhash_id_seq', 1, false);


--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_notifications_settings_id_seq', 1, true);


--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_oauth2_access_tokens_id_seq', 1, false);


--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_oauth2_clients_id_seq', 1, false);


--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_open_local_editor_id_seq', 1, false);


--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_photos_albums_album_id_seq', 1, false);


--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_photos_albums_collabs_id_seq', 1, false);


--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_photos_albums_files_album_file_id_seq', 1, false);


--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_privacy_admins_id_seq', 1, false);


--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_profile_config_id_seq', 1, false);


--
-- Name: oc_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_properties_id_seq', 1, false);


--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_ratelimit_entries_id_seq', 1, false);


--
-- Name: oc_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_reactions_id_seq', 1, false);


--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_recent_contact_id_seq', 1, false);


--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_schedulingobjects_id_seq', 1, false);


--
-- Name: oc_share_external_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_share_external_id_seq', 1, false);


--
-- Name: oc_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_share_id_seq', 1, false);


--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_storages_credentials_id_seq', 1, false);


--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_storages_numeric_id_seq', 2, true);


--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_systemtag_id_seq', 1, false);


--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_text_sessions_id_seq', 46, true);


--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_text_steps_id_seq', 2, true);


--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_textprocessing_tasks_id_seq', 1, false);


--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_trusted_servers_id_seq', 1, false);


--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_twofactor_backupcodes_id_seq', 1, false);


--
-- Name: oc_user_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_user_status_id_seq', 1, true);


--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_user_transfer_owner_id_seq', 1, false);


--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_vcategory_id_seq', 1, false);


--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_webauthn_id_seq', 1, false);


--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_andmi
--

SELECT pg_catalog.setval('public.oc_whats_new_id_seq', 1, false);


--
-- Name: oc_accounts_data oc_accounts_data_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_accounts_data
    ADD CONSTRAINT oc_accounts_data_pkey PRIMARY KEY (id);


--
-- Name: oc_accounts oc_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_accounts
    ADD CONSTRAINT oc_accounts_pkey PRIMARY KEY (uid);


--
-- Name: oc_activity_mq oc_activity_mq_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_activity_mq
    ADD CONSTRAINT oc_activity_mq_pkey PRIMARY KEY (mail_id);


--
-- Name: oc_activity oc_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_activity
    ADD CONSTRAINT oc_activity_pkey PRIMARY KEY (activity_id);


--
-- Name: oc_addressbookchanges oc_addressbookchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_addressbookchanges
    ADD CONSTRAINT oc_addressbookchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_addressbooks oc_addressbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_addressbooks
    ADD CONSTRAINT oc_addressbooks_pkey PRIMARY KEY (id);


--
-- Name: oc_appconfig oc_appconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_appconfig
    ADD CONSTRAINT oc_appconfig_pkey PRIMARY KEY (appid, configkey);


--
-- Name: oc_authorized_groups oc_authorized_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_authorized_groups
    ADD CONSTRAINT oc_authorized_groups_pkey PRIMARY KEY (id);


--
-- Name: oc_authtoken oc_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_authtoken
    ADD CONSTRAINT oc_authtoken_pkey PRIMARY KEY (id);


--
-- Name: oc_bruteforce_attempts oc_bruteforce_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_bruteforce_attempts
    ADD CONSTRAINT oc_bruteforce_attempts_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_invitations oc_calendar_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_invitations
    ADD CONSTRAINT oc_calendar_invitations_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_reminders oc_calendar_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_reminders
    ADD CONSTRAINT oc_calendar_reminders_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_resources_md oc_calendar_resources_md_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_resources_md
    ADD CONSTRAINT oc_calendar_resources_md_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_resources oc_calendar_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_resources
    ADD CONSTRAINT oc_calendar_resources_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_rooms_md oc_calendar_rooms_md_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_rooms_md
    ADD CONSTRAINT oc_calendar_rooms_md_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_rooms oc_calendar_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendar_rooms
    ADD CONSTRAINT oc_calendar_rooms_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarchanges oc_calendarchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarchanges
    ADD CONSTRAINT oc_calendarchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarobjects oc_calendarobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarobjects
    ADD CONSTRAINT oc_calendarobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarobjects_props oc_calendarobjects_props_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarobjects_props
    ADD CONSTRAINT oc_calendarobjects_props_pkey PRIMARY KEY (id);


--
-- Name: oc_calendars oc_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendars
    ADD CONSTRAINT oc_calendars_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarsubscriptions oc_calendarsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_calendarsubscriptions
    ADD CONSTRAINT oc_calendarsubscriptions_pkey PRIMARY KEY (id);


--
-- Name: oc_cards oc_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_cards
    ADD CONSTRAINT oc_cards_pkey PRIMARY KEY (id);


--
-- Name: oc_cards_properties oc_cards_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_cards_properties
    ADD CONSTRAINT oc_cards_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_circle oc_circles_circle_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_circle
    ADD CONSTRAINT oc_circles_circle_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_event oc_circles_event_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_event
    ADD CONSTRAINT oc_circles_event_pkey PRIMARY KEY (token, instance);


--
-- Name: oc_circles_member oc_circles_member_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_member
    ADD CONSTRAINT oc_circles_member_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_membership oc_circles_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_membership
    ADD CONSTRAINT oc_circles_membership_pkey PRIMARY KEY (single_id, circle_id);


--
-- Name: oc_circles_mount oc_circles_mount_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_mount
    ADD CONSTRAINT oc_circles_mount_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_mountpoint oc_circles_mountpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_mountpoint
    ADD CONSTRAINT oc_circles_mountpoint_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_remote oc_circles_remote_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_remote
    ADD CONSTRAINT oc_circles_remote_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_share_lock oc_circles_share_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_share_lock
    ADD CONSTRAINT oc_circles_share_lock_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_token oc_circles_token_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_circles_token
    ADD CONSTRAINT oc_circles_token_pkey PRIMARY KEY (id);


--
-- Name: oc_collres_accesscache oc_collres_accesscache_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_collres_accesscache
    ADD CONSTRAINT oc_collres_accesscache_pkey PRIMARY KEY (user_id, collection_id, resource_type, resource_id);


--
-- Name: oc_collres_collections oc_collres_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_collres_collections
    ADD CONSTRAINT oc_collres_collections_pkey PRIMARY KEY (id);


--
-- Name: oc_collres_resources oc_collres_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_collres_resources
    ADD CONSTRAINT oc_collres_resources_pkey PRIMARY KEY (collection_id, resource_type, resource_id);


--
-- Name: oc_comments oc_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_comments
    ADD CONSTRAINT oc_comments_pkey PRIMARY KEY (id);


--
-- Name: oc_comments_read_markers oc_comments_read_markers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_comments_read_markers
    ADD CONSTRAINT oc_comments_read_markers_pkey PRIMARY KEY (user_id, object_type, object_id);


--
-- Name: oc_dav_cal_proxy oc_dav_cal_proxy_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_dav_cal_proxy
    ADD CONSTRAINT oc_dav_cal_proxy_pkey PRIMARY KEY (id);


--
-- Name: oc_dav_shares oc_dav_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_dav_shares
    ADD CONSTRAINT oc_dav_shares_pkey PRIMARY KEY (id);


--
-- Name: oc_direct_edit oc_direct_edit_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_direct_edit
    ADD CONSTRAINT oc_direct_edit_pkey PRIMARY KEY (id);


--
-- Name: oc_directlink oc_directlink_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_directlink
    ADD CONSTRAINT oc_directlink_pkey PRIMARY KEY (id);


--
-- Name: oc_federated_reshares oc_federated_reshares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_federated_reshares
    ADD CONSTRAINT oc_federated_reshares_pkey PRIMARY KEY (share_id);


--
-- Name: oc_file_locks oc_file_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_file_locks
    ADD CONSTRAINT oc_file_locks_pkey PRIMARY KEY (id);


--
-- Name: oc_file_metadata oc_file_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_file_metadata
    ADD CONSTRAINT oc_file_metadata_pkey PRIMARY KEY (id, group_name);


--
-- Name: oc_filecache_extended oc_filecache_extended_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_filecache_extended
    ADD CONSTRAINT oc_filecache_extended_pkey PRIMARY KEY (fileid);


--
-- Name: oc_filecache oc_filecache_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_filecache
    ADD CONSTRAINT oc_filecache_pkey PRIMARY KEY (fileid);


--
-- Name: oc_files_reminders oc_files_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_reminders
    ADD CONSTRAINT oc_files_reminders_pkey PRIMARY KEY (id);


--
-- Name: oc_files_trash oc_files_trash_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_trash
    ADD CONSTRAINT oc_files_trash_pkey PRIMARY KEY (auto_id);


--
-- Name: oc_files_versions oc_files_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_files_versions
    ADD CONSTRAINT oc_files_versions_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_checks oc_flow_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_checks
    ADD CONSTRAINT oc_flow_checks_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_operations oc_flow_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_operations
    ADD CONSTRAINT oc_flow_operations_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_operations_scope oc_flow_operations_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_flow_operations_scope
    ADD CONSTRAINT oc_flow_operations_scope_pkey PRIMARY KEY (id);


--
-- Name: oc_group_admin oc_group_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_group_admin
    ADD CONSTRAINT oc_group_admin_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_group_user oc_group_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_group_user
    ADD CONSTRAINT oc_group_user_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_groups oc_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_groups
    ADD CONSTRAINT oc_groups_pkey PRIMARY KEY (gid);


--
-- Name: oc_jobs oc_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_jobs
    ADD CONSTRAINT oc_jobs_pkey PRIMARY KEY (id);


--
-- Name: oc_known_users oc_known_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_known_users
    ADD CONSTRAINT oc_known_users_pkey PRIMARY KEY (id);


--
-- Name: oc_login_flow_v2 oc_login_flow_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_login_flow_v2
    ADD CONSTRAINT oc_login_flow_v2_pkey PRIMARY KEY (id);


--
-- Name: oc_migrations oc_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_migrations
    ADD CONSTRAINT oc_migrations_pkey PRIMARY KEY (app, version);


--
-- Name: oc_mimetypes oc_mimetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_mimetypes
    ADD CONSTRAINT oc_mimetypes_pkey PRIMARY KEY (id);


--
-- Name: oc_mounts oc_mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_mounts
    ADD CONSTRAINT oc_mounts_pkey PRIMARY KEY (id);


--
-- Name: oc_notifications oc_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications
    ADD CONSTRAINT oc_notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: oc_notifications_pushhash oc_notifications_pushhash_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications_pushhash
    ADD CONSTRAINT oc_notifications_pushhash_pkey PRIMARY KEY (id);


--
-- Name: oc_notifications_settings oc_notifications_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_notifications_settings
    ADD CONSTRAINT oc_notifications_settings_pkey PRIMARY KEY (id);


--
-- Name: oc_oauth2_access_tokens oc_oauth2_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_oauth2_access_tokens
    ADD CONSTRAINT oc_oauth2_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oc_oauth2_clients oc_oauth2_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_oauth2_clients
    ADD CONSTRAINT oc_oauth2_clients_pkey PRIMARY KEY (id);


--
-- Name: oc_open_local_editor oc_open_local_editor_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_open_local_editor
    ADD CONSTRAINT oc_open_local_editor_pkey PRIMARY KEY (id);


--
-- Name: oc_photos_albums_collabs oc_photos_albums_collabs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums_collabs
    ADD CONSTRAINT oc_photos_albums_collabs_pkey PRIMARY KEY (id);


--
-- Name: oc_photos_albums_files oc_photos_albums_files_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums_files
    ADD CONSTRAINT oc_photos_albums_files_pkey PRIMARY KEY (album_file_id);


--
-- Name: oc_photos_albums oc_photos_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_photos_albums
    ADD CONSTRAINT oc_photos_albums_pkey PRIMARY KEY (album_id);


--
-- Name: oc_preferences oc_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_preferences
    ADD CONSTRAINT oc_preferences_pkey PRIMARY KEY (userid, appid, configkey);


--
-- Name: oc_privacy_admins oc_privacy_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_privacy_admins
    ADD CONSTRAINT oc_privacy_admins_pkey PRIMARY KEY (id);


--
-- Name: oc_profile_config oc_profile_config_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_profile_config
    ADD CONSTRAINT oc_profile_config_pkey PRIMARY KEY (id);


--
-- Name: oc_properties oc_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_properties
    ADD CONSTRAINT oc_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_ratelimit_entries oc_ratelimit_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_ratelimit_entries
    ADD CONSTRAINT oc_ratelimit_entries_pkey PRIMARY KEY (id);


--
-- Name: oc_reactions oc_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_reactions
    ADD CONSTRAINT oc_reactions_pkey PRIMARY KEY (id);


--
-- Name: oc_recent_contact oc_recent_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_recent_contact
    ADD CONSTRAINT oc_recent_contact_pkey PRIMARY KEY (id);


--
-- Name: oc_schedulingobjects oc_schedulingobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_schedulingobjects
    ADD CONSTRAINT oc_schedulingobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_share_external oc_share_external_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_share_external
    ADD CONSTRAINT oc_share_external_pkey PRIMARY KEY (id);


--
-- Name: oc_share oc_share_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_share
    ADD CONSTRAINT oc_share_pkey PRIMARY KEY (id);


--
-- Name: oc_storages_credentials oc_storages_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_storages_credentials
    ADD CONSTRAINT oc_storages_credentials_pkey PRIMARY KEY (id);


--
-- Name: oc_storages oc_storages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_storages
    ADD CONSTRAINT oc_storages_pkey PRIMARY KEY (numeric_id);


--
-- Name: oc_systemtag_group oc_systemtag_group_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_systemtag_group
    ADD CONSTRAINT oc_systemtag_group_pkey PRIMARY KEY (gid, systemtagid);


--
-- Name: oc_systemtag_object_mapping oc_systemtag_object_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_systemtag_object_mapping
    ADD CONSTRAINT oc_systemtag_object_mapping_pkey PRIMARY KEY (objecttype, objectid, systemtagid);


--
-- Name: oc_systemtag oc_systemtag_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_systemtag
    ADD CONSTRAINT oc_systemtag_pkey PRIMARY KEY (id);


--
-- Name: oc_text_documents oc_text_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_text_documents
    ADD CONSTRAINT oc_text_documents_pkey PRIMARY KEY (id);


--
-- Name: oc_text_sessions oc_text_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_text_sessions
    ADD CONSTRAINT oc_text_sessions_pkey PRIMARY KEY (id);


--
-- Name: oc_text_steps oc_text_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_text_steps
    ADD CONSTRAINT oc_text_steps_pkey PRIMARY KEY (id);


--
-- Name: oc_textprocessing_tasks oc_textprocessing_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_textprocessing_tasks
    ADD CONSTRAINT oc_textprocessing_tasks_pkey PRIMARY KEY (id);


--
-- Name: oc_trusted_servers oc_trusted_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_trusted_servers
    ADD CONSTRAINT oc_trusted_servers_pkey PRIMARY KEY (id);


--
-- Name: oc_twofactor_backupcodes oc_twofactor_backupcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_twofactor_backupcodes
    ADD CONSTRAINT oc_twofactor_backupcodes_pkey PRIMARY KEY (id);


--
-- Name: oc_twofactor_providers oc_twofactor_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_twofactor_providers
    ADD CONSTRAINT oc_twofactor_providers_pkey PRIMARY KEY (provider_id, uid);


--
-- Name: oc_user_status oc_user_status_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_user_status
    ADD CONSTRAINT oc_user_status_pkey PRIMARY KEY (id);


--
-- Name: oc_user_transfer_owner oc_user_transfer_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_user_transfer_owner
    ADD CONSTRAINT oc_user_transfer_owner_pkey PRIMARY KEY (id);


--
-- Name: oc_users oc_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_users
    ADD CONSTRAINT oc_users_pkey PRIMARY KEY (uid);


--
-- Name: oc_vcategory oc_vcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_vcategory
    ADD CONSTRAINT oc_vcategory_pkey PRIMARY KEY (id);


--
-- Name: oc_vcategory_to_object oc_vcategory_to_object_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_vcategory_to_object
    ADD CONSTRAINT oc_vcategory_to_object_pkey PRIMARY KEY (categoryid, objid, type);


--
-- Name: oc_webauthn oc_webauthn_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_webauthn
    ADD CONSTRAINT oc_webauthn_pkey PRIMARY KEY (id);


--
-- Name: oc_whats_new oc_whats_new_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_andmi
--

ALTER TABLE ONLY public.oc_whats_new
    ADD CONSTRAINT oc_whats_new_pkey PRIMARY KEY (id);


--
-- Name: accounts_data_name; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX accounts_data_name ON public.oc_accounts_data USING btree (name);


--
-- Name: accounts_data_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX accounts_data_uid ON public.oc_accounts_data USING btree (uid);


--
-- Name: accounts_data_value; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX accounts_data_value ON public.oc_accounts_data USING btree (value);


--
-- Name: activity_filter; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX activity_filter ON public.oc_activity USING btree (affecteduser, type, app, "timestamp");


--
-- Name: activity_filter_by; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX activity_filter_by ON public.oc_activity USING btree (affecteduser, "user", "timestamp");


--
-- Name: activity_object; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX activity_object ON public.oc_activity USING btree (object_type, object_id);


--
-- Name: activity_user_time; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX activity_user_time ON public.oc_activity USING btree (affecteduser, "timestamp");


--
-- Name: addressbook_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX addressbook_index ON public.oc_addressbooks USING btree (principaluri, uri);


--
-- Name: addressbookid_synctoken; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX addressbookid_synctoken ON public.oc_addressbookchanges USING btree (addressbookid, synctoken);


--
-- Name: admindel_groupid_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX admindel_groupid_idx ON public.oc_authorized_groups USING btree (group_id);


--
-- Name: album_collabs_uniq_collab; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX album_collabs_uniq_collab ON public.oc_photos_albums_collabs USING btree (album_id, collaborator_id, collaborator_type);


--
-- Name: amp_latest_send_time; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX amp_latest_send_time ON public.oc_activity_mq USING btree (amq_latest_send);


--
-- Name: amp_timestamp_time; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX amp_timestamp_time ON public.oc_activity_mq USING btree (amq_timestamp);


--
-- Name: amp_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX amp_user ON public.oc_activity_mq USING btree (amq_affecteduser);


--
-- Name: appconfig_config_key_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX appconfig_config_key_index ON public.oc_appconfig USING btree (configkey);


--
-- Name: authtoken_last_activity_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX authtoken_last_activity_idx ON public.oc_authtoken USING btree (last_activity);


--
-- Name: authtoken_token_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX authtoken_token_index ON public.oc_authtoken USING btree (token);


--
-- Name: authtoken_uid_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX authtoken_uid_index ON public.oc_authtoken USING btree (uid);


--
-- Name: bruteforce_attempts_ip; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX bruteforce_attempts_ip ON public.oc_bruteforce_attempts USING btree (ip);


--
-- Name: bruteforce_attempts_subnet; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX bruteforce_attempts_subnet ON public.oc_bruteforce_attempts USING btree (subnet);


--
-- Name: calendar_invitation_tokens; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_invitation_tokens ON public.oc_calendar_invitations USING btree (token);


--
-- Name: calendar_reminder_objid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_reminder_objid ON public.oc_calendar_reminders USING btree (object_id);


--
-- Name: calendar_reminder_uidrec; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_reminder_uidrec ON public.oc_calendar_reminders USING btree (uid, recurrence_id);


--
-- Name: calendar_resources_bkdrsc; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_resources_bkdrsc ON public.oc_calendar_resources USING btree (backend_id, resource_id);


--
-- Name: calendar_resources_email; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_resources_email ON public.oc_calendar_resources USING btree (email);


--
-- Name: calendar_resources_md_idk; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_resources_md_idk ON public.oc_calendar_resources_md USING btree (resource_id, key);


--
-- Name: calendar_resources_name; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_resources_name ON public.oc_calendar_resources USING btree (displayname);


--
-- Name: calendar_rooms_bkdrsc; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_rooms_bkdrsc ON public.oc_calendar_rooms USING btree (backend_id, resource_id);


--
-- Name: calendar_rooms_email; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_rooms_email ON public.oc_calendar_rooms USING btree (email);


--
-- Name: calendar_rooms_md_idk; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_rooms_md_idk ON public.oc_calendar_rooms_md USING btree (room_id, key);


--
-- Name: calendar_rooms_name; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendar_rooms_name ON public.oc_calendar_rooms USING btree (displayname);


--
-- Name: calendarobject_calid_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendarobject_calid_index ON public.oc_calendarobjects_props USING btree (calendarid, calendartype);


--
-- Name: calendarobject_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendarobject_index ON public.oc_calendarobjects_props USING btree (objectid, calendartype);


--
-- Name: calendarobject_name_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendarobject_name_index ON public.oc_calendarobjects_props USING btree (name, calendartype);


--
-- Name: calendarobject_value_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calendarobject_value_index ON public.oc_calendarobjects_props USING btree (value, calendartype);


--
-- Name: calendars_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX calendars_index ON public.oc_calendars USING btree (principaluri, uri);


--
-- Name: calid_type_synctoken; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX calid_type_synctoken ON public.oc_calendarchanges USING btree (calendarid, calendartype, synctoken);


--
-- Name: calobjects_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX calobjects_index ON public.oc_calendarobjects USING btree (calendarid, calendartype, uri);


--
-- Name: cals_princ_del_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX cals_princ_del_idx ON public.oc_calendars USING btree (principaluri, deleted_at);


--
-- Name: calsub_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX calsub_index ON public.oc_calendarsubscriptions USING btree (principaluri, uri);


--
-- Name: card_contactid_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX card_contactid_index ON public.oc_cards_properties USING btree (cardid);


--
-- Name: card_name_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX card_name_index ON public.oc_cards_properties USING btree (name);


--
-- Name: card_value_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX card_value_index ON public.oc_cards_properties USING btree (value);


--
-- Name: cards_abid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX cards_abid ON public.oc_cards USING btree (addressbookid);


--
-- Name: cards_abiduri; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX cards_abiduri ON public.oc_cards USING btree (addressbookid, uri);


--
-- Name: cards_prop_abid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX cards_prop_abid ON public.oc_cards_properties USING btree (addressbookid);


--
-- Name: category_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX category_index ON public.oc_vcategory USING btree (category);


--
-- Name: circles_member_cisi; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX circles_member_cisi ON public.oc_circles_member USING btree (circle_id, single_id);


--
-- Name: circles_member_cisiuiutil; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX circles_member_cisiuiutil ON public.oc_circles_member USING btree (circle_id, single_id, user_id, user_type, instance, level);


--
-- Name: circles_membership_ifilci; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX circles_membership_ifilci ON public.oc_circles_membership USING btree (inheritance_first, inheritance_last, circle_id);


--
-- Name: circles_mount_cimipt; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX circles_mount_cimipt ON public.oc_circles_mount USING btree (circle_id, mount_id, parent, token);


--
-- Name: circles_mountpoint_ms; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX circles_mountpoint_ms ON public.oc_circles_mountpoint USING btree (mount_id, single_id);


--
-- Name: collres_user_res; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX collres_user_res ON public.oc_collres_accesscache USING btree (user_id, resource_type, resource_id);


--
-- Name: comment_reaction; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comment_reaction ON public.oc_reactions USING btree (reaction);


--
-- Name: comment_reaction_parent_id; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comment_reaction_parent_id ON public.oc_reactions USING btree (parent_id);


--
-- Name: comment_reaction_unique; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX comment_reaction_unique ON public.oc_reactions USING btree (parent_id, actor_type, actor_id, reaction);


--
-- Name: comments_actor_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comments_actor_index ON public.oc_comments USING btree (actor_type, actor_id);


--
-- Name: comments_marker_object_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comments_marker_object_index ON public.oc_comments_read_markers USING btree (object_type, object_id);


--
-- Name: comments_object_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comments_object_index ON public.oc_comments USING btree (object_type, object_id, creation_timestamp);


--
-- Name: comments_parent_id_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comments_parent_id_index ON public.oc_comments USING btree (parent_id);


--
-- Name: comments_topmost_parent_id_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX comments_topmost_parent_id_idx ON public.oc_comments USING btree (topmost_parent_id);


--
-- Name: dav_cal_proxy_ipid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX dav_cal_proxy_ipid ON public.oc_dav_cal_proxy USING btree (proxy_id);


--
-- Name: dav_cal_proxy_uidx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX dav_cal_proxy_uidx ON public.oc_dav_cal_proxy USING btree (owner_id, proxy_id, permissions);


--
-- Name: dav_shares_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX dav_shares_index ON public.oc_dav_shares USING btree (principaluri, resourceid, type, publicuri);


--
-- Name: direct_edit_timestamp; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX direct_edit_timestamp ON public.oc_direct_edit USING btree ("timestamp");


--
-- Name: directlink_expiration_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX directlink_expiration_idx ON public.oc_directlink USING btree (expiration);


--
-- Name: directlink_token_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX directlink_token_idx ON public.oc_directlink USING btree (token);


--
-- Name: dname; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX dname ON public.oc_circles_circle USING btree (display_name);


--
-- Name: expire_date; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX expire_date ON public.oc_comments USING btree (expire_date);


--
-- Name: fce_ctime_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fce_ctime_idx ON public.oc_filecache_extended USING btree (creation_time);


--
-- Name: fce_utime_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fce_utime_idx ON public.oc_filecache_extended USING btree (upload_time);


--
-- Name: file_source_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX file_source_index ON public.oc_share USING btree (file_source);


--
-- Name: files_versions_uniq_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX files_versions_uniq_index ON public.oc_files_versions USING btree (file_id, "timestamp");


--
-- Name: flow_unique_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX flow_unique_hash ON public.oc_flow_checks USING btree (hash);


--
-- Name: flow_unique_scope; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX flow_unique_scope ON public.oc_flow_operations_scope USING btree (operation_id, type, value);


--
-- Name: fs_id_storage_size; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_id_storage_size ON public.oc_filecache USING btree (fileid, storage, size);


--
-- Name: fs_mtime; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_mtime ON public.oc_filecache USING btree (mtime);


--
-- Name: fs_parent; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_parent ON public.oc_filecache USING btree (parent);


--
-- Name: fs_parent_name_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_parent_name_hash ON public.oc_filecache USING btree (parent, name);


--
-- Name: fs_size; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_size ON public.oc_filecache USING btree (size);


--
-- Name: fs_storage_mimepart; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_storage_mimepart ON public.oc_filecache USING btree (storage, mimepart);


--
-- Name: fs_storage_mimetype; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_storage_mimetype ON public.oc_filecache USING btree (storage, mimetype);


--
-- Name: fs_storage_path_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX fs_storage_path_hash ON public.oc_filecache USING btree (storage, path_hash);


--
-- Name: fs_storage_size; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX fs_storage_size ON public.oc_filecache USING btree (storage, size, fileid);


--
-- Name: group_admin_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX group_admin_uid ON public.oc_group_admin USING btree (uid);


--
-- Name: gu_uid_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX gu_uid_index ON public.oc_group_user USING btree (uid);


--
-- Name: id_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX id_index ON public.oc_files_trash USING btree (id);


--
-- Name: idx_25c66a49e7a1254a; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_25c66a49e7a1254a ON public.oc_circles_member USING btree (contact_id);


--
-- Name: idx_4d5afeca5f37a13b; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_4d5afeca5f37a13b ON public.oc_direct_edit USING btree (token);


--
-- Name: idx_8195f5484230b1de; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_8195f5484230b1de ON public.oc_circles_circle USING btree (instance);


--
-- Name: idx_8195f5485f8a7f73; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_8195f5485f8a7f73 ON public.oc_circles_circle USING btree (source);


--
-- Name: idx_8195f548c317b362; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_8195f548c317b362 ON public.oc_circles_circle USING btree (sanitized_name);


--
-- Name: idx_8195f548d48a2f7c; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_8195f548d48a2f7c ON public.oc_circles_circle USING btree (config);


--
-- Name: idx_8fc816eae7c1d92b; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_8fc816eae7c1d92b ON public.oc_circles_membership USING btree (single_id);


--
-- Name: idx_f94ef8334f8e741; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_f94ef8334f8e741 ON public.oc_circles_remote USING btree (href);


--
-- Name: idx_f94ef83539b0606; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX idx_f94ef83539b0606 ON public.oc_circles_remote USING btree (uid);


--
-- Name: initiator_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX initiator_index ON public.oc_share USING btree (uid_initiator);


--
-- Name: item_share_type_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX item_share_type_index ON public.oc_share USING btree (item_type, share_type);


--
-- Name: job_argument_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX job_argument_hash ON public.oc_jobs USING btree (class, argument_hash);


--
-- Name: job_class_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX job_class_index ON public.oc_jobs USING btree (class);


--
-- Name: job_lastcheck_reserved; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX job_lastcheck_reserved ON public.oc_jobs USING btree (last_checked, reserved_at);


--
-- Name: jobs_time_sensitive; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX jobs_time_sensitive ON public.oc_jobs USING btree (time_sensitive);


--
-- Name: ku_known_to; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ku_known_to ON public.oc_known_users USING btree (known_to);


--
-- Name: ku_known_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ku_known_user ON public.oc_known_users USING btree (known_user);


--
-- Name: lock_key_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX lock_key_index ON public.oc_file_locks USING btree (key);


--
-- Name: lock_ttl_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX lock_ttl_index ON public.oc_file_locks USING btree (ttl);


--
-- Name: login_token; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX login_token ON public.oc_login_flow_v2 USING btree (login_token);


--
-- Name: mimetype_id_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX mimetype_id_index ON public.oc_mimetypes USING btree (mimetype);


--
-- Name: mount_user_storage; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mount_user_storage ON public.oc_mounts USING btree (storage_id, user_id);


--
-- Name: mounts_class_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mounts_class_index ON public.oc_mounts USING btree (mount_provider_class);


--
-- Name: mounts_mount_id_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mounts_mount_id_index ON public.oc_mounts USING btree (mount_id);


--
-- Name: mounts_root_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mounts_root_index ON public.oc_mounts USING btree (root_id);


--
-- Name: mounts_storage_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mounts_storage_index ON public.oc_mounts USING btree (storage_id);


--
-- Name: mounts_user_root_path_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX mounts_user_root_path_index ON public.oc_mounts USING btree (user_id, root_id, mount_point);


--
-- Name: notset_nextsend; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX notset_nextsend ON public.oc_notifications_settings USING btree (next_send_time);


--
-- Name: notset_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX notset_user ON public.oc_notifications_settings USING btree (user_id);


--
-- Name: oauth2_access_client_id_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX oauth2_access_client_id_idx ON public.oc_oauth2_access_tokens USING btree (client_id);


--
-- Name: oauth2_access_hash_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX oauth2_access_hash_idx ON public.oc_oauth2_access_tokens USING btree (hashed_code);


--
-- Name: oauth2_client_id_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX oauth2_client_id_idx ON public.oc_oauth2_clients USING btree (client_identifier);


--
-- Name: oc_notifications_app; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX oc_notifications_app ON public.oc_notifications USING btree (app);


--
-- Name: oc_notifications_object; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX oc_notifications_object ON public.oc_notifications USING btree (object_type, object_id);


--
-- Name: oc_notifications_timestamp; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX oc_notifications_timestamp ON public.oc_notifications USING btree ("timestamp");


--
-- Name: oc_notifications_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX oc_notifications_user ON public.oc_notifications USING btree ("user");


--
-- Name: oc_npushhash_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX oc_npushhash_uid ON public.oc_notifications_pushhash USING btree (uid, token);


--
-- Name: openlocal_user_path_token; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX openlocal_user_path_token ON public.oc_open_local_editor USING btree (user_id, path_hash, token);


--
-- Name: owner_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX owner_index ON public.oc_share USING btree (uid_owner);


--
-- Name: pa_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX pa_user ON public.oc_photos_albums USING btree ("user");


--
-- Name: paf_album_file; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX paf_album_file ON public.oc_photos_albums_files USING btree (album_id, file_id);


--
-- Name: paf_folder; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX paf_folder ON public.oc_photos_albums_files USING btree (album_id);


--
-- Name: parent_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX parent_index ON public.oc_share USING btree (parent);


--
-- Name: poll_token; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX poll_token ON public.oc_login_flow_v2 USING btree (poll_token);


--
-- Name: preferences_app_key; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX preferences_app_key ON public.oc_preferences USING btree (appid, configkey);


--
-- Name: profile_config_user_id_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX profile_config_user_id_idx ON public.oc_profile_config USING btree (user_id);


--
-- Name: properties_path_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX properties_path_index ON public.oc_properties USING btree (userid, propertypath);


--
-- Name: properties_pathonly_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX properties_pathonly_index ON public.oc_properties USING btree (propertypath);


--
-- Name: property_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX property_index ON public.oc_properties USING btree (userid);


--
-- Name: ratelimit_delete_after; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ratelimit_delete_after ON public.oc_ratelimit_entries USING btree (delete_after);


--
-- Name: ratelimit_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ratelimit_hash ON public.oc_ratelimit_entries USING btree (hash);


--
-- Name: rd_session_token_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX rd_session_token_idx ON public.oc_text_sessions USING btree (token);


--
-- Name: rd_steps_did_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX rd_steps_did_idx ON public.oc_text_steps USING btree (document_id);


--
-- Name: rd_steps_version_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX rd_steps_version_idx ON public.oc_text_steps USING btree (version);


--
-- Name: recent_contact_actor_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_actor_uid ON public.oc_recent_contact USING btree (actor_uid);


--
-- Name: recent_contact_email; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_email ON public.oc_recent_contact USING btree (email);


--
-- Name: recent_contact_fed_id; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_fed_id ON public.oc_recent_contact USING btree (federated_cloud_id);


--
-- Name: recent_contact_id_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_id_uid ON public.oc_recent_contact USING btree (id, actor_uid);


--
-- Name: recent_contact_last_contact; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_last_contact ON public.oc_recent_contact USING btree (last_contact);


--
-- Name: recent_contact_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX recent_contact_uid ON public.oc_recent_contact USING btree (uid);


--
-- Name: reminders_uniq_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX reminders_uniq_idx ON public.oc_files_reminders USING btree (user_id, file_id, due_date);


--
-- Name: schedulobj_principuri_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX schedulobj_principuri_index ON public.oc_schedulingobjects USING btree (principaluri);


--
-- Name: sh_external_mp; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX sh_external_mp ON public.oc_share_external USING btree ("user", mountpoint_hash);


--
-- Name: share_with_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX share_with_index ON public.oc_share USING btree (share_with);


--
-- Name: sicisimit; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX sicisimit ON public.oc_circles_token USING btree (share_id, circle_id, single_id, member_id, token);


--
-- Name: stocred_ui; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX stocred_ui ON public.oc_storages_credentials USING btree ("user", identifier);


--
-- Name: stocred_user; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX stocred_user ON public.oc_storages_credentials USING btree ("user");


--
-- Name: storages_id_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX storages_id_index ON public.oc_storages USING btree (id);


--
-- Name: systag_by_tagid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX systag_by_tagid ON public.oc_systemtag_object_mapping USING btree (systemtagid, objecttype);


--
-- Name: tag_ident; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX tag_ident ON public.oc_systemtag USING btree (name, visibility, editable);


--
-- Name: textstep_session; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX textstep_session ON public.oc_text_steps USING btree (session_id);


--
-- Name: timestamp; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX "timestamp" ON public.oc_login_flow_v2 USING btree ("timestamp");


--
-- Name: timestamp_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX timestamp_index ON public.oc_files_trash USING btree ("timestamp");


--
-- Name: token_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX token_index ON public.oc_share USING btree (token);


--
-- Name: tp_tasks_status_type_nonunique; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX tp_tasks_status_type_nonunique ON public.oc_textprocessing_tasks USING btree (status, type);


--
-- Name: tp_tasks_uid_appid_ident; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX tp_tasks_uid_appid_ident ON public.oc_textprocessing_tasks USING btree (user_id, app_id, identifier);


--
-- Name: tp_tasks_updated; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX tp_tasks_updated ON public.oc_textprocessing_tasks USING btree (last_updated);


--
-- Name: ts_docid_lastcontact; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ts_docid_lastcontact ON public.oc_text_sessions USING btree (document_id, last_contact);


--
-- Name: ts_lastcontact; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX ts_lastcontact ON public.oc_text_sessions USING btree (last_contact);


--
-- Name: twofactor_backupcodes_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX twofactor_backupcodes_uid ON public.oc_twofactor_backupcodes USING btree (user_id);


--
-- Name: twofactor_providers_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX twofactor_providers_uid ON public.oc_twofactor_providers USING btree (uid);


--
-- Name: type_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX type_index ON public.oc_vcategory USING btree (type);


--
-- Name: uid_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX uid_index ON public.oc_vcategory USING btree (uid);


--
-- Name: uniq_337f52f8126f525e70ee2ff6; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX uniq_337f52f8126f525e70ee2ff6 ON public.oc_circles_share_lock USING btree (item_id, circle_id);


--
-- Name: uniq_8195f548e3c68343; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX uniq_8195f548e3c68343 ON public.oc_circles_circle USING btree (unique_id);


--
-- Name: uniq_f94ef834230b1de; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX uniq_f94ef834230b1de ON public.oc_circles_remote USING btree (instance);


--
-- Name: url_hash; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX url_hash ON public.oc_trusted_servers USING btree (url_hash);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX user_index ON public.oc_files_trash USING btree ("user");


--
-- Name: user_status_clr_ix; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX user_status_clr_ix ON public.oc_user_status USING btree (clear_at);


--
-- Name: user_status_iud_ix; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX user_status_iud_ix ON public.oc_user_status USING btree (is_user_defined, status);


--
-- Name: user_status_tstmp_ix; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX user_status_tstmp_ix ON public.oc_user_status USING btree (status_timestamp);


--
-- Name: user_status_uid_ix; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX user_status_uid_ix ON public.oc_user_status USING btree (user_id);


--
-- Name: user_uid_lower; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX user_uid_lower ON public.oc_users USING btree (uid_lower);


--
-- Name: vcategory_objectd_index; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX vcategory_objectd_index ON public.oc_vcategory_to_object USING btree (objid, type);


--
-- Name: version; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE UNIQUE INDEX version ON public.oc_whats_new USING btree (version);


--
-- Name: version_etag_idx; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX version_etag_idx ON public.oc_whats_new USING btree (version, etag);


--
-- Name: webauthn_publickeycredentialid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX webauthn_publickeycredentialid ON public.oc_webauthn USING btree (public_key_credential_id);


--
-- Name: webauthn_uid; Type: INDEX; Schema: public; Owner: oc_andmi
--

CREATE INDEX webauthn_uid ON public.oc_webauthn USING btree (uid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: nextcloud
--

GRANT CREATE ON SCHEMA public TO oc_andmi;


--
-- PostgreSQL database dump complete
--

