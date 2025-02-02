PGDMP     	    #            
    y            Libreria    13.4    14.0 @               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24662    Libreria    DATABASE     f   CREATE DATABASE "Libreria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Libreria";
                postgres    false                        2615    24663    libreria    SCHEMA        CREATE SCHEMA libreria;
    DROP SCHEMA libreria;
                postgres    false            �            1259    24694    Persona    TABLE     1  CREATE TABLE libreria."Persona" (
    "RFC" character varying(13) NOT NULL,
    nombre_persona character varying(50) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50) NOT NULL,
    "CP" numeric(5,0) NOT NULL,
    direccion character varying(255)
);
    DROP TABLE libreria."Persona";
       libreria         heap    postgres    false    4            �            1259    24704    Autor    TABLE     A   CREATE TABLE libreria."Autor" (
)
INHERITS (libreria."Persona");
    DROP TABLE libreria."Autor";
       libreria         heap    postgres    false    4    205            �            1259    24664 	   Categoria    TABLE     ~   CREATE TABLE libreria."Categoria" (
    categoria_id integer NOT NULL,
    nombre_categoria character varying(50) NOT NULL
);
 !   DROP TABLE libreria."Categoria";
       libreria         heap    postgres    false    4            �            1259    24674    Ciudad    TABLE     �   CREATE TABLE libreria."Ciudad" (
    ciudad_id integer NOT NULL,
    nombre_ciudad character varying(50) NOT NULL,
    pais_id integer NOT NULL
);
    DROP TABLE libreria."Ciudad";
       libreria         heap    postgres    false    4            �            1259    24714    Cliente    TABLE     �   CREATE TABLE libreria."Cliente" (
    email_cliente character varying(100) NOT NULL,
    telefono_cliente character varying(15) NOT NULL
)
INHERITS (libreria."Persona");
    DROP TABLE libreria."Cliente";
       libreria         heap    postgres    false    4    205            �            1259    24732 	   Editorial    TABLE     �   CREATE TABLE libreria."Editorial" (
    nombre_editorial character varying(60) NOT NULL,
    telefono_editorial numeric(15,0) NOT NULL,
    "CP" numeric(5,0) NOT NULL
);
 !   DROP TABLE libreria."Editorial";
       libreria         heap    postgres    false    4            �            1259    24709 	   Encargado    TABLE     E   CREATE TABLE libreria."Encargado" (
)
INHERITS (libreria."Persona");
 !   DROP TABLE libreria."Encargado";
       libreria         heap    postgres    false    205    4            �            1259    24722    Factura    TABLE     �   CREATE TABLE libreria."Factura" (
    factura_id integer NOT NULL,
    "RFC" character varying(13) NOT NULL,
    fecha_compra date NOT NULL
);
    DROP TABLE libreria."Factura";
       libreria         heap    postgres    false    4            �            1259    24809    Factura_Libro    TABLE     �   CREATE TABLE libreria."Factura_Libro" (
    factura_id integer NOT NULL,
    "ISBN" numeric(13,0) NOT NULL,
    cantidad_libro integer NOT NULL
);
 %   DROP TABLE libreria."Factura_Libro";
       libreria         heap    postgres    false    4            �            1259    24801    Historial_precios    TABLE     �   CREATE TABLE libreria."Historial_precios" (
    "ISBN" numeric(13,0) NOT NULL,
    precio_antiguo numeric(10,2) NOT NULL,
    precio_nuevo numeric(10,2) NOT NULL,
    fecha_modificacion date NOT NULL
);
 )   DROP TABLE libreria."Historial_precios";
       libreria         heap    postgres    false    4            �            1259    24742    Libreria    TABLE     �   CREATE TABLE libreria."Libreria" (
    libreria_id integer NOT NULL,
    telefono numeric(15,0) NOT NULL,
    "RFC" character varying(13) NOT NULL,
    "CP" numeric(5,0) NOT NULL,
    direccion character varying(255) NOT NULL
);
     DROP TABLE libreria."Libreria";
       libreria         heap    postgres    false    4            �            1259    24781    Libreria_libro    TABLE     �   CREATE TABLE libreria."Libreria_libro" (
    libreria_id integer NOT NULL,
    "ISBN" numeric(13,0) NOT NULL,
    stock integer NOT NULL
);
 &   DROP TABLE libreria."Libreria_libro";
       libreria         heap    postgres    false    4            �            1259    24757    Libro    TABLE     {  CREATE TABLE libreria."Libro" (
    "ISBN" numeric(13,0) NOT NULL,
    "RFC" character varying(13) NOT NULL,
    nombre_editorial character varying(60) NOT NULL,
    anio numeric(4,0) NOT NULL,
    titulo character varying(255) NOT NULL,
    precio numeric(10,2) NOT NULL,
    categoria_id integer NOT NULL,
    CONSTRAINT ck_precio_mayor_cero CHECK ((precio > (0)::numeric))
);
    DROP TABLE libreria."Libro";
       libreria         heap    postgres    false    4            �            1259    24684 	   Municipio    TABLE     �   CREATE TABLE libreria."Municipio" (
    "CP" numeric(5,0) NOT NULL,
    nombre_municipio character varying(50) NOT NULL,
    ciudad_id integer NOT NULL
);
 !   DROP TABLE libreria."Municipio";
       libreria         heap    postgres    false    4            �            1259    24669    Pais    TABLE     o   CREATE TABLE libreria."Pais" (
    pais_id integer NOT NULL,
    nombre_pais character varying(50) NOT NULL
);
    DROP TABLE libreria."Pais";
       libreria         heap    postgres    false    4                      0    24704    Autor 
   TABLE DATA           o   COPY libreria."Autor" ("RFC", nombre_persona, apellido_paterno, apellido_materno, "CP", direccion) FROM stdin;
    libreria          postgres    false    206   �N                 0    24664 	   Categoria 
   TABLE DATA           G   COPY libreria."Categoria" (categoria_id, nombre_categoria) FROM stdin;
    libreria          postgres    false    201   O       
          0    24674    Ciudad 
   TABLE DATA           G   COPY libreria."Ciudad" (ciudad_id, nombre_ciudad, pais_id) FROM stdin;
    libreria          postgres    false    203   9O                 0    24714    Cliente 
   TABLE DATA           �   COPY libreria."Cliente" ("RFC", nombre_persona, apellido_paterno, apellido_materno, "CP", direccion, email_cliente, telefono_cliente) FROM stdin;
    libreria          postgres    false    208   VO                 0    24732 	   Editorial 
   TABLE DATA           S   COPY libreria."Editorial" (nombre_editorial, telefono_editorial, "CP") FROM stdin;
    libreria          postgres    false    210   sO                 0    24709 	   Encargado 
   TABLE DATA           s   COPY libreria."Encargado" ("RFC", nombre_persona, apellido_paterno, apellido_materno, "CP", direccion) FROM stdin;
    libreria          postgres    false    207   �O                 0    24722    Factura 
   TABLE DATA           F   COPY libreria."Factura" (factura_id, "RFC", fecha_compra) FROM stdin;
    libreria          postgres    false    209   �O                 0    24809    Factura_Libro 
   TABLE DATA           O   COPY libreria."Factura_Libro" (factura_id, "ISBN", cantidad_libro) FROM stdin;
    libreria          postgres    false    215   �O                 0    24801    Historial_precios 
   TABLE DATA           i   COPY libreria."Historial_precios" ("ISBN", precio_antiguo, precio_nuevo, fecha_modificacion) FROM stdin;
    libreria          postgres    false    214   �O                 0    24742    Libreria 
   TABLE DATA           U   COPY libreria."Libreria" (libreria_id, telefono, "RFC", "CP", direccion) FROM stdin;
    libreria          postgres    false    211   P                 0    24781    Libreria_libro 
   TABLE DATA           H   COPY libreria."Libreria_libro" (libreria_id, "ISBN", stock) FROM stdin;
    libreria          postgres    false    213   !P                 0    24757    Libro 
   TABLE DATA           h   COPY libreria."Libro" ("ISBN", "RFC", nombre_editorial, anio, titulo, precio, categoria_id) FROM stdin;
    libreria          postgres    false    212   >P                 0    24684 	   Municipio 
   TABLE DATA           J   COPY libreria."Municipio" ("CP", nombre_municipio, ciudad_id) FROM stdin;
    libreria          postgres    false    204   [P       	          0    24669    Pais 
   TABLE DATA           8   COPY libreria."Pais" (pais_id, nombre_pais) FROM stdin;
    libreria          postgres    false    202   xP                 0    24694    Persona 
   TABLE DATA           q   COPY libreria."Persona" ("RFC", nombre_persona, apellido_paterno, apellido_materno, "CP", direccion) FROM stdin;
    libreria          postgres    false    205   �P       f           2606    24708    Autor pk_autor 
   CONSTRAINT     S   ALTER TABLE ONLY libreria."Autor"
    ADD CONSTRAINT pk_autor PRIMARY KEY ("RFC");
 <   ALTER TABLE ONLY libreria."Autor" DROP CONSTRAINT pk_autor;
       libreria            postgres    false    206            \           2606    24668    Categoria pk_categoria 
   CONSTRAINT     b   ALTER TABLE ONLY libreria."Categoria"
    ADD CONSTRAINT pk_categoria PRIMARY KEY (categoria_id);
 D   ALTER TABLE ONLY libreria."Categoria" DROP CONSTRAINT pk_categoria;
       libreria            postgres    false    201            `           2606    24678    Ciudad pk_ciudad 
   CONSTRAINT     Y   ALTER TABLE ONLY libreria."Ciudad"
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (ciudad_id);
 >   ALTER TABLE ONLY libreria."Ciudad" DROP CONSTRAINT pk_ciudad;
       libreria            postgres    false    203            j           2606    24721    Cliente pk_cliente 
   CONSTRAINT     W   ALTER TABLE ONLY libreria."Cliente"
    ADD CONSTRAINT pk_cliente PRIMARY KEY ("RFC");
 @   ALTER TABLE ONLY libreria."Cliente" DROP CONSTRAINT pk_cliente;
       libreria            postgres    false    208            n           2606    24736    Editorial pk_editorial 
   CONSTRAINT     f   ALTER TABLE ONLY libreria."Editorial"
    ADD CONSTRAINT pk_editorial PRIMARY KEY (nombre_editorial);
 D   ALTER TABLE ONLY libreria."Editorial" DROP CONSTRAINT pk_editorial;
       libreria            postgres    false    210            h           2606    24713    Encargado pk_encargado 
   CONSTRAINT     [   ALTER TABLE ONLY libreria."Encargado"
    ADD CONSTRAINT pk_encargado PRIMARY KEY ("RFC");
 D   ALTER TABLE ONLY libreria."Encargado" DROP CONSTRAINT pk_encargado;
       libreria            postgres    false    207            l           2606    24726    Factura pk_factura 
   CONSTRAINT     \   ALTER TABLE ONLY libreria."Factura"
    ADD CONSTRAINT pk_factura PRIMARY KEY (factura_id);
 @   ALTER TABLE ONLY libreria."Factura" DROP CONSTRAINT pk_factura;
       libreria            postgres    false    209            v           2606    24813    Factura_Libro pk_factura_libro 
   CONSTRAINT     p   ALTER TABLE ONLY libreria."Factura_Libro"
    ADD CONSTRAINT pk_factura_libro PRIMARY KEY (factura_id, "ISBN");
 L   ALTER TABLE ONLY libreria."Factura_Libro" DROP CONSTRAINT pk_factura_libro;
       libreria            postgres    false    215    215            p           2606    24746    Libreria pk_libreria 
   CONSTRAINT     _   ALTER TABLE ONLY libreria."Libreria"
    ADD CONSTRAINT pk_libreria PRIMARY KEY (libreria_id);
 B   ALTER TABLE ONLY libreria."Libreria" DROP CONSTRAINT pk_libreria;
       libreria            postgres    false    211            t           2606    24785     Libreria_libro pk_libreria_libro 
   CONSTRAINT     s   ALTER TABLE ONLY libreria."Libreria_libro"
    ADD CONSTRAINT pk_libreria_libro PRIMARY KEY (libreria_id, "ISBN");
 N   ALTER TABLE ONLY libreria."Libreria_libro" DROP CONSTRAINT pk_libreria_libro;
       libreria            postgres    false    213    213            r           2606    24762    Libro pk_libro 
   CONSTRAINT     T   ALTER TABLE ONLY libreria."Libro"
    ADD CONSTRAINT pk_libro PRIMARY KEY ("ISBN");
 <   ALTER TABLE ONLY libreria."Libro" DROP CONSTRAINT pk_libro;
       libreria            postgres    false    212            b           2606    24688    Municipio pk_municipio 
   CONSTRAINT     Z   ALTER TABLE ONLY libreria."Municipio"
    ADD CONSTRAINT pk_municipio PRIMARY KEY ("CP");
 D   ALTER TABLE ONLY libreria."Municipio" DROP CONSTRAINT pk_municipio;
       libreria            postgres    false    204            ^           2606    24673    Pais pk_pais 
   CONSTRAINT     S   ALTER TABLE ONLY libreria."Pais"
    ADD CONSTRAINT pk_pais PRIMARY KEY (pais_id);
 :   ALTER TABLE ONLY libreria."Pais" DROP CONSTRAINT pk_pais;
       libreria            postgres    false    202            d           2606    24698    Persona pk_persona 
   CONSTRAINT     W   ALTER TABLE ONLY libreria."Persona"
    ADD CONSTRAINT pk_persona PRIMARY KEY ("RFC");
 @   ALTER TABLE ONLY libreria."Persona" DROP CONSTRAINT pk_persona;
       libreria            postgres    false    205            w           2606    24679    Ciudad fk_ciudad_pais    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Ciudad"
    ADD CONSTRAINT fk_ciudad_pais FOREIGN KEY (pais_id) REFERENCES libreria."Pais"(pais_id);
 C   ALTER TABLE ONLY libreria."Ciudad" DROP CONSTRAINT fk_ciudad_pais;
       libreria          postgres    false    203    202    2910            {           2606    24737     Editorial fk_editorial_municipio    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Editorial"
    ADD CONSTRAINT fk_editorial_municipio FOREIGN KEY ("CP") REFERENCES libreria."Municipio"("CP");
 N   ALTER TABLE ONLY libreria."Editorial" DROP CONSTRAINT fk_editorial_municipio;
       libreria          postgres    false    210    204    2914            z           2606    24727    Factura fk_factura_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Factura"
    ADD CONSTRAINT fk_factura_cliente FOREIGN KEY ("RFC") REFERENCES libreria."Cliente"("RFC");
 H   ALTER TABLE ONLY libreria."Factura" DROP CONSTRAINT fk_factura_cliente;
       libreria          postgres    false    209    208    2922            �           2606    24814 &   Factura_Libro fk_factura_libro_factura    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Factura_Libro"
    ADD CONSTRAINT fk_factura_libro_factura FOREIGN KEY (factura_id) REFERENCES libreria."Factura"(factura_id);
 T   ALTER TABLE ONLY libreria."Factura_Libro" DROP CONSTRAINT fk_factura_libro_factura;
       libreria          postgres    false    215    2924    209            �           2606    24819 $   Factura_Libro fk_factura_libro_libro    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Factura_Libro"
    ADD CONSTRAINT fk_factura_libro_libro FOREIGN KEY ("ISBN") REFERENCES libreria."Libro"("ISBN");
 R   ALTER TABLE ONLY libreria."Factura_Libro" DROP CONSTRAINT fk_factura_libro_libro;
       libreria          postgres    false    212    2930    215            �           2606    24804 ,   Historial_precios fk_historial_precios_libro    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Historial_precios"
    ADD CONSTRAINT fk_historial_precios_libro FOREIGN KEY ("ISBN") REFERENCES libreria."Libro"("ISBN");
 Z   ALTER TABLE ONLY libreria."Historial_precios" DROP CONSTRAINT fk_historial_precios_libro;
       libreria          postgres    false    212    214    2930            |           2606    24747    Libreria fk_libreria_encargado    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libreria"
    ADD CONSTRAINT fk_libreria_encargado FOREIGN KEY ("RFC") REFERENCES libreria."Encargado"("RFC");
 L   ALTER TABLE ONLY libreria."Libreria" DROP CONSTRAINT fk_libreria_encargado;
       libreria          postgres    false    2920    207    211            �           2606    24786 )   Libreria_libro fk_libreria_libro_libreria    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libreria_libro"
    ADD CONSTRAINT fk_libreria_libro_libreria FOREIGN KEY (libreria_id) REFERENCES libreria."Libreria"(libreria_id);
 W   ALTER TABLE ONLY libreria."Libreria_libro" DROP CONSTRAINT fk_libreria_libro_libreria;
       libreria          postgres    false    2928    211    213            �           2606    24791 &   Libreria_libro fk_libreria_libro_libro    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libreria_libro"
    ADD CONSTRAINT fk_libreria_libro_libro FOREIGN KEY ("ISBN") REFERENCES libreria."Libro"("ISBN");
 T   ALTER TABLE ONLY libreria."Libreria_libro" DROP CONSTRAINT fk_libreria_libro_libro;
       libreria          postgres    false    2930    212    213            }           2606    24752    Libreria fk_libreria_municipio    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libreria"
    ADD CONSTRAINT fk_libreria_municipio FOREIGN KEY ("CP") REFERENCES libreria."Municipio"("CP");
 L   ALTER TABLE ONLY libreria."Libreria" DROP CONSTRAINT fk_libreria_municipio;
       libreria          postgres    false    2914    204    211            ~           2606    24763    Libro fk_libro_autor    FK CONSTRAINT     |   ALTER TABLE ONLY libreria."Libro"
    ADD CONSTRAINT fk_libro_autor FOREIGN KEY ("RFC") REFERENCES libreria."Autor"("RFC");
 B   ALTER TABLE ONLY libreria."Libro" DROP CONSTRAINT fk_libro_autor;
       libreria          postgres    false    2918    212    206            �           2606    24773    Libro fk_libro_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libro"
    ADD CONSTRAINT fk_libro_categoria FOREIGN KEY (categoria_id) REFERENCES libreria."Categoria"(categoria_id);
 F   ALTER TABLE ONLY libreria."Libro" DROP CONSTRAINT fk_libro_categoria;
       libreria          postgres    false    212    2908    201                       2606    24768    Libro fk_libro_editorial    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Libro"
    ADD CONSTRAINT fk_libro_editorial FOREIGN KEY (nombre_editorial) REFERENCES libreria."Editorial"(nombre_editorial);
 F   ALTER TABLE ONLY libreria."Libro" DROP CONSTRAINT fk_libro_editorial;
       libreria          postgres    false    2926    210    212            x           2606    24689    Municipio fk_municipio_ciudad    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Municipio"
    ADD CONSTRAINT fk_municipio_ciudad FOREIGN KEY (ciudad_id) REFERENCES libreria."Ciudad"(ciudad_id);
 K   ALTER TABLE ONLY libreria."Municipio" DROP CONSTRAINT fk_municipio_ciudad;
       libreria          postgres    false    203    2912    204            y           2606    24699    Persona fk_persona_municipio    FK CONSTRAINT     �   ALTER TABLE ONLY libreria."Persona"
    ADD CONSTRAINT fk_persona_municipio FOREIGN KEY ("CP") REFERENCES libreria."Municipio"("CP");
 J   ALTER TABLE ONLY libreria."Persona" DROP CONSTRAINT fk_persona_municipio;
       libreria          postgres    false    205    2914    204                  x������ � �            x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      	      x������ � �            x������ � �     