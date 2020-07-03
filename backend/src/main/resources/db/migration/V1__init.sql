CREATE SCHEMA IF NOT EXISTS public;


DROP TABLE IF EXISTS public.answers_labels CASCADE;
DROP TABLE IF EXISTS public.questions CASCADE;
DROP TABLE IF EXISTS public.answers CASCADE;
DROP TABLE IF EXISTS public.labels CASCADE;


DROP SEQUENCE IF EXISTS public.question_sequence;
DROP SEQUENCE IF EXISTS public.answer_sequence;
DROP SEQUENCE IF EXISTS public.label_sequence;


CREATE SEQUENCE IF NOT EXISTS public.question_sequence 
	START WITH 100 
	INCREMENT BY 50
	NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_sequence OWNER TO postgres;


CREATE SEQUENCE IF NOT EXISTS public.answer_sequence 
	START WITH 100 
	INCREMENT BY 50
	NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_sequence OWNER TO postgres;


CREATE SEQUENCE IF NOT EXISTS public.label_sequence 
	START WITH 100 
	INCREMENT BY 50
	NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_sequence OWNER TO postgres;


CREATE TABLE public.questions (
    id bigint NOT NULL PRIMARY KEY,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    title character varying(100)
);


ALTER TABLE public.questions OWNER TO postgres;


CREATE TABLE public.answers (
    id bigint NOT NULL PRIMARY KEY,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content text,
    duration bigint,
    language character varying(255),
    note text,
    question_id bigint NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);


ALTER TABLE public.answers OWNER TO postgres;


CREATE TABLE public.labels (
    id bigint NOT NULL PRIMARY KEY,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(20)
);


ALTER TABLE public.labels OWNER TO postgres;


CREATE TABLE public.answers_labels (
    answer_id bigint NOT NULL,
    labels_id bigint NOT NULL,
    PRIMARY KEY (answer_id, labels_id),
    FOREIGN KEY (answer_id) REFERENCES answers(id) ON DELETE CASCADE,
    FOREIGN KEY (labels_id) REFERENCES labels(id) ON DELETE CASCADE
);


ALTER TABLE public.answers_labels OWNER TO postgres;

