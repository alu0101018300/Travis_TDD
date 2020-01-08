#nutricion.rb
#
# Autor:: Adrian Ramos Mejias
# Asignatura:: Practicas de Laboratorio LPP
# == Clase Nutricion
#
# Con esta clase tenemos la intencion de:
# - Aprender el metodo guiado por Pruebas
# - Acceder a atributos de elementos
# - Instaurar una base para el resto de practicas
#
# Definicion de la clase Nutricion
# * metodo initialize
# * metodo get_nombre
# * metodo get_gei
# * metodo get_terreno
# * metodo get_val
# * metodo to_s
# * metodo <=>

class Nutricion
  include Comparable

# Metodo que inicializa un objeto del tipo que vamos a usar en la clase.
  def initialize(nombre,gei,terreno,proteinas,lipidos,glucidos)
    @nombre, @gei, @terreno, @proteinas, @lipidos, @glucidos = nombre, gei, terreno, proteinas, lipidos, glucidos
  end

  attr_reader :nombre, :gei, :terreno, :proteinas, :lipidos, :glucidos

# Metodo que halla el nombre del objeto
  def get_nombre()
    @nombre
  end

# Metodo que halla el valor de Gases de Efecto Invernadero del objeto
  def get_gei()
    @gei
  end

# Metodo que halla la estimacion de utilizacion de terreno del objeto
  def get_terreno()
    @terreno
  end

# Metodo que halla el valor de la energia del objeto
  def get_val()
    val = (@proteinas * 4) + (@lipidos * 9) + (@glucidos * 4)
  end

# Metodo que formatea la visualizacion del objeto
  def to_s()
    [@nombre, @gei, @terreno, @proteinas, @lipidos, @glucidos]
  end

# Metodo que permite comparar valores de energia entre diferentes objetos 
  def <=>(an0ther)
    get_val() <=> an0ther.get_val()
end
end
