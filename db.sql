PGDMP     ,    #            
    z            rumahpc    14.5    14.5      +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16394    rumahpc    DATABASE     j   CREATE DATABASE rumahpc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE rumahpc;
                postgres    false                        3079    16395 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            /           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16406    category    TABLE     �   CREATE TABLE public.category (
    id character varying NOT NULL,
    category_name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16413    product_details    TABLE       CREATE TABLE public.product_details (
    id character varying NOT NULL,
    processor character varying NOT NULL,
    motherboard character varying,
    memory character varying NOT NULL,
    storage character varying NOT NULL,
    graphics character varying,
    casing character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    psu character varying,
    display character varying,
    product_id character varying
);
 #   DROP TABLE public.product_details;
       public         heap    postgres    false            �            1259    16420    products    TABLE     �  CREATE TABLE public.products (
    id character varying NOT NULL,
    product_name character varying NOT NULL,
    stock integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    price integer NOT NULL,
    details_id character varying,
    category_id character varying,
    image character varying[] DEFAULT '{}'::character varying[]
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16427    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    role_name character varying NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16432    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    213            0           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    214            �            1259    16433    users    TABLE     �  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    phone character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    role_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            �           2604    16441    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            #          0    16406    category 
   TABLE DATA           M   COPY public.category (id, category_name, created_at, updated_at) FROM stdin;
    public          postgres    false    210   �)       $          0    16413    product_details 
   TABLE DATA           �   COPY public.product_details (id, processor, motherboard, memory, storage, graphics, casing, created_at, updated_at, psu, display, product_id) FROM stdin;
    public          postgres    false    211   P*       %          0    16420    products 
   TABLE DATA           z   COPY public.products (id, product_name, stock, created_at, updated_at, price, details_id, category_id, image) FROM stdin;
    public          postgres    false    212   �/       &          0    16427    roles 
   TABLE DATA           F   COPY public.roles (id, created_at, updated_at, role_name) FROM stdin;
    public          postgres    false    213   �1       (          0    16433    users 
   TABLE DATA           f   COPY public.users (id, username, email, phone, password, created_at, updated_at, role_id) FROM stdin;
    public          postgres    false    215   2       1           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    214            �           2606    16443 '   products PK_0806c755e0aca124e67c0cf6d7d 
   CONSTRAINT     g   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d";
       public            postgres    false    212            �           2606    16445 '   category PK_9c4e4a89e3674fc9f382d733f03 
   CONSTRAINT     g   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9c4e4a89e3674fc9f382d733f03" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.category DROP CONSTRAINT "PK_9c4e4a89e3674fc9f382d733f03";
       public            postgres    false    210            �           2606    16447 .   product_details PK_a3fa8e2e94f3c37a8d731451de4 
   CONSTRAINT     n   ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT "PK_a3fa8e2e94f3c37a8d731451de4" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.product_details DROP CONSTRAINT "PK_a3fa8e2e94f3c37a8d731451de4";
       public            postgres    false    211            �           2606    16449 $   users PK_a3ffb1c0c8416b9fc6f907b7433 
   CONSTRAINT     d   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433";
       public            postgres    false    215            �           2606    16451 $   roles PK_c1433d71a4838793a49dcad46ab 
   CONSTRAINT     d   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "PK_c1433d71a4838793a49dcad46ab" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.roles DROP CONSTRAINT "PK_c1433d71a4838793a49dcad46ab";
       public            postgres    false    213            �           2606    16453 $   users UQ_97672ac88f789774dd47f7c8be3 
   CONSTRAINT     b   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3";
       public            postgres    false    215            �           2606    16533 .   product_details UQ_abbb591b1989c63fb0c240dfffb 
   CONSTRAINT     q   ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT "UQ_abbb591b1989c63fb0c240dfffb" UNIQUE (product_id);
 Z   ALTER TABLE ONLY public.product_details DROP CONSTRAINT "UQ_abbb591b1989c63fb0c240dfffb";
       public            postgres    false    211            �           2606    16481 '   products UQ_ed62372001b7ea7b0a14cf12fac 
   CONSTRAINT     j   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "UQ_ed62372001b7ea7b0a14cf12fac" UNIQUE (details_id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "UQ_ed62372001b7ea7b0a14cf12fac";
       public            postgres    false    212            �           2606    16487 '   products FK_9a5f6868c96e0069e699f33e124    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_9a5f6868c96e0069e699f33e124" FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_9a5f6868c96e0069e699f33e124";
       public          postgres    false    3205    212    210            �           2606    16492 $   users FK_a2cecd1a3531c0b041e29ba46e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_a2cecd1a3531c0b041e29ba46e1" FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "FK_a2cecd1a3531c0b041e29ba46e1";
       public          postgres    false    3215    215    213            �           2606    16544 .   product_details FK_abbb591b1989c63fb0c240dfffb    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT "FK_abbb591b1989c63fb0c240dfffb" FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.product_details DROP CONSTRAINT "FK_abbb591b1989c63fb0c240dfffb";
       public          postgres    false    212    3211    211            �           2606    16482 '   products FK_ed62372001b7ea7b0a14cf12fac    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_ed62372001b7ea7b0a14cf12fac" FOREIGN KEY (details_id) REFERENCES public.product_details(id);
 S   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK_ed62372001b7ea7b0a14cf12fac";
       public          postgres    false    3207    212    211            #   O   x�s�t��-(-I-�4202�54�50S04�24�26�3�4673�60�/����XP�_����@������H�\1z\\\ �)k      $   }  x����n�FƯ��8��
�`�_�p7Ǝc�K�텗�5�#C�I��$}�>D�O�3c����E�1�9��;߱"4����|�QU���}�!��lݼ��#�+��}�u	ԃķ�,�DE�;I ��}QC��R��,gd�p���!#��!$�ͨ��a�^�w!x*��b�œ�����c���
��?�,�f������ga��?W���4_'� �
>ϱFO����f{~8�'X�ʗ#��)�(2wȥ�8J�w�mWi�p�dH�^e�xB�JWR��=xfO;��j�ZZ&�"�Jv�#`�s���g��UYZ�~����,`)�bEa<nX��)̦y8�Ag�3�����q�X@�0	�0A��F���%��]Ym!]�#qa��h�� ��U�K���D\���5D6d�Px6��Ǥ^UHe�de�)w�>~�f0�3���;x���[���s�n��.A�g��B��T�3䨔�m<��|:	�?�.�q�v��Q�\�;�	@�9+����<�&��.כ��#�FŮ��y>Oda��6�fü!ql��@.�p�D�1��Ͳ9��?BiJ�X�,�����[�F�+w��+�!�F"��� �|*}��m/�|�:9(��[z���F�Tm�U�b����`��ܦ=Ȱ-y��,H�͂��B����;H�tvb���n}�(�����6����F�G�C�]��P�7ɝ!Ŝl �*���X}�,Z���j��9gY?�%t<r���F"���2�~����H"�V��(�<W��Jv{��b��y]����c�h����tU�xr�Zz�D-|;ʥ�Uل3���C��!t'th�}����F�6�uSds���5����>�m}�q�;��==>����F�;L`l*�Ec���خp��Ն���ߘbu��)枆�i��i��J _�eq��1l4�6G-I�O��'��5Y�A�О��G'�v,ʌ��&.�]V%�����7���7���q��.\c�t耑gJ<�EP� ����+�ј�g0+��,$�T.G�`�#C�
���k�g-����4�ci<Y�pW��1S_ò���Ѵ����y��9�}��y͉�'	z��a)0/������'��P.���7`q�yv�k؀a���&y6B*��K�p�ހ8}�鵩	^k��n��q�����2,"GZ8?��b@�����{�h�X� ��hdE	L�!v�.�-�ȱF���?�����wS(1�bh��ݮ�1�mt�)��"�~��א?�+�+�	l���	=�d�}�k�?:�V\s�~�GD#�s�;��)_R/����X�*9C%�ʡt��mL�g��yz�s1���~:����`_]]�z��      %   �  x�m�Mo�@���W�=�jfvf�n�ȩ�(��&��֊vrH���; N��/�R�bs����W��z�6��
E�~��/��q	�Q��d�#�x�l*.Y4�X駈0\��R���wQ�U��u��omٶOzݵ��2��P����Qo��t��!	����8i��@j}9�V=m�U��v/���ݤ����8&�&���%�	��iH�e�Jg��K�4u7}�	�	�$�'�C1�c,1�0�c7U�o�	{�bT�ɚ��x9�l��qQ��~�2Bv�x&�e��ܾ� c=z����!3��	��T��bH@FBp�P^���n���yW�c���>����������w��	#�99q�0X7�dl N}'u[7�[�����n�I��1�4�x�XqVg�Y���bG���O�X,��~��      &   I   x�3�4202�54�50T04�20�21�3���46�60' ������e����X�������(��ũE\1z\\\ }�      (     x�}�OO�@��s�)8p3����t�=������x韥VD,Z�|z�Ƙ�L�\~o�pΙ@�(p	F����R(rK�\�ཹ�ٵ���a}V���I曵���Π��YWA��=Ǹ�:Mh��&�� �7����i��.9M���p�4�l�V��Ak�� �Q*Ra��D@� ��([��*_s�H�,�8�B�	D�ٜ��E��_�E�rI=���l��iӿ|ٯ&��fx[W�Oۻ�,~�m<�c{>�-���E�ђ�Qq�P*&�|P�^���	�i�     