PGDMP     -                    y           Gestion_Reservation    13.1    13.1 ,    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17419    Gestion_Reservation    DATABASE     r   CREATE DATABASE "Gestion_Reservation" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Morocco.1252';
 %   DROP DATABASE "Gestion_Reservation";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            ?            1259    17483    admin    TABLE     g   CREATE TABLE public.admin (
    username character varying(255),
    id_utilisateur bigint NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false    3            ?            1259    17488 	   apprenant    TABLE     ?   CREATE TABLE public.apprenant (
    nom character varying(255),
    prenom character varying(255),
    id_utilisateur bigint NOT NULL
);
    DROP TABLE public.apprenant;
       public         heap    postgres    false    3            ?            1259    17545    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false    3            ?            1259    17599    preinscription    TABLE     S  CREATE TABLE public.preinscription (
    idutilisateur bigint NOT NULL,
    email character varying(255) NOT NULL,
    mdp character varying(255) NOT NULL,
    nom character varying(255),
    prenom character varying(255),
    tel character varying(255) NOT NULL,
    statu character varying(255) DEFAULT 'En attent'::character varying
);
 "   DROP TABLE public.preinscription;
       public         heap    postgres    false    3            ?            1259    17597     preinscription_idutilisateur_seq    SEQUENCE     ?   CREATE SEQUENCE public.preinscription_idutilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.preinscription_idutilisateur_seq;
       public          postgres    false    208    3            ?           0    0     preinscription_idutilisateur_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.preinscription_idutilisateur_seq OWNED BY public.preinscription.idutilisateur;
          public          postgres    false    207            ?            1259    17578    reservation    TABLE     '  CREATE TABLE public.reservation (
    id_reservation bigint NOT NULL,
    "confirmé" character varying(255) DEFAULT 'En attent'::character varying,
    date date NOT NULL,
    id_apprenant_id_utilisateur bigint NOT NULL,
    type_reservation_type_reservation character varying(255) NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false    3            ?            1259    17496    role    TABLE     d   CREATE TABLE public.role (
    id_role bigint NOT NULL,
    role character varying(255) NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false    3            ?            1259    17556    typereservation    TABLE     p   CREATE TABLE public.typereservation (
    id_tr bigint NOT NULL,
    type_reservation character varying(255)
);
 #   DROP TABLE public.typereservation;
       public         heap    postgres    false    3            ?            1259    17501    utilisateur    TABLE       CREATE TABLE public.utilisateur (
    id_utilisateur bigint NOT NULL,
    email character varying(255) NOT NULL,
    mdp character varying(255) NOT NULL,
    tel character varying(255) NOT NULL,
    id_role character varying(255) NOT NULL,
    role character varying(255)
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false    3            A           2604    17602    preinscription idutilisateur    DEFAULT     ?   ALTER TABLE ONLY public.preinscription ALTER COLUMN idutilisateur SET DEFAULT nextval('public.preinscription_idutilisateur_seq'::regclass);
 K   ALTER TABLE public.preinscription ALTER COLUMN idutilisateur DROP DEFAULT;
       public          postgres    false    207    208    208            ?          0    17483    admin 
   TABLE DATA                 public          postgres    false    200            ?          0    17488 	   apprenant 
   TABLE DATA                 public          postgres    false    201            ?          0    17599    preinscription 
   TABLE DATA                 public          postgres    false    208            ?          0    17578    reservation 
   TABLE DATA                 public          postgres    false    206            ?          0    17496    role 
   TABLE DATA                 public          postgres    false    202            ?          0    17556    typereservation 
   TABLE DATA                 public          postgres    false    205            ?          0    17501    utilisateur 
   TABLE DATA                 public          postgres    false    203            ?           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 95, true);
          public          postgres    false    204            ?           0    0     preinscription_idutilisateur_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.preinscription_idutilisateur_seq', 34, true);
          public          postgres    false    207            D           2606    17487    admin admin_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_utilisateur);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    200            F           2606    17495    apprenant apprenant_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.apprenant
    ADD CONSTRAINT apprenant_pkey PRIMARY KEY (id_utilisateur);
 B   ALTER TABLE ONLY public.apprenant DROP CONSTRAINT apprenant_pkey;
       public            postgres    false    201            X           2606    17607 "   preinscription preinscription_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.preinscription
    ADD CONSTRAINT preinscription_pkey PRIMARY KEY (idutilisateur);
 L   ALTER TABLE ONLY public.preinscription DROP CONSTRAINT preinscription_pkey;
       public            postgres    false    208            Z           2606    25579     preinscription preinscription_un 
   CONSTRAINT     \   ALTER TABLE ONLY public.preinscription
    ADD CONSTRAINT preinscription_un UNIQUE (email);
 J   ALTER TABLE ONLY public.preinscription DROP CONSTRAINT preinscription_un;
       public            postgres    false    208            V           2606    17585    reservation reservation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    206            H           2606    17527    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    202            R           2606    17560 $   typereservation typereservation_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.typereservation
    ADD CONSTRAINT typereservation_pkey PRIMARY KEY (id_tr);
 N   ALTER TABLE ONLY public.typereservation DROP CONSTRAINT typereservation_pkey;
       public            postgres    false    205            J           2606    17510 !   role uk_33x416oeil31hpge9a6qc8jau 
   CONSTRAINT     \   ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_33x416oeil31hpge9a6qc8jau UNIQUE (role);
 K   ALTER TABLE ONLY public.role DROP CONSTRAINT uk_33x416oeil31hpge9a6qc8jau;
       public            postgres    false    202            L           2606    17550 !   role uk_bjxn5ii7v7ygwx39et0wawu0q 
   CONSTRAINT     \   ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_bjxn5ii7v7ygwx39et0wawu0q UNIQUE (role);
 K   ALTER TABLE ONLY public.role DROP CONSTRAINT uk_bjxn5ii7v7ygwx39et0wawu0q;
       public            postgres    false    202            T           2606    17567 ,   typereservation uk_lfx6nohjagxx37das3e90n0ue 
   CONSTRAINT     s   ALTER TABLE ONLY public.typereservation
    ADD CONSTRAINT uk_lfx6nohjagxx37das3e90n0ue UNIQUE (type_reservation);
 V   ALTER TABLE ONLY public.typereservation DROP CONSTRAINT uk_lfx6nohjagxx37das3e90n0ue;
       public            postgres    false    205            N           2606    17529    utilisateur utilisateur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public            postgres    false    203            P           2606    17548    utilisateur utilisateur_un 
   CONSTRAINT     [   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_un UNIQUE (email, tel);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_un;
       public            postgres    false    203    203            ^           2606    17551 '   utilisateur fk8blobjcwfdr8smc5poa1isjar    FK CONSTRAINT     ?   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fk8blobjcwfdr8smc5poa1isjar FOREIGN KEY (role) REFERENCES public.role(role);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fk8blobjcwfdr8smc5poa1isjar;
       public          postgres    false    2890    203    202            ]           2606    17540 '   utilisateur fkfu4yk9e1pflqd5at99judq0b7    FK CONSTRAINT     ?   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fkfu4yk9e1pflqd5at99judq0b7 FOREIGN KEY (id_role) REFERENCES public.role(role);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fkfu4yk9e1pflqd5at99judq0b7;
       public          postgres    false    2890    202    203            \           2606    17535 %   apprenant fkjdo06n2lnum75nkjc0myw9nui    FK CONSTRAINT     ?   ALTER TABLE ONLY public.apprenant
    ADD CONSTRAINT fkjdo06n2lnum75nkjc0myw9nui FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
 O   ALTER TABLE ONLY public.apprenant DROP CONSTRAINT fkjdo06n2lnum75nkjc0myw9nui;
       public          postgres    false    203    201    2894            [           2606    17530 !   admin fkk3rj0p9ym1gxfpvg3n8ml4seg    FK CONSTRAINT     ?   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fkk3rj0p9ym1gxfpvg3n8ml4seg FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
 K   ALTER TABLE ONLY public.admin DROP CONSTRAINT fkk3rj0p9ym1gxfpvg3n8ml4seg;
       public          postgres    false    2894    203    200            `           2606    17591 '   reservation fkpxcoaxyykmwm0u7pgjs8050r8    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fkpxcoaxyykmwm0u7pgjs8050r8 FOREIGN KEY (type_reservation_type_reservation) REFERENCES public.typereservation(type_reservation);
 Q   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fkpxcoaxyykmwm0u7pgjs8050r8;
       public          postgres    false    206    205    2900            _           2606    17586 '   reservation fks0ai4lnik3u6dnrm1acoiedjq    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fks0ai4lnik3u6dnrm1acoiedjq FOREIGN KEY (id_apprenant_id_utilisateur) REFERENCES public.apprenant(id_utilisateur);
 Q   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fks0ai4lnik3u6dnrm1acoiedjq;
       public          postgres    false    2886    201    206            ?   <   x???v
Q???W((M??L?KL???Ss?	uV?P?LL??K577W?Q0մ??? ???      ?   ?   x???Ok?@??~???@(?$$?Ӷ\?p?o?\?????O_gC????????7oV$2?r&?<e?\iU??0?M??}??${qc~??8?k?^??"	?q?::??Gf??I??4??A?,/??,R??R#*Ħ???"?%??ҝ?M?<2?E$v??f????Z????ja??ͳ?????\?#,??=K?xZG?M/?????荾!f???????h?翃?a?c???????      ?   ?  x????j?0?Ͻ????(?ib?N??`???,??6???@????ƖT??6??7???<y߄??7?9?x6q??HU?n??2.ԶRy?|?y/r?0xq?^??[V?Jf????8_I7?u???,*+AN??s}?V@?=B;>v76c?8>????~~m???????y?2??f????????*?bػ?˃?i??o???isþ?!??z?ëʼ?o??^??Zf{^?*c̿E?f?bn?h2??V-?Zi%?PJ??a?T?f??W?;?p??j@??0???Z????y?lzw??O?????0??#??IB?((?V@ؚe.ę-???+?/F? >?????(??????S7^ ? 2)?QX"
??	?2?g|M?2b^?#v?b???z]      ?   <  x????N?0?;O?????Ph????aw?3jdW? ??[t;???X??t???ޔ[Q?۵?8??????}????C'???ˍ??????N4???!??*??:???i??>???>?^E??L&U"S????-3M???5in?ٹ????1U)?s???!?]4?%â?&t2?8?&»?Z?_?A??6??x?t??Wܰ??c?3?i?D?s?~O(C???h?Xi??0?H??AϏ?a?ѫt?ʯ?tXF?/܄J츖pF??VN?q??%??`???c??%?4|?f??5ܰeV|F-?2;>???E߃Ѽ?      ?   G   x???v
Q???W((M??L?+??IUs?	uV?0?QPw,((J?K?+Q״??$???!%73??? ???      ?   R   x???v
Q???W((M??L?+?,H-J-N-*K,???Ss?	uV?0?QPOM?N?KQ״??$^?P?_~QnbH# ??%      ?   ?  x?Ŕ?jAE????9? ??]d#-?d??@????͋?b}}?%d??,<????>\???????c1[>????ҏ?]Y?[?á/~L??ۇ??R?<Y_6X?ͺj???z???e5?m}?~?H?A??.)w?i?"0*P0*?RRc??j?u=6?٥b??????Ñ????G?%8?q!?6?P?͛Q(K????]5I??/????N?@D?????S??H?{^\?4??˪.'x*?9D?G?cuC??o?:\?1???6]?C??`???3z%???M[?돓BgO,l????v7lv??v?m?g???#QʜV;$>
???%<'??^?c2V???~?????2??Ἇ:T??}???Uf?ō tB2?*?P?J?????>?f=?2 ?J?h8A?]$?.??2R????itVCί??????????~u??gj??w?@B?R??*S@ ??H??Y??;???F?????E      ,    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17419    Gestion_Reservation    DATABASE     r   CREATE DATABASE "Gestion_Reservation" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Morocco.1252';
 %   DROP DATABASE "Gestion_Reservation";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            ?            1259    17483    admin    TABLE     g   CREATE TABLE public.admin (
    username character varying(255),
    id_utilisateur bigint NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false    3            ?            1259    17488 	   apprenant    TABLE     ?   CREATE TABLE public.apprenant (
    nom character varying(255),
    prenom character varying(255),
    id_utilisateur bigint NOT NULL
);
    DROP TABLE public.apprenant;
       public         heap    postgres    false    3            ?            1259    17545    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false    3            ?            1259    17599    preinscription    TABLE     S  CREATE TABLE public.preinscription (
    idutilisateur bigint NOT NULL,
    email character varying(255) NOT NULL,
    mdp character varying(255) NOT NULL,
    nom character varying(255),
    prenom character varying(255),
    tel character varying(255) NOT NULL,
    statu character varying(255) DEFAULT 'En attent'::character varying
);
 "   DROP TABLE public.preinscription;
       public         heap    postgres    false    3            ?            1259    17597     preinscription_idutilisateur_seq    SEQUENCE     ?   CREATE SEQUENCE public.preinscription_idutilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.preinscription_idutilisateur_seq;
       public          postgres    false    208    3            ?           0    0     preinscription_idutilisateur_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.preinscription_idutilisateur_seq OWNED BY public.preinscription.idutilisateur;
          public          postgres    false    207            ?            1259    17578    reservation    TABLE     '  CREATE TABLE public.reservation (
    id_reservation bigint NOT NULL,
    "confirmé" character varying(255) DEFAULT 'En attent'::character varying,
    date date NOT NULL,
    id_apprenant_id_utilisateur bigint NOT NULL,
    type_reservation_type_reservation character varying(255) NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false    3            ?            1259    17496    role    TABLE     d   CREATE TABLE public.role (
    id_role bigint NOT NULL,
    role character varying(255) NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false    3            ?            1259    17556    typereservation    TABLE     p   CREATE TABLE public.typereservation (
    id_tr bigint NOT NULL,
    type_reservation character varying(255)
);
 #   DROP TABLE public.typereservation;
       public         heap    postgres    false    3            ?            1259    17501    utilisateur    TABLE       CREATE TABLE public.utilisateur (
    id_utilisateur bigint NOT NULL,
    email character varying(255) NOT NULL,
    mdp character varying(255) NOT NULL,
    tel character varying(255) NOT NULL,
    id_role character varying(255) NOT NULL,
    role character varying(255)
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false    3            A           2604    17602    preinscription idutilisateur    DEFAULT     ?   ALTER TABLE ONLY public.preinscription ALTER COLUMN idutilisateur SET DEFAULT nextval('public.preinscription_idutilisateur_seq'::regclass);
 K   ALTER TABLE public.preinscription ALTER COLUMN idutilisateur DROP DEFAULT;
       public          postgres    false    207    208    208            ?          0    17483    admin 
   TABLE DATA                 public          postgres    false    200   2       ?          0    17488 	   apprenant 
   TABLE DATA                 public          postgres    false    201   ~       ?          0    17599    preinscription 
   TABLE DATA                 public          postgres    false    208   t       ?          0    17578    reservation 
   TABLE DATA                 public          postgres    false    206          ?          0    17496    role 
   TABLE DATA                 public          postgres    false    202   X       ?          0    17556    typereservation 
   TABLE DATA                 public          postgres    false    205   ?       ?          0    17501    utilisateur 
   TABLE DATA                 public          postgres    false    203          ?           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 95, true);
          public          postgres    false    204            ?           0    0     preinscription_idutilisateur_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.preinscription_idutilisateur_seq', 34, true);
          public          postgres    false    207            D           2606    17487    admin admin_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_utilisateur);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    200            F           2606    17495    apprenant apprenant_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.apprenant
    ADD CONSTRAINT apprenant_pkey PRIMARY KEY (id_utilisateur);
 B   ALTER TABLE ONLY public.apprenant DROP CONSTRAINT apprenant_pkey;
       public            postgres    false    201            X           2606    17607 "   preinscription preinscription_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.preinscription
    ADD CONSTRAINT preinscription_pkey PRIMARY KEY (idutilisateur);
 L   ALTER TABLE ONLY public.preinscription DROP CONSTRAINT preinscription_pkey;
       public            postgres    false    208            Z           2606    25579     preinscription preinscription_un 
   CONSTRAINT     \   ALTER TABLE ONLY public.preinscription
    ADD CONSTRAINT preinscription_un UNIQUE (email);
 J   ALTER TABLE ONLY public.preinscription DROP CONSTRAINT preinscription_un;
       public            postgres    false    208            V           2606    17585    reservation reservation_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    206            H           2606    17527    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    202            R           2606    17560 $   typereservation typereservation_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.typereservation
    ADD CONSTRAINT typereservation_pkey PRIMARY KEY (id_tr);
 N   ALTER TABLE ONLY public.typereservation DROP CONSTRAINT typereservation_pkey;
       public            postgres    false    205            J           2606    17510 !   role uk_33x416oeil31hpge9a6qc8jau 
   CONSTRAINT     \   ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_33x416oeil31hpge9a6qc8jau UNIQUE (role);
 K   ALTER TABLE ONLY public.role DROP CONSTRAINT uk_33x416oeil31hpge9a6qc8jau;
       public            postgres    false    202            L           2606    17550 !   role uk_bjxn5ii7v7ygwx39et0wawu0q 
   CONSTRAINT     \   ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_bjxn5ii7v7ygwx39et0wawu0q UNIQUE (role);
 K   ALTER TABLE ONLY public.role DROP CONSTRAINT uk_bjxn5ii7v7ygwx39et0wawu0q;
       public            postgres    false    202            T           2606    17567 ,   typereservation uk_lfx6nohjagxx37das3e90n0ue 
   CONSTRAINT     s   ALTER TABLE ONLY public.typereservation
    ADD CONSTRAINT uk_lfx6nohjagxx37das3e90n0ue UNIQUE (type_reservation);
 V   ALTER TABLE ONLY public.typereservation DROP CONSTRAINT uk_lfx6nohjagxx37das3e90n0ue;
       public            postgres    false    205            N           2606    17529    utilisateur utilisateur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);
 F   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pkey;
       public            postgres    false    203            P           2606    17548    utilisateur utilisateur_un 
   CONSTRAINT     [   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_un UNIQUE (email, tel);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_un;
       public            postgres    false    203    203            ^           2606    17551 '   utilisateur fk8blobjcwfdr8smc5poa1isjar    FK CONSTRAINT     ?   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fk8blobjcwfdr8smc5poa1isjar FOREIGN KEY (role) REFERENCES public.role(role);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fk8blobjcwfdr8smc5poa1isjar;
       public          postgres    false    2890    203    202            ]           2606    17540 '   utilisateur fkfu4yk9e1pflqd5at99judq0b7    FK CONSTRAINT     ?   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT fkfu4yk9e1pflqd5at99judq0b7 FOREIGN KEY (id_role) REFERENCES public.role(role);
 Q   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT fkfu4yk9e1pflqd5at99judq0b7;
       public          postgres    false    2890    202    203            \           2606    17535 %   apprenant fkjdo06n2lnum75nkjc0myw9nui    FK CONSTRAINT     ?   ALTER TABLE ONLY public.apprenant
    ADD CONSTRAINT fkjdo06n2lnum75nkjc0myw9nui FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
 O   ALTER TABLE ONLY public.apprenant DROP CONSTRAINT fkjdo06n2lnum75nkjc0myw9nui;
       public          postgres    false    203    201    2894            [           2606    17530 !   admin fkk3rj0p9ym1gxfpvg3n8ml4seg    FK CONSTRAINT     ?   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fkk3rj0p9ym1gxfpvg3n8ml4seg FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
 K   ALTER TABLE ONLY public.admin DROP CONSTRAINT fkk3rj0p9ym1gxfpvg3n8ml4seg;
       public          postgres    false    2894    203    200            `           2606    17591 '   reservation fkpxcoaxyykmwm0u7pgjs8050r8    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fkpxcoaxyykmwm0u7pgjs8050r8 FOREIGN KEY (type_reservation_type_reservation) REFERENCES public.typereservation(type_reservation);
 Q   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fkpxcoaxyykmwm0u7pgjs8050r8;
       public          postgres    false    206    205    2900            _           2606    17586 '   reservation fks0ai4lnik3u6dnrm1acoiedjq    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fks0ai4lnik3u6dnrm1acoiedjq FOREIGN KEY (id_apprenant_id_utilisateur) REFERENCES public.apprenant(id_utilisateur);
 Q   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fks0ai4lnik3u6dnrm1acoiedjq;
       public          postgres    false    2886    201    206           