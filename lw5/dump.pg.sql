--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id_company integer NOT NULL,
    name character varying(50) NOT NULL,
    established integer NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_id_company_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_company_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_id_company_seq OWNER TO postgres;

--
-- Name: company_id_company_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_company_seq OWNED BY public.company.id_company;


--
-- Name: dealer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dealer (
    id_dealer integer NOT NULL,
    id_company integer NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(50) NOT NULL
);


ALTER TABLE public.dealer OWNER TO postgres;

--
-- Name: dealer_id_dealer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dealer_id_dealer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dealer_id_dealer_seq OWNER TO postgres;

--
-- Name: dealer_id_dealer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dealer_id_dealer_seq OWNED BY public.dealer.id_dealer;


--
-- Name: medicine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicine (
    id_medicine integer NOT NULL,
    name character varying(50) NOT NULL,
    cure_duration smallint NOT NULL
);


ALTER TABLE public.medicine OWNER TO postgres;

--
-- Name: medicine_id_medicine_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicine_id_medicine_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicine_id_medicine_seq OWNER TO postgres;

--
-- Name: medicine_id_medicine_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicine_id_medicine_seq OWNED BY public.medicine.id_medicine;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id_order integer NOT NULL,
    id_production integer NOT NULL,
    id_dealer integer NOT NULL,
    id_pharmacy integer NOT NULL,
    date date NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_order_seq OWNER TO postgres;

--
-- Name: order_id_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_order_seq OWNED BY public."order".id_order;


--
-- Name: pharmacy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacy (
    id_pharmacy integer NOT NULL,
    name character varying(100) NOT NULL,
    rating real
);


ALTER TABLE public.pharmacy OWNER TO postgres;

--
-- Name: pharmacy_id_pharmacy_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pharmacy_id_pharmacy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pharmacy_id_pharmacy_seq OWNER TO postgres;

--
-- Name: pharmacy_id_pharmacy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pharmacy_id_pharmacy_seq OWNED BY public.pharmacy.id_pharmacy;


--
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    id_production integer NOT NULL,
    id_company integer NOT NULL,
    id_medicine integer NOT NULL,
    price money NOT NULL,
    rating smallint NOT NULL
);


ALTER TABLE public.production OWNER TO postgres;

--
-- Name: production_id_production_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_id_production_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_id_production_seq OWNER TO postgres;

--
-- Name: production_id_production_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_id_production_seq OWNED BY public.production.id_production;


--
-- Name: company id_company; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id_company SET DEFAULT nextval('public.company_id_company_seq'::regclass);


--
-- Name: dealer id_dealer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer ALTER COLUMN id_dealer SET DEFAULT nextval('public.dealer_id_dealer_seq'::regclass);


--
-- Name: medicine id_medicine; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicine ALTER COLUMN id_medicine SET DEFAULT nextval('public.medicine_id_medicine_seq'::regclass);


--
-- Name: order id_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id_order SET DEFAULT nextval('public.order_id_order_seq'::regclass);


--
-- Name: pharmacy id_pharmacy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacy ALTER COLUMN id_pharmacy SET DEFAULT nextval('public.pharmacy_id_pharmacy_seq'::regclass);


