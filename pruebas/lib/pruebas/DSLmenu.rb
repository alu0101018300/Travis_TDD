#DSLplato.rb
#
# Autor:: Adrian Ramos Mejias
# Asignatura:: Practicas de Laboratorio LPP
# == Clase Nutricion
#
# Con esta clase tenemos la intencion de:
# - Aprender el uso de los DSL
#
# Definicion de la clase Nutricion
# * metodo initialize
# * metodo to_s
# * metodo platos

class Menu
  include Enumerable

  attr_reader :nombre_menu, :platos, :precios, :valor_energetico, :valor_ambiental

# Metodo que inicializa un objeto del tipo que vamos a usar en la clase.
  def initialize(name, &block)
    @name = name
    @platos = []
    @precios = []
    @valor_energetico = []
    @valor_ambiental = []

    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end
  end

# Metodo que formatea la salida por pantalla del objeto
  def to_s
    output = @name
    output << "\n#{'=' * @name.size}\n"
    output << "Platos: #{@platos.join(', ')}\n"
    output << "Precio total del menu: #{@precios.reduce(:+)}\n"
    output << "\nValor calorico total del menu: #{@valor_energetico.reduce(:+).round(1)}"
    output << "\nValor de las emisiones de CO2 del menu: #{@valor_ambiental.reduce(:+).round(1)} \n"

  end

# Metodo para obtener todos los datos que necesitamos del plato
  def platos(options = {})
    plato = options[:nombre]
    nombre_plato = plato.name
    precio_plato = options[:precio]
    @precios << precio_plato
    @valor_energetico << plato.calculoCaloriasDSL
    @valor_ambiental << plato.calculoEmisionesDSL

    plato = "(#{nombre_plato})"
    plato << "(#{precio_plato} €)"
    @platos << plato
  end
end
