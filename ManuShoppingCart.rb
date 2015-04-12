class Carrito

	def initialize # Método para inicializar nuestra clase
		@contenido = []
		@total = 0
	end

	def añadirFrutas(fruta) # Método que meterá cada una de nuestras frutas en nuestro carrito
		@contenido.push(fruta)
	end

	def mostrarTicket(estacion,esDomingo) # Método que el cual mostrará el ticket

		# Declaramos unas variables para tener el control de los descuentos
		numManzanas = 0
		numNaranjas = 0
		numUvas = 0
		regalarPlatano = false

		# Recorremos cada fruta que tenemos en nuestro carrito de compra
		@contenido.each do |x|
				case estacion # Asignamos el precio de cada fruta segun la estación del año
					when "1" # PRIMAVERA
						if (x.fruta == "Manzana") 
							numManzanas = numManzanas + 1
								if (numManzanas < 2)
									costFruta = 10
								else
									costFruta = 0 # Al ser numManzanas == 2 Le damos la segunda manzana gratis
									numManzanas = 0 # Reiniciamos el controlador de numero de Manzanas
									print ("\n~~ ¡Le hemos regalado la segunda manzana! Oferta 2x1")
								end
						elsif (x.fruta == "Naranja") 
							numNaranjas = numNaranjas + 1
								if (numNaranjas < 3)
									costFruta = 5
								else
									costFruta = 0 # Al ser numNaranjas == 2 Le damos la segunda naranja gratis
									numNaranjas = 0 # Reiniciamos el controlador de numero de Naranjas
									print("\n~~ ¡Le hemos regalado la tercera naranja! Oferta 3x2")
								end
						elsif (x.fruta == "Uva") 
								numUvas = numUvas + 1
								if (numUvas == 4)
									numUvas = 0
									regalarPlatano = true
								end
								costFruta=15
						elsif (x.fruta == "Platano") 
							costFruta = 20
						elsif (x.fruta == "Melon") 
							costFruta = 50
						end

					when "2" #VERANO
						if (x.fruta == "Manzana") 
							numManzanas = numManzanas + 1
								if (numManzanas < 2)
									costFruta = 10
								else
									costFruta = 0 # Al ser numManzanas == 2 Le damos la segunda manzana gratis
									numManzanas = 0 # Reiniciamos el controlador de numero de Manzanas
									print ("\n~~ ¡Le hemos regalado la segunda manzana! Oferta 2x1")
								end
						elsif (x.fruta == "Naranja") 
							numNaranjas = numNaranjas + 1
								if (numNaranjas < 3)
									costFruta = 2
								else
									costFruta = 0 # Al ser numNaranjas == 2 Le damos la segunda naranja gratis
									numNaranjas = 0 # Reiniciamos el controlador de numero de Naranjas
									print("\n~~ ¡Le hemos regalado la tercera naranja! Oferta 3x2")
								end
						elsif (x.fruta == "Uva") 
								numUvas = numUvas + 1
								if (numUvas == 4)
									numUvas = 0
									regalarPlatano = true
								end
								costFruta=15
						elsif (x.fruta == "Platano") 
							costFruta = 20
						elsif (x.fruta == "Melon") 
							costFruta = 50
						end

					when "3" #OTOÑO
						if (x.fruta == "Manzana") 
							numManzanas = numManzanas + 1
								if (numManzanas < 2)
									costFruta = 15
								else
									costFruta = 0 # Al ser numManzanas == 2 Le damos la segunda manzana gratis
									numManzanas = 0 # Reiniciamos el controlador de numero de Manzanas
									print ("\n~~ ¡Le hemos regalado la segunda manzana! Oferta 2x1")
								end
						elsif (x.fruta == "Naranja") 
							numNaranjas = numNaranjas + 1
								if (numNaranjas < 3)
									costFruta = 5
								else
									costFruta = 0 # Al ser numNaranjas == 2 Le damos la segunda naranja gratis
									numNaranjas = 0 # Reiniciamos el controlador de numero de Naranjas
									print("\n~~ ¡Le hemos regalado la tercera naranja! Oferta 3x2")
								end
						elsif (x.fruta == "Uva") 
								numUvas = numUvas + 1
								if (numUvas == 4)
									numUvas = 0
									regalarPlatano = true
								end
								costFruta=15
						elsif (x.fruta == "Platano") 
							costFruta = 20
						elsif (x.fruta == "Melon") 
							costFruta = 50
						end

					when "4" #INVIERNO
						if (x.fruta == "Manzana") 
							numManzanas = numManzanas + 1
								if (numManzanas < 2)
									costFruta = 12
								else
									costFruta = 0 # Al ser numManzanas == 2 Le damos la segunda manzana gratis
									numManzanas = 0 # Reiniciamos el controlador de numero de Manzanas
									print ("\n~~ ¡Le hemos regalado la segunda manzana! Oferta 2x1")
								end
						elsif (x.fruta == "Naranja") 
							numNaranjas = numNaranjas + 1
								if (numNaranjas < 3)
									costFruta = 5
								else
									costFruta = 0 # Al ser numNaranjas == 2 Le damos la segunda naranja gratis
									numNaranjas = 0 # Reiniciamos el controlador de numero de Naranjas
									print("\n~~ ¡Le hemos regalado la tercera naranja! Oferta 3x2")
								end
						elsif (x.fruta == "Uva") 
								numUvas = numUvas + 1
								if (numUvas == 4)
									numUvas = 0
									regalarPlatano = true
								end
								costFruta=15
						elsif (x.fruta == "Platano") 
							costFruta = 21
						elsif (x.fruta == "Melon") 
							costFruta = 50
						end
						
					else
						puts "Has introducido una estación del año incorecta"
						break
				end

				if(esDomingo == "S" && x.fruta =="Melon") #Si es Domingo y hay melon añadido en el carrito de compra, su valor es el doble.
					costFruta = costFruta * 2
				end

				puts "\n- #{x.fruta} -> #{costFruta}\n"
				@total = @total + costFruta #Sumamos el precio de la fruta al total que llevamos en el carrito

				# Controlamos si tenemos que preguntarle al cliente si quiere un Platano gratis por la compra de 4 Uvas
						if(regalarPlatano)
								print(" Has comprado 4 Uvas ¿Desea un platano gratis? (S/N): ")
								confirmar=gets.chomp

									if(confirmar == "S")
										puts "\n- Platano -> 0\n"
									end
								regalarPlatano=false

						end
		end
	end

	def mostrarPrecioTotal # Método que muestra el precio total final.
		puts"----TOTAL----"
		print @total

	end

