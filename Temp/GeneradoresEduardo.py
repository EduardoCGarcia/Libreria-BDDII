from random import randint, uniform
"""
Tablas de las que Eduardo genero datos para poblarlas
Categoria: [categoria_id, nombre_categoria]
Libro: [ISBN, *RFC, *nombre_editorial, anio, titulo, precio, categoria_id]
Inventario_libro: [libreria_id, ISBN, stock]
Libreria: [libreria_id, telefono, *RFC, *CP, direccion(calle #numero)]

"""





"""Regresa un set que contiene todos los ISBN para los libros, aproximadamente 1Millon"""
def ISBN():
    isbn1 = set()
    isbn2 = set()
    isbn = set()
    for i in range(100,133):#32*32
        for j in range(200,233):
            isbn1.add("1"+str(i)+str(j))
            isbn2.add(str(j)+str(i))


    for i in isbn1:#1024*1024
        for j in isbn2:
            isbn.add(i + j)

    for i in isbn:
        break
    return isbn
"""Regresa un set que contiene todos los titulos para los libros, aproximadamente 1.5Millones"""
def titulos():
    f1  = open('ArchivosDeTexto/Titulos1.txt','r')
    f2  = open('ArchivosDeTexto/Titulos2.txt','r')
    f3  = open('ArchivosDeTexto/Titulos3.txt','r')
    f4  = open('ArchivosDeTexto/Titulos4.txt','r')

    t1 = f1.readlines()
    t2 = f2.readlines()
    t3 = f3.readlines()
    t4 = f4.readlines()

    title1 = set()
    title2 = set()
    title3 = set()

    for i in t1:
        for j in t2:
            title1.add(i.replace("\n"," ") + j)

    for i in t3:
        for j in t4:
            title2.add(i.replace("\n"," ") + j)

    for i in title1:
        for j in title2:
            title3.add(i.replace("\n"," ") + " y "  + j)

    f1.close()
    f2.close()
    f3.close()
    f4.close()
    return title3

def categorias():
    f1  = open('ArchivosDeTexto/Categorias.txt','r')
    f2  = open('ArchivosParaLaBase/CategoriasBD.txt','w')
    f3  = open('ArchivosDeTexto/Categorias_ID.txt','w')

    cats = f1.readlines()

    for l in range(len(cats)):
        f2.write(str(l+1)+","+cats[l])
    
    for i in range(35000):
        for j in range(37):
            f3.write(str(j+1) + "\n")
    

    f1.close()
    f2.close()

def telefonos():
    f  = open('ArchivosDeTexto/telefonos.txt','w')

    for i in range(100,150):#32*32
        f.write("7221"+str(i)+str(i)+"\n")

def numerosExt():
    f  = open('ArchivosDeTexto/numeros.txt','w')
    numeros = []
    for i in range(1000,5000,7):
        if(len(numeros) <= 31):
            numeros.append(i)
            f.write(str(i)+"\n")
        else:
            break
    f.close()

def direccioneslibs():
    dire  = open('ArchivosDeTexto/DireccionesLibs.txt','w',encoding='UTF8')
    cal  = open('ArchivosDeTexto/Calles.txt','r',encoding='UTF8')
    num  = open('ArchivosDeTexto/numeros.txt','r',encoding='UTF8')
    
    calles = cal.readlines()
    numeros = num.readlines()
    for c,n in zip(calles,numeros):
        dire.write(c.replace("\n","  #") + n)
    
    dire.close()
    cal.close()
    num.close()

def mergelibs():
    bd  = open('ArchivosParaLaBase/LibreriasBD.txt','w',encoding='UTF8')
    dire  = open('ArchivosDeTexto/DireccionesLibs.txt','r',encoding='UTF8')
    tel  = open('ArchivosDeTexto/telefonos.txt','r',encoding='UTF8')
    libid  = open('ArchivosDeTexto/Librerias_ID.txt','w',encoding='UTF8')
    direcciones = dire.readlines()
    telefonos = tel.readlines()
    contador = 1

    for t,d in zip(telefonos,direcciones):
        libid.write(str(contador)+"\n")
        bd.write(str(contador) + "," + t.replace("\n",",") + d)
        contador += 1

    bd.close()
    dire.close()
    tel.close()

def years():

    anios = []
    for m in range(40000):
        for i in range(1980,2021):
            anios.append(str(i))
    return anios

"""Mezcla los archivos para generar uno solo para la base de datos, donde cada atributo esta separado con una coma"""
def mergeLibros():
    aL = open('ArchivosParaLaBase/LibrosBD.txt','w')
    aI  = open('ArchivosDeTexto/ISBN.txt','r')
    aT  = open('ArchivosDeTexto/Titulos.txt','r')
    aC  = open('ArchivosDeTexto/Categorias_ID.txt','r')
    
    identificador = aI.readlines()
    titulos = aT.readlines()
    anios = years()
    precios = generarPrecios()
    categorias = aC.readlines()

    for i,a,t,p,c in zip(identificador,anios,titulos,precios,categorias):
        aL.write(str(i).replace("\n",",") + 
                str(a) + "," +
                str(t).replace("\n",",")+
                str(p) + "," +
                str(c))

    aL.close()
    aT.close()
    aI.close()
    aC.close()

def generarPrecios():
    import random
    precios = []
    for i in range(1000000):
        precios.append("{0:.2f}".format(uniform(200,1000)))
        
    return precios


def libreriaLibro():
    import random
    aI = open('ArchivosDeTexto/ISBN.txt','r')
    aLL = open('ArchivosParaLaBase/LibreriaLibroBD.txt','w')
    aL = open('ArchivosDeTexto/Librerias_ID.txt','r')

    identificador = aI.readlines()
    libreriasid = aL.readlines()

    for i,l in zip(identificador,libreriasid):
        aLL.write(str(i).replace("\n",",") + str(l).replace("\n",",") + str(randint(100,600))  + "\n")
    aL.close()
    aLL.close()
    aI.close()

if __name__ == "__main__":
    #Generar los ISBN
    """aIsbn  = open('ArchivosDeTexto/ISBN.txt','w')#Se guarda dentro de la carpeta
    isbns = ISBN()
    for i in isbns:
        aIsbn.write(str(i)+"\n")
    aIsbn.close()"""

    #Generar los Titulos
    """aTitles  = open('ArchivosDeTexto/Titulos.txt','w')#Se guarda dentro de la carpeta
    titles = titulos()
    for i in titles:
        aTitles.write(str(i))
    aTitles.close()"""

    #Generear Categorias
    #categorias()

    """Generar librerias"""
    #telefonos()
    #numerosExt()
    #direccioneslibs()
    #mergelibs()

    #generarPrecios()

    #Genera Libros
    #mergeLibros()

    """libid  = open('ArchivosDeTexto/Librerias_ID.txt','w',encoding='UTF8')
    for i in range(35000):
        for j in range(31):
            libid.write(str(j+1) + "\n")
    libid.close()"""

    libreriaLibro()

