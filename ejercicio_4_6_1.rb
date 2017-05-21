class Libro
	attr_accessor :nombre, :autor, :seccion

	def initialize (nombre, autor, seccion)
		@nombre = nombre
		@autor = autor
		@seccion = seccion
	end
end

biblioteca =[]
opcion_elegida =""
opciones_menu = {
	"I" => "Insertar nuevo libro",
	"B" => "Buscar libro",
	"E" => "Eliminar libro",
	"M" => "Mostrar datos del libro",
	"S" => "Salir del programa"
}

entradas = {
	"nombre" => "",
	"autor" => "",
	"seccion" => ""
}

def dibujar_menu(opciones_menu)
	opciones_menu.each do |clave, valor|
		puts "#{clave} - #{valor}"
	end
end

def elegir_opcion(entradas,biblioteca)
	
	opcion = gets.chomp.upcase
	case opcion
		when "I"
			insertar_libro(entradas, biblioteca)
		when "B"
			buscar_en_libros(biblioteca)
			
		when "E"
			mostrar_libros(biblioteca)
			borrar_libros(biblioteca)
		when "M"
			mostrar_libros(biblioteca)
		when "S"
			puts "Hasta pronto"
		
		else
			puts "Opción incorrecta"
	end
	return opcion
end

def insertar_libro(entradas, biblioteca)
	print entradas.keys[0] + " "
	entradas["nombre"] = gets.chomp
	print entradas.keys[1] + " "
	entradas["autor"] = gets.chomp
	print entradas.keys[2] + " "
	entradas["seccion"] = gets.chomp
	libro = Libro.new(entradas["nombre"], entradas["autor"], entradas["seccion"])
	biblioteca[biblioteca.length] = libro
	return biblioteca
end

def mostrar_libros(biblioteca)
	
	indice = 0
	while indice < biblioteca.length
		print "Libro nº " + (indice+1).to_s + " "
		print "El nombre del libro es " + biblioteca[indice].nombre + ", "	
		print "su autor es " + biblioteca[indice].autor + " y "
		puts "su seccion es " + biblioteca[indice].seccion
		indice += 1
#		for elemento in biblioteca
#		indice = biblioteca.index(elemento) + 1
#		puts indice.class
#		puts elemento.nombre
#		puts elemento.autor
#	end
	
#	bilioteca.each do |elemento|
#		indice = biblioteca.index(elemento) + 1
#		puts "Numero de ingreso: " + indice.to_s + "El nombre del libro es " + elemento.nombre + "su autor es " + elemento.autor + "y su seccion es " + elemento.seccion
    end
    puts ""
    puts "Pulse cualquier tecla para continuar"
    salida = gets.chomp
    return biblioteca	
end

def borrar_libros(biblioteca)
	opcion_borrar = ""
#	print "¿Desea borrar algun libro?: "
	while (opcion_borrar !="S") && (opcion_borrar !="N")
		print "¿Desea borrar algun libro?: "
		opcion_borrar = gets.chomp.upcase
	end
	if 	opcion_borrar != "N"
		if opcion_borrar == "S"
#			print "Pulse el número del libro a borrar: "
			opcion_borrado = 0
			while (opcion_borrado <=0) || (opcion_borrado > biblioteca.length)
				print "Pulse el número del libro a borrar: "
				opcion_borrado = gets.chomp.to_i
			end
			biblioteca.delete_at(opcion_borrado-1)
		elsif opcion_borrar != "S" && opcion_borrar !="N"
			puts "Opción inválida"
		else puts ""
		end
	end
end

def buscar_en_libros(biblioteca)
	tabla_busqueda=[]
	print "Escribe el texto que quieres buscar: "
	texto_buscado = gets.chomp
	coincidencias = 0
	for elemento in biblioteca
		if elemento.nombre.include? texto_buscado
			coincidencias += 1
			puts "Hallado #{texto_buscado} en el nombre del libro #{elemento.nombre}"
		end
		if elemento.autor.include? texto_buscado
			coincidencias += 1
			puts "Hallado #{texto_buscado} en el autor #{elemento.autor} del libro #{elemento.nombre}"
		end
		if elemento.seccion.include? texto_buscado
			coincidencias += 1
			puts "Hallado #{texto_buscado} en la seccion #{elemento.seccion} del libro #{elemento.nombre} y cuyo autor es #{elemento.autor}"
		end
	end
end

def borrar_pantalla
	system('clear')
end


while opcion_elegida != "S"
	borrar_pantalla
	dibujar_menu(opciones_menu)
	opcion_elegida=elegir_opcion(entradas,biblioteca)
end