end

class Fruta
	attr_accessor :fruta, :precio
	def initialize (fruta) # Método para inicializar nuestra clase
		@fruta = fruta
		@precio = precio
	end
end

# Preguntamos la estación del año y si es Domingo como dia de la semana
puts "--------------------------------------------------------------"
puts "(1) Primavera, (2) Verano, (3) Otoño, (4) Invierno "
puts "--------------------------------------------------------------"
print "Por favor, introduzca el numero correspondiente a su estacion: "
estacion = gets.chomp
print "¿Es Domingo? (S/N): "
esDomingo = gets.chomp

# ------------- LISTADO DE PRECIOS ----------------
Manzana = Fruta.new("Manzana")
Naranja = Fruta.new("Naranja")
Uva = Fruta.new("Uva")
Platano = Fruta.new("Platano")
Melon = Fruta.new("Melon")
#--------------------------------------------------

# --------- AÑADIMOS AL CARRITO FRUTA -------------
CarritoDeManu = Carrito.new
CarritoDeManu.añadirFrutas(Manzana)
CarritoDeManu.añadirFrutas(Manzana)
CarritoDeManu.añadirFrutas(Platano)
CarritoDeManu.añadirFrutas(Naranja)
CarritoDeManu.añadirFrutas(Naranja)
CarritoDeManu.añadirFrutas(Naranja)
CarritoDeManu.añadirFrutas(Uva)
CarritoDeManu.añadirFrutas(Uva)
CarritoDeManu.añadirFrutas(Uva)
CarritoDeManu.añadirFrutas(Uva)
CarritoDeManu.añadirFrutas(Melon)
#--------------------------------------------------

# ------ IMPRIMIMOS EL TICKET DE LA COMPRA --------
CarritoDeManu.mostrarTicket(estacion,esDomingo)
CarritoDeManu.mostrarPrecioTotal
