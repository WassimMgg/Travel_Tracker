PGDMP         
                |            World    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    World    DATABASE     �   CREATE DATABASE "World" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE "World";
                postgres    false            �            1259    16440 	   countries    TABLE     �   CREATE TABLE public.countries (
    id integer NOT NULL,
    country_code character varying(3),
    country_name character varying(100)
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16439    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    217                       0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    216            �            1259    16431    visited_countries    TABLE     j   CREATE TABLE public.visited_countries (
    id integer NOT NULL,
    country_code character varying(3)
);
 %   DROP TABLE public.visited_countries;
       public         heap    postgres    false            �            1259    16430    visited_countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visited_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.visited_countries_id_seq;
       public          postgres    false    215            	           0    0    visited_countries_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.visited_countries_id_seq OWNED BY public.visited_countries.id;
          public          postgres    false    214            k           2604    16443    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            j           2604    16434    visited_countries id    DEFAULT     |   ALTER TABLE ONLY public.visited_countries ALTER COLUMN id SET DEFAULT nextval('public.visited_countries_id_seq'::regclass);
 C   ALTER TABLE public.visited_countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    16440 	   countries 
   TABLE DATA           C   COPY public.countries (id, country_code, country_name) FROM stdin;
    public          postgres    false    217   �       �          0    16431    visited_countries 
   TABLE DATA           =   COPY public.visited_countries (id, country_code) FROM stdin;
    public          postgres    false    215          
           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 1, false);
          public          postgres    false    216                       0    0    visited_countries_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.visited_countries_id_seq', 32, true);
          public          postgres    false    214            o           2606    16445    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    217            m           2606    16436 (   visited_countries visited_countries_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.visited_countries DROP CONSTRAINT visited_countries_pkey;
       public            postgres    false    215               e
  x�UX˖������Z����CTDA
��t�I�Q�6��6�����cw��|���}��O�EΌ��Ǔ�UU�ܰ����L�sQ���!g	���K�-�Q� =rr�xދ�LĹF��)9��(Ka�Y�LCr�ܨhD��Z��_�=9Ա&��X��������(���b |����G�f��.9kr��.E�k��������,wB��Q�%)%�0��,�oF����"kH���$΢2���J��{O��c&�:�E�11_q(*öi�Dc������etT�ٰ�4�2RoҰ{4~ �y�>�S���W4.2��6�8@ΫY�e�&��{��G,�ի ���y��-�F�b��MeFǦ��jU�̍*�*��t����E~P�j/�o*K���jtp�/5�T��X�L��N����(��hX>��9Uatp���lt���i"λ���h0�eQ�F��&`.�]�&��47�<H�k����,>�w;4��i����6+cyiv���.�S������h�ģʰU�&!?�{��}������w3qb�4�IL�EbƜ��+
�^_����خD9!u�c��	&�|_T�/����yϦ�
�Yq�qYuȇ+�sQ"�z]��7����|�W'Q�oF��a/�?��Y4���Z���,^
UJ��C�yY����9�4�r���p���i��-M����鲾ES��2?�����4}��/�+�Z�M�g��?��������r���4�}r=r��Km�Q�r3t��]����?�TS��ר\b��1���hpO�KnU��)��I�6�|����k3��T}3���FY���4{�����A�f<�:p�>�b��"�Kc0 o sx	Ը�C�>lQ�]sY1���;�򳊔���=yyb�lZ�x�������	73*��Wc�%oNމy�#oA��!��G�a����RJP��R��Cxv�X�pD^DB"��A��̚gc.)?��,�S������y!��2���m��	cZO�]��O���!�KQt��"٧Ќ��qP~��L�4�6�֩4Q5,5}3F#��\�����|O�5͛]�
h�"��^�C[�H���/���Ld��톕Y��k�]������a�wi1%���+z��i�,��ٞ��#������/���-\<�s�" |%���@�)-j��2��!���A��Cx�/v���Y��-��Ê���zL)(�C�����ߒ/���I+�}�]�e~�et���T;xxD~D~�z2�¢�Oߠ�����F��l��$�yE��y=������n��2Mc�.-7�5K��[�i)1<�c�r��*�S8�eLK��ӄ�[>1d��� ��yUK��y[�0֧F��o�rM��O	i�#,6>�ey�����q��V�(�=�Ƃ���d�n��O]u�b���A��f-�� �]��h��̟BR~�y��`P�Yg�G�[P���1ʨ?�� ��Ach��7�j��.=��ע��p�����ÇЯ`�4ȅF
BF��^ �2���7@3і
�H ������,���*��q7�!O�}f�A�B�B�NY]
c@�:@�By@��% ����!FN��d�ȗe�[HS8�ګ9Y=Gn�q+E[P��pA!��a�(ta�P
`S�@} ��s@��!�ٻh�
wF�K�[t��&���A����
� 4k��̙��|��s;:[P��8C� K�����l�<��[>̭ZТ�	v}l�\�$�B�)�.�.P�(�H�{�J�`��{sd����W��)'��C?+�͉W�6� ;�bLp<��Z��Р��b̔��Р������0�֧���t!Gɼ]�T�I�!K~x����+��C��p h�rr[\6{M);�m��yw�� :�+
nE
Y��gg�َh��<F@�F+w��p�	�w���m�s�	*�8�4e:�Й�Kp�v.�.��?��%�Myݟd��к^b��\Jhlq<� O�U����d���z�%��uƆ�%cJx,>G[���`>닍]ۂ-w�۠�9��nÃvҺ@0f�W�~n����4,+6�΅���t.�-���3��3��Wq� ����<P�"pW�i��v�U~9
�/�R���.@��0 ��)�o��zU�[�"`B�(�ra��|��;m��w0�?R*�+k�����m�e��~�[��P�tK�&�P�s�s�W�����ғx�
1Iߌ 0@{�dn����M�p/(i�Da�_AB�%�
�o?4q:�z���J}<?K�64]"g @;�.V��4-vB�!��YX�l�i�Ϙlhih�������t�mmMN0q�gd���� h@Z����ؐյC�g��>t�q��1��x��m0���p_9
\|������1{���`�O� ����4WM�]��vZ?Ѻlt��!��-��v�=��͚6"��
����KT��}����#ƈy�F�I�yA��#7�t�qF��s��o��������9�%�9䄶k��\z�g�n��6�m;��P��#m�y'v�h��D	�`7�ￆa�� �      �   1   x�32�t�2��t��2����26����26�tv�26������ ��'     