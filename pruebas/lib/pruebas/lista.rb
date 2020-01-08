# lista.rb
#
# Autor:: Adrian Ramos Mejias
# Asignatura:: Practicas de Laboratorio LPP
# == Clase Lista
#
# Con esta clase tenemos la intencion de:
# - Generar una estructura de datos
# - Tener una forma de ordenar elementos
# - Instaurar una base para el resto de practicas
#
# Definicion de la clase Nutricion
# * metodo initialize
# * metodo insert_head
# * metodo insert_tail
# * metodo each
# * metodo insert_elements
# * metodo extract_head
# * metodo extract_tail
# * metodo gei_diario
# * metodo gei_anual
# * metodo terreno

Node = Struct.new(:value, :next, :prev)

class Listas
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head, @tail = head, tail
  end

#Metodo que inserta un elemento por la cabeza de la lista
  def insert_head(valor)
    if(@head == nil)
      @head = Node.new(valor,nil,nil)
      @tail = @head
    else
      nodo_nuevo = Node.new(valor,nil,nil)
      nodo_nuevo.next = @head
      @head.prev = nodo_nuevo
      @head = nodo_nuevo
    end
  end

#Metodo que inserta un elemento por la cola de la lista
  def insert_tail(valor)
    if(@tail == nil)
      @tail = Node.new(valor,nil,nil)
      @head = @tail
    else
      nodo_nuevo = Node.new(valor,nil,nil)
      nodo_nuevo.next = @tail
      @tail.next = nodo_nuevo
      @tail = nodo_nuevo
    end
  end

#Enumeracion de los nodos de la lista y que permite que sea enumerable
  def each
    nodo = @head
    while (nodo != nil)
      yield nodo.value
      nodo = nodo.next
    end
  end

#Metodo que inserta varios nodos en la lista
  def insert_elements(valores)
    valores.each{
      |n| insert_tail(n)
    }
  end

#Metodo que extrae el primer elemento de la lista
    def extract_head
      if(@head == nil)
        return nil
      end
      valor = @head
      @head = @head.next
      if(@head == nil)
        @tail = nil
      else
        @head.prev = nil
        valor.next = nil
      end
      valor.value
    end

#Metodo que extrae el ultimo elemento de la lista
      def extract_tail
        if(@tail == nil)
          return nil
        end
        valor = @tail
        @tail = @tail.prev
        if(@tail == nil)
          @head = nil
        else
          @tail.next = nil
          valor.prev = nil
        end
        valor.value
      end

#Metodo que calcula el valor de gei diario de la lista
      def gei_diario
        auxNodo = @head
        geitotal = 0
        while(auxNodo != nil)
          geitotal += auxNodo.value.gei
          auxNodo = auxNodo.next
        end
        return geitotal.round(1)
      end

#Metodo que calcula el valor de gei en un año de la lista
      def gei_anual
        auxNodo = @head
        geitotal = 0
        while(auxNodo != nil)
          geitotal += auxNodo.value.gei * 365
          auxNodo = auxNodo.next
        end
        return geitotal.round(1)
      end

#Metodo que halla el valor de estimacion de terreno de la lista
      def terreno
        auxNodo = @head
        terrenototal = 0
        while(auxNodo != nil)
          terrenototal += auxNodo.value.terreno
          auxNodo = auxNodo.next
        end
        return terrenototal.round(1)
      end
end
