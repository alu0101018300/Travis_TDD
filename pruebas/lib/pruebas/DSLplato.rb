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
# * metodo nombreplato
# * metodo alimento
# * metodo calculoCaloriasDSL
# * metodo calculoEmisionesDSL

class DSLPlato

  attr_accessor :name, :alimentos, :nombre_plato, :cantidades, :lista_alimentos

# Metodo que inicializa un objeto del tipo que vamos a usar en la clase.
  def initialize(name, &block)
    @name = name
    @alimentos = []
    @cantidades = Listas.new()
    @lista_alimentos = Listas.new()

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
    output << "\n#{'=' * @name.size}\n\n"
    output << "Alimentos: #{@alimentos.join(', ')}\n\n"
  end

# Metodo para obtener el nombre del plato
  def nombreplato(nombre)
    @nombre_plato = nombre
  end

# Metodo para obtener todos los datos que necesitamos del alimento
  def alimento(options = {})
    alimento = options[:descripcion]
    nombre_alimento = alimento.nombre
    @lista_alimentos.insert_head(alimento)
    alimento = "(#{nombre_alimento})"
    alimento << "(#{options[:gramos]} g)"
    @cantidades.insert_head(options[:gramos])
    @alimentos << alimento
  end

# Metodo para obtener el valor energetico del alimento
  def calculoCaloriasDSL
    auxplato = Plato_2.new(@nombre_alimento, @lista_alimentos, @cantidades)
    auxplato.eficiencia_energetica
  end

# Metodo para obtener el valor ambiental del alimento
  def calculoEmisionesDSL
    auxplato = Plato_2.new(@nombre_alimento, @lista_alimentos, @cantidades)
    auxplato.geidiario
  end
end
