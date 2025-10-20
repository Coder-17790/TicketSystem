--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.9 (Homebrew)

-- Started on 2025-10-20 22:57:15 +07

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
-- TOC entry 245 (class 1259 OID 16703)
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    actor_id bigint,
    action character varying(100) NOT NULL,
    resource character varying(50) NOT NULL,
    resource_id bigint,
    meta jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16702)
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 244
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- TOC entry 223 (class 1259 OID 16486)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    parent_id bigint
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16485)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 222
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 240 (class 1259 OID 16653)
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields (
    id bigint NOT NULL,
    scope character varying(30) DEFAULT 'ticket'::character varying NOT NULL,
    key character varying(100) NOT NULL,
    label character varying(255) NOT NULL,
    data_type character varying(30) NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    options jsonb
);


ALTER TABLE public.custom_fields OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16652)
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.custom_fields_id_seq OWNER TO postgres;

--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 239
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- TOC entry 249 (class 1259 OID 16733)
-- Name: escalations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.escalations (
    id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    rule_name character varying(255) NOT NULL,
    triggered_at timestamp with time zone DEFAULT now() NOT NULL,
    action_taken character varying(255),
    meta jsonb
);


ALTER TABLE public.escalations OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16732)
-- Name: escalations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.escalations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.escalations_id_seq OWNER TO postgres;

--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 248
-- Name: escalations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.escalations_id_seq OWNED BY public.escalations.id;


--
-- TOC entry 247 (class 1259 OID 16718)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    kind character varying(50) NOT NULL,
    title character varying(255),
    body text,
    payload jsonb,
    sent_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16717)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 246
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 216 (class 1259 OID 16428)
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    domain character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16427)
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organizations_id_seq OWNER TO postgres;

--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 215
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- TOC entry 253 (class 1259 OID 16758)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    code character varying(100) NOT NULL,
    note text
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16757)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 252
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 225 (class 1259 OID 16500)
-- Name: priorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priorities (
    id smallint NOT NULL,
    name character varying(50) NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.priorities OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16499)
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priorities_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.priorities_id_seq OWNER TO postgres;

--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 224
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;


--
-- TOC entry 254 (class 1259 OID 16768)
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16748)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16747)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 250
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 229 (class 1259 OID 16521)
-- Name: sla_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sla_policies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    response_time_s integer NOT NULL,
    resolve_time_s integer NOT NULL,
    working_calendar jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sla_policies OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16520)
-- Name: sla_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sla_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sla_policies_id_seq OWNER TO postgres;

--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 228
-- Name: sla_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sla_policies_id_seq OWNED BY public.sla_policies.id;


--
-- TOC entry 227 (class 1259 OID 16511)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id smallint NOT NULL,
    name character varying(50) NOT NULL,
    is_closed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16510)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statuses_id_seq OWNER TO postgres;

--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 226
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 233 (class 1259 OID 16587)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16586)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 232
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 221 (class 1259 OID 16469)
-- Name: team_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_members (
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_in_team character varying(50) DEFAULT 'member'::character varying
);


ALTER TABLE public.team_members OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16459)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16458)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 219
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 238 (class 1259 OID 16633)
-- Name: ticket_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_attachments (
    id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    uploader_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    file_size bigint NOT NULL,
    mime_type character varying(100),
    storage_url text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ticket_attachments OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16632)
-- Name: ticket_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_attachments_id_seq OWNER TO postgres;

--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 237
-- Name: ticket_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_attachments_id_seq OWNED BY public.ticket_attachments.id;


--
-- TOC entry 236 (class 1259 OID 16611)
-- Name: ticket_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_comments (
    id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    author_id bigint NOT NULL,
    body text NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ticket_comments OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16610)
-- Name: ticket_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_comments_id_seq OWNER TO postgres;

--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 235
-- Name: ticket_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_comments_id_seq OWNED BY public.ticket_comments.id;


--
-- TOC entry 241 (class 1259 OID 16665)
-- Name: ticket_custom_field_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_custom_field_values (
    ticket_id bigint NOT NULL,
    field_id bigint NOT NULL,
    value_text text,
    value_number numeric,
    value_bool boolean,
    value_date date,
    value_json jsonb
);


