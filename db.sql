PGDMP                         |         
   maltdrinks    15.1    15.1 K    _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    57977 
   maltdrinks    DATABASE     ~   CREATE DATABASE maltdrinks WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE maltdrinks;
                postgres    false            �            1259    57990    bankaccounts    TABLE     �   CREATE TABLE public.bankaccounts (
    id integer NOT NULL,
    manufacturers_id integer,
    amount numeric,
    numberofaccount character varying(16)
);
     DROP TABLE public.bankaccounts;
       public         heap    postgres    false            �            1259    57989    bankaccounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bankaccounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.bankaccounts_id_seq;
       public          postgres    false    217            c           0    0    bankaccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.bankaccounts_id_seq OWNED BY public.bankaccounts.id;
          public          postgres    false    216            �            1259    58112    cart    TABLE     a   CREATE TABLE public.cart (
    customer_id integer,
    amount integer,
    recipe_id integer
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    58056 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    telephone character varying(20),
    namecompany character varying(50),
    inn character varying(9),
    login character varying(50),
    password character varying(50)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    58055    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    223            d           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    222            �            1259    57979    manufacturers    TABLE     �   CREATE TABLE public.manufacturers (
    manufacturer_id integer NOT NULL,
    namecompany character varying(50),
    inn character varying(9),
    login character varying(50),
    password character varying(50)
);
 !   DROP TABLE public.manufacturers;
       public         heap    postgres    false            �            1259    57978 "   manufacturers_manufacturers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.manufacturers_manufacturers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.manufacturers_manufacturers_id_seq;
       public          postgres    false    215            e           0    0 "   manufacturers_manufacturers_id_seq    SEQUENCE OWNED BY     h   ALTER SEQUENCE public.manufacturers_manufacturers_id_seq OWNED BY public.manufacturers.manufacturer_id;
          public          postgres    false    214            �            1259    66179    metadata    TABLE     ]   CREATE TABLE public.metadata (
    recipe_id integer NOT NULL,
    path character varying
);
    DROP TABLE public.metadata;
       public         heap    postgres    false            �            1259    58067    orders    TABLE     �   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    amount integer,
    delivery_date date,
    price integer,
    recipe_id integer,
    order_date date
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    58066    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    225            f           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    224            �            1259    58013    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying,
    unitprice numeric,
    type character varying
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    58012    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    221            g           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    220            �            1259    58004    recipes    TABLE     �   CREATE TABLE public.recipes (
    recipe_id integer NOT NULL,
    name character varying,
    description character varying(250),
    manufacturer_id integer
);
    DROP TABLE public.recipes;
       public         heap    postgres    false            �            1259    66186    recipes_products    TABLE     t   CREATE TABLE public.recipes_products (
    recipe_id integer,
    product_id integer,
    amount_product integer
);
 $   DROP TABLE public.recipes_products;
       public         heap    postgres    false            �            1259    58003    recipes_recipe_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recipes_recipe_id_seq;
       public          postgres    false    219            h           0    0    recipes_recipe_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes.recipe_id;
          public          postgres    false    218            �            1259    58084    sklad    TABLE     g   CREATE TABLE public.sklad (
    manufacturer_id integer,
    product_id integer,
    amount integer
);
    DROP TABLE public.sklad;
       public         heap    postgres    false            �            1259    66213    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    banned boolean DEFAULT false,
    banreason character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    66212    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    231            i           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    230            �           2604    57993    bankaccounts id    DEFAULT     r   ALTER TABLE ONLY public.bankaccounts ALTER COLUMN id SET DEFAULT nextval('public.bankaccounts_id_seq'::regclass);
 >   ALTER TABLE public.bankaccounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    58059    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    57982    manufacturers manufacturer_id    DEFAULT     �   ALTER TABLE ONLY public.manufacturers ALTER COLUMN manufacturer_id SET DEFAULT nextval('public.manufacturers_manufacturers_id_seq'::regclass);
 L   ALTER TABLE public.manufacturers ALTER COLUMN manufacturer_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    58070    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    58016    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    58007    recipes recipe_id    DEFAULT     v   ALTER TABLE ONLY public.recipes ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);
 @   ALTER TABLE public.recipes ALTER COLUMN recipe_id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    66216    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            N          0    57990    bankaccounts 
   TABLE DATA           U   COPY public.bankaccounts (id, manufacturers_id, amount, numberofaccount) FROM stdin;
    public          postgres    false    217   �V       X          0    58112    cart 
   TABLE DATA           >   COPY public.cart (customer_id, amount, recipe_id) FROM stdin;
    public          postgres    false    227   ]W       T          0    58056 	   customers 
   TABLE DATA           ^   COPY public.customers (customer_id, telephone, namecompany, inn, login, password) FROM stdin;
    public          postgres    false    223   �W       L          0    57979    manufacturers 
   TABLE DATA           [   COPY public.manufacturers (manufacturer_id, namecompany, inn, login, password) FROM stdin;
    public          postgres    false    215   X       Y          0    66179    metadata 
   TABLE DATA           3   COPY public.metadata (recipe_id, path) FROM stdin;
    public          postgres    false    228   �X       V          0    58067    orders 
   TABLE DATA           l   COPY public.orders (order_id, customer_id, amount, delivery_date, price, recipe_id, order_date) FROM stdin;
    public          postgres    false    225   �Y       R          0    58013    products 
   TABLE DATA           E   COPY public.products (product_id, name, unitprice, type) FROM stdin;
    public          postgres    false    221   �Z       P          0    58004    recipes 
   TABLE DATA           P   COPY public.recipes (recipe_id, name, description, manufacturer_id) FROM stdin;
    public          postgres    false    219   \       Z          0    66186    recipes_products 
   TABLE DATA           Q   COPY public.recipes_products (recipe_id, product_id, amount_product) FROM stdin;
    public          postgres    false    229   �_       W          0    58084    sklad 
   TABLE DATA           D   COPY public.sklad (manufacturer_id, product_id, amount) FROM stdin;
    public          postgres    false    226   >a       \          0    66213    users 
   TABLE DATA           G   COPY public.users (id, email, password, banned, banreason) FROM stdin;
    public          postgres    false    231   |a       j           0    0    bankaccounts_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bankaccounts_id_seq', 4, true);
          public          postgres    false    216            k           0    0    customers_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customer_id_seq', 5, true);
          public          postgres    false    222            l           0    0 "   manufacturers_manufacturers_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.manufacturers_manufacturers_id_seq', 4, true);
          public          postgres    false    214            m           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 51, true);
          public          postgres    false    224            n           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 23, true);
          public          postgres    false    220            o           0    0    recipes_recipe_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 50, true);
          public          postgres    false    218            p           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    230            �           2606    57997    bankaccounts bankaccounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bankaccounts
    ADD CONSTRAINT bankaccounts_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.bankaccounts DROP CONSTRAINT bankaccounts_pkey;
       public            postgres    false    217            �           2606    58063    customers customers_inn_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_inn_key UNIQUE (inn);
 E   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_inn_key;
       public            postgres    false    223            �           2606    58065    customers customers_login_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_login_key UNIQUE (login);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_login_key;
       public            postgres    false    223            �           2606    58061    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    223            �           2606    57986 #   manufacturers manufacturers_inn_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_inn_key UNIQUE (inn);
 M   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_inn_key;
       public            postgres    false    215            �           2606    57988 %   manufacturers manufacturers_login_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_login_key UNIQUE (login);
 O   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_login_key;
       public            postgres    false    215            �           2606    57984     manufacturers manufacturers_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (manufacturer_id);
 J   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_pkey;
       public            postgres    false    215            �           2606    66185    metadata metadata_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (recipe_id);
 @   ALTER TABLE ONLY public.metadata DROP CONSTRAINT metadata_pkey;
       public            postgres    false    228            �           2606    58072    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    58020    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    221            �           2606    58011    recipes recipes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);
 >   ALTER TABLE ONLY public.recipes DROP CONSTRAINT recipes_pkey;
       public            postgres    false    219            �           2606    66223    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    231            �           2606    66221    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231            �           2606    57998 /   bankaccounts bankaccounts_manufacturers_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bankaccounts
    ADD CONSTRAINT bankaccounts_manufacturers_id_fkey FOREIGN KEY (manufacturers_id) REFERENCES public.manufacturers(manufacturer_id);
 Y   ALTER TABLE ONLY public.bankaccounts DROP CONSTRAINT bankaccounts_manufacturers_id_fkey;
       public          postgres    false    3232    215    217            �           2606    58115    cart cart_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_customer_id_fkey;
       public          postgres    false    227    3244    223            �           2606    66174    cart fk_cart_recipes    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_recipes FOREIGN KEY (recipe_id) REFERENCES public.recipes(recipe_id);
 >   ALTER TABLE ONLY public.cart DROP CONSTRAINT fk_cart_recipes;
       public          postgres    false    219    227    3236            �           2606    58078    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    223    225    3244            �           2606    66194 1   recipes_products recipes_products_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipes_products
    ADD CONSTRAINT recipes_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 [   ALTER TABLE ONLY public.recipes_products DROP CONSTRAINT recipes_products_product_id_fkey;
       public          postgres    false    221    229    3238            �           2606    66189 0   recipes_products recipes_products_recipe_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipes_products
    ADD CONSTRAINT recipes_products_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(recipe_id);
 Z   ALTER TABLE ONLY public.recipes_products DROP CONSTRAINT recipes_products_recipe_id_fkey;
       public          postgres    false    3236    219    229            �           2606    58090 !   sklad sklad_manufacturers_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sklad
    ADD CONSTRAINT sklad_manufacturers_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(manufacturer_id);
 K   ALTER TABLE ONLY public.sklad DROP CONSTRAINT sklad_manufacturers_id_fkey;
       public          postgres    false    226    215    3232            �           2606    58095    sklad sklad_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sklad
    ADD CONSTRAINT sklad_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 E   ALTER TABLE ONLY public.sklad DROP CONSTRAINT sklad_product_id_fkey;
       public          postgres    false    226    221    3238            N   T   x�̱�0C���a!��K��#8����˖A�#�lf����pLs��($=-m"�U={/N��_ퟕ�w� ��*      X      x�3�4�44�2Qf@ʔ�Ȕ+F��� .V]      T   r   x�E�;�PF�zf��0/����DJ�pc��'��?�<�'$j�0�����/��喓�u=�����v����8�ᦒ`�ـ(�s6` �N� �9p 砂 9��留O8kBv      L   �   x�UϽ��0�9������]\\
:�K&*�M���$8T\�K����^Û;2�s���f����<�kd��-J\P�%r�:ؘg��.a�����#�$N&u5꩏QF��Sv(����r�	W�ҩKB?!��#ͩ��aC����Qne�`��(t���O��m�k]_pY�a I+VS��BD�[{7+qrp��^�s�.�AUpVc��G���"ڭPJ�
a�E      Y   �   x�m�;�0Eњ,&��{�ABb����k�y.o���vt����<ޣ>�{����*
"��G�H��&���1'�ɸ�_øn�}20�f#�f�<9�yV��`�<ʋ�G��D��<r��}\}���3��      V     x�e�ˑ� C�v/��z���X����<�$�JJF&��e�|h'�-	�Z�^b�[�I��?��&��� �IP�ʠ�Z��츟����"=7	� P~�!�J�¨~8�u��5�=U-hN�Z�:����Z���`�r����8�8� ���~��ϳ)t�XM�%���ԝu��y[��M�|�2Ʌ�^�^(�u��n	�s�*3~r�Rp�e�QԩO�j�򾡹��]�Tr�/�q]�G���=knY��f�Ā�      R   b  x��SAN�@<;���n���IZHT
��� '8�)�Ҥ�~��c� @l$E��{���ϼ�w��b�{�q�+�	��[����=.�e�/ql��'4�&�OH�#B�}C�(��%�'��Ή��Z2���^�൒\�)x��{�������܆,�,ƺU��<���)J���`k��N
��cm~��[��+䐛�]��(�~
]ȴO@��e����#��ɦ���Qk%F�ҿ�h�`�K]���c�f ��� 2�a�3g�� 毸�5���'cф����{D*��A��%�_�a��/�TXD}�Pg�e`��#��Vp���Ɖ�Ԃ��8l����(�> N��      P   �  x��Vmn�@�m��0vB�w�0I��(�A�GP���iN�8W��of�k��B�~��ݙ7o��ly􁶔���Q�^Q���h�)���vT�k+���W�'t�ͧ�V��N-����%5�JB9e��8�����w�|�S�>�u�y��}�k.�ط�Xc��+� u�^�&��ݍ���Vs5U/p��l	.Ӏ����]���G^�Gc����,O;��,G��y��г�[�.��ۂ_V�1 ���2��Y��q�G��q�0;7�7q^��bna����)3US�����@$ ��]R�Cx�~��չD����ˏ����=��9k��ѕI�I{,�	+�#!�=�y.4VBIyg�N�����w��O/Dpĵ�ș��bOƱu��	,�Z����	���*^�:*6�%�OV&	ra�߶�b��\���6@͒SMw�%P��G"���M���M��Z��<�x5��ZWsh��a*�d6gEƏ=��/$&�O6��)���ݗ�%'X{+�%Z�d�!����_�4�O�.�e��fg2,�=0�q��ϐM�!I�8Z��#9^�7�����+u.����M�BR���YT��m��ݠ�fw����i0��U�?t�тY��w"�5:�������n���f.��UT��d���R���kȧ��;�v$w�@��Gk<�iWY؆i봯��G� ��9�^5�p];ڤN�B����A!�ǭ�S���R�T�Ou�˸�\`�lCY�mv�zx&�ED}�,w���<X�VZC��r��b
�;vV*��aYwS��E,��*���c���lچ5�<"��M&��-n��o�qj%��-3�~���"ۺ���O���1�U����6��};�G����ڥc      Z   }  x�=Rˑ@1:��ى�o/�+�{
c$�AUT����h�)�\���C֧
�)��-Ɩ��0�E<��.W&O��C�ٜ	�E��W�� F� �<��j��].ϙ�q��b,�ݒ�FP��ڴ�T�Sz��ӊ�KP�#�Z��b�/Z� �1@�\��8_�{����x��,@� ���}6� ܗW�^ �P(�+�1FD	f>�9�if����Oƌ8Ap�&����aCLt�� �O����_�Yk�Yi�Y��Փiu��J�����V��x��v��v�!*x �6���i���N�4*��$����fݶw����r�{�_/���_��U� r#/��|z'�G��G��W�����̨����}��؛�      W   .   x�3�4�4650�2�4��HcÐ���3@,N3#F��� b�	�      \      x������ � �     