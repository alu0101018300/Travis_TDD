# herencia.rb
#
# Autor:: Adrian Ramos Mejias
# Asignatura:: Practicas de Laboratorio LPP
# == Clase Plato y Plato_2
#
# Con estas clases tenemos la intencion de:
# - Conocer como funciona la herencia
# - Acostumbrarnos a usar los modulos enumerable y comparable
# - Instaurar una base para el resto de practicas
#
# Definicion de la clase Plato(Padre)
# * metodo initialize
# * metodo porcentaje_proteinas
# * metodo porcentaje_lipidos
# * metodo porcentaje_lipidos
# * metodo get_vct
# * metodo to_s
#
# Definicion de la clase Plato(Padre)
# * metodo initialize
# * metodo geidiario
# * metodo terreno
# * metodo eficiencia_energetica
# * metodo to_s
# * metodo <=>
# * metodo each
# * metodo valor_calorico
# * metodo huella_carbono
# * metodo huella_nutricional


class Plato
  include Comparable
  attr_reader :nombre,:lista_alimentos,:gramos

# Metodo que inicializa el objeto relacionado con esta clase
  def initialize (nombre, lista_alimentos, gramos)
      @nombre, @lista_alimentos, @gramos = nombre, lista_alimentos, gramos
  end

# Metodo que calcula el procentaje de proteinas del plato
  def porcentaje_proteinas
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    porcentaje_prot = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      porcentaje_prot += (auxNodo1.value.proteinas * auxNodo2.value) / 100
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return porcentaje_prot.round(1)
  end

# Metodo que calcula el procentaje de lipidos del plato
  def porcentaje_lipidos
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    porcentaje_lip = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      porcentaje_lip += (auxNodo1.value.lipidos * auxNodo2.value) / 100
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return porcentaje_lip.round(1)
  end

# Metodo que calcula el procentaje de glucidos del plato
  def porcentaje_glucidos
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    porcentaje_gluc = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      porcentaje_gluc += (auxNodo1.value.glucidos * auxNodo2.value) / 100
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return porcentaje_gluc.round(1)
  end

# Metodo que calcula el valor calorico total del plato
  def get_vct
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    vct = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      vct += (auxNodo1.value.get_val / (auxNodo1.value.proteinas + auxNodo1.value.glucidos + auxNodo1.value.lipidos)) * auxNodo2.value
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return vct.round(1)
  end

# Metodo que formatea la visualizacion del plato
  def to_s
    "Nombre del plato: #{@nombre}"
  end
end

class Plato_2 < Plato
  include Comparable
  include Enumerable
  attr_reader :nombre,:lista_alimentos,:gramos

# Metodo que inicializa el objeto relacionado con esta clase
  def initialize (nombre, lista_alimentos, gramos)
    super(nombre,lista_alimentos,gramos)
  end

# Metodo que calcula los gases de efecto invernadero de un plato
  def geidiario
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    geitotal = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      geitotal += (auxNodo1.value.gei * auxNodo2.value) / 100
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return geitotal.round(1)
  end

# Metodo que calcula la estimacion de utilizacion de terreno de un plato
  def terreno
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    terrenototal = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      terrenototal += (auxNodo1.value.terreno * auxNodo2.value) / 100
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return terrenototal.round(1)
  end

# Metodo que calcula la eficiencia energetica de un plato
  def eficiencia_energetica
    auxNodo1 = @lista_alimentos.head
    auxNodo2 = @gramos.head
    eficiencia_total = 0
    while(auxNodo1 != nil && auxNodo2 != nil)
      eficiencia_total += ((auxNodo1.value.terreno * auxNodo1.value.gei) / auxNodo1.value.terreno + auxNodo1.value.gei ) * auxNodo2.value
      auxNodo1 = auxNodo1.next
      auxNodo2 = auxNodo2.next
    end
    return eficiencia_total.round(1)
  end

# Metodo que formatea la visualizacion de un plato
  def to_s
    "La eficiencia energetica del plato es: #{eficiencia_energetica()}"
  end

# Metodo que permite comparar la eficiencia energetica de dos platos
  def <=> (an0ther)
    eficiencia_energetica() <=> an0ther.eficiencia_energetica()
  end

# Metodo que permite enumerar los platos mediante el modulo Enumerable
  def each
    nodo1 = @lista_alimentos.head
    nodo2 = @gramos.head
    while (nodo1 != nil && nodo2 != nil)
      yield nodo1.value
      nodo1 = nodo1.next
      nodo2 = nodo2.next
    end
  end

# Metodo que calcula el valor calorico de un plato
  def valor_calorico
    if eficiencia_energetica() < 670
      return 1
    end
    if eficiencia_energetica() > 830
      return 3
    else
      return 2
    end
  end

# Metodo que calcula la huella de carbono de un plato
  def huella_carbono
    if geidiario() < 800
      return 1
    end
    if geidiario() > 1200
      return 3
    else
      return 2
    end
  end

# Metodo que calcula la huella nutricional de un plato
  def huella_nutricional
    (valor_calorico() + huella_carbono()) / 2
  end

end
