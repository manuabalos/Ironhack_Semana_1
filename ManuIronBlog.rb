class Blog
	
	def initialize (nombreBlog) #Método para inicializar nuestra clase
		@nombreBlog = nombreBlog
		@contenido = []
	end

	def almacenarContenido(post) #Método por el cual meteremos cada uno de nuestros posts en su blog correspondiente
		@contenido.push(post)
	end

	def mostrarNombreBlog #Método decorativo por el cual nos mostrará el nombre del blog
		puts @nombreBlog 
	end

	def mostrarContenido # Método por el cual mostraremos por pantalla nuestro blog
		@contenido.sort!{|a,b| a.date <=> b.date} # Ordenamos nuestra array por fecha
		
		@contenido.each do |x|
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

class Post
	attr_accessor :title, :text, :date, :sponsored

	def initialize(title,text,date,sponsored) # Método para inicializar nuestra clase
		@title = title
		@text = text
		@date = date	
		@sponsored = sponsored
	end
end

bloggy = Blog.new ("Blog de Ironhack")
puts "========================"
bloggy.mostrarNombreBlog
puts "========================"

post1=Post.new("Entregar ejercicios (Week1)","Ejercicios para entregar: IronBlog y Shopping Cart.","12/4/2015","No Sponsored")
bloggy.almacenarContenido(post1)
post2=Post.new("Recordatorio SoftSkill","Los días 27 y 28 habra clase presencial y obligatorias de SoftSkill.","25/4/2015","Sponsored")
bloggy.almacenarContenido(post2)
post3=Post.new("Proyecto por grupos","El proyecto ha realizar en conjunto con los grupos de trabajo realizados son (bla,bla,bla).","05/4/2015","No Sponshored")
bloggy.almacenarContenido(post3)

bloggy.mostrarContenido