ALTER TABLE public.ticket_custom_field_values OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16683)
-- Name: ticket_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_events (
    id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    actor_id bigint,
    event_type character varying(50) NOT NULL,
    from_value jsonb,
    to_value jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ticket_events OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16682)
-- Name: ticket_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_events_id_seq OWNER TO postgres;

--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 242
-- Name: ticket_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_events_id_seq OWNED BY public.ticket_events.id;


--
-- TOC entry 234 (class 1259 OID 16595)
-- Name: ticket_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_tags (
    ticket_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.ticket_tags OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16532)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    code character varying(30) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    requester_id bigint NOT NULL,
    assignee_id bigint,
    team_id bigint,
    category_id bigint,
    priority_id smallint,
    status_id smallint,
    sla_policy_id bigint,
    due_at timestamp with time zone,
    first_response_at timestamp with time zone,
    resolved_at timestamp with time zone,
    closed_at timestamp with time zone,
    source character varying(30) DEFAULT 'web'::character varying,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16531)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 230
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 255 (class 1259 OID 16783)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16439)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    org_id bigint,
    email character varying NOT NULL,
    full_name character varying(255) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16438)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3582 (class 2604 OID 16706)
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 16489)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3577 (class 2604 OID 16656)
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- TOC entry 3586 (class 2604 OID 16736)
-- Name: escalations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalations ALTER COLUMN id SET DEFAULT nextval('public.escalations_id_seq'::regclass);


--
-- TOC entry 3584 (class 2604 OID 16721)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3548 (class 2604 OID 16431)
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- TOC entry 3590 (class 2604 OID 16761)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3560 (class 2604 OID 16503)
-- Name: priorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);


--
-- TOC entry 3588 (class 2604 OID 16751)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 16524)
-- Name: sla_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla_policies ALTER COLUMN id SET DEFAULT nextval('public.sla_policies_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 16514)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- TOC entry 3571 (class 2604 OID 16590)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3555 (class 2604 OID 16462)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 16636)
-- Name: ticket_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_attachments ALTER COLUMN id SET DEFAULT nextval('public.ticket_attachments_id_seq'::regclass);


--
-- TOC entry 3572 (class 2604 OID 16614)
-- Name: ticket_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_comments ALTER COLUMN id SET DEFAULT nextval('public.ticket_comments_id_seq'::regclass);


--
-- TOC entry 3580 (class 2604 OID 16686)
-- Name: ticket_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_events ALTER COLUMN id SET DEFAULT nextval('public.ticket_events_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 16535)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 3551 (class 2604 OID 16442)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3865 (class 0 OID 16703)
-- Dependencies: 245
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, actor_id, action, resource, resource_id, meta, created_at) FROM stdin;
\.


--
-- TOC entry 3843 (class 0 OID 16486)
-- Dependencies: 223
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, parent_id) FROM stdin;
\.


--
-- TOC entry 3860 (class 0 OID 16653)
-- Dependencies: 240
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields (id, scope, key, label, data_type, is_required, options) FROM stdin;
\.


--
-- TOC entry 3869 (class 0 OID 16733)
-- Dependencies: 249
-- Data for Name: escalations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.escalations (id, ticket_id, rule_name, triggered_at, action_taken, meta) FROM stdin;
\.


--
-- TOC entry 3867 (class 0 OID 16718)
-- Dependencies: 247
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, user_id, kind, title, body, payload, sent_at, created_at) FROM stdin;
\.


--
-- TOC entry 3836 (class 0 OID 16428)
-- Dependencies: 216
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizations (id, name, domain, created_at, updated_at) FROM stdin;
1	Tplus	tplus.co	2025-10-03 21:36:45.413886+07	2025-10-03 21:36:45.413886+07
2	NewTech	newtech.example	2025-10-03 21:36:45.413886+07	2025-10-03 21:36:45.413886+07
3	Vina	vina.vn	2025-10-03 21:36:45.413886+07	2025-10-03 21:36:45.413886+07
\.


--
-- TOC entry 3873 (class 0 OID 16758)
-- Dependencies: 253
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, code, note) FROM stdin;
1	ticket.read	\N
2	ticket.create	\N
3	ticket.update	\N
4	ticket.comment	\N
5	user.manage	\N
\.


