PGDMP     /    $    	             x            carpedia    12.1    12.1 1    S           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            T           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            U           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            V           1262    16393    carpedia    DATABASE     �   CREATE DATABASE carpedia WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
    DROP DATABASE carpedia;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            W           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    28991    bodytype    TABLE     c   CREATE TABLE public.bodytype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.bodytype;
       public         heap    postgres    false    3            �            1259    28996    car    TABLE     w  CREATE TABLE public.car (
    id bigint NOT NULL,
    endproduction character varying(4),
    name character varying(255) NOT NULL,
    ncap integer,
    startproduction character varying(4),
    bodytype_id bigint,
    company_id bigint,
    country_id bigint,
    segment_id bigint,
    author bigint,
    CONSTRAINT car_ncap_check CHECK (((ncap <= 5) AND (ncap >= 0)))
);
    DROP TABLE public.car;
       public         heap    postgres    false    3            �            1259    29002    car_engines    TABLE     x   CREATE TABLE public.car_engines (
    car_id bigint NOT NULL,
    engine_id bigint NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.car_engines;
       public         heap    postgres    false    3            �            1259    29007    company    TABLE     �   CREATE TABLE public.company (
    id bigint NOT NULL,
    foundation integer NOT NULL,
    name character varying(255) NOT NULL,
    country_id bigint
);
    DROP TABLE public.company;
       public         heap    postgres    false    3            �            1259    29012    country    TABLE     b   CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false    3            �            1259    29017    engine    TABLE     }   CREATE TABLE public.engine (
    id bigint NOT NULL,
    capacity real,
    name character varying(20),
    power integer
);
    DROP TABLE public.engine;
       public         heap    postgres    false    3            �            1259    28989    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false    3            �            1259    29022    segment    TABLE     W   CREATE TABLE public.segment (
    id bigint NOT NULL,
    name character varying(2)
);
    DROP TABLE public.segment;
       public         heap    postgres    false    3            �            1259    29027 	   simplycar    TABLE     �   CREATE TABLE public.simplycar (
    id bigint NOT NULL,
    company character varying(255),
    model character varying(255)
);
    DROP TABLE public.simplycar;
       public         heap    postgres    false    3            �            1259    29035    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    fname character varying(20),
    isactive boolean DEFAULT false,
    ismod boolean DEFAULT false,
    lname character varying(20),
    login character varying(20) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    3            H          0    28991    bodytype 
   TABLE DATA           ,   COPY public.bodytype (id, name) FROM stdin;
    public          postgres    false    203   u8       I          0    28996    car 
   TABLE DATA           �   COPY public.car (id, endproduction, name, ncap, startproduction, bodytype_id, company_id, country_id, segment_id, author) FROM stdin;
    public          postgres    false    204   �8       J          0    29002    car_engines 
   TABLE DATA           <   COPY public.car_engines (car_id, engine_id, id) FROM stdin;
    public          postgres    false    205   c9       K          0    29007    company 
   TABLE DATA           C   COPY public.company (id, foundation, name, country_id) FROM stdin;
    public          postgres    false    206   �9       L          0    29012    country 
   TABLE DATA           +   COPY public.country (id, name) FROM stdin;
    public          postgres    false    207   �9       M          0    29017    engine 
   TABLE DATA           ;   COPY public.engine (id, capacity, name, power) FROM stdin;
    public          postgres    false    208   Q:       N          0    29022    segment 
   TABLE DATA           +   COPY public.segment (id, name) FROM stdin;
    public          postgres    false    209   �:       O          0    29027 	   simplycar 
   TABLE DATA           7   COPY public.simplycar (id, company, model) FROM stdin;
    public          postgres    false    210   �:       P          0    29035    users 
   TABLE DATA           S   COPY public.users (id, fname, isactive, ismod, lname, login, password) FROM stdin;
    public          postgres    false    211   k;       X           0    0    hibernate_sequence    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hibernate_sequence', 148, true);
          public          postgres    false    202            �
           2606    28995    bodytype bodytype_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bodytype
    ADD CONSTRAINT bodytype_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bodytype DROP CONSTRAINT bodytype_pkey;
       public            postgres    false    203            �
           2606    29006    car_engines car_engines_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.car_engines
    ADD CONSTRAINT car_engines_pkey PRIMARY KEY (car_id, id);
 F   ALTER TABLE ONLY public.car_engines DROP CONSTRAINT car_engines_pkey;
       public            postgres    false    205    205            �
           2606    29001    car car_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    204            �
           2606    29011    company company_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    206            �
           2606    29016    country country_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    207            �
           2606    29021    engine engine_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.engine DROP CONSTRAINT engine_pkey;
       public            postgres    false    208            �
           2606    29026    segment segment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.segment
    ADD CONSTRAINT segment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.segment DROP CONSTRAINT segment_pkey;
       public            postgres    false    209            �
           2606    29034    simplycar simplycar_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.simplycar
    ADD CONSTRAINT simplycar_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.simplycar DROP CONSTRAINT simplycar_pkey;
       public            postgres    false    210            �
           2606    29043 %   bodytype uk_5c2cfrbiphv3fqb0o5ngg87ic 
   CONSTRAINT     `   ALTER TABLE ONLY public.bodytype
    ADD CONSTRAINT uk_5c2cfrbiphv3fqb0o5ngg87ic UNIQUE (name);
 O   ALTER TABLE ONLY public.bodytype DROP CONSTRAINT uk_5c2cfrbiphv3fqb0o5ngg87ic;
       public            postgres    false    203            �
           2606    29045 $   company uk_gr8wykrvrs5hegko7im1ldtav 
   CONSTRAINT     e   ALTER TABLE ONLY public.company
    ADD CONSTRAINT uk_gr8wykrvrs5hegko7im1ldtav UNIQUE (foundation);
 N   ALTER TABLE ONLY public.company DROP CONSTRAINT uk_gr8wykrvrs5hegko7im1ldtav;
       public            postgres    false    206            �
           2606    29049 $   country uk_llidyp77h6xkeokpbmoy710d4 
   CONSTRAINT     _   ALTER TABLE ONLY public.country
    ADD CONSTRAINT uk_llidyp77h6xkeokpbmoy710d4 UNIQUE (name);
 N   ALTER TABLE ONLY public.country DROP CONSTRAINT uk_llidyp77h6xkeokpbmoy710d4;
       public            postgres    false    207            �
           2606    29051 #   engine uk_namnc97tmp37w2i7tg024ghgj 
   CONSTRAINT     ^   ALTER TABLE ONLY public.engine
    ADD CONSTRAINT uk_namnc97tmp37w2i7tg024ghgj UNIQUE (name);
 M   ALTER TABLE ONLY public.engine DROP CONSTRAINT uk_namnc97tmp37w2i7tg024ghgj;
       public            postgres    false    208            �
           2606    29047 $   company uk_niu8sfil2gxywcru9ah3r4ec5 
   CONSTRAINT     _   ALTER TABLE ONLY public.company
    ADD CONSTRAINT uk_niu8sfil2gxywcru9ah3r4ec5 UNIQUE (name);
 N   ALTER TABLE ONLY public.company DROP CONSTRAINT uk_niu8sfil2gxywcru9ah3r4ec5;
       public            postgres    false    206            �
           2606    29053 "   users uk_ow0gan20590jrb00upg3va2fn 
   CONSTRAINT     ^   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_ow0gan20590jrb00upg3va2fn UNIQUE (login);
 L   ALTER TABLE ONLY public.users DROP CONSTRAINT uk_ow0gan20590jrb00upg3va2fn;
       public            postgres    false    211            �
           2606    29041    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    211            �
           2606    29084 '   car_engines fk5g7obexpp0rxull3vf2n6ykd8    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_engines
    ADD CONSTRAINT fk5g7obexpp0rxull3vf2n6ykd8 FOREIGN KEY (car_id) REFERENCES public.car(id);
 Q   ALTER TABLE ONLY public.car_engines DROP CONSTRAINT fk5g7obexpp0rxull3vf2n6ykd8;
       public          postgres    false    2728    205    204            �
           2606    29064    car fk7coo9i18j692gp7loi29t13x9    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk7coo9i18j692gp7loi29t13x9 FOREIGN KEY (country_id) REFERENCES public.country(id);
 I   ALTER TABLE ONLY public.car DROP CONSTRAINT fk7coo9i18j692gp7loi29t13x9;
       public          postgres    false    207    204    2738            �
           2606    29089 #   company fkaa85rotlnir4w4xlj1nkilnws    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT fkaa85rotlnir4w4xlj1nkilnws FOREIGN KEY (country_id) REFERENCES public.country(id);
 M   ALTER TABLE ONLY public.company DROP CONSTRAINT fkaa85rotlnir4w4xlj1nkilnws;
       public          postgres    false    2738    207    206            �
           2606    29054    car fkd13v027rq2o2h6qdjg9abyfd1    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fkd13v027rq2o2h6qdjg9abyfd1 FOREIGN KEY (bodytype_id) REFERENCES public.bodytype(id);
 I   ALTER TABLE ONLY public.car DROP CONSTRAINT fkd13v027rq2o2h6qdjg9abyfd1;
       public          postgres    false    204    2724    203            �
           2606    29079 '   car_engines fkdfgqdjojb1m066epfdf5bf09j    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_engines
    ADD CONSTRAINT fkdfgqdjojb1m066epfdf5bf09j FOREIGN KEY (engine_id) REFERENCES public.engine(id);
 Q   ALTER TABLE ONLY public.car_engines DROP CONSTRAINT fkdfgqdjojb1m066epfdf5bf09j;
       public          postgres    false    205    208    2742            �
           2606    29069    car fkjqesahapdts5cr3daitkdphi4    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fkjqesahapdts5cr3daitkdphi4 FOREIGN KEY (segment_id) REFERENCES public.segment(id);
 I   ALTER TABLE ONLY public.car DROP CONSTRAINT fkjqesahapdts5cr3daitkdphi4;
       public          postgres    false    209    204    2746            �
           2606    29059    car fkjqp14dkmi2lh5kjavv4t0dkqy    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fkjqp14dkmi2lh5kjavv4t0dkqy FOREIGN KEY (company_id) REFERENCES public.company(id);
 I   ALTER TABLE ONLY public.car DROP CONSTRAINT fkjqp14dkmi2lh5kjavv4t0dkqy;
       public          postgres    false    2732    204    206            �
           2606    29074    car fknlbtuthvter81u8xoq66uo44x    FK CONSTRAINT     }   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fknlbtuthvter81u8xoq66uo44x FOREIGN KEY (author) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.car DROP CONSTRAINT fknlbtuthvter81u8xoq66uo44x;
       public          postgres    false    211    2752    204            H   C   x�3���H,I�HJL��0�NMI��0����M��24��t�/-82���؜3$��$���+F���  -�      I   �   x�]Ͻ� ��x�
c㙽SǬ�3�Rշ/?��2����LI����@��
1�b������"�����x<�����;�)5��\�2$�;��+�gNY�dUJ�i�d�Q�I��V���ֵ�v!|�,Z      J      x������ � �      K   _   x�˽
� @��އ	���A��� E�?���Z?�!�YSh1�
� �05�p�dA�L~�=hB�U�\Z�Pj�˚��<{�>­C�|W�      L   R   x�31���I�K�21�tO-�M̫�21�t+J�KN�21�.H���27��,I̩�27�*-.�L�242�t.�O,�c���� <��      M   8   x��0�4463�	5�
�47岰�422 �pZpYXr����9M�b���� 'x
A      N   &   x�37�t�27�t�27�t�27�t�27�t����� H1t      O   �   x�M��
�0Eg�c��GL��
�@�.��$ԍ���|~%`�r�^dB�ǘ+hա�:49��/�q��SF��m�
�=�yM�V�i���:ݶ��0'+e{M/���z89$���0q�E����d}����?;�:r      P   �  x�e�ێ�@E��;|�*���Al�(АN:�@�\J�~�tw��e���Z� `YL����JZ"~�ϼ`���A90T%'��� ������pͣ��._�X!�J��`t�$h"!������'�ˬz�k��L��Zs.}�ř#ޔ)H��l���jo�;�I6O����o:7�j�m�Y�H��=�(<XpKU�vц�|+8̸���U�{���hgB��4��!�d��c�zNW�"��ƒ�Ցֳd�!y�� 5h�TFE,�A#+R*���`	��ꓮ�=s�-���A�D��RU�
�;��#�8�ӟ(��#/��/-o�Z����AM
�����������K  ��{=ò���Ӽ�L�*x��n�Qw����g�K�H�[b�ܓ����G��&4��~w�"I�/�\��     