class Blog
	attr_accessor :totalPost, :nombreBlog
	def initialize (nombreBlog) #Método para inicializar nuestra clase
		@nombreBlog = nombreBlog
		@contenido = []
		@totalPost = 0
	end

	def almacenarContenido(post) #Método por el cual meteremos cada uno de nuestros posts en su blog correspondiente
		@contenido.push(post)
		@totalPost = @totalPost +1
	end

	def mostrarContenido(numPaginaActual)# Método por el cual mostraremos por pantalla nuestro blog
		
		numPostInicio = numPaginaActual + (numPaginaActual-1) # Algoritmo para empezar por el post que le corresponde por a esa Pagina

		@contenido.sort!{|a,b| a.date <=> b.date} # Ordenamos nuestra array por fecha
		
		numContenido = 0 # Se usa esta variable para despues imprimir desde el numero de post correspondiente
		@contenido.each do |x|
			numContenido=numContenido+1 
			if(numContenido == numPostInicio || numContenido == numPostInicio+1)
				if(x.sponsored == "Sponsored") # Controlamos si el post es Sponsored
					puts "\n-------------- SPONSORED POST -----------------\n"
					puts ">>>-- (#{x.date}) #{x.title} --<<<\n"
					puts "-----------------------------------------------\n"
					puts "#{x.text}\n"
					puts "-----------------------------------------------\n"
				else
					puts "\n(#{x.date}) #{x.title}"
					puts "---------------------------------------------\n"
					puts "#{x.text}\n"
				end
			end
		end
	end

end

class Post
	attr_accessor :title, :text, :date, :sponsored

	def initialize(title,text,date,sponsored) # Método para inicializar nuestra clase
		@title = title
		@text = text
		@date = date	
		@sponsored = sponsored
	end
end

# Creamos un objeto blog
bloggy = Blog.new ("Blog de Ironhack")

# Creamos unos cuantos objetos Posts para trabajar con ellos
post1=Post.new("Entregar ejercicios (Week1)","Ejercicios para entregar: IronBlog y Shopping Cart.","12/4/2015","No Sponsored")
bloggy.almacenarContenido(post1)
post2=Post.new("Recordatorio SoftSkill","Los días 27 y 28 habra clase presencial y obligatorias de SoftSkill.","25/4/2015","Sponsored")
bloggy.almacenarContenido(post2)
post3=Post.new("Proyecto por grupos","El proyecto ha realizar en conjunto con los grupos de trabajo realizados son (bla,bla,bla).","05/4/2015","No Sponshored")
bloggy.almacenarContenido(post3)


puts "============================="
puts " #{bloggy.nombreBlog} ~~ Total nº de Posts: #{bloggy.totalPost}"
puts "============================="
# bloggy.mostrarContenido

numeroPostPorPagina = 2 # Numero de posts que queremos por pagina
numeroPaginas = (bloggy.totalPost/numeroPostPorPagina.to_f).ceil # De esta forma obtenemos el numero total de páginas que habrá en el blog
numPaginaActual = 1 # Variable para poner por defecto el numero de Pagina como 1
opcion = " "

while opcion != "Q"
	bloggy.mostrarContenido(numPaginaActual)

	print("\n=======================================================\n") #Pie de pagina que nos mostrara el numero de Pagina en el que nos encontramos
	puts "Pagina nº #{numPaginaActual} de #{numeroPaginas}"
	print("=======================================================\n")
	print "Pasar página siguiente (S) - Pasar página anterior (A) - Para Salir (Q): " # Preguntamos a qe numero de pagina queremos ir
	opcion = gets.chomp
	
	if (opcion == "S") # Si nos movemos a la pagina siguiente
		print("\n\n============= MOVIDO A LA PAGINA SIGUIENTE ===============\n")
		numPaginaActual = numPaginaActual+1
			if(numPaginaActual > numeroPaginas) # Para controlar que no nos vamos a una pagina del blog que no existe
				numPaginaActual = numPaginaActual-1
				print("_______________________________________________\n")
				print("ERROR al querer saltar a una pagina inexistente\n")
				print("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n")
				print("~ Redireccionando a la pagina #{numPaginaActual}\n")
				print("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n")
			end

	elsif (opcion == "A") # Si nos movemos a la pagina anterior
		print("\n\n============= MOVIDO A LA PAGINA ANTERIOR ===============\n")
		numPaginaActual = numPaginaActual-1
			if(numPaginaActual < 1) # Para controlar que no nos vamos a una pagina del blog que no existe
				numPaginaActual = numPaginaActual+1
				print("_______________________________________________\n")
				print("ERROR al querer saltar a una pagina inexistente\n")
				print("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n")
				print("~ Redireccionando a la pagina #{numPaginaActual}\n")
				print("~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n")
				
			end
	end

end