--
-- TOC entry 3845 (class 0 OID 16500)
-- Dependencies: 225
-- Data for Name: priorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priorities (id, name, rank) FROM stdin;
1	Urgent	1
2	High	2
3	Medium	3
4	Low	4
\.


--
-- TOC entry 3874 (class 0 OID 16768)
-- Dependencies: 254
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (role_id, permission_id) FROM stdin;
1	1
2	1
1	2
2	2
1	3
2	3
1	4
2	4
1	5
2	5
3	1
3	2
3	4
\.


--
-- TOC entry 3871 (class 0 OID 16748)
-- Dependencies: 251
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, created_at) FROM stdin;
1	admin	2025-10-03 17:16:54.700772+07
2	agent	2025-10-03 17:16:54.700772+07
3	requester	2025-10-03 17:16:54.700772+07
\.


--
-- TOC entry 3849 (class 0 OID 16521)
-- Dependencies: 229
-- Data for Name: sla_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sla_policies (id, name, response_time_s, resolve_time_s, working_calendar, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3847 (class 0 OID 16511)
-- Dependencies: 227
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statuses (id, name, is_closed) FROM stdin;
1	New	f
2	In Progress	f
3	Pending	f
4	Resolved	t
5	Closed	t
\.


--
-- TOC entry 3853 (class 0 OID 16587)
-- Dependencies: 233
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
\.


--
-- TOC entry 3841 (class 0 OID 16469)
-- Dependencies: 221
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_members (team_id, user_id, role_in_team) FROM stdin;
\.


--
-- TOC entry 3840 (class 0 OID 16459)
-- Dependencies: 220
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3858 (class 0 OID 16633)
-- Dependencies: 238
-- Data for Name: ticket_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_attachments (id, ticket_id, uploader_id, file_name, file_size, mime_type, storage_url, created_at) FROM stdin;
\.


--
-- TOC entry 3856 (class 0 OID 16611)
-- Dependencies: 236
-- Data for Name: ticket_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_comments (id, ticket_id, author_id, body, is_internal, created_at) FROM stdin;
\.


--
-- TOC entry 3861 (class 0 OID 16665)
-- Dependencies: 241
-- Data for Name: ticket_custom_field_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_custom_field_values (ticket_id, field_id, value_text, value_number, value_bool, value_date, value_json) FROM stdin;
\.


--
-- TOC entry 3863 (class 0 OID 16683)
-- Dependencies: 243
-- Data for Name: ticket_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_events (id, ticket_id, actor_id, event_type, from_value, to_value, created_at) FROM stdin;
\.


--
-- TOC entry 3854 (class 0 OID 16595)
-- Dependencies: 234
-- Data for Name: ticket_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_tags (ticket_id, tag_id) FROM stdin;
\.


--
-- TOC entry 3851 (class 0 OID 16532)
-- Dependencies: 231
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, code, title, description, requester_id, assignee_id, team_id, category_id, priority_id, status_id, sla_policy_id, due_at, first_response_at, resolved_at, closed_at, source, is_deleted, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3875 (class 0 OID 16783)
-- Dependencies: 255
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- TOC entry 3838 (class 0 OID 16439)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, org_id, email, full_name, is_active, created_at, updated_at) FROM stdin;
9	1	tuan.pham@demo.local	Tuấn Phạm	t	2024-01-15 09:23:41+07	2024-01-15 09:23:41+07
10	1	hanh.le@demo.local	Hạnh Lê	t	2024-03-22 14:12:09+07	2024-08-10 11:04:30+07
11	2	quang.tran@demo.local	Quang Trần	t	2024-05-07 17:45:58+07	2024-05-07 17:45:58+07
12	2	thu.nguyen@demo.local	Thu Nguyễn	t	2024-06-30 10:25:16+07	2024-12-01 19:42:00+07
13	2	hoang.vu@demo.local	Hoàng Vũ	t	2024-09-18 08:10:39+07	2025-01-05 13:11:20+07
14	3	nga.do@demo.local	Ngà Đỗ	t	2024-11-27 15:34:27+07	2025-02-20 15:34:27+07
15	3	khang.bui@demo.local	Khang Bùi	t	2025-01-12 09:59:00+07	2025-06-03 21:10:42+07
16	3	long.pham@demo.local	Long Phạm	f	2025-03-28 07:41:05+07	2025-03-28 07:41:05+07
17	1	truc.vo@demo.locallll	Trúc Võ Nguyễn	t	2025-05-19 18:14:54+07	2025-10-19 08:22:41.222+07
18	2	anh.dang@demo.localll	Anh Đặng	t	2025-07-21 10:08:12+07	2025-10-19 08:22:56.834+07
\.


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 244
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 1, false);


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 222
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 239
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 248
-- Name: escalations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.escalations_id_seq', 1, false);


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 246
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 215
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizations_id_seq', 3, true);


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 252
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 5, true);


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 224
-- Name: priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priorities_id_seq', 4, true);


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 250
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 228
-- Name: sla_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sla_policies_id_seq', 1, false);


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 226
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 5, true);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 232
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 219
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, false);


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 237
-- Name: ticket_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_attachments_id_seq', 1, false);


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 235
-- Name: ticket_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_comments_id_seq', 1, false);


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 242
-- Name: ticket_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_events_id_seq', 1, false);


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 230
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- TOC entry 3647 (class 2606 OID 16711)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3603 (class 2606 OID 16493)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 3605 (class 2606 OID 16491)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 16662)
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 3641 (class 2606 OID 16664)
-- Name: custom_fields custom_fields_scope_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_scope_key_key UNIQUE (scope, key);