--
-- Name: production id_production; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN id_production SET DEFAULT nextval('public.production_id_production_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company VALUES (1, 'Pfizer', 1997);
INSERT INTO public.company VALUES (2, 'Novartis', 1990);
INSERT INTO public.company VALUES (3, 'Roche Holding', 2000);
INSERT INTO public.company VALUES (4, 'AstraZeneca', 2014);
INSERT INTO public.company VALUES (5, 'Merck KGaA', 1940);
INSERT INTO public.company VALUES (6, 'McKesson', 2005);
INSERT INTO public.company VALUES (7, 'Аргус', 2003);
INSERT INTO public.company VALUES (8, 'Фарма', 1978);


--
-- Data for Name: dealer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dealer VALUES (1, 8, 'Ловзанский Феоктист Фомевич', '7(7800)227-72-32');
INSERT INTO public.dealer VALUES (2, 6, 'Яшуков Капитон Архипович', '7(676)046-56-35');
INSERT INTO public.dealer VALUES (3, 7, 'Кривоухов Эрнст Адрианович', '7(13)135-92-59');
INSERT INTO public.dealer VALUES (4, 8, 'Каширин Емельян Никитевич', '7(823)568-93-66');
INSERT INTO public.dealer VALUES (5, 3, 'Рябков Елисей Эдуардович', '7(600)638-84-26');
INSERT INTO public.dealer VALUES (6, 5, 'Савин Севастьян Севастьянович', '7(515)653-47-70');
INSERT INTO public.dealer VALUES (7, 7, 'Шадрин Семён Изяславович', '7(48)758-11-92');
INSERT INTO public.dealer VALUES (8, 3, 'Амелин Антип Онуфриевич', '7(651)041-69-32');
INSERT INTO public.dealer VALUES (9, 2, 'Блантер Лавр Леонович', '7(9704)858-24-00');
INSERT INTO public.dealer VALUES (10, 3, 'Шемякин Пимен Валерьянович', '7(9219)560-71-11');
INSERT INTO public.dealer VALUES (11, 4, 'Русинов Данил Мечиславович', '7(706)767-81-36');
INSERT INTO public.dealer VALUES (12, 3, 'Гершкович Федор Тарасович', '7(180)992-11-16');
INSERT INTO public.dealer VALUES (13, 1, 'Достовалов Карп Демьянович', '7(763)742-54-95');
INSERT INTO public.dealer VALUES (14, 1, 'Янишевский Эмиль Владиславович', '7(53)676-38-54');
INSERT INTO public.dealer VALUES (15, 3, 'Парамонов Остап Филиппович', '7(43)554-11-28');
INSERT INTO public.dealer VALUES (16, 2, 'Элефтеров Владилен Куприянович', '7(169)143-76-81');
INSERT INTO public.dealer VALUES (17, 1, 'Пенкин Никанор Дмитриевич', '7(5839)838-27-18');
INSERT INTO public.dealer VALUES (18, 2, 'Чегодаев Платон Платонович', '7(59)778-94-73');
INSERT INTO public.dealer VALUES (19, 2, 'Ярославцев Феофан Евгениевич', '7(163)444-03-79');
INSERT INTO public.dealer VALUES (20, 2, 'Якурин Владислав Эрнстович', '7(62)899-72-56');
INSERT INTO public.dealer VALUES (21, 6, 'Шагидзянов Семен Касьянович', '7(343)815-42-17');
INSERT INTO public.dealer VALUES (22, 2, 'Гребенников Фадей Епифанович', '7(62)662-66-99');
INSERT INTO public.dealer VALUES (23, 4, 'Тарасов Ростислав Никонович', '7(894)192-73-60');
INSERT INTO public.dealer VALUES (24, 8, 'Михайлов Радион Левович', '7(511)427-49-09');
INSERT INTO public.dealer VALUES (25, 3, 'Бабыкин Артем Эмилевич', '7(622)127-01-15');
INSERT INTO public.dealer VALUES (26, 6, 'Пелёвин Степан Ефремович', '7(17)541-09-22');
INSERT INTO public.dealer VALUES (27, 2, 'Цейдлерин Тарас Ипполитович', '7(7461)610-34-35');
INSERT INTO public.dealer VALUES (28, 4, 'Эскин Ярослав Кондратиевич', '7(536)519-79-02');
INSERT INTO public.dealer VALUES (29, 8, 'Куимов Станислав Самуилович', '7(12)441-19-73');
INSERT INTO public.dealer VALUES (30, 6, 'Другаков Тимур Чеславович', '7(444)873-43-60');
INSERT INTO public.dealer VALUES (31, 3, 'Переверзев Онисим Никанорович', '7(12)810-04-13');
INSERT INTO public.dealer VALUES (32, 7, 'Карапетян Андриян Панкратиевич', '7(5886)692-14-68');
INSERT INTO public.dealer VALUES (33, 4, 'Антипин Юлиан Тихонович', '7(428)897-01-79');
INSERT INTO public.dealer VALUES (34, 5, 'Луньков Кир Ермолаевич', '7(707)453-23-00');
INSERT INTO public.dealer VALUES (35, 5, 'Завражнов Агап Якубович', '7(0215)983-27-10');
INSERT INTO public.dealer VALUES (36, 7, 'Киселев Борис Матвеевич', '7(8186)241-02-55');
INSERT INTO public.dealer VALUES (37, 5, 'Дятлов Евсей Гордеевич', '7(7878)719-20-91');
INSERT INTO public.dealer VALUES (38, 5, 'Ишутин Изяслав Яковович', '7(195)643-40-46');
INSERT INTO public.dealer VALUES (39, 7, 'Пелевин Всеслав Святославович', '7(567)138-01-69');
INSERT INTO public.dealer VALUES (40, 3, 'Шевцов Варфоломей Кириллович', '7(8818)320-28-28');
INSERT INTO public.dealer VALUES (41, 5, 'Экель Александра Измаиловна', '7(63)106-67-37');
INSERT INTO public.dealer VALUES (42, 7, 'Комарова Ева Агафоновна', '7(7699)871-79-05');
INSERT INTO public.dealer VALUES (43, 1, 'Шишмарёва Юлия Савелиевна', '7(35)184-34-75');
INSERT INTO public.dealer VALUES (44, 5, 'Рящина Инна Геннадиевна', '7(722)603-47-33');
INSERT INTO public.dealer VALUES (45, 1, 'Нечаева Лиана Макаровна', '7(11)912-44-60');
INSERT INTO public.dealer VALUES (46, 6, 'Мальцева Кристина Тихоновна', '7(7830)169-89-13');
INSERT INTO public.dealer VALUES (47, 5, 'Осминина Мария Вячеславовна', '7(260)930-15-30');
INSERT INTO public.dealer VALUES (48, 2, 'Канаша Василиса Михаиловна', '7(650)509-44-08');
INSERT INTO public.dealer VALUES (49, 2, 'Кая Евдокия Гаврииловна', '7(673)961-23-11');
INSERT INTO public.dealer VALUES (50, 3, 'Григолюка Рената Остаповна', '7(52)165-72-08');
INSERT INTO public.dealer VALUES (51, 8, 'Молодыха Елизавета Владиленовна', '7(695)358-82-62');
INSERT INTO public.dealer VALUES (52, 7, 'Слобожанина Кира Марковна', '7(5907)196-72-08');
INSERT INTO public.dealer VALUES (53, 2, 'Онегина Яна Федотовна', '7(5616)624-12-76');
INSERT INTO public.dealer VALUES (54, 1, 'Великая Пелагея Елизаровна', '7(69)973-87-11');
INSERT INTO public.dealer VALUES (55, 4, 'Торопова Зинаида Кондратьевна', '7(0773)614-22-08');
INSERT INTO public.dealer VALUES (56, 5, 'Шаньгина Вера Евдокимовна', '7(2205)777-65-64');
INSERT INTO public.dealer VALUES (57, 5, 'Артемьева Маргарита Емельяновна', '7(5297)049-33-55');
INSERT INTO public.dealer VALUES (58, 6, 'Зиновьева Мирослава Василиевна', '7(8786)197-70-44');
INSERT INTO public.dealer VALUES (59, 4, 'Яшнова Вероника Владленовна', '7(0934)968-68-81');
INSERT INTO public.dealer VALUES (60, 6, 'Лагранская Ульяна Леонидовна', '7(2437)251-92-39');
INSERT INTO public.dealer VALUES (61, 1, 'Хомколова Дарья Давидовна', '7(1935)350-84-94');
INSERT INTO public.dealer VALUES (62, 7, 'Абрамович Инесса Харитоновна', '7(53)613-15-14');
INSERT INTO public.dealer VALUES (63, 3, 'Локтева Римма Андрияновна', '7(6678)680-61-62');
INSERT INTO public.dealer VALUES (64, 3, 'Смышляева Алла Зиновьевна', '7(233)278-81-95');
INSERT INTO public.dealer VALUES (65, 7, 'Махова Анастасия Карповна', '7(36)405-17-29');
INSERT INTO public.dealer VALUES (66, 2, 'Голодяева Тамара Богдановна', '7(9886)494-62-73');
INSERT INTO public.dealer VALUES (67, 5, 'Гришко Оксана Карловна', '7(513)189-45-68');
INSERT INTO public.dealer VALUES (68, 7, 'Трунина Ника Ильевна', '7(293)904-78-17');
INSERT INTO public.dealer VALUES (69, 8, 'Цыганова Любава Ивановна', '7(020)037-65-13');
INSERT INTO public.dealer VALUES (70, 4, 'Мухаметова Эмма Арсентиевна', '7(920)991-19-46');
INSERT INTO public.dealer VALUES (71, 1, 'Мазурина Екатерина Владиславовна', '7(5173)472-77-57');
INSERT INTO public.dealer VALUES (72, 4, 'Новицкая Ираида Валентиновна', '7(23)362-39-38');
INSERT INTO public.dealer VALUES (73, 4, 'Шибалова Эмилия Капитоновна', '7(2902)719-88-31');
INSERT INTO public.dealer VALUES (74, 3, 'Шульц Ариадна Филимоновна', '7(040)989-11-65');
INSERT INTO public.dealer VALUES (75, 2, 'Шаронова Янина Денисовна', '7(9972)658-78-24');
INSERT INTO public.dealer VALUES (76, 8, 'Токмакова Зоя Тарасовна', '7(1385)259-34-81');
INSERT INTO public.dealer VALUES (77, 2, 'Саблина Полина Ираклиевна', '7(020)005-82-45');
INSERT INTO public.dealer VALUES (78, 5, 'Низовцова Роза Никитевна', '7(2264)660-51-57');
INSERT INTO public.dealer VALUES (79, 6, 'Флёрова Алина Артуровна', '7(4123)645-70-57');
INSERT INTO public.dealer VALUES (80, 8, 'Кулдошина Алиса Рубеновна', '7(400)921-67-83');
INSERT INTO public.dealer VALUES (81, 7, 'Менщикова Валентина Фомевна', '7(886)638-76-19');
INSERT INTO public.dealer VALUES (82, 8, 'Седегова Рада Леонидовна', '7(54)608-25-83');
INSERT INTO public.dealer VALUES (83, 5, 'Мажова Марфа Эдуардовна', '7(866)447-83-64');
INSERT INTO public.dealer VALUES (84, 5, 'Еськина Диана Потаповна', '7(2840)607-25-78');
INSERT INTO public.dealer VALUES (85, 8, 'Зинченко Ирина Ярославовна', '7(511)463-12-85');


--
-- Data for Name: medicine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicine VALUES (1, 'Анаферон', 11);
INSERT INTO public.medicine VALUES (2, 'Арбидол', 7);
INSERT INTO public.medicine VALUES (3, 'Баралгетас', 12);
INSERT INTO public.medicine VALUES (4, 'Граммидин', 14);
INSERT INTO public.medicine VALUES (5, 'Кагоцел', 10);
INSERT INTO public.medicine VALUES (6, 'Ремантадин', 5);
INSERT INTO public.medicine VALUES (7, 'Ринза', 3);
INSERT INTO public.medicine VALUES (8, 'Риниколд', 4);
INSERT INTO public.medicine VALUES (9, 'Синупред', 21);
INSERT INTO public.medicine VALUES (10, 'Кордерон', 60);
INSERT INTO public.medicine VALUES (11, 'Линкас', 7);
INSERT INTO public.medicine VALUES (12, 'Овесол', 30);
INSERT INTO public.medicine VALUES (13, 'Цитрамон', 3);
INSERT INTO public.medicine VALUES (14, 'Парацетамол', 4);
INSERT INTO public.medicine VALUES (15, 'Уголь активированный', 5);
INSERT INTO public.medicine VALUES (16, 'Гриппферон', 7);
INSERT INTO public.medicine VALUES (17, 'Анальгин', 2);
INSERT INTO public.medicine VALUES (18, 'Гептрал', 30);
INSERT INTO public.medicine VALUES (19, 'Карсил', 28);
INSERT INTO public.medicine VALUES (20, 'Визмед мульти', 3);
INSERT INTO public.medicine VALUES (21, 'Бифиформ ', 12);


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" VALUES (1, 10, 77, 16, '2019-10-31', 496);
INSERT INTO public."order" VALUES (2, 132, 11, 11, '2019-04-13', 66);
INSERT INTO public."order" VALUES (3, 6, 79, 10, '2019-02-21', 746);
INSERT INTO public."order" VALUES (4, 119, 3, 10, '2019-03-31', 245);
INSERT INTO public."order" VALUES (5, 105, 14, 11, '2019-02-24', 756);
INSERT INTO public."order" VALUES (6, 109, 41, 1, '2019-05-29', 730);
INSERT INTO public."order" VALUES (7, 29, 41, 15, '2019-03-15', 85);
INSERT INTO public."order" VALUES (8, 126, 79, 3, '2019-03-30', 881);
INSERT INTO public."order" VALUES (9, 166, 79, 20, '2019-11-18', 629);
INSERT INTO public."order" VALUES (10, 47, 3, 9, '2019-12-26', 509);
INSERT INTO public."order" VALUES (11, 97, 14, 10, '2019-05-07', 114);
INSERT INTO public."order" VALUES (12, 124, 11, 1, '2019-08-10', 552);
INSERT INTO public."order" VALUES (13, 120, 51, 17, '2019-10-31', 561);
INSERT INTO public."order" VALUES (14, 83, 15, 19, '2019-11-16', 724);
INSERT INTO public."order" VALUES (15, 156, 11, 22, '2019-08-18', 134);
INSERT INTO public."order" VALUES (16, 17, 14, 17, '2019-11-26', 238);
INSERT INTO public."order" VALUES (17, 132, 11, 23, '2019-07-17', 53);
INSERT INTO public."order" VALUES (18, 164, 11, 11, '2019-06-13', 974);
INSERT INTO public."order" VALUES (19, 49, 14, 8, '2019-10-07', 393);
INSERT INTO public."order" VALUES (20, 117, 41, 11, '2019-05-21', 541);
INSERT INTO public."order" VALUES (21, 138, 77, 20, '2019-06-16', 513);
INSERT INTO public."order" VALUES (22, 86, 79, 18, '2019-07-15', 856);
INSERT INTO public."order" VALUES (23, 69, 41, 17, '2019-02-18', 393);
INSERT INTO public."order" VALUES (24, 35, 15, 7, '2019-05-21', 408);
INSERT INTO public."order" VALUES (25, 21, 44, 7, '2019-02-28', 920);
INSERT INTO public."order" VALUES (26, 10, 48, 19, '2019-07-15', 514);
INSERT INTO public."order" VALUES (27, 56, 51, 7, '2019-07-23', 707);
INSERT INTO public."order" VALUES (28, 18, 48, 22, '2019-03-16', 903);
INSERT INTO public."order" VALUES (29, 44, 11, 10, '2019-06-19', 469);
INSERT INTO public."order" VALUES (30, 160, 51, 7, '2019-08-13', 762);
INSERT INTO public."order" VALUES (31, 56, 51, 22, '2019-07-19', 248);
INSERT INTO public."order" VALUES (32, 17, 13, 15, '2019-06-01', 90);
INSERT INTO public."order" VALUES (33, 103, 3, 2, '2019-02-13', 258);
INSERT INTO public."order" VALUES (34, 72, 1, 23, '2019-09-17', 445);
INSERT INTO public."order" VALUES (35, 6, 79, 18, '2019-05-02', 172);
INSERT INTO public."order" VALUES (36, 70, 79, 11, '2019-01-27', 961);
INSERT INTO public."order" VALUES (37, 52, 11, 20, '2019-11-22', 222);
INSERT INTO public."order" VALUES (38, 73, 14, 16, '2019-11-09', 455);
INSERT INTO public."order" VALUES (39, 134, 79, 1, '2019-08-03', 567);
INSERT INTO public."order" VALUES (40, 15, 3, 20, '2019-05-17', 79);
INSERT INTO public."order" VALUES (41, 23, 39, 6, '2019-12-19', 50);
INSERT INTO public."order" VALUES (42, 86, 79, 20, '2019-12-27', 705);
INSERT INTO public."order" VALUES (43, 163, 15, 2, '2019-05-20', 623);
INSERT INTO public."order" VALUES (44, 134, 79, 16, '2019-12-10', 833);
INSERT INTO public."order" VALUES (45, 85, 41, 3, '2019-05-19', 766);
INSERT INTO public."order" VALUES (46, 16, 51, 12, '2019-06-04', 676);
INSERT INTO public."order" VALUES (47, 4, 11, 24, '2019-07-05', 951);
INSERT INTO public."order" VALUES (48, 92, 11, 18, '2019-11-02', 212);
INSERT INTO public."order" VALUES (49, 147, 15, 2, '2019-01-24', 669);
INSERT INTO public."order" VALUES (50, 118, 79, 6, '2019-07-29', 122);
INSERT INTO public."order" VALUES (51, 116, 11, 8, '2019-09-11', 344);
INSERT INTO public."order" VALUES (52, 73, 14, 22, '2019-05-07', 126);
INSERT INTO public."order" VALUES (53, 132, 11, 14, '2019-08-17', 492);
INSERT INTO public."order" VALUES (54, 158, 79, 18, '2019-03-26', 137);
INSERT INTO public."order" VALUES (55, 49, 14, 13, '2019-05-06', 228);
INSERT INTO public."order" VALUES (56, 77, 41, 20, '2019-11-11', 112);
INSERT INTO public."order" VALUES (57, 95, 3, 21, '2019-06-24', 967);
INSERT INTO public."order" VALUES (58, 114, 77, 5, '2019-04-25', 809);
INSERT INTO public."order" VALUES (59, 128, 51, 17, '2019-01-08', 75);
INSERT INTO public."order" VALUES (60, 76, 11, 19, '2019-10-29', 991);
INSERT INTO public."order" VALUES (61, 17, 14, 8, '2019-05-04', 123);
INSERT INTO public."order" VALUES (62, 127, 3, 17, '2019-11-12', 413);
INSERT INTO public."order" VALUES (63, 70, 79, 19, '2019-12-17', 465);
INSERT INTO public."order" VALUES (64, 151, 3, 16, '2019-12-16', 371);
INSERT INTO public."order" VALUES (65, 58, 77, 15, '2019-12-18', 67);
INSERT INTO public."order" VALUES (66, 165, 41, 2, '2019-11-16', 152);
INSERT INTO public."order" VALUES (67, 87, 3, 16, '2019-03-26', 267);
INSERT INTO public."order" VALUES (68, 163, 15, 15, '2019-03-07', 8);
INSERT INTO public."order" VALUES (69, 2, 77, 17, '2019-07-23', 262);
INSERT INTO public."order" VALUES (70, 130, 18, 19, '2019-08-18', 255);
INSERT INTO public."order" VALUES (71, 7, 3, 3, '2019-08-10', 654);
INSERT INTO public."order" VALUES (72, 37, 41, 3, '2019-10-21', 276);
INSERT INTO public."order" VALUES (73, 127, 3, 12, '2019-06-19', 714);
INSERT INTO public."order" VALUES (74, 70, 79, 17, '2019-07-22', 787);
INSERT INTO public."order" VALUES (75, 46, 79, 1, '2019-05-06', 162);
INSERT INTO public."order" VALUES (76, 146, 77, 22, '2019-02-03', 893);
INSERT INTO public."order" VALUES (77, 97, 14, 18, '2019-02-22', 551);
INSERT INTO public."order" VALUES (78, 158, 79, 4, '2019-07-07', 969);
INSERT INTO public."order" VALUES (79, 60, 11, 7, '2019-07-13', 413);
INSERT INTO public."order" VALUES (80, 147, 15, 2, '2019-02-12', 368);
INSERT INTO public."order" VALUES (81, 158, 21, 2, '2019-08-17', 669);
INSERT INTO public."order" VALUES (82, 162, 9, 17, '2019-02-15', 882);
INSERT INTO public."order" VALUES (83, 114, 53, 24, '2019-12-06', 523);
INSERT INTO public."order" VALUES (84, 71, 52, 6, '2019-07-30', 715);
INSERT INTO public."order" VALUES (85, 164, 33, 3, '2019-12-02', 693);
INSERT INTO public."order" VALUES (86, 105, 14, 23, '2019-07-29', 511);
INSERT INTO public."order" VALUES (87, 95, 3, 23, '2019-10-04', 402);
INSERT INTO public."order" VALUES (88, 29, 41, 3, '2019-10-31', 475);
INSERT INTO public."order" VALUES (89, 33, 14, 2, '2019-12-17', 658);
INSERT INTO public."order" VALUES (90, 56, 51, 8, '2019-02-17', 727);
INSERT INTO public."order" VALUES (91, 142, 79, 3, '2019-06-18', 143);
INSERT INTO public."order" VALUES (92, 105, 14, 10, '2019-10-19', 126);
INSERT INTO public."order" VALUES (93, 131, 15, 21, '2019-11-06', 875);
INSERT INTO public."order" VALUES (94, 56, 51, 14, '2019-12-09', 891);
INSERT INTO public."order" VALUES (95, 9, 14, 17, '2019-02-17', 31);
INSERT INTO public."order" VALUES (96, 30, 79, 21, '2019-01-01', 385);
INSERT INTO public."order" VALUES (97, 57, 14, 2, '2019-05-03', 380);
INSERT INTO public."order" VALUES (98, 117, 84, 2, '2019-04-29', 114);
INSERT INTO public."order" VALUES (99, 102, 79, 25, '2019-02-04', 705);
INSERT INTO public."order" VALUES (100, 12, 11, 21, '2019-12-25', 359);
INSERT INTO public."order" VALUES (101, 34, 77, 13, '2019-04-04', 746);
INSERT INTO public."order" VALUES (102, 36, 11, 1, '2019-04-28', 994);
INSERT INTO public."order" VALUES (103, 64, 51, 12, '2019-08-04', 634);
INSERT INTO public."order" VALUES (104, 93, 41, 12, '2019-04-12', 52);
INSERT INTO public."order" VALUES (105, 107, 15, 9, '2019-07-30', 246);
INSERT INTO public."order" VALUES (106, 47, 3, 1, '2019-05-08', 346);
INSERT INTO public."order" VALUES (107, 141, 41, 19, '2019-02-27', 453);
INSERT INTO public."order" VALUES (108, 124, 23, 21, '2019-01-27', 153);
INSERT INTO public."order" VALUES (109, 6, 79, 24, '2019-08-07', 23);
INSERT INTO public."order" VALUES (110, 80, 51, 17, '2019-01-08', 445);
INSERT INTO public."order" VALUES (111, 119, 3, 7, '2019-02-27', 487);
INSERT INTO public."order" VALUES (112, 47, 3, 13, '2019-01-23', 80);
INSERT INTO public."order" VALUES (113, 52, 11, 21, '2019-04-21', 368);
INSERT INTO public."order" VALUES (114, 97, 14, 9, '2019-01-24', 209);
INSERT INTO public."order" VALUES (115, 149, 41, 21, '2019-01-07', 953);
INSERT INTO public."order" VALUES (116, 49, 14, 23, '2019-09-01', 496);
INSERT INTO public."order" VALUES (117, 47, 3, 17, '2019-09-02', 642);
INSERT INTO public."order" VALUES (118, 160, 51, 16, '2019-01-06', 708);
INSERT INTO public."order" VALUES (119, 99, 10, 19, '2019-09-17', 7);
INSERT INTO public."order" VALUES (120, 160, 51, 8, '2019-10-18', 619);
INSERT INTO public."order" VALUES (121, 64, 51, 3, '2019-01-31', 394);
INSERT INTO public."order" VALUES (122, 41, 14, 15, '2019-11-11', 868);
INSERT INTO public."order" VALUES (123, 70, 79, 21, '2019-11-19', 92);
INSERT INTO public."order" VALUES (124, 109, 41, 24, '2019-05-19', 122);
INSERT INTO public."order" VALUES (125, 6, 79, 7, '2019-03-03', 422);
INSERT INTO public."order" VALUES (126, 87, 3, 21, '2019-11-20', 841);
INSERT INTO public."order" VALUES (127, 156, 11, 14, '2019-10-18', 150);
INSERT INTO public."order" VALUES (128, 104, 51, 22, '2019-07-27', 806);
INSERT INTO public."order" VALUES (129, 142, 79, 2, '2019-03-21', 383);
INSERT INTO public."order" VALUES (130, 124, 11, 7, '2019-02-22', 549);
INSERT INTO public."order" VALUES (131, 45, 41, 10, '2019-10-10', 993);
INSERT INTO public."order" VALUES (132, 2, 77, 25, '2019-08-01', 695);
INSERT INTO public."order" VALUES (133, 102, 79, 9, '2019-07-20', 335);
INSERT INTO public."order" VALUES (134, 58, 16, 21, '2019-04-06', 566);
INSERT INTO public."order" VALUES (135, 49, 14, 10, '2019-01-12', 269);
INSERT INTO public."order" VALUES (136, 19, 15, 13, '2019-09-26', 489);
INSERT INTO public."order" VALUES (137, 51, 15, 21, '2019-10-23', 309);
INSERT INTO public."order" VALUES (138, 76, 11, 5, '2019-11-14', 747);
INSERT INTO public."order" VALUES (139, 116, 11, 11, '2019-07-31', 960);
INSERT INTO public."order" VALUES (140, 46, 79, 10, '2019-06-25', 438);
INSERT INTO public."order" VALUES (141, 7, 3, 24, '2019-09-17', 615);
INSERT INTO public."order" VALUES (142, 10, 77, 5, '2019-06-14', 305);
INSERT INTO public."order" VALUES (143, 49, 14, 1, '2019-09-22', 478);
INSERT INTO public."order" VALUES (144, 44, 11, 6, '2019-06-05', 957);
INSERT INTO public."order" VALUES (145, 120, 51, 4, '2019-08-30', 309);
INSERT INTO public."order" VALUES (146, 54, 79, 3, '2019-03-17', 955);
INSERT INTO public."order" VALUES (147, 35, 25, 15, '2019-03-16', 937);
INSERT INTO public."order" VALUES (148, 53, 41, 2, '2019-10-21', 387);
INSERT INTO public."order" VALUES (149, 99, 15, 3, '2019-03-22', 362);
INSERT INTO public."order" VALUES (150, 159, 3, 12, '2019-06-06', 292);
INSERT INTO public."order" VALUES (151, 81, 13, 19, '2019-06-02', 447);
INSERT INTO public."order" VALUES (152, 87, 3, 4, '2019-04-27', 697);
INSERT INTO public."order" VALUES (153, 86, 79, 1, '2019-01-10', 995);
INSERT INTO public."order" VALUES (154, 121, 14, 4, '2019-08-17', 942);
INSERT INTO public."order" VALUES (155, 147, 15, 21, '2019-12-01', 576);
INSERT INTO public."order" VALUES (156, 42, 77, 4, '2019-09-27', 36);
INSERT INTO public."order" VALUES (157, 99, 15, 5, '2019-02-06', 494);
INSERT INTO public."order" VALUES (158, 59, 15, 14, '2019-11-19', 431);
INSERT INTO public."order" VALUES (159, 153, 14, 14, '2019-12-16', 50);
INSERT INTO public."order" VALUES (160, 118, 79, 15, '2019-06-09', 223);
INSERT INTO public."order" VALUES (161, 152, 51, 12, '2019-01-15', 567);
INSERT INTO public."order" VALUES (162, 75, 15, 16, '2019-03-04', 347);
INSERT INTO public."order" VALUES (163, 63, 3, 15, '2019-04-18', 396);
INSERT INTO public."order" VALUES (164, 164, 11, 13, '2019-04-11', 343);
INSERT INTO public."order" VALUES (165, 5, 41, 22, '2019-01-09', 693);
INSERT INTO public."order" VALUES (166, 153, 14, 23, '2019-05-14', 3);
INSERT INTO public."order" VALUES (167, 31, 62, 1, '2019-08-24', 744);
INSERT INTO public."order" VALUES (168, 93, 41, 25, '2019-11-29', 357);
INSERT INTO public."order" VALUES (169, 146, 77, 22, '2019-03-03', 819);
INSERT INTO public."order" VALUES (170, 145, 14, 9, '2019-03-31', 913);
INSERT INTO public."order" VALUES (171, 109, 41, 3, '2019-04-18', 299);
INSERT INTO public."order" VALUES (172, 91, 15, 2, '2019-02-06', 237);
INSERT INTO public."order" VALUES (173, 27, 15, 15, '2019-04-04', 373);
INSERT INTO public."order" VALUES (174, 136, 51, 17, '2019-02-20', 86);
INSERT INTO public."order" VALUES (175, 36, 11, 19, '2019-06-04', 632);
INSERT INTO public."order" VALUES (176, 79, 3, 2, '2019-08-29', 955);
INSERT INTO public."order" VALUES (177, 106, 49, 19, '2019-11-11', 943);
INSERT INTO public."order" VALUES (178, 121, 14, 25, '2019-02-05', 719);
INSERT INTO public."order" VALUES (179, 107, 15, 8, '2019-10-20', 59);
INSERT INTO public."order" VALUES (180, 102, 79, 5, '2019-11-17', 464);
INSERT INTO public."order" VALUES (181, 10, 77, 2, '2019-02-19', 496);
INSERT INTO public."order" VALUES (182, 48, 51, 24, '2019-07-20', 163);
INSERT INTO public."order" VALUES (183, 99, 15, 18, '2019-11-21', 978);
INSERT INTO public."order" VALUES (184, 102, 79, 10, '2019-09-10', 596);
INSERT INTO public."order" VALUES (185, 58, 77, 13, '2019-02-16', 807);
INSERT INTO public."order" VALUES (186, 52, 23, 11, '2019-07-23', 995);
INSERT INTO public."order" VALUES (187, 146, 77, 17, '2019-10-07', 466);
INSERT INTO public."order" VALUES (188, 130, 77, 11, '2019-11-12', 174);
INSERT INTO public."order" VALUES (189, 106, 77, 18, '2019-09-13', 453);
INSERT INTO public."order" VALUES (190, 11, 15, 8, '2019-06-26', 877);
INSERT INTO public."order" VALUES (191, 96, 51, 19, '2019-06-23', 743);
INSERT INTO public."order" VALUES (192, 122, 77, 22, '2019-11-09', 728);
INSERT INTO public."order" VALUES (193, 139, 15, 25, '2019-08-14', 206);
INSERT INTO public."order" VALUES (194, 68, 11, 1, '2019-06-13', 628);
INSERT INTO public."order" VALUES (195, 72, 51, 6, '2019-06-06', 723);
INSERT INTO public."order" VALUES (196, 89, 14, 12, '2019-05-12', 620);
INSERT INTO public."order" VALUES (197, 52, 55, 19, '2019-11-05', 756);
INSERT INTO public."order" VALUES (198, 41, 14, 10, '2019-11-20', 211);
INSERT INTO public."order" VALUES (199, 127, 3, 13, '2019-09-07', 452);
INSERT INTO public."order" VALUES (200, 8, 51, 1, '2019-07-06', 574);
INSERT INTO public."order" VALUES (201, 128, 51, 11, '2019-07-10', 581);
INSERT INTO public."order" VALUES (202, 153, 14, 12, '2019-07-17', 94);
INSERT INTO public."order" VALUES (203, 16, 1, 12, '2019-03-26', 300);
INSERT INTO public."order" VALUES (204, 135, 3, 15, '2019-04-15', 477);
INSERT INTO public."order" VALUES (205, 38, 79, 8, '2019-06-12', 127);
INSERT INTO public."order" VALUES (206, 161, 14, 24, '2019-10-17', 916);
INSERT INTO public."order" VALUES (207, 168, 51, 10, '2019-05-08', 524);
INSERT INTO public."order" VALUES (208, 163, 15, 19, '2019-08-05', 326);
INSERT INTO public."order" VALUES (209, 85, 41, 6, '2019-11-08', 962);
INSERT INTO public."order" VALUES (210, 43, 15, 21, '2019-12-16', 923);
INSERT INTO public."order" VALUES (211, 81, 14, 1, '2019-09-14', 710);
INSERT INTO public."order" VALUES (212, 89, 14, 24, '2019-10-28', 136);
INSERT INTO public."order" VALUES (213, 127, 3, 10, '2019-04-06', 197);
INSERT INTO public."order" VALUES (214, 133, 41, 15, '2019-07-18', 460);
INSERT INTO public."order" VALUES (215, 102, 79, 20, '2019-07-18', 309);
INSERT INTO public."order" VALUES (216, 108, 11, 19, '2019-03-30', 988);
INSERT INTO public."order" VALUES (217, 103, 32, 17, '2019-02-06', 131);
INSERT INTO public."order" VALUES (218, 145, 14, 24, '2019-09-04', 359);
INSERT INTO public."order" VALUES (219, 147, 15, 12, '2019-03-20', 552);
INSERT INTO public."order" VALUES (220, 23, 3, 2, '2019-03-27', 140);
INSERT INTO public."order" VALUES (221, 25, 14, 3, '2019-12-04', 467);
INSERT INTO public."order" VALUES (222, 155, 15, 4, '2019-01-14', 756);
INSERT INTO public."order" VALUES (223, 85, 41, 11, '2019-05-06', 587);
INSERT INTO public."order" VALUES (224, 138, 77, 20, '2019-10-28', 57);
INSERT INTO public."order" VALUES (225, 30, 79, 19, '2019-07-24', 176);
INSERT INTO public."order" VALUES (226, 116, 11, 20, '2019-01-12', 168);
INSERT INTO public."order" VALUES (227, 98, 77, 5, '2019-12-19', 129);
INSERT INTO public."order" VALUES (228, 116, 11, 1, '2019-05-22', 985);
INSERT INTO public."order" VALUES (229, 141, 47, 7, '2019-06-20', 826);
INSERT INTO public."order" VALUES (230, 6, 79, 17, '2019-11-11', 802);
INSERT INTO public."order" VALUES (231, 65, 14, 17, '2019-12-24', 521);
INSERT INTO public."order" VALUES (232, 38, 79, 15, '2019-05-23', 138);
INSERT INTO public."order" VALUES (233, 8, 51, 2, '2019-12-12', 816);
INSERT INTO public."order" VALUES (234, 114, 77, 23, '2019-08-26', 763);
INSERT INTO public."order" VALUES (235, 117, 41, 11, '2019-08-12', 976);
INSERT INTO public."order" VALUES (236, 103, 3, 16, '2019-04-15', 876);
INSERT INTO public."order" VALUES (237, 166, 79, 20, '2019-08-01', 606);
INSERT INTO public."order" VALUES (238, 77, 41, 24, '2019-06-22', 457);
INSERT INTO public."order" VALUES (239, 35, 15, 17, '2019-01-08', 225);
INSERT INTO public."order" VALUES (240, 7, 3, 20, '2019-12-28', 449);
INSERT INTO public."order" VALUES (241, 127, 3, 25, '2019-12-06', 148);
INSERT INTO public."order" VALUES (242, 76, 11, 19, '2019-11-22', 540);
INSERT INTO public."order" VALUES (243, 111, 3, 5, '2019-07-31', 18);
INSERT INTO public."order" VALUES (244, 139, 15, 13, '2019-03-18', 698);
INSERT INTO public."order" VALUES (245, 25, 14, 21, '2019-02-05', 512);
INSERT INTO public."order" VALUES (246, 111, 3, 3, '2019-09-16', 781);
INSERT INTO public."order" VALUES (247, 41, 14, 14, '2019-07-14', 800);
INSERT INTO public."order" VALUES (248, 147, 15, 14, '2019-08-02', 971);
INSERT INTO public."order" VALUES (249, 83, 15, 6, '2019-02-24', 742);
INSERT INTO public."order" VALUES (250, 13, 41, 21, '2019-04-27', 226);
INSERT INTO public."order" VALUES (251, 84, 11, 5, '2019-11-08', 888);
INSERT INTO public."order" VALUES (252, 111, 3, 5, '2019-03-23', 847);
INSERT INTO public."order" VALUES (253, 12, 11, 16, '2019-02-19', 162);
INSERT INTO public."order" VALUES (254, 45, 41, 15, '2019-11-20', 283);
INSERT INTO public."order" VALUES (255, 75, 15, 25, '2019-04-15', 423);
INSERT INTO public."order" VALUES (256, 67, 15, 20, '2019-03-01', 398);
INSERT INTO public."order" VALUES (257, 11, 15, 10, '2019-11-27', 888);
INSERT INTO public."order" VALUES (258, 163, 15, 4, '2019-04-27', 285);
INSERT INTO public."order" VALUES (259, 135, 3, 14, '2019-07-11', 68);
INSERT INTO public."order" VALUES (260, 11, 15, 7, '2019-08-19', 886);
INSERT INTO public."order" VALUES (261, 125, 41, 13, '2019-07-24', 788);
INSERT INTO public."order" VALUES (262, 33, 14, 13, '2019-06-06', 672);
INSERT INTO public."order" VALUES (263, 164, 11, 11, '2019-11-30', 88);
INSERT INTO public."order" VALUES (264, 107, 15, 13, '2019-01-06', 930);
INSERT INTO public."order" VALUES (265, 59, 15, 1, '2019-02-23', 601);
INSERT INTO public."order" VALUES (266, 137, 14, 10, '2019-01-25', 121);
INSERT INTO public."order" VALUES (267, 16, 51, 2, '2019-09-21', 306);
INSERT INTO public."order" VALUES (268, 136, 51, 16, '2019-09-28', 193);
INSERT INTO public."order" VALUES (269, 73, 14, 10, '2019-09-11', 131);
INSERT INTO public."order" VALUES (270, 85, 41, 15, '2019-07-04', 744);
INSERT INTO public."order" VALUES (271, 49, 14, 3, '2019-05-10', 71);
INSERT INTO public."order" VALUES (272, 84, 11, 7, '2019-01-04', 832);
INSERT INTO public."order" VALUES (273, 161, 14, 13, '2019-01-17', 399);
INSERT INTO public."order" VALUES (274, 24, 51, 9, '2019-03-07', 376);
INSERT INTO public."order" VALUES (275, 144, 51, 20, '2019-07-09', 953);
INSERT INTO public."order" VALUES (276, 58, 77, 15, '2019-02-14', 699);
INSERT INTO public."order" VALUES (277, 88, 51, 13, '2019-10-31', 67);
INSERT INTO public."order" VALUES (278, 90, 77, 23, '2019-01-06', 250);
INSERT INTO public."order" VALUES (279, 77, 41, 14, '2019-01-28', 924);
INSERT INTO public."order" VALUES (280, 14, 79, 21, '2019-06-27', 587);
INSERT INTO public."order" VALUES (281, 96, 51, 24, '2019-05-11', 430);
INSERT INTO public."order" VALUES (282, 121, 14, 10, '2019-05-13', 172);
INSERT INTO public."order" VALUES (283, 22, 79, 17, '2019-07-08', 524);
INSERT INTO public."order" VALUES (284, 100, 28, 20, '2019-01-05', 810);
INSERT INTO public."order" VALUES (285, 122, 77, 2, '2019-06-27', 274);
INSERT INTO public."order" VALUES (286, 3, 15, 20, '2019-04-10', 773);
INSERT INTO public."order" VALUES (287, 153, 14, 18, '2019-01-13', 399);
INSERT INTO public."order" VALUES (288, 10, 77, 25, '2019-07-12', 263);
INSERT INTO public."order" VALUES (289, 96, 51, 4, '2019-01-06', 927);
INSERT INTO public."order" VALUES (290, 77, 41, 22, '2019-02-26', 962);
INSERT INTO public."order" VALUES (291, 60, 11, 1, '2019-08-07', 164);
INSERT INTO public."order" VALUES (292, 76, 11, 14, '2019-10-17', 962);
INSERT INTO public."order" VALUES (293, 61, 41, 13, '2019-06-22', 305);
INSERT INTO public."order" VALUES (294, 142, 79, 5, '2019-07-31', 285);
INSERT INTO public."order" VALUES (295, 112, 51, 18, '2019-03-27', 239);
INSERT INTO public."order" VALUES (296, 135, 3, 22, '2019-03-02', 916);
INSERT INTO public."order" VALUES (297, 7, 3, 25, '2019-10-25', 331);
INSERT INTO public."order" VALUES (298, 17, 14, 25, '2019-01-24', 753);
INSERT INTO public."order" VALUES (299, 16, 51, 8, '2019-02-13', 34);
INSERT INTO public."order" VALUES (300, 2, 77, 2, '2019-05-05', 757);
INSERT INTO public."order" VALUES (301, 37, 41, 2, '2019-05-20', 366);
INSERT INTO public."order" VALUES (302, 67, 15, 25, '2019-03-05', 1);
INSERT INTO public."order" VALUES (303, 152, 51, 3, '2019-05-22', 233);
INSERT INTO public."order" VALUES (304, 33, 14, 19, '2019-04-02', 286);
INSERT INTO public."order" VALUES (305, 12, 11, 9, '2019-09-21', 605);
INSERT INTO public."order" VALUES (306, 14, 79, 2, '2019-08-06', 87);
INSERT INTO public."order" VALUES (307, 60, 55, 8, '2019-03-06', 140);
INSERT INTO public."order" VALUES (308, 83, 12, 25, '2019-11-09', 538);
INSERT INTO public."order" VALUES (309, 108, 11, 8, '2019-10-07', 657);
INSERT INTO public."order" VALUES (310, 5, 41, 24, '2019-11-16', 322);
INSERT INTO public."order" VALUES (311, 145, 14, 18, '2019-06-09', 406);
INSERT INTO public."order" VALUES (312, 8, 51, 12, '2019-06-23', 822);
INSERT INTO public."order" VALUES (313, 147, 15, 1, '2019-07-22', 708);
INSERT INTO public."order" VALUES (314, 148, 11, 10, '2019-02-14', 616);
INSERT INTO public."order" VALUES (315, 157, 41, 5, '2019-05-08', 615);
INSERT INTO public."order" VALUES (316, 57, 14, 1, '2019-05-16', 305);
INSERT INTO public."order" VALUES (317, 62, 79, 7, '2019-06-05', 874);
INSERT INTO public."order" VALUES (318, 156, 11, 10, '2019-03-10', 152);
INSERT INTO public."order" VALUES (319, 27, 15, 18, '2019-08-01', 314);
INSERT INTO public."order" VALUES (320, 104, 51, 7, '2019-02-13', 521);
INSERT INTO public."order" VALUES (321, 87, 3, 5, '2019-11-08', 466);
INSERT INTO public."order" VALUES (322, 109, 41, 17, '2019-04-10', 919);
INSERT INTO public."order" VALUES (323, 103, 3, 4, '2019-06-18', 100);
INSERT INTO public."order" VALUES (324, 134, 79, 6, '2019-09-22', 828);
INSERT INTO public."order" VALUES (325, 40, 51, 7, '2019-01-25', 135);
INSERT INTO public."order" VALUES (326, 33, 17, 12, '2019-02-24', 975);
INSERT INTO public."order" VALUES (327, 137, 54, 17, '2019-04-20', 175);
INSERT INTO public."order" VALUES (328, 49, 14, 16, '2019-09-09', 183);
INSERT INTO public."order" VALUES (329, 25, 14, 7, '2019-07-12', 385);
INSERT INTO public."order" VALUES (330, 135, 3, 11, '2019-01-30', 667);
INSERT INTO public."order" VALUES (331, 46, 79, 9, '2019-03-11', 357);
INSERT INTO public."order" VALUES (332, 1, 14, 8, '2019-03-27', 967);
INSERT INTO public."order" VALUES (333, 30, 79, 2, '2019-03-17', 233);
INSERT INTO public."order" VALUES (334, 53, 41, 14, '2019-02-05', 878);
INSERT INTO public."order" VALUES (335, 112, 51, 22, '2019-08-27', 119);
INSERT INTO public."order" VALUES (336, 68, 11, 24, '2019-05-29', 642);
INSERT INTO public."order" VALUES (337, 137, 14, 18, '2019-05-31', 813);
INSERT INTO public."order" VALUES (338, 51, 15, 1, '2019-09-03', 916);
INSERT INTO public."order" VALUES (339, 100, 11, 15, '2019-04-28', 930);
INSERT INTO public."order" VALUES (340, 145, 17, 13, '2019-05-16', 947);
INSERT INTO public."order" VALUES (341, 142, 79, 7, '2019-11-18', 582);
INSERT INTO public."order" VALUES (342, 34, 77, 15, '2019-11-23', 576);
INSERT INTO public."order" VALUES (343, 164, 11, 24, '2019-06-12', 859);
INSERT INTO public."order" VALUES (344, 26, 77, 24, '2019-03-11', 303);
INSERT INTO public."order" VALUES (345, 48, 51, 13, '2019-05-06', 861);
INSERT INTO public."order" VALUES (346, 28, 59, 15, '2019-10-18', 2);
INSERT INTO public."order" VALUES (347, 83, 15, 14, '2019-09-16', 364);
INSERT INTO public."order" VALUES (348, 32, 51, 11, '2019-08-29', 588);
INSERT INTO public."order" VALUES (349, 155, 64, 2, '2019-03-03', 627);
INSERT INTO public."order" VALUES (350, 3, 15, 8, '2019-01-09', 104);
INSERT INTO public."order" VALUES (351, 146, 77, 22, '2019-03-25', 662);
INSERT INTO public."order" VALUES (352, 127, 3, 1, '2019-06-07', 209);
INSERT INTO public."order" VALUES (353, 104, 51, 5, '2019-02-18', 473);
INSERT INTO public."order" VALUES (354, 54, 79, 11, '2019-08-20', 414);
INSERT INTO public."order" VALUES (355, 52, 11, 11, '2019-01-13', 67);
INSERT INTO public."order" VALUES (356, 123, 15, 22, '2019-05-01', 757);
INSERT INTO public."order" VALUES (357, 72, 1, 24, '2019-06-22', 523);
INSERT INTO public."order" VALUES (358, 43, 15, 24, '2019-11-26', 818);
INSERT INTO public."order" VALUES (359, 140, 11, 18, '2019-01-14', 128);
INSERT INTO public."order" VALUES (360, 61, 41, 5, '2019-10-08', 796);
INSERT INTO public."order" VALUES (361, 21, 41, 11, '2019-03-19', 656);
INSERT INTO public."order" VALUES (362, 38, 79, 24, '2019-03-20', 713);
INSERT INTO public."order" VALUES (363, 153, 14, 21, '2019-06-02', 295);
INSERT INTO public."order" VALUES (364, 44, 11, 1, '2019-01-11', 549);
INSERT INTO public."order" VALUES (365, 159, 3, 9, '2019-07-28', 129);
INSERT INTO public."order" VALUES (366, 70, 79, 7, '2019-04-01', 855);
INSERT INTO public."order" VALUES (367, 62, 79, 19, '2019-06-02', 562);
INSERT INTO public."order" VALUES (368, 135, 3, 20, '2019-06-16', 70);
INSERT INTO public."order" VALUES (369, 114, 77, 16, '2019-06-15', 657);
INSERT INTO public."order" VALUES (370, 26, 77, 24, '2019-03-23', 444);
INSERT INTO public."order" VALUES (371, 78, 79, 8, '2019-06-06', 888);
INSERT INTO public."order" VALUES (372, 47, 3, 11, '2019-01-08', 712);
INSERT INTO public."order" VALUES (373, 120, 51, 12, '2019-04-01', 181);
INSERT INTO public."order" VALUES (374, 12, 11, 4, '2019-12-13', 184);
INSERT INTO public."order" VALUES (375, 138, 77, 11, '2019-06-06', 944);
INSERT INTO public."order" VALUES (376, 144, 51, 3, '2019-01-15', 632);
INSERT INTO public."order" VALUES (377, 27, 15, 9, '2019-05-11', 129);
INSERT INTO public."order" VALUES (378, 97, 14, 14, '2019-12-24', 491);
INSERT INTO public."order" VALUES (379, 131, 15, 21, '2019-11-09', 259);
INSERT INTO public."order" VALUES (380, 26, 77, 7, '2019-08-12', 561);
INSERT INTO public."order" VALUES (381, 47, 3, 4, '2019-04-19', 571);
INSERT INTO public."order" VALUES (382, 66, 77, 16, '2019-03-21', 507);
INSERT INTO public."order" VALUES (383, 147, 15, 20, '2019-01-04', 501);
INSERT INTO public."order" VALUES (384, 46, 79, 25, '2019-03-28', 986);
INSERT INTO public."order" VALUES (385, 51, 15, 12, '2019-09-06', 307);
INSERT INTO public."order" VALUES (386, 12, 11, 1, '2019-06-15', 769);
INSERT INTO public."order" VALUES (387, 15, 3, 11, '2019-04-07', 401);
INSERT INTO public."order" VALUES (388, 9, 14, 21, '2019-06-12', 265);
INSERT INTO public."order" VALUES (389, 100, 11, 5, '2019-11-27', 895);
INSERT INTO public."order" VALUES (390, 17, 14, 8, '2019-04-19', 914);
INSERT INTO public."order" VALUES (391, 78, 79, 7, '2019-10-31', 999);
INSERT INTO public."order" VALUES (392, 143, 3, 19, '2019-09-11', 760);
INSERT INTO public."order" VALUES (393, 111, 3, 18, '2019-11-18', 410);
INSERT INTO public."order" VALUES (394, 1, 14, 14, '2019-05-05', 533);
INSERT INTO public."order" VALUES (395, 97, 14, 19, '2019-02-08', 835);
INSERT INTO public."order" VALUES (396, 107, 15, 7, '2019-06-07', 556);
INSERT INTO public."order" VALUES (397, 17, 14, 6, '2019-09-03', 104);
INSERT INTO public."order" VALUES (398, 110, 79, 6, '2019-07-10', 452);
INSERT INTO public."order" VALUES (399, 100, 11, 22, '2019-12-10', 155);
INSERT INTO public."order" VALUES (400, 100, 11, 8, '2019-04-30', 608);
INSERT INTO public."order" VALUES (401, 143, 3, 17, '2019-10-19', 74);
INSERT INTO public."order" VALUES (402, 43, 15, 25, '2019-09-12', 378);
INSERT INTO public."order" VALUES (403, 153, 14, 9, '2019-07-18', 710);
INSERT INTO public."order" VALUES (404, 108, 11, 7, '2019-10-12', 865);
INSERT INTO public."order" VALUES (405, 7, 3, 22, '2019-11-01', 652);
INSERT INTO public."order" VALUES (406, 168, 51, 3, '2019-11-20', 799);
INSERT INTO public."order" VALUES (407, 165, 41, 15, '2019-03-12', 166);
INSERT INTO public."order" VALUES (408, 12, 70, 15, '2019-11-03', 226);
INSERT INTO public."order" VALUES (409, 123, 12, 1, '2019-02-14', 746);
INSERT INTO public."order" VALUES (410, 41, 14, 23, '2019-05-12', 660);
INSERT INTO public."order" VALUES (411, 74, 77, 6, '2019-11-19', 598);
INSERT INTO public."order" VALUES (412, 32, 51, 3, '2019-07-19', 292);
INSERT INTO public."order" VALUES (413, 85, 37, 8, '2019-02-16', 839);
INSERT INTO public."order" VALUES (414, 10, 75, 18, '2019-07-01', 891);
INSERT INTO public."order" VALUES (415, 167, 3, 15, '2019-06-30', 807);
INSERT INTO public."order" VALUES (416, 89, 14, 8, '2019-08-26', 889);
INSERT INTO public."order" VALUES (417, 160, 51, 18, '2019-07-05', 796);
INSERT INTO public."order" VALUES (418, 105, 14, 10, '2019-04-22', 689);
INSERT INTO public."order" VALUES (419, 115, 15, 1, '2019-12-20', 603);
INSERT INTO public."order" VALUES (420, 151, 3, 21, '2019-11-19', 62);
INSERT INTO public."order" VALUES (421, 87, 3, 19, '2019-12-07', 449);
INSERT INTO public."order" VALUES (422, 111, 68, 12, '2019-08-26', 884);
INSERT INTO public."order" VALUES (423, 89, 14, 2, '2019-06-19', 96);
INSERT INTO public."order" VALUES (424, 79, 3, 14, '2019-12-30', 20);
INSERT INTO public."order" VALUES (425, 135, 3, 1, '2019-05-19', 623);
INSERT INTO public."order" VALUES (426, 72, 51, 6, '2019-07-23', 336);
INSERT INTO public."order" VALUES (427, 145, 14, 16, '2019-05-02', 723);
INSERT INTO public."order" VALUES (428, 2, 77, 10, '2019-06-19', 250);
INSERT INTO public."order" VALUES (429, 119, 3, 3, '2019-09-12', 242);
INSERT INTO public."order" VALUES (430, 124, 23, 16, '2019-10-27', 951);
INSERT INTO public."order" VALUES (431, 96, 76, 23, '2019-05-22', 555);
INSERT INTO public."order" VALUES (432, 83, 15, 20, '2019-07-30', 783);
INSERT INTO public."order" VALUES (433, 112, 51, 1, '2019-02-28', 158);
INSERT INTO public."order" VALUES (434, 122, 77, 17, '2019-11-27', 752);
INSERT INTO public."order" VALUES (435, 103, 3, 4, '2019-05-01', 856);
INSERT INTO public."order" VALUES (436, 84, 11, 19, '2019-02-28', 813);
INSERT INTO public."order" VALUES (437, 81, 14, 19, '2019-01-22', 985);
INSERT INTO public."order" VALUES (438, 93, 41, 20, '2019-12-25', 305);
INSERT INTO public."order" VALUES (439, 65, 14, 12, '2019-01-16', 474);
INSERT INTO public."order" VALUES (440, 67, 15, 9, '2019-10-25', 515);
INSERT INTO public."order" VALUES (441, 61, 41, 25, '2019-01-29', 931);
INSERT INTO public."order" VALUES (442, 92, 11, 10, '2019-10-27', 911);
INSERT INTO public."order" VALUES (443, 89, 14, 25, '2019-05-02', 611);
INSERT INTO public."order" VALUES (444, 141, 41, 9, '2019-12-03', 646);
INSERT INTO public."order" VALUES (445, 42, 77, 7, '2019-04-08', 675);
INSERT INTO public."order" VALUES (446, 151, 3, 5, '2019-02-10', 270);
INSERT INTO public."order" VALUES (447, 102, 79, 3, '2019-09-02', 504);
INSERT INTO public."order" VALUES (448, 47, 3, 5, '2019-10-01', 956);
INSERT INTO public."order" VALUES (449, 113, 45, 15, '2019-04-11', 570);
INSERT INTO public."order" VALUES (450, 32, 51, 10, '2019-07-17', 495);
INSERT INTO public."order" VALUES (451, 76, 11, 24, '2019-06-10', 432);
INSERT INTO public."order" VALUES (452, 124, 55, 1, '2019-07-04', 659);
INSERT INTO public."order" VALUES (453, 100, 11, 1, '2019-08-11', 728);
INSERT INTO public."order" VALUES (454, 21, 41, 8, '2019-02-09', 820);
INSERT INTO public."order" VALUES (455, 81, 14, 5, '2019-09-14', 872);
INSERT INTO public."order" VALUES (456, 87, 65, 5, '2019-05-19', 989);
INSERT INTO public."order" VALUES (457, 88, 51, 20, '2019-10-28', 328);
INSERT INTO public."order" VALUES (458, 29, 41, 1, '2019-08-17', 824);
INSERT INTO public."order" VALUES (459, 151, 3, 23, '2019-02-12', 971);
INSERT INTO public."order" VALUES (460, 124, 11, 21, '2019-07-28', 773);
INSERT INTO public."order" VALUES (461, 70, 79, 8, '2019-08-09', 915);
INSERT INTO public."order" VALUES (462, 25, 14, 22, '2019-09-25', 534);
INSERT INTO public."order" VALUES (463, 117, 41, 9, '2019-01-20', 311);
INSERT INTO public."order" VALUES (464, 137, 14, 4, '2019-09-05', 125);
INSERT INTO public."order" VALUES (465, 23, 3, 14, '2019-10-06', 432);
INSERT INTO public."order" VALUES (466, 137, 14, 21, '2019-07-27', 370);
INSERT INTO public."order" VALUES (467, 129, 14, 17, '2019-03-09', 35);
INSERT INTO public."order" VALUES (468, 49, 14, 10, '2019-02-28', 18);
INSERT INTO public."order" VALUES (469, 145, 14, 25, '2019-04-30', 693);
INSERT INTO public."order" VALUES (470, 141, 41, 17, '2019-12-21', 376);
INSERT INTO public."order" VALUES (471, 54, 79, 19, '2019-06-08', 16);
INSERT INTO public."order" VALUES (472, 53, 41, 13, '2019-08-01', 982);
INSERT INTO public."order" VALUES (473, 42, 77, 14, '2019-12-29', 751);
INSERT INTO public."order" VALUES (474, 93, 41, 24, '2019-01-31', 576);
INSERT INTO public."order" VALUES (475, 77, 41, 2, '2019-05-26', 114);
INSERT INTO public."order" VALUES (476, 98, 9, 21, '2019-05-12', 728);
INSERT INTO public."order" VALUES (477, 39, 3, 9, '2019-07-03', 215);
INSERT INTO public."order" VALUES (478, 55, 3, 15, '2019-05-17', 449);
INSERT INTO public."order" VALUES (479, 75, 15, 11, '2019-07-17', 258);
INSERT INTO public."order" VALUES (480, 22, 79, 14, '2019-10-13', 766);
INSERT INTO public."order" VALUES (481, 157, 41, 12, '2019-02-01', 844);
INSERT INTO public."order" VALUES (482, 138, 77, 3, '2019-12-17', 966);
INSERT INTO public."order" VALUES (483, 33, 43, 5, '2019-05-22', 372);
INSERT INTO public."order" VALUES (484, 163, 15, 12, '2019-12-22', 500);
INSERT INTO public."order" VALUES (485, 95, 3, 25, '2019-03-23', 716);
INSERT INTO public."order" VALUES (486, 2, 77, 21, '2019-12-11', 762);
INSERT INTO public."order" VALUES (487, 95, 3, 9, '2019-03-29', 768);
INSERT INTO public."order" VALUES (488, 145, 14, 15, '2019-10-03', 595);
INSERT INTO public."order" VALUES (489, 135, 3, 7, '2019-04-05', 369);
INSERT INTO public."order" VALUES (490, 11, 15, 11, '2019-06-30', 33);
INSERT INTO public."order" VALUES (491, 152, 51, 8, '2019-03-11', 550);
INSERT INTO public."order" VALUES (492, 97, 14, 13, '2019-03-19', 969);
INSERT INTO public."order" VALUES (493, 71, 3, 10, '2019-08-25', 448);
INSERT INTO public."order" VALUES (494, 16, 51, 17, '2019-12-07', 149);
INSERT INTO public."order" VALUES (495, 137, 14, 6, '2019-07-19', 539);
INSERT INTO public."order" VALUES (496, 128, 51, 3, '2019-03-11', 716);
INSERT INTO public."order" VALUES (497, 40, 51, 15, '2019-01-12', 706);
INSERT INTO public."order" VALUES (498, 35, 74, 8, '2019-12-19', 422);
INSERT INTO public."order" VALUES (499, 105, 14, 10, '2019-02-17', 962);
INSERT INTO public."order" VALUES (500, 42, 18, 9, '2019-06-26', 40);
INSERT INTO public."order" VALUES (501, 38, 21, 23, '2019-09-09', 865);
INSERT INTO public."order" VALUES (502, 101, 41, 9, '2019-12-26', 847);
INSERT INTO public."order" VALUES (503, 82, 77, 23, '2019-10-08', 429);
INSERT INTO public."order" VALUES (504, 27, 15, 3, '2019-07-15', 556);
INSERT INTO public."order" VALUES (505, 85, 41, 15, '2019-12-21', 266);
INSERT INTO public."order" VALUES (506, 155, 15, 9, '2019-03-05', 183);
INSERT INTO public."order" VALUES (507, 167, 3, 16, '2019-01-15', 67);
INSERT INTO public."order" VALUES (508, 36, 11, 11, '2019-08-23', 622);
INSERT INTO public."order" VALUES (509, 55, 3, 8, '2019-06-19', 360);
INSERT INTO public."order" VALUES (510, 24, 51, 21, '2019-09-27', 994);
INSERT INTO public."order" VALUES (511, 53, 41, 14, '2019-03-12', 225);
INSERT INTO public."order" VALUES (512, 75, 15, 6, '2019-12-13', 92);
INSERT INTO public."order" VALUES (513, 24, 51, 20, '2019-09-21', 618);
INSERT INTO public."order" VALUES (514, 9, 14, 21, '2019-08-26', 49);
INSERT INTO public."order" VALUES (515, 10, 77, 1, '2019-04-18', 351);
INSERT INTO public."order" VALUES (516, 109, 41, 9, '2019-08-29', 169);
INSERT INTO public."order" VALUES (517, 30, 79, 25, '2019-12-09', 699);
INSERT INTO public."order" VALUES (518, 36, 11, 5, '2019-04-10', 502);
INSERT INTO public."order" VALUES (519, 46, 79, 14, '2019-11-15', 290);
INSERT INTO public."order" VALUES (520, 135, 3, 14, '2019-06-14', 687);
INSERT INTO public."order" VALUES (521, 119, 3, 2, '2019-11-06', 572);
INSERT INTO public."order" VALUES (522, 30, 79, 4, '2019-10-11', 324);
INSERT INTO public."order" VALUES (523, 7, 3, 4, '2019-10-01', 471);
INSERT INTO public."order" VALUES (524, 84, 11, 9, '2019-06-08', 505);
INSERT INTO public."order" VALUES (525, 116, 73, 2, '2019-07-13', 999);
INSERT INTO public."order" VALUES (526, 48, 51, 21, '2019-06-09', 777);
INSERT INTO public."order" VALUES (527, 11, 15, 24, '2019-06-08', 556);
INSERT INTO public."order" VALUES (528, 166, 79, 24, '2019-09-29', 962);
INSERT INTO public."order" VALUES (529, 141, 41, 21, '2019-03-20', 993);
INSERT INTO public."order" VALUES (530, 45, 41, 3, '2019-11-22', 431);
INSERT INTO public."order" VALUES (531, 108, 11, 8, '2019-02-12', 886);
INSERT INTO public."order" VALUES (532, 166, 79, 9, '2019-09-07', 593);
INSERT INTO public."order" VALUES (533, 163, 15, 17, '2019-11-04', 91);
INSERT INTO public."order" VALUES (534, 69, 41, 10, '2019-08-10', 681);
INSERT INTO public."order" VALUES (535, 14, 79, 19, '2019-07-20', 524);
INSERT INTO public."order" VALUES (536, 161, 14, 17, '2019-11-04', 454);
INSERT INTO public."order" VALUES (537, 54, 79, 15, '2019-07-08', 824);
INSERT INTO public."order" VALUES (538, 50, 77, 3, '2019-07-26', 409);
INSERT INTO public."order" VALUES (539, 59, 15, 8, '2019-05-06', 190);
INSERT INTO public."order" VALUES (540, 128, 51, 22, '2019-08-14', 782);
INSERT INTO public."order" VALUES (541, 116, 11, 14, '2019-05-12', 266);
INSERT INTO public."order" VALUES (542, 155, 15, 25, '2019-03-09', 455);
INSERT INTO public."order" VALUES (543, 30, 79, 2, '2019-01-04', 554);
INSERT INTO public."order" VALUES (544, 152, 51, 18, '2019-11-28', 68);
INSERT INTO public."order" VALUES (545, 82, 77, 15, '2019-02-21', 964);
INSERT INTO public."order" VALUES (546, 64, 51, 9, '2019-06-27', 251);
INSERT INTO public."order" VALUES (547, 137, 14, 16, '2019-08-18', 287);
INSERT INTO public."order" VALUES (548, 70, 79, 7, '2019-01-25', 660);
INSERT INTO public."order" VALUES (549, 27, 15, 10, '2019-12-13', 918);
INSERT INTO public."order" VALUES (550, 105, 14, 12, '2019-11-01', 213);
INSERT INTO public."order" VALUES (551, 81, 14, 21, '2019-03-04', 727);
INSERT INTO public."order" VALUES (552, 4, 11, 1, '2019-11-27', 268);
INSERT INTO public."order" VALUES (553, 55, 3, 25, '2019-05-12', 774);
INSERT INTO public."order" VALUES (554, 67, 15, 8, '2019-03-25', 229);
INSERT INTO public."order" VALUES (555, 99, 15, 12, '2019-02-03', 120);
INSERT INTO public."order" VALUES (556, 118, 79, 23, '2019-02-17', 376);
INSERT INTO public."order" VALUES (557, 86, 79, 3, '2019-01-25', 57);
INSERT INTO public."order" VALUES (558, 30, 79, 18, '2019-12-27', 905);
INSERT INTO public."order" VALUES (559, 3, 15, 21, '2019-06-03', 682);
INSERT INTO public."order" VALUES (560, 9, 14, 19, '2019-06-15', 675);
INSERT INTO public."order" VALUES (561, 32, 51, 7, '2019-10-06', 87);
INSERT INTO public."order" VALUES (562, 9, 14, 20, '2019-06-10', 516);
INSERT INTO public."order" VALUES (563, 91, 15, 5, '2019-03-05', 326);
INSERT INTO public."order" VALUES (564, 55, 3, 20, '2019-04-19', 356);
INSERT INTO public."order" VALUES (565, 149, 6, 15, '2019-10-19', 632);
INSERT INTO public."order" VALUES (566, 21, 41, 10, '2019-04-01', 250);
INSERT INTO public."order" VALUES (567, 70, 79, 8, '2019-06-04', 505);
INSERT INTO public."order" VALUES (568, 129, 14, 9, '2019-02-11', 760);
INSERT INTO public."order" VALUES (569, 97, 14, 19, '2019-08-25', 419);
INSERT INTO public."order" VALUES (570, 82, 77, 2, '2019-12-16', 407);
INSERT INTO public."order" VALUES (571, 50, 77, 17, '2019-10-25', 289);
INSERT INTO public."order" VALUES (572, 3, 15, 19, '2019-01-12', 631);
INSERT INTO public."order" VALUES (573, 86, 79, 10, '2019-08-17', 74);
INSERT INTO public."order" VALUES (574, 150, 79, 10, '2019-12-17', 762);
INSERT INTO public."order" VALUES (575, 74, 77, 14, '2019-12-13', 602);
INSERT INTO public."order" VALUES (576, 71, 3, 16, '2019-12-14', 477);
INSERT INTO public."order" VALUES (577, 167, 3, 23, '2019-11-13', 475);
INSERT INTO public."order" VALUES (578, 136, 51, 19, '2019-01-16', 201);
INSERT INTO public."order" VALUES (579, 79, 3, 24, '2019-03-30', 421);
INSERT INTO public."order" VALUES (580, 163, 15, 12, '2019-05-22', 486);
INSERT INTO public."order" VALUES (581, 71, 3, 21, '2019-06-22', 297);
INSERT INTO public."order" VALUES (582, 103, 3, 15, '2019-10-16', 785);
INSERT INTO public."order" VALUES (583, 117, 41, 20, '2019-04-30', 902);
INSERT INTO public."order" VALUES (584, 25, 14, 19, '2019-07-20', 127);
INSERT INTO public."order" VALUES (585, 150, 79, 9, '2019-04-17', 626);
INSERT INTO public."order" VALUES (586, 158, 79, 24, '2019-10-29', 702);
INSERT INTO public."order" VALUES (587, 155, 15, 24, '2019-07-23', 27);
INSERT INTO public."order" VALUES (588, 56, 51, 12, '2019-10-30', 183);
INSERT INTO public."order" VALUES (589, 61, 41, 20, '2019-09-25', 412);
INSERT INTO public."order" VALUES (590, 37, 41, 12, '2019-02-18', 638);
INSERT INTO public."order" VALUES (591, 97, 14, 13, '2019-04-02', 484);
INSERT INTO public."order" VALUES (592, 108, 11, 12, '2019-02-25', 418);
INSERT INTO public."order" VALUES (593, 15, 65, 10, '2019-01-10', 394);
INSERT INTO public."order" VALUES (594, 14, 79, 9, '2019-10-26', 985);
INSERT INTO public."order" VALUES (595, 117, 41, 15, '2019-10-11', 777);
INSERT INTO public."order" VALUES (596, 98, 53, 23, '2019-04-23', 89);
INSERT INTO public."order" VALUES (597, 108, 11, 13, '2019-02-06', 358);
INSERT INTO public."order" VALUES (598, 142, 79, 19, '2019-07-29', 892);
INSERT INTO public."order" VALUES (599, 142, 79, 2, '2019-03-19', 822);
INSERT INTO public."order" VALUES (600, 42, 77, 23, '2019-04-14', 166);
INSERT INTO public."order" VALUES (601, 167, 3, 21, '2019-05-24', 80);
INSERT INTO public."order" VALUES (602, 40, 4, 22, '2019-09-10', 50);
INSERT INTO public."order" VALUES (603, 82, 77, 5, '2019-05-21', 221);
INSERT INTO public."order" VALUES (604, 135, 3, 16, '2019-03-12', 761);
INSERT INTO public."order" VALUES (605, 126, 79, 14, '2019-06-21', 182);
INSERT INTO public."order" VALUES (606, 3, 15, 4, '2019-02-21', 956);
INSERT INTO public."order" VALUES (607, 101, 41, 13, '2019-08-17', 792);
INSERT INTO public."order" VALUES (608, 86, 79, 17, '2019-01-09', 638);
INSERT INTO public."order" VALUES (609, 40, 51, 4, '2019-09-26', 523);
INSERT INTO public."order" VALUES (610, 116, 33, 13, '2019-12-22', 56);
INSERT INTO public."order" VALUES (611, 21, 41, 3, '2019-02-25', 771);
INSERT INTO public."order" VALUES (612, 46, 79, 18, '2019-08-28', 683);
INSERT INTO public."order" VALUES (613, 106, 77, 19, '2019-01-26', 231);
INSERT INTO public."order" VALUES (614, 1, 14, 22, '2019-02-26', 79);
INSERT INTO public."order" VALUES (615, 157, 41, 22, '2019-06-23', 81);
INSERT INTO public."order" VALUES (616, 64, 51, 12, '2019-03-08', 914);
INSERT INTO public."order" VALUES (617, 79, 3, 14, '2019-12-31', 317);
INSERT INTO public."order" VALUES (618, 103, 3, 15, '2019-05-28', 781);
INSERT INTO public."order" VALUES (619, 84, 11, 19, '2019-06-29', 201);
INSERT INTO public."order" VALUES (620, 134, 79, 3, '2019-07-24', 520);
INSERT INTO public."order" VALUES (621, 112, 51, 11, '2019-02-01', 805);
INSERT INTO public."order" VALUES (622, 35, 5, 10, '2019-09-11', 927);
INSERT INTO public."order" VALUES (623, 20, 11, 9, '2019-04-28', 698);
INSERT INTO public."order" VALUES (624, 150, 79, 9, '2019-09-03', 623);
INSERT INTO public."order" VALUES (625, 75, 15, 4, '2019-05-25', 402);
INSERT INTO public."order" VALUES (626, 20, 11, 23, '2019-02-15', 491);
INSERT INTO public."order" VALUES (627, 23, 3, 10, '2019-03-10', 551);
INSERT INTO public."order" VALUES (628, 135, 3, 7, '2019-08-02', 572);
INSERT INTO public."order" VALUES (629, 14, 79, 17, '2019-08-11', 275);
INSERT INTO public."order" VALUES (630, 18, 77, 24, '2019-01-15', 843);
INSERT INTO public."order" VALUES (631, 100, 73, 2, '2019-02-10', 601);
INSERT INTO public."order" VALUES (632, 149, 41, 23, '2019-08-14', 231);
INSERT INTO public."order" VALUES (633, 22, 79, 7, '2019-06-15', 231);
INSERT INTO public."order" VALUES (634, 135, 3, 15, '2019-02-17', 343);
INSERT INTO public."order" VALUES (635, 152, 51, 21, '2019-09-29', 31);
INSERT INTO public."order" VALUES (636, 15, 3, 5, '2019-06-07', 972);
INSERT INTO public."order" VALUES (637, 165, 41, 16, '2019-01-07', 232);
INSERT INTO public."order" VALUES (638, 118, 79, 5, '2019-04-08', 541);
INSERT INTO public."order" VALUES (639, 115, 15, 10, '2019-06-04', 792);
INSERT INTO public."order" VALUES (640, 132, 11, 1, '2019-08-11', 848);
INSERT INTO public."order" VALUES (641, 78, 79, 22, '2019-08-01', 190);
INSERT INTO public."order" VALUES (642, 163, 74, 15, '2019-10-13', 390);
INSERT INTO public."order" VALUES (643, 67, 15, 7, '2019-11-15', 379);
INSERT INTO public."order" VALUES (644, 93, 41, 12, '2019-04-09', 298);
INSERT INTO public."order" VALUES (645, 127, 3, 10, '2019-07-26', 607);
INSERT INTO public."order" VALUES (646, 90, 77, 14, '2019-11-01', 693);
INSERT INTO public."order" VALUES (647, 15, 3, 2, '2019-11-28', 414);
INSERT INTO public."order" VALUES (648, 140, 11, 14, '2019-04-12', 360);
INSERT INTO public."order" VALUES (649, 92, 11, 20, '2019-03-25', 640);
INSERT INTO public."order" VALUES (650, 48, 51, 6, '2019-11-28', 454);
INSERT INTO public."order" VALUES (651, 56, 51, 9, '2019-04-06', 77);
INSERT INTO public."order" VALUES (652, 98, 77, 10, '2019-05-27', 752);
INSERT INTO public."order" VALUES (653, 147, 10, 25, '2019-07-12', 989);
INSERT INTO public."order" VALUES (654, 62, 79, 4, '2019-05-09', 556);
INSERT INTO public."order" VALUES (655, 8, 51, 10, '2019-12-30', 417);
INSERT INTO public."order" VALUES (656, 157, 41, 14, '2019-06-09', 232);
INSERT INTO public."order" VALUES (657, 39, 3, 6, '2019-11-18', 380);
INSERT INTO public."order" VALUES (658, 135, 3, 13, '2019-08-12', 739);
INSERT INTO public."order" VALUES (659, 72, 51, 16, '2019-12-17', 164);
INSERT INTO public."order" VALUES (660, 78, 79, 9, '2019-07-04', 1000);
INSERT INTO public."order" VALUES (661, 44, 11, 23, '2019-09-15', 459);
INSERT INTO public."order" VALUES (662, 41, 14, 1, '2019-01-19', 482);
INSERT INTO public."order" VALUES (663, 90, 77, 15, '2019-07-11', 991);
INSERT INTO public."order" VALUES (664, 92, 11, 14, '2019-10-05', 263);
INSERT INTO public."order" VALUES (665, 43, 15, 23, '2019-06-19', 396);
INSERT INTO public."order" VALUES (666, 30, 79, 2, '2019-09-13', 996);
INSERT INTO public."order" VALUES (667, 167, 3, 13, '2019-04-03', 461);
INSERT INTO public."order" VALUES (668, 109, 41, 24, '2019-10-02', 542);
INSERT INTO public."order" VALUES (669, 49, 14, 7, '2019-12-25', 968);
INSERT INTO public."order" VALUES (670, 137, 43, 14, '2019-05-16', 39);
INSERT INTO public."order" VALUES (671, 12, 11, 4, '2019-07-18', 835);
INSERT INTO public."order" VALUES (672, 103, 3, 18, '2019-06-08', 327);
INSERT INTO public."order" VALUES (673, 21, 41, 7, '2019-06-29', 803);
INSERT INTO public."order" VALUES (674, 158, 79, 12, '2019-08-03', 572);
INSERT INTO public."order" VALUES (675, 81, 14, 2, '2019-03-06', 425);
INSERT INTO public."order" VALUES (676, 165, 41, 17, '2019-07-27', 110);
INSERT INTO public."order" VALUES (677, 106, 77, 17, '2019-01-25', 946);
INSERT INTO public."order" VALUES (678, 87, 3, 3, '2019-08-07', 36);
INSERT INTO public."order" VALUES (679, 83, 15, 8, '2019-05-04', 401);
INSERT INTO public."order" VALUES (680, 61, 41, 18, '2019-01-04', 642);
INSERT INTO public."order" VALUES (681, 14, 58, 2, '2019-04-06', 122);
INSERT INTO public."order" VALUES (682, 22, 79, 17, '2019-09-04', 855);
INSERT INTO public."order" VALUES (683, 105, 14, 4, '2019-03-13', 69);
INSERT INTO public."order" VALUES (684, 167, 3, 5, '2019-06-11', 56);
INSERT INTO public."order" VALUES (685, 161, 14, 12, '2019-03-31', 325);
INSERT INTO public."order" VALUES (686, 141, 41, 15, '2019-03-30', 608);
INSERT INTO public."order" VALUES (687, 63, 3, 1, '2019-04-22', 368);
INSERT INTO public."order" VALUES (688, 26, 77, 4, '2019-06-13', 473);
INSERT INTO public."order" VALUES (689, 44, 11, 20, '2019-06-19', 986);
INSERT INTO public."order" VALUES (690, 30, 79, 20, '2019-11-20', 381);
INSERT INTO public."order" VALUES (691, 157, 41, 12, '2019-01-20', 810);
INSERT INTO public."order" VALUES (692, 5, 41, 13, '2019-09-04', 710);
INSERT INTO public."order" VALUES (693, 63, 3, 23, '2019-07-05', 69);
INSERT INTO public."order" VALUES (694, 65, 14, 18, '2019-10-20', 750);
INSERT INTO public."order" VALUES (695, 88, 51, 14, '2019-06-18', 792);
INSERT INTO public."order" VALUES (696, 67, 15, 5, '2019-04-26', 774);
INSERT INTO public."order" VALUES (697, 139, 15, 24, '2019-08-25', 669);
INSERT INTO public."order" VALUES (698, 81, 17, 5, '2019-03-28', 537);
INSERT INTO public."order" VALUES (699, 117, 41, 2, '2019-10-16', 478);
INSERT INTO public."order" VALUES (700, 67, 15, 22, '2019-02-27', 356);
INSERT INTO public."order" VALUES (701, 30, 79, 24, '2019-01-31', 622);
INSERT INTO public."order" VALUES (702, 90, 77, 15, '2019-03-02', 857);
INSERT INTO public."order" VALUES (703, 9, 14, 3, '2019-12-05', 55);
INSERT INTO public."order" VALUES (704, 65, 14, 11, '2019-05-22', 336);
INSERT INTO public."order" VALUES (705, 36, 73, 5, '2019-03-26', 583);
INSERT INTO public."order" VALUES (706, 88, 51, 10, '2019-06-16', 23);
INSERT INTO public."order" VALUES (707, 157, 41, 11, '2019-12-18', 895);
INSERT INTO public."order" VALUES (708, 42, 77, 17, '2019-05-11', 725);
INSERT INTO public."order" VALUES (709, 24, 51, 9, '2019-08-03', 790);
INSERT INTO public."order" VALUES (710, 149, 41, 22, '2019-03-10', 484);
INSERT INTO public."order" VALUES (711, 10, 77, 25, '2019-03-27', 603);
INSERT INTO public."order" VALUES (712, 103, 3, 20, '2019-08-16', 808);
INSERT INTO public."order" VALUES (713, 55, 3, 19, '2019-09-23', 24);
INSERT INTO public."order" VALUES (714, 47, 3, 17, '2019-09-30', 989);
INSERT INTO public."order" VALUES (715, 97, 17, 10, '2019-02-27', 834);
INSERT INTO public."order" VALUES (716, 95, 3, 18, '2019-06-06', 317);
INSERT INTO public."order" VALUES (717, 18, 77, 19, '2019-08-26', 961);
INSERT INTO public."order" VALUES (718, 105, 14, 25, '2019-10-07', 916);
INSERT INTO public."order" VALUES (719, 76, 11, 23, '2019-08-28', 245);
INSERT INTO public."order" VALUES (720, 167, 7, 5, '2019-09-12', 266);
INSERT INTO public."order" VALUES (721, 73, 14, 10, '2019-09-24', 646);
INSERT INTO public."order" VALUES (722, 1, 14, 8, '2019-03-28', 740);
INSERT INTO public."order" VALUES (723, 67, 15, 25, '2019-03-15', 21);
INSERT INTO public."order" VALUES (724, 4, 11, 21, '2019-07-17', 565);
INSERT INTO public."order" VALUES (725, 148, 11, 13, '2019-03-05', 103);
INSERT INTO public."order" VALUES (726, 114, 77, 11, '2019-11-03', 763);
INSERT INTO public."order" VALUES (727, 159, 3, 21, '2019-06-27', 796);
INSERT INTO public."order" VALUES (728, 68, 11, 1, '2019-02-03', 120);
INSERT INTO public."order" VALUES (729, 60, 11, 11, '2019-01-22', 828);
INSERT INTO public."order" VALUES (730, 98, 9, 21, '2019-07-20', 805);
INSERT INTO public."order" VALUES (731, 52, 11, 6, '2019-05-25', 117);
INSERT INTO public."order" VALUES (732, 100, 11, 1, '2019-10-23', 259);
INSERT INTO public."order" VALUES (733, 39, 3, 4, '2019-01-11', 897);
INSERT INTO public."order" VALUES (734, 2, 77, 8, '2019-07-06', 567);
INSERT INTO public."order" VALUES (735, 64, 51, 23, '2019-11-10', 218);
INSERT INTO public."order" VALUES (736, 131, 15, 21, '2019-11-10', 526);
INSERT INTO public."order" VALUES (737, 92, 11, 10, '2019-05-19', 873);
INSERT INTO public."order" VALUES (738, 60, 11, 9, '2019-06-13', 294);
INSERT INTO public."order" VALUES (739, 89, 14, 1, '2019-12-07', 163);
INSERT INTO public."order" VALUES (740, 84, 11, 13, '2019-05-07', 633);
INSERT INTO public."order" VALUES (741, 110, 79, 5, '2019-01-12', 824);
INSERT INTO public."order" VALUES (742, 106, 77, 25, '2019-06-23', 976);
INSERT INTO public."order" VALUES (743, 110, 79, 4, '2019-03-16', 763);
INSERT INTO public."order" VALUES (744, 34, 77, 20, '2019-03-22', 258);
INSERT INTO public."order" VALUES (745, 136, 4, 16, '2019-02-01', 157);
INSERT INTO public."order" VALUES (746, 108, 11, 21, '2019-04-22', 877);
INSERT INTO public."order" VALUES (747, 84, 11, 24, '2019-07-12', 566);
INSERT INTO public."order" VALUES (748, 107, 15, 25, '2019-12-27', 597);
INSERT INTO public."order" VALUES (749, 94, 79, 16, '2019-06-30', 118);
INSERT INTO public."order" VALUES (750, 71, 3, 2, '2019-11-22', 177);
INSERT INTO public."order" VALUES (751, 39, 3, 1, '2019-07-19', 594);
INSERT INTO public."order" VALUES (752, 53, 41, 25, '2019-06-05', 730);
INSERT INTO public."order" VALUES (753, 54, 79, 7, '2019-08-15', 61);
INSERT INTO public."order" VALUES (754, 145, 14, 3, '2019-08-26', 483);
INSERT INTO public."order" VALUES (755, 123, 15, 11, '2019-08-29', 842);
INSERT INTO public."order" VALUES (756, 100, 11, 6, '2019-09-01', 878);
INSERT INTO public."order" VALUES (757, 75, 25, 21, '2019-05-23', 736);
INSERT INTO public."order" VALUES (758, 40, 29, 16, '2019-11-30', 959);
INSERT INTO public."order" VALUES (759, 21, 41, 6, '2019-04-09', 811);
INSERT INTO public."order" VALUES (760, 150, 79, 4, '2019-06-04', 284);
INSERT INTO public."order" VALUES (761, 118, 79, 3, '2019-03-16', 187);
INSERT INTO public."order" VALUES (762, 48, 51, 10, '2019-04-21', 74);
INSERT INTO public."order" VALUES (763, 104, 51, 8, '2019-09-26', 690);
INSERT INTO public."order" VALUES (764, 15, 3, 19, '2019-04-24', 148);
INSERT INTO public."order" VALUES (765, 31, 3, 1, '2019-06-23', 66);
INSERT INTO public."order" VALUES (766, 57, 14, 14, '2019-07-27', 271);
INSERT INTO public."order" VALUES (767, 39, 3, 21, '2019-08-23', 129);
INSERT INTO public."order" VALUES (768, 31, 3, 4, '2019-11-05', 467);
INSERT INTO public."order" VALUES (769, 146, 77, 15, '2019-01-13', 781);
INSERT INTO public."order" VALUES (770, 107, 15, 24, '2019-06-18', 713);
INSERT INTO public."order" VALUES (771, 118, 79, 12, '2019-05-10', 39);
INSERT INTO public."order" VALUES (772, 21, 41, 8, '2019-10-03', 334);
INSERT INTO public."order" VALUES (773, 79, 3, 18, '2019-12-20', 826);
INSERT INTO public."order" VALUES (774, 73, 17, 3, '2019-09-21', 166);
INSERT INTO public."order" VALUES (775, 73, 14, 21, '2019-09-03', 475);
INSERT INTO public."order" VALUES (776, 87, 3, 14, '2019-01-25', 833);
INSERT INTO public."order" VALUES (777, 105, 14, 22, '2019-07-25', 137);
INSERT INTO public."order" VALUES (778, 29, 41, 18, '2019-04-12', 295);
INSERT INTO public."order" VALUES (779, 134, 79, 16, '2019-03-05', 988);
INSERT INTO public."order" VALUES (780, 89, 14, 21, '2019-03-20', 408);
INSERT INTO public."order" VALUES (781, 125, 41, 4, '2019-03-14', 632);
INSERT INTO public."order" VALUES (782, 46, 79, 10, '2019-08-19', 817);
INSERT INTO public."order" VALUES (783, 50, 77, 10, '2019-12-18', 74);
INSERT INTO public."order" VALUES (784, 110, 79, 5, '2019-01-30', 992);
INSERT INTO public."order" VALUES (785, 22, 79, 13, '2019-09-18', 749);
INSERT INTO public."order" VALUES (786, 168, 51, 16, '2019-10-02', 855);
INSERT INTO public."order" VALUES (787, 48, 51, 6, '2019-10-05', 240);
INSERT INTO public."order" VALUES (788, 28, 11, 10, '2019-03-05', 767);
INSERT INTO public."order" VALUES (789, 160, 51, 24, '2019-07-02', 122);
INSERT INTO public."order" VALUES (790, 100, 11, 17, '2019-12-16', 654);
INSERT INTO public."order" VALUES (791, 78, 79, 8, '2019-11-01', 689);
INSERT INTO public."order" VALUES (792, 11, 15, 14, '2019-08-20', 789);
INSERT INTO public."order" VALUES (793, 153, 14, 22, '2019-05-23', 969);
INSERT INTO public."order" VALUES (794, 105, 14, 15, '2019-11-05', 722);
INSERT INTO public."order" VALUES (795, 95, 3, 20, '2019-11-26', 334);
INSERT INTO public."order" VALUES (796, 68, 11, 1, '2019-08-25', 972);
INSERT INTO public."order" VALUES (797, 34, 77, 12, '2019-06-09', 715);
INSERT INTO public."order" VALUES (798, 113, 14, 16, '2019-03-15', 409);
INSERT INTO public."order" VALUES (799, 48, 51, 11, '2019-05-07', 262);
INSERT INTO public."order" VALUES (800, 2, 77, 6, '2019-02-02', 807);
INSERT INTO public."order" VALUES (801, 148, 11, 18, '2019-06-17', 570);
INSERT INTO public."order" VALUES (802, 34, 77, 22, '2019-08-09', 405);
INSERT INTO public."order" VALUES (803, 82, 77, 1, '2019-05-27', 742);
INSERT INTO public."order" VALUES (804, 37, 47, 14, '2019-09-22', 847);
INSERT INTO public."order" VALUES (805, 33, 14, 23, '2019-04-28', 563);
INSERT INTO public."order" VALUES (806, 123, 15, 18, '2019-01-16', 909);
INSERT INTO public."order" VALUES (807, 97, 14, 13, '2019-11-30', 610);
INSERT INTO public."order" VALUES (808, 59, 15, 11, '2019-06-30', 419);
INSERT INTO public."order" VALUES (809, 136, 51, 17, '2019-11-25', 614);
INSERT INTO public."order" VALUES (810, 56, 51, 16, '2019-05-23', 567);
INSERT INTO public."order" VALUES (811, 15, 3, 13, '2019-04-24', 55);
INSERT INTO public."order" VALUES (812, 158, 79, 6, '2019-11-20', 981);
INSERT INTO public."order" VALUES (813, 11, 15, 17, '2019-04-25', 265);
INSERT INTO public."order" VALUES (814, 149, 41, 16, '2019-05-01', 229);
INSERT INTO public."order" VALUES (815, 37, 41, 10, '2019-05-23', 350);
INSERT INTO public."order" VALUES (816, 142, 79, 10, '2019-11-19', 976);
INSERT INTO public."order" VALUES (817, 57, 17, 7, '2019-05-16', 210);
INSERT INTO public."order" VALUES (818, 12, 11, 13, '2019-07-02', 445);
INSERT INTO public."order" VALUES (819, 6, 79, 1, '2019-07-29', 387);
INSERT INTO public."order" VALUES (820, 151, 3, 16, '2019-07-19', 496);
INSERT INTO public."order" VALUES (821, 77, 41, 14, '2019-08-07', 881);
INSERT INTO public."order" VALUES (822, 164, 11, 7, '2019-04-20', 207);
INSERT INTO public."order" VALUES (823, 43, 12, 16, '2019-12-04', 839);
INSERT INTO public."order" VALUES (824, 36, 11, 8, '2019-05-05', 947);
INSERT INTO public."order" VALUES (825, 87, 3, 16, '2019-12-31', 713);
INSERT INTO public."order" VALUES (826, 155, 15, 17, '2019-01-22', 777);
INSERT INTO public."order" VALUES (827, 5, 41, 5, '2019-12-18', 606);
INSERT INTO public."order" VALUES (828, 58, 77, 19, '2019-06-25', 332);
INSERT INTO public."order" VALUES (829, 84, 11, 23, '2019-02-08', 780);
INSERT INTO public."order" VALUES (830, 91, 15, 18, '2019-09-25', 803);
INSERT INTO public."order" VALUES (831, 135, 3, 17, '2019-08-27', 999);
INSERT INTO public."order" VALUES (832, 149, 67, 18, '2019-10-04', 605);
INSERT INTO public."order" VALUES (833, 94, 79, 17, '2019-02-04', 386);
INSERT INTO public."order" VALUES (834, 58, 77, 7, '2019-08-31', 118);
INSERT INTO public."order" VALUES (835, 86, 79, 25, '2019-07-26', 531);
INSERT INTO public."order" VALUES (836, 10, 77, 21, '2019-08-13', 253);
INSERT INTO public."order" VALUES (837, 30, 79, 25, '2019-02-02', 873);
INSERT INTO public."order" VALUES (838, 26, 77, 6, '2019-05-09', 64);
INSERT INTO public."order" VALUES (839, 25, 14, 19, '2019-06-16', 304);
INSERT INTO public."order" VALUES (840, 39, 3, 24, '2019-11-29', 920);
INSERT INTO public."order" VALUES (841, 98, 77, 7, '2019-03-03', 491);
INSERT INTO public."order" VALUES (842, 65, 14, 1, '2019-03-27', 518);
INSERT INTO public."order" VALUES (843, 159, 39, 3, '2019-08-14', 659);
INSERT INTO public."order" VALUES (844, 114, 77, 16, '2019-02-11', 469);
INSERT INTO public."order" VALUES (845, 111, 3, 5, '2019-09-13', 586);
INSERT INTO public."order" VALUES (846, 23, 3, 2, '2019-07-31', 856);
INSERT INTO public."order" VALUES (847, 23, 3, 15, '2019-03-27', 536);
INSERT INTO public."order" VALUES (848, 151, 3, 1, '2019-05-23', 458);
INSERT INTO public."order" VALUES (849, 87, 3, 16, '2019-10-30', 250);
INSERT INTO public."order" VALUES (850, 68, 11, 4, '2019-11-28', 489);
INSERT INTO public."order" VALUES (851, 53, 41, 22, '2019-12-20', 693);
INSERT INTO public."order" VALUES (852, 83, 15, 2, '2019-06-26', 284);
INSERT INTO public."order" VALUES (853, 96, 51, 19, '2019-03-27', 246);
INSERT INTO public."order" VALUES (854, 132, 11, 10, '2019-06-18', 365);
INSERT INTO public."order" VALUES (855, 32, 51, 22, '2019-05-29', 942);
INSERT INTO public."order" VALUES (856, 86, 79, 20, '2019-12-05', 368);
INSERT INTO public."order" VALUES (857, 161, 14, 23, '2019-06-17', 475);
INSERT INTO public."order" VALUES (858, 14, 79, 2, '2019-02-16', 9);
INSERT INTO public."order" VALUES (859, 86, 79, 7, '2019-11-26', 94);
INSERT INTO public."order" VALUES (860, 166, 60, 2, '2019-08-30', 800);
INSERT INTO public."order" VALUES (861, 74, 77, 18, '2019-01-13', 55);
INSERT INTO public."order" VALUES (862, 29, 56, 7, '2019-01-27', 277);
INSERT INTO public."order" VALUES (863, 27, 8, 25, '2019-10-15', 325);
INSERT INTO public."order" VALUES (864, 81, 14, 23, '2019-06-03', 56);
INSERT INTO public."order" VALUES (865, 14, 79, 11, '2019-07-31', 341);
INSERT INTO public."order" VALUES (866, 123, 15, 7, '2019-04-26', 603);
INSERT INTO public."order" VALUES (867, 165, 41, 22, '2019-01-09', 871);
INSERT INTO public."order" VALUES (868, 12, 11, 4, '2019-05-25', 297);
INSERT INTO public."order" VALUES (869, 27, 15, 12, '2019-12-26', 79);
INSERT INTO public."order" VALUES (870, 1, 14, 20, '2019-05-19', 514);
INSERT INTO public."order" VALUES (871, 93, 41, 17, '2019-12-05', 150);
INSERT INTO public."order" VALUES (872, 141, 41, 10, '2019-06-22', 423);
INSERT INTO public."order" VALUES (873, 84, 11, 13, '2019-08-12', 800);
INSERT INTO public."order" VALUES (874, 53, 41, 13, '2019-06-24', 714);
INSERT INTO public."order" VALUES (875, 31, 3, 3, '2019-08-04', 820);
INSERT INTO public."order" VALUES (876, 24, 51, 4, '2019-06-18', 600);
INSERT INTO public."order" VALUES (877, 168, 51, 17, '2019-02-10', 184);
INSERT INTO public."order" VALUES (878, 21, 41, 25, '2019-02-05', 764);
INSERT INTO public."order" VALUES (879, 108, 11, 16, '2019-08-04', 919);
INSERT INTO public."order" VALUES (880, 68, 11, 22, '2019-02-18', 903);
INSERT INTO public."order" VALUES (881, 80, 51, 20, '2019-06-12', 588);
INSERT INTO public."order" VALUES (882, 139, 15, 10, '2019-02-24', 534);
INSERT INTO public."order" VALUES (883, 41, 14, 11, '2019-03-18', 526);
INSERT INTO public."order" VALUES (884, 59, 15, 18, '2019-09-28', 587);
INSERT INTO public."order" VALUES (885, 94, 79, 17, '2019-01-06', 122);
INSERT INTO public."order" VALUES (886, 76, 11, 24, '2019-04-26', 611);
INSERT INTO public."order" VALUES (887, 73, 14, 25, '2019-04-13', 143);
INSERT INTO public."order" VALUES (888, 1, 14, 23, '2019-04-18', 796);
INSERT INTO public."order" VALUES (889, 60, 11, 1, '2019-08-16', 661);
INSERT INTO public."order" VALUES (890, 98, 77, 20, '2019-07-26', 479);
INSERT INTO public."order" VALUES (891, 66, 77, 18, '2019-04-14', 623);
INSERT INTO public."order" VALUES (892, 93, 41, 21, '2019-05-04', 923);
INSERT INTO public."order" VALUES (893, 36, 11, 1, '2019-03-08', 159);
INSERT INTO public."order" VALUES (894, 116, 11, 11, '2019-11-07', 982);
INSERT INTO public."order" VALUES (895, 149, 57, 19, '2019-03-07', 143);
INSERT INTO public."order" VALUES (896, 52, 11, 10, '2019-12-06', 573);
INSERT INTO public."order" VALUES (897, 106, 77, 22, '2019-12-30', 774);
INSERT INTO public."order" VALUES (898, 147, 15, 3, '2019-05-07', 323);
INSERT INTO public."order" VALUES (899, 116, 11, 17, '2019-11-04', 419);
INSERT INTO public."order" VALUES (900, 74, 19, 1, '2019-12-19', 584);
INSERT INTO public."order" VALUES (901, 57, 14, 13, '2019-08-06', 628);
INSERT INTO public."order" VALUES (902, 139, 15, 8, '2019-07-20', 951);
INSERT INTO public."order" VALUES (903, 15, 3, 25, '2019-08-04', 729);
INSERT INTO public."order" VALUES (904, 118, 79, 23, '2019-05-06', 609);
INSERT INTO public."order" VALUES (905, 128, 51, 14, '2019-01-08', 681);
INSERT INTO public."order" VALUES (906, 78, 58, 11, '2019-01-11', 873);
INSERT INTO public."order" VALUES (907, 27, 15, 5, '2019-07-18', 18);
INSERT INTO public."order" VALUES (908, 81, 14, 9, '2019-07-27', 574);
INSERT INTO public."order" VALUES (909, 39, 3, 17, '2019-12-25', 769);
INSERT INTO public."order" VALUES (910, 155, 15, 10, '2019-08-10', 927);
INSERT INTO public."order" VALUES (911, 54, 79, 3, '2019-08-17', 440);
INSERT INTO public."order" VALUES (912, 99, 15, 4, '2019-11-27', 676);
INSERT INTO public."order" VALUES (913, 158, 79, 6, '2019-02-18', 459);
INSERT INTO public."order" VALUES (914, 98, 16, 2, '2019-07-03', 834);
INSERT INTO public."order" VALUES (915, 133, 41, 7, '2019-11-16', 431);
INSERT INTO public."order" VALUES (916, 48, 51, 12, '2019-10-30', 292);
INSERT INTO public."order" VALUES (917, 127, 42, 4, '2019-09-03', 559);
INSERT INTO public."order" VALUES (918, 7, 3, 21, '2019-12-03', 975);
INSERT INTO public."order" VALUES (919, 95, 3, 21, '2019-09-08', 92);
INSERT INTO public."order" VALUES (920, 18, 77, 2, '2019-03-12', 54);
INSERT INTO public."order" VALUES (921, 136, 51, 9, '2019-09-22', 713);
INSERT INTO public."order" VALUES (922, 121, 14, 17, '2019-06-19', 277);
INSERT INTO public."order" VALUES (923, 163, 10, 3, '2019-04-18', 603);
INSERT INTO public."order" VALUES (924, 59, 63, 24, '2019-10-16', 952);
INSERT INTO public."order" VALUES (925, 167, 3, 13, '2019-09-11', 43);
INSERT INTO public."order" VALUES (926, 70, 79, 18, '2019-01-07', 44);
INSERT INTO public."order" VALUES (927, 127, 3, 10, '2019-06-26', 61);
INSERT INTO public."order" VALUES (928, 22, 79, 9, '2019-01-02', 66);
INSERT INTO public."order" VALUES (929, 30, 79, 25, '2019-07-01', 682);
INSERT INTO public."order" VALUES (930, 92, 11, 15, '2019-06-06', 649);
INSERT INTO public."order" VALUES (931, 128, 51, 3, '2019-08-05', 980);
INSERT INTO public."order" VALUES (932, 160, 51, 23, '2019-05-16', 439);
INSERT INTO public."order" VALUES (933, 162, 77, 23, '2019-08-04', 225);
INSERT INTO public."order" VALUES (934, 164, 11, 24, '2019-10-02', 825);
INSERT INTO public."order" VALUES (935, 34, 77, 10, '2019-05-25', 251);
INSERT INTO public."order" VALUES (936, 113, 14, 25, '2019-06-23', 370);
INSERT INTO public."order" VALUES (937, 126, 79, 3, '2019-09-11', 481);
INSERT INTO public."order" VALUES (938, 133, 41, 25, '2019-08-07', 915);
INSERT INTO public."order" VALUES (939, 16, 51, 19, '2019-05-24', 359);
INSERT INTO public."order" VALUES (940, 111, 3, 23, '2019-12-25', 67);
INSERT INTO public."order" VALUES (941, 168, 51, 15, '2019-06-21', 876);
INSERT INTO public."order" VALUES (942, 160, 51, 6, '2019-04-28', 765);
INSERT INTO public."order" VALUES (943, 132, 11, 19, '2019-07-27', 829);
INSERT INTO public."order" VALUES (944, 38, 79, 14, '2019-03-31', 144);
INSERT INTO public."order" VALUES (945, 137, 14, 5, '2019-05-23', 598);
INSERT INTO public."order" VALUES (946, 72, 51, 13, '2019-01-06', 911);
INSERT INTO public."order" VALUES (947, 126, 79, 12, '2019-10-23', 953);
INSERT INTO public."order" VALUES (948, 159, 3, 6, '2019-01-15', 285);
INSERT INTO public."order" VALUES (949, 168, 1, 21, '2019-06-15', 205);
INSERT INTO public."order" VALUES (950, 88, 51, 6, '2019-11-29', 476);
INSERT INTO public."order" VALUES (951, 85, 41, 5, '2019-04-17', 678);
INSERT INTO public."order" VALUES (952, 138, 77, 4, '2019-01-31', 919);
INSERT INTO public."order" VALUES (953, 43, 15, 4, '2019-09-02', 30);
INSERT INTO public."order" VALUES (954, 65, 14, 11, '2019-12-26', 324);
INSERT INTO public."order" VALUES (955, 167, 3, 20, '2019-04-06', 727);
INSERT INTO public."order" VALUES (956, 69, 41, 3, '2019-02-01', 480);
INSERT INTO public."order" VALUES (957, 46, 79, 13, '2019-11-09', 537);
INSERT INTO public."order" VALUES (958, 37, 41, 20, '2019-04-29', 807);
INSERT INTO public."order" VALUES (959, 83, 8, 19, '2019-08-08', 257);
INSERT INTO public."order" VALUES (960, 13, 41, 6, '2019-02-10', 31);
INSERT INTO public."order" VALUES (961, 96, 51, 5, '2019-07-28', 775);
INSERT INTO public."order" VALUES (962, 82, 77, 12, '2019-12-06', 96);
INSERT INTO public."order" VALUES (963, 164, 11, 24, '2019-05-02', 354);
INSERT INTO public."order" VALUES (964, 6, 79, 12, '2019-05-04', 521);
INSERT INTO public."order" VALUES (965, 10, 77, 12, '2019-01-17', 195);
INSERT INTO public."order" VALUES (966, 68, 11, 5, '2019-03-31', 814);
INSERT INTO public."order" VALUES (967, 127, 3, 14, '2019-11-28', 226);
INSERT INTO public."order" VALUES (968, 136, 80, 17, '2019-01-18', 907);
INSERT INTO public."order" VALUES (969, 39, 3, 15, '2019-08-07', 24);
INSERT INTO public."order" VALUES (970, 65, 14, 21, '2019-11-05', 50);
INSERT INTO public."order" VALUES (971, 114, 77, 14, '2019-12-02', 806);
INSERT INTO public."order" VALUES (972, 31, 3, 1, '2019-12-12', 889);
INSERT INTO public."order" VALUES (973, 36, 11, 13, '2019-10-13', 461);
INSERT INTO public."order" VALUES (974, 148, 11, 10, '2019-05-14', 206);
INSERT INTO public."order" VALUES (975, 66, 77, 3, '2019-07-07', 328);
INSERT INTO public."order" VALUES (976, 104, 51, 20, '2019-07-25', 711);
INSERT INTO public."order" VALUES (977, 9, 14, 20, '2019-02-18', 194);
INSERT INTO public."order" VALUES (978, 103, 3, 20, '2019-10-06', 9);
INSERT INTO public."order" VALUES (979, 83, 15, 18, '2019-09-05', 737);
INSERT INTO public."order" VALUES (980, 66, 77, 11, '2019-01-21', 255);
INSERT INTO public."order" VALUES (981, 108, 28, 17, '2019-10-11', 121);
INSERT INTO public."order" VALUES (982, 37, 44, 4, '2019-08-16', 186);
INSERT INTO public."order" VALUES (983, 14, 79, 9, '2019-01-12', 568);
INSERT INTO public."order" VALUES (984, 133, 41, 12, '2019-05-03', 702);
INSERT INTO public."order" VALUES (985, 117, 41, 9, '2019-09-24', 263);
INSERT INTO public."order" VALUES (986, 128, 51, 8, '2019-07-15', 972);
INSERT INTO public."order" VALUES (987, 56, 51, 18, '2019-04-09', 913);
INSERT INTO public."order" VALUES (988, 155, 15, 3, '2019-02-05', 604);
INSERT INTO public."order" VALUES (989, 141, 41, 6, '2019-01-29', 509);
INSERT INTO public."order" VALUES (990, 15, 3, 21, '2019-07-20', 614);
INSERT INTO public."order" VALUES (991, 87, 3, 21, '2019-11-09', 394);
INSERT INTO public."order" VALUES (992, 61, 41, 14, '2019-09-07', 36);
INSERT INTO public."order" VALUES (993, 157, 47, 15, '2019-11-08', 274);
INSERT INTO public."order" VALUES (994, 44, 11, 16, '2019-01-22', 178);
INSERT INTO public."order" VALUES (995, 82, 77, 1, '2019-06-21', 274);
INSERT INTO public."order" VALUES (996, 168, 51, 17, '2019-09-25', 584);
INSERT INTO public."order" VALUES (997, 42, 77, 7, '2019-01-31', 195);
INSERT INTO public."order" VALUES (998, 27, 15, 6, '2019-01-08', 708);
INSERT INTO public."order" VALUES (999, 119, 3, 6, '2019-04-02', 178);


--
-- Data for Name: pharmacy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pharmacy VALUES (1, 'Панатек', 9);
INSERT INTO public.pharmacy VALUES (2, 'Аптека № 73', 4);
INSERT INTO public.pharmacy VALUES (3, 'Интерфарм-3', 10);
INSERT INTO public.pharmacy VALUES (4, 'Аптека Farmani', 7);
INSERT INTO public.pharmacy VALUES (5, 'Аптека № 1', 8);
INSERT INTO public.pharmacy VALUES (6, 'Дежурный аптекарь', 7);
INSERT INTO public.pharmacy VALUES (7, 'Аптека №7', 5);
INSERT INTO public.pharmacy VALUES (8, 'Аптека №8', 7);
INSERT INTO public.pharmacy VALUES (9, 'Аптека №9', 2);
INSERT INTO public.pharmacy VALUES (10, 'Аптека №10', 5);
INSERT INTO public.pharmacy VALUES (11, 'Аптека №11', 4);
INSERT INTO public.pharmacy VALUES (12, 'Аптека №12', 6);
INSERT INTO public.pharmacy VALUES (13, 'Аптека №13', 2);
INSERT INTO public.pharmacy VALUES (14, 'Аптека №14', 9);
INSERT INTO public.pharmacy VALUES (15, 'Аптека №15', 9);
INSERT INTO public.pharmacy VALUES (16, 'Аптека №16', 8);
INSERT INTO public.pharmacy VALUES (17, 'Аптека №17', 8);
INSERT INTO public.pharmacy VALUES (18, 'Аптека №18', 6);
INSERT INTO public.pharmacy VALUES (19, 'Аптека №19', 8);
INSERT INTO public.pharmacy VALUES (20, 'Аптека №20', 4);
INSERT INTO public.pharmacy VALUES (21, 'Аптека №21', 1);
INSERT INTO public.pharmacy VALUES (22, 'Аптека №22', 6);
INSERT INTO public.pharmacy VALUES (23, 'Аптека №23', 4);
INSERT INTO public.pharmacy VALUES (24, 'Аптека №24', 9);
INSERT INTO public.pharmacy VALUES (25, 'Аптека №25', 10);


--
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.production VALUES (1, 1, 1, '$1,123,300.00', 5);
INSERT INTO public.production VALUES (2, 2, 1, '$909,800.00', 8);
INSERT INTO public.production VALUES (3, 3, 1, '$707,400.00', 8);
INSERT INTO public.production VALUES (4, 4, 1, '$946,700.00', 3);
INSERT INTO public.production VALUES (5, 5, 1, '$681,000.00', 4);
INSERT INTO public.production VALUES (6, 6, 1, '$620,000.00', 4);
INSERT INTO public.production VALUES (7, 7, 1, '$124,000.00', 6);
INSERT INTO public.production VALUES (8, 8, 1, '$1,237,000.00', 8);
INSERT INTO public.production VALUES (9, 1, 2, '$1,138,300.00', 9);
INSERT INTO public.production VALUES (10, 2, 2, '$240,300.00', 6);
INSERT INTO public.production VALUES (11, 3, 2, '$538,600.00', 6);
INSERT INTO public.production VALUES (12, 4, 2, '$1,092,000.00', 9);
INSERT INTO public.production VALUES (13, 5, 2, '$407,000.00', 4);
INSERT INTO public.production VALUES (14, 6, 2, '$905,100.00', 8);
INSERT INTO public.production VALUES (15, 7, 2, '$862,700.00', 2);
INSERT INTO public.production VALUES (16, 8, 2, '$689,300.00', 10);
INSERT INTO public.production VALUES (17, 1, 3, '$582,600.00', 10);
INSERT INTO public.production VALUES (18, 2, 3, '$848,300.00', 1);
INSERT INTO public.production VALUES (19, 3, 3, '$908,000.00', 7);
INSERT INTO public.production VALUES (20, 4, 3, '$681,200.00', 9);
INSERT INTO public.production VALUES (21, 5, 3, '$443,500.00', 2);
INSERT INTO public.production VALUES (22, 6, 3, '$273,200.00', 6);
INSERT INTO public.production VALUES (23, 7, 3, '$525,200.00', 3);
INSERT INTO public.production VALUES (24, 8, 3, '$264,400.00', 6);
INSERT INTO public.production VALUES (25, 1, 4, '$847,400.00', 4);
INSERT INTO public.production VALUES (26, 2, 4, '$280,300.00', 3);
INSERT INTO public.production VALUES (27, 3, 4, '$437,900.00', 1);
INSERT INTO public.production VALUES (28, 4, 4, '$719,000.00', 9);
INSERT INTO public.production VALUES (29, 5, 4, '$194,900.00', 8);
INSERT INTO public.production VALUES (30, 6, 4, '$114,900.00', 8);
INSERT INTO public.production VALUES (31, 7, 4, '$479,100.00', 10);
INSERT INTO public.production VALUES (32, 8, 4, '$458,200.00', 1);
INSERT INTO public.production VALUES (33, 1, 5, '$707,000.00', 1);
INSERT INTO public.production VALUES (34, 2, 5, '$749,700.00', 5);
INSERT INTO public.production VALUES (35, 3, 5, '$191,200.00', 3);
INSERT INTO public.production VALUES (36, 4, 5, '$783,900.00', 7);
INSERT INTO public.production VALUES (37, 5, 5, '$380,700.00', 10);
INSERT INTO public.production VALUES (38, 6, 5, '$317,600.00', 7);
INSERT INTO public.production VALUES (39, 7, 5, '$1,066,300.00', 9);
INSERT INTO public.production VALUES (40, 8, 5, '$1,181,900.00', 4);
INSERT INTO public.production VALUES (41, 1, 6, '$1,231,200.00', 7);
INSERT INTO public.production VALUES (42, 2, 6, '$917,800.00', 1);
INSERT INTO public.production VALUES (43, 3, 6, '$1,191,800.00', 7);
INSERT INTO public.production VALUES (44, 4, 6, '$361,000.00', 3);
INSERT INTO public.production VALUES (45, 5, 6, '$111,000.00', 6);
INSERT INTO public.production VALUES (46, 6, 6, '$1,210,000.00', 3);
INSERT INTO public.production VALUES (47, 7, 6, '$886,200.00', 1);
INSERT INTO public.production VALUES (48, 8, 6, '$154,400.00', 8);
INSERT INTO public.production VALUES (49, 1, 7, '$228,600.00', 8);
INSERT INTO public.production VALUES (50, 2, 7, '$965,300.00', 7);
INSERT INTO public.production VALUES (51, 3, 7, '$1,229,900.00', 8);
INSERT INTO public.production VALUES (52, 4, 7, '$882,400.00', 9);
INSERT INTO public.production VALUES (53, 5, 7, '$380,300.00', 1);
INSERT INTO public.production VALUES (54, 6, 7, '$1,117,000.00', 8);
INSERT INTO public.production VALUES (55, 7, 7, '$1,216,100.00', 1);
INSERT INTO public.production VALUES (56, 8, 7, '$1,204,500.00', 2);
INSERT INTO public.production VALUES (57, 1, 8, '$426,500.00', 9);
INSERT INTO public.production VALUES (58, 2, 8, '$186,900.00', 4);
INSERT INTO public.production VALUES (59, 3, 8, '$360,100.00', 2);
INSERT INTO public.production VALUES (60, 4, 8, '$368,900.00', 8);
INSERT INTO public.production VALUES (61, 5, 8, '$733,200.00', 9);
INSERT INTO public.production VALUES (62, 6, 8, '$183,500.00', 8);
INSERT INTO public.production VALUES (63, 7, 8, '$743,700.00', 7);
INSERT INTO public.production VALUES (64, 8, 8, '$830,900.00', 4);
INSERT INTO public.production VALUES (65, 1, 9, '$1,125,100.00', 5);
INSERT INTO public.production VALUES (66, 2, 9, '$430,400.00', 2);
INSERT INTO public.production VALUES (67, 3, 9, '$592,500.00', 6);
INSERT INTO public.production VALUES (68, 4, 9, '$722,100.00', 6);
INSERT INTO public.production VALUES (69, 5, 9, '$318,200.00', 8);
INSERT INTO public.production VALUES (70, 6, 9, '$747,600.00', 7);
INSERT INTO public.production VALUES (71, 7, 9, '$972,700.00', 6);
INSERT INTO public.production VALUES (72, 8, 9, '$735,200.00', 10);
INSERT INTO public.production VALUES (73, 1, 10, '$1,113,300.00', 9);
INSERT INTO public.production VALUES (74, 2, 10, '$997,900.00', 8);
INSERT INTO public.production VALUES (75, 3, 10, '$300,900.00', 10);
INSERT INTO public.production VALUES (76, 4, 10, '$639,100.00', 9);
INSERT INTO public.production VALUES (77, 5, 10, '$944,000.00', 7);
INSERT INTO public.production VALUES (78, 6, 10, '$108,600.00', 3);
INSERT INTO public.production VALUES (79, 7, 10, '$775,600.00', 4);
INSERT INTO public.production VALUES (80, 8, 10, '$546,300.00', 4);
INSERT INTO public.production VALUES (81, 1, 11, '$533,100.00', 4);
INSERT INTO public.production VALUES (82, 2, 11, '$1,029,700.00', 7);
INSERT INTO public.production VALUES (83, 3, 11, '$153,400.00', 1);
INSERT INTO public.production VALUES (84, 4, 11, '$719,200.00', 1);
INSERT INTO public.production VALUES (85, 5, 11, '$745,800.00', 2);
INSERT INTO public.production VALUES (86, 6, 11, '$225,600.00', 8);
INSERT INTO public.production VALUES (87, 7, 11, '$570,300.00', 4);
INSERT INTO public.production VALUES (88, 8, 11, '$1,041,500.00', 3);
INSERT INTO public.production VALUES (89, 1, 12, '$856,800.00', 2);
INSERT INTO public.production VALUES (90, 2, 12, '$566,100.00', 4);
INSERT INTO public.production VALUES (91, 3, 12, '$736,400.00', 10);
INSERT INTO public.production VALUES (92, 4, 12, '$1,232,200.00', 8);
INSERT INTO public.production VALUES (93, 5, 12, '$415,600.00', 8);
INSERT INTO public.production VALUES (94, 6, 12, '$927,300.00', 3);
INSERT INTO public.production VALUES (95, 7, 12, '$887,500.00', 9);
INSERT INTO public.production VALUES (96, 8, 12, '$1,056,400.00', 6);
INSERT INTO public.production VALUES (97, 1, 13, '$1,049,200.00', 7);
INSERT INTO public.production VALUES (98, 2, 13, '$395,500.00', 7);
INSERT INTO public.production VALUES (99, 3, 13, '$1,010,900.00', 10);
INSERT INTO public.production VALUES (100, 4, 13, '$1,120,700.00', 4);
INSERT INTO public.production VALUES (101, 5, 13, '$1,116,500.00', 8);
INSERT INTO public.production VALUES (102, 6, 13, '$619,700.00', 4);
INSERT INTO public.production VALUES (103, 7, 13, '$1,235,500.00', 2);
INSERT INTO public.production VALUES (104, 8, 13, '$159,800.00', 1);
INSERT INTO public.production VALUES (105, 1, 14, '$1,078,300.00', 9);
INSERT INTO public.production VALUES (106, 2, 14, '$829,300.00', 6);
INSERT INTO public.production VALUES (107, 3, 14, '$578,400.00', 2);
INSERT INTO public.production VALUES (108, 4, 14, '$676,000.00', 6);
INSERT INTO public.production VALUES (109, 5, 14, '$668,500.00', 10);
INSERT INTO public.production VALUES (110, 6, 14, '$745,400.00', 7);
INSERT INTO public.production VALUES (111, 7, 14, '$172,800.00', 5);
INSERT INTO public.production VALUES (112, 8, 14, '$588,800.00', 2);
INSERT INTO public.production VALUES (113, 1, 15, '$1,149,900.00', 3);
INSERT INTO public.production VALUES (114, 2, 15, '$696,200.00', 9);
INSERT INTO public.production VALUES (115, 3, 15, '$812,000.00', 8);
INSERT INTO public.production VALUES (116, 4, 15, '$831,500.00', 5);
INSERT INTO public.production VALUES (117, 5, 15, '$466,000.00', 2);
INSERT INTO public.production VALUES (118, 6, 15, '$514,900.00', 6);
INSERT INTO public.production VALUES (119, 7, 15, '$292,700.00', 4);
INSERT INTO public.production VALUES (120, 8, 15, '$463,900.00', 8);
INSERT INTO public.production VALUES (121, 1, 16, '$351,500.00', 6);
INSERT INTO public.production VALUES (122, 2, 16, '$178,100.00', 10);
INSERT INTO public.production VALUES (123, 3, 16, '$1,245,300.00', 1);
INSERT INTO public.production VALUES (124, 4, 16, '$589,800.00', 8);
INSERT INTO public.production VALUES (125, 5, 16, '$610,400.00', 6);
INSERT INTO public.production VALUES (126, 6, 16, '$197,600.00', 6);
INSERT INTO public.production VALUES (127, 7, 16, '$756,700.00', 3);
INSERT INTO public.production VALUES (128, 8, 16, '$1,079,700.00', 2);
INSERT INTO public.production VALUES (129, 1, 17, '$646,000.00', 1);
INSERT INTO public.production VALUES (130, 2, 17, '$746,000.00', 3);
INSERT INTO public.production VALUES (131, 3, 17, '$1,053,400.00', 2);
INSERT INTO public.production VALUES (132, 4, 17, '$386,000.00', 4);
INSERT INTO public.production VALUES (133, 5, 17, '$855,800.00', 4);
INSERT INTO public.production VALUES (134, 6, 17, '$434,800.00', 4);
INSERT INTO public.production VALUES (135, 7, 17, '$384,200.00', 10);
INSERT INTO public.production VALUES (136, 8, 17, '$497,300.00', 4);
INSERT INTO public.production VALUES (137, 1, 18, '$655,100.00', 8);
INSERT INTO public.production VALUES (138, 2, 18, '$616,800.00', 9);
INSERT INTO public.production VALUES (139, 3, 18, '$363,100.00', 10);
INSERT INTO public.production VALUES (140, 4, 18, '$427,700.00', 9);
INSERT INTO public.production VALUES (141, 5, 18, '$422,700.00', 5);
INSERT INTO public.production VALUES (142, 6, 18, '$268,200.00', 8);
INSERT INTO public.production VALUES (143, 7, 18, '$756,400.00', 10);
INSERT INTO public.production VALUES (144, 8, 18, '$160,800.00', 7);
INSERT INTO public.production VALUES (145, 1, 19, '$709,700.00', 7);
INSERT INTO public.production VALUES (146, 2, 19, '$978,800.00', 4);
INSERT INTO public.production VALUES (147, 3, 19, '$803,900.00', 8);
INSERT INTO public.production VALUES (148, 4, 19, '$961,100.00', 3);
INSERT INTO public.production VALUES (149, 5, 19, '$1,136,300.00', 8);
INSERT INTO public.production VALUES (150, 6, 19, '$958,100.00', 4);
INSERT INTO public.production VALUES (151, 7, 19, '$322,400.00', 2);
INSERT INTO public.production VALUES (152, 8, 19, '$927,700.00', 6);
INSERT INTO public.production VALUES (153, 1, 20, '$1,066,500.00', 9);
INSERT INTO public.production VALUES (154, 2, 20, '$105,100.00', 1);
INSERT INTO public.production VALUES (155, 3, 20, '$287,600.00', 5);
INSERT INTO public.production VALUES (156, 4, 20, '$1,110,900.00', 9);
INSERT INTO public.production VALUES (157, 5, 20, '$379,500.00', 8);
INSERT INTO public.production VALUES (158, 6, 20, '$226,700.00', 8);
INSERT INTO public.production VALUES (159, 7, 20, '$113,400.00', 4);
INSERT INTO public.production VALUES (160, 8, 20, '$817,300.00', 1);
INSERT INTO public.production VALUES (161, 1, 21, '$355,800.00', 2);
INSERT INTO public.production VALUES (162, 2, 21, '$205,900.00', 6);
INSERT INTO public.production VALUES (163, 3, 21, '$313,800.00', 9);
INSERT INTO public.production VALUES (164, 4, 21, '$213,700.00', 6);
INSERT INTO public.production VALUES (165, 5, 21, '$565,400.00', 8);
INSERT INTO public.production VALUES (166, 6, 21, '$726,200.00', 3);
INSERT INTO public.production VALUES (167, 7, 21, '$200,300.00', 4);
INSERT INTO public.production VALUES (168, 8, 21, '$604,900.00', 4);


--
-- Name: company_id_company_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_company_seq', 9, false);


--
-- Name: dealer_id_dealer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dealer_id_dealer_seq', 86, false);


--
-- Name: medicine_id_medicine_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicine_id_medicine_seq', 22, false);


--
-- Name: order_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_order_seq', 1000, false);


--
-- Name: pharmacy_id_pharmacy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pharmacy_id_pharmacy_seq', 26, false);


--
-- Name: production_id_production_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_id_production_seq', 169, false);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);


--
-- Name: dealer dealer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dealer
    ADD CONSTRAINT dealer_pkey PRIMARY KEY (id_dealer);


--
-- Name: medicine medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicine
    ADD CONSTRAINT medicine_pkey PRIMARY KEY (id_medicine);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id_order);


--
-- Name: pharmacy pharmacy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacy
    ADD CONSTRAINT pharmacy_pkey PRIMARY KEY (id_pharmacy);


--
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (id_production);


--
-- PostgreSQL database dump complete
--