--
-- TOC entry 3651 (class 2606 OID 16741)
-- Name: escalations escalations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalations
    ADD CONSTRAINT escalations_pkey PRIMARY KEY (id);


--
-- TOC entry 3649 (class 2606 OID 16726)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3592 (class 2606 OID 16437)
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- TOC entry 3657 (class 2606 OID 16767)
-- Name: permissions permissions_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_code_key UNIQUE (code);


--
-- TOC entry 3659 (class 2606 OID 16765)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3607 (class 2606 OID 16507)
-- Name: priorities priorities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_name_key UNIQUE (name);


--
-- TOC entry 3609 (class 2606 OID 16505)
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- TOC entry 3611 (class 2606 OID 16509)
-- Name: priorities priorities_rank_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_rank_key UNIQUE (rank);


--
-- TOC entry 3661 (class 2606 OID 16772)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 3653 (class 2606 OID 16756)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 3655 (class 2606 OID 16754)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3617 (class 2606 OID 16530)
-- Name: sla_policies sla_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla_policies
    ADD CONSTRAINT sla_policies_pkey PRIMARY KEY (id);


--
-- TOC entry 3613 (class 2606 OID 16519)
-- Name: statuses statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_name_key UNIQUE (name);


--
-- TOC entry 3615 (class 2606 OID 16517)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 16594)
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- TOC entry 3630 (class 2606 OID 16592)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3601 (class 2606 OID 16474)
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (team_id, user_id);


--
-- TOC entry 3599 (class 2606 OID 16468)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 16641)
-- Name: ticket_attachments ticket_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3635 (class 2606 OID 16620)
-- Name: ticket_comments ticket_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3643 (class 2606 OID 16671)
-- Name: ticket_custom_field_values ticket_custom_field_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_custom_field_values
    ADD CONSTRAINT ticket_custom_field_values_pkey PRIMARY KEY (ticket_id, field_id);


--
-- TOC entry 3645 (class 2606 OID 16691)
-- Name: ticket_events ticket_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_events
    ADD CONSTRAINT ticket_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 16599)
-- Name: ticket_tags ticket_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_tags
    ADD CONSTRAINT ticket_tags_pkey PRIMARY KEY (ticket_id, tag_id);


--
-- TOC entry 3624 (class 2606 OID 16545)
-- Name: tickets tickets_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_code_key UNIQUE (code);


--
-- TOC entry 3626 (class 2606 OID 16543)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 16787)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3595 (class 2606 OID 16451)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3597 (class 2606 OID 16449)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3633 (class 1259 OID 16631)
-- Name: idx_comments_ticket; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comments_ticket ON public.ticket_comments USING btree (ticket_id);


--
-- TOC entry 3618 (class 1259 OID 16582)
-- Name: idx_tickets_assignee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_assignee ON public.tickets USING btree (assignee_id);


--
-- TOC entry 3619 (class 1259 OID 16585)
-- Name: idx_tickets_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_created ON public.tickets USING btree (created_at);


--
-- TOC entry 3620 (class 1259 OID 16584)
-- Name: idx_tickets_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_priority ON public.tickets USING btree (priority_id);


--
-- TOC entry 3621 (class 1259 OID 16581)
-- Name: idx_tickets_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_status ON public.tickets USING btree (status_id);


--
-- TOC entry 3622 (class 1259 OID 16583)
-- Name: idx_tickets_team; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_team ON public.tickets USING btree (team_id);


--
-- TOC entry 3593 (class 1259 OID 16457)
-- Name: idx_users_org; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_org ON public.users USING btree (org_id);


--
-- TOC entry 3685 (class 2606 OID 16712)
-- Name: audit_logs audit_logs_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3667 (class 2606 OID 16494)
-- Name: categories categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- TOC entry 3687 (class 2606 OID 16742)
-- Name: escalations escalations_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalations
    ADD CONSTRAINT escalations_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3686 (class 2606 OID 16727)
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3688 (class 2606 OID 16778)
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3689 (class 2606 OID 16773)
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 3665 (class 2606 OID 16475)
-- Name: team_members team_members_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- TOC entry 3666 (class 2606 OID 16480)
-- Name: team_members team_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3679 (class 2606 OID 16642)
-- Name: ticket_attachments ticket_attachments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3680 (class 2606 OID 16647)
-- Name: ticket_attachments ticket_attachments_uploader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_uploader_id_fkey FOREIGN KEY (uploader_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 3677 (class 2606 OID 16626)
-- Name: ticket_comments ticket_comments_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 3678 (class 2606 OID 16621)
-- Name: ticket_comments ticket_comments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3681 (class 2606 OID 16677)
-- Name: ticket_custom_field_values ticket_custom_field_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_custom_field_values
    ADD CONSTRAINT ticket_custom_field_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 3682 (class 2606 OID 16672)
-- Name: ticket_custom_field_values ticket_custom_field_values_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_custom_field_values
    ADD CONSTRAINT ticket_custom_field_values_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3683 (class 2606 OID 16697)
-- Name: ticket_events ticket_events_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_events
    ADD CONSTRAINT ticket_events_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3684 (class 2606 OID 16692)
-- Name: ticket_events ticket_events_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_events
    ADD CONSTRAINT ticket_events_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3675 (class 2606 OID 16605)
-- Name: ticket_tags ticket_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_tags
    ADD CONSTRAINT ticket_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- TOC entry 3676 (class 2606 OID 16600)
-- Name: ticket_tags ticket_tags_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_tags
    ADD CONSTRAINT ticket_tags_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 3668 (class 2606 OID 16551)
-- Name: tickets tickets_assignee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_assignee_id_fkey FOREIGN KEY (assignee_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3669 (class 2606 OID 16561)
-- Name: tickets tickets_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- TOC entry 3670 (class 2606 OID 16566)
-- Name: tickets tickets_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON DELETE SET NULL;


--
-- TOC entry 3671 (class 2606 OID 16546)
-- Name: tickets tickets_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 3672 (class 2606 OID 16576)
-- Name: tickets tickets_sla_policy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_sla_policy_id_fkey FOREIGN KEY (sla_policy_id) REFERENCES public.sla_policies(id) ON DELETE SET NULL;


--
-- TOC entry 3673 (class 2606 OID 16571)
-- Name: tickets tickets_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(id) ON DELETE RESTRICT;


--
-- TOC entry 3674 (class 2606 OID 16556)
-- Name: tickets tickets_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE SET NULL;


--
-- TOC entry 3690 (class 2606 OID 16793)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 3691 (class 2606 OID 16788)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3664 (class 2606 OID 16452)
-- Name: users users_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_org_id_fkey FOREIGN KEY (org_id) REFERENCES public.organizations(id) ON DELETE SET NULL;


-- Completed on 2025-10-20 22:57:15 +07

--
-- PostgreSQL database dump complete
--

