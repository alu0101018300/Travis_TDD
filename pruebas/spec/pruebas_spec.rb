require 'spec_helper'

  RSpec.describe Nutricion do
    before :all do
      @queso = Nutricion.new('queso', 11.00,41.00,25.00,33.00,1.30)
      @vaca = Nutricion.new('vaca', 50.00,164.00,21.10,3.10,0.00)
      @cordero = Nutricion.new('cordero', 20.00,185.00,18.00,17.00,0.00)
      @camarones = Nutricion.new('camarones', 18.00,2.00,17.60,0.60,1.50)
      @chocolate = Nutricion.new('chocolate', 2.30,3.40,5.30,30.00,47.00)
      @salmon = Nutricion.new('salmon', 6.00,3.70,19.90,13.60,0.00)
      @cerdo = Nutricion.new('cerdo', 7.60,11.00,21.50,6.30,0.00)
      @pollo = Nutricion.new('pollo', 5.70,7.10,20.60,5.60,0.00)
      @cerveza = Nutricion.new('cerveza', 0.24,0.22,0.50,0.00,3.60)
      @leche = Nutricion.new('leche', 3.20,8.90,3.30,3.20,4.80)
      @huevos = Nutricion.new('huevos', 4.20,5.70,13.00,11.00,1.10)
      @cafe = Nutricion.new('cafe', 0.40,0.30,0.10,0.00,0.00)
      @tofu = Nutricion.new('tofu', 2.00,2.20,8.00,4.80,1.90)
      @lentejas = Nutricion.new('lentejas', 0.40,3.40,23.50,1.40,52.00)
      @nuez = Nutricion.new('nuez', 0.30,7.90,20.00,54.00,21.00)

    end

      it "Se lee el nombre del alimento" do
        expect(@queso.nombre). to eq('queso')
    end

      it "Se lee el valor de los Gases de Efecto Invernadero" do
        expect(@queso.gei). to eq(11.00)
    end

      it "Se lee el valor del Terreono" do
        expect(@queso.terreno). to eq(41.00)
    end

    	it "Funciona el Get_Nombre" do
        expect(@queso.get_nombre).to eq('queso')
    end

      it "Funciona el Get_Gases Efecto Invernadero" do
        expect(@queso.get_gei).to eq(11.00)
    end

      it "Funciona el Get_Terreno" do
        expect(@queso.get_terreno).to eq(41.00)
    end

      it "Funciona el Get_Valor Energetico" do
        expect(@queso.get_val).to eq(402.2)
    end

      it "Funciona la salida del Formato" do
        expect(@queso.to_s).to eq(['queso', 11.00, 41.00, 25.00, 33.00,1.30])
    end
#Practica 7, probando el modulo comparable

      it "Funciona el operador <" do
        expect(@cafe < @huevos).to eq(true)
      end

      it "Funciona el operador <=" do
        expect(@cafe < @huevos).to eq(true)
      end

      it "Funciona el operador >" do
        expect(@huevos > @cafe).to eq(true)
      end

      it "Funciona el operador >=" do
        expect(@huevos >= @cafe).to eq(true)
      end

      it "Funciona el operador ==" do
        expect(@huevos == @huevos).to eq(true)
      end

      it "Funciona el operador <=>" do
        expect(@huevos <=> @cafe).to eq(1)
        expect(@cafe <=> @huevos).to eq(-1)
        expect(@huevos <=> @huevos).to eq(0)
      end

      it "Funciona el operador between" do
        expect(@queso.get_val.between?(400,405)).to eq(true)
      end

  end

  RSpec.describe Listas do
    before :all do
      @lista = Listas.new()
      @node = Node.new(1,nil,nil)
      @dieta_espanola = Listas.new()
      @dieta_vasca = Listas.new()
      @dieta_vegetaria = Listas.new()
      @dieta_vegetaliana = Listas.new()
      @dieta_locura = Listas.new()

  end

    context "Metodos de la lista inicial de prueba " do
    it "Existe un nodo de la lista con su valor, su siguiente y su previo" do
      expect(@node).to have_attributes(:value => 1, :next => nil, :prev => nil)
    end

    it "Existen los elementos head y tail" do
      expect(@lista).to have_attributes(:head => nil, :tail => nil)
    end

    it "Se puede insertar por la cabeza" do
      @lista.insert_head(1)
      expect(@lista.head.value).to eq(1)
    end

    it "Se puede insertar un elemento por la cola" do
      @lista.insert_tail(2)
      expect(@lista.tail.value).to eq(2)
    end

    it "Se pueden insertar varios elementos en la lista" do
     @lista.insert_elements([1,2])
     expect(@lista.head.value).to eq(1)
     expect(@lista.head.next.value).to eq(2)
   end

   it "Se puede extraer el nodo de la cabeza" do
     expect(@lista.extract_head).to eq(1)
   end

   it "Se puede extraer el nodo de la cola" do
   expect(@lista.extract_tail).to eq(2)
   end
 end

 context "Pruebas relacionadas con las dietas" do
   it "Introduciendo los alimentos en las diferentes listas" do
     @dieta_espanola.insert_head(Nutricion.new('Chocolate', 2.30,3.40,5.30,30.00,47.00))
     @dieta_espanola.insert_head(Nutricion.new('nuez', 0.30,7.90,20.00,54.00,21.00))
     @dieta_vasca.insert_head(Nutricion.new('Chocolate', 2.30, 3.40, 47.00, 5.30, 30.00))
     @dieta_vasca.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
     @dieta_vasca.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
     @dieta_vegetaria.insert_head(Nutricion.new('Queso', 11.00, 41.00, 1.30, 25.00, 33.00))
     @dieta_vegetaria.insert_head(Nutricion.new('Chocolate', 2.30, 3.40, 47.00, 5.30, 30.00))
     @dieta_vegetaria.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
     @dieta_vegetaria.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
     @dieta_vegetaria.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
     @dieta_vegetaliana.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
     @dieta_vegetaliana.insert_head(Nutricion.new('Nuez', 0.30, 7.90, 21.00, 20.00, 54.00))
     @dieta_vegetaliana.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
     @dieta_vegetaliana.insert_head(Nutricion.new('Tofu', 2.00, 2.20, 1.90, 8.00, 4.80))
     @dieta_locura.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
     @dieta_locura.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
     @dieta_locura.insert_head(Nutricion.new('Vaca', 50.00, 164.00, 0.00, 21.10, 3.10))
     @dieta_locura.insert_head(Nutricion.new('Cordero', 20.00, 185.00, 1.50, 17.60, 0.60))

   end

   it "Emisiones diarias de GEI para cada dieta" do
     expect(@dieta_espanola.gei_diario).to eq(2.6)
     expect(@dieta_vasca.gei_diario).to eq(3.1)
     expect(@dieta_vegetaria.gei_diario).to eq(21.1)
     expect(@dieta_vegetaliana.gei_diario).to eq(3.1)
     expect(@dieta_locura.gei_diario).to eq(77.4)
  end

  it "Emisiones anuales de GEI para cada dieta" do
    expect(@dieta_espanola.gei_anual).to eq(949.0)
    expect(@dieta_vasca.gei_anual).to eq(1131.5)
    expect(@dieta_vegetaria.gei_anual).to eq(7701.5)
    expect(@dieta_vegetaliana.gei_anual).to eq(1131.5)
    expect(@dieta_locura.gei_anual).to eq(28251.0)
  end

  it "Estimacion metros cuadrados de uso" do
    expect(@dieta_espanola.terreno).to eq(11.3)
    expect(@dieta_vasca.terreno).to eq(7.1)
    expect(@dieta_vegetaria.terreno).to eq(62.4)
    expect(@dieta_vegetaliana.terreno).to eq(13.8)
    expect(@dieta_locura.terreno).to eq(363.6)
  end
end
  context "Pruebas modulo enumerable" do
    before :each do
      @lista_prueba = Listas.new()
      @alimento = Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20)
      @alimento2 = Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00)
      @lista_prueba.insert_head(@alimento)
      @lista_prueba.insert_head(@alimento2)
    end
  it "Pruebas metodos max,min del modulo enumerable" do
    expect(@lista_prueba.max.get_terreno()).to eq(5.70)
    expect(@lista_prueba.min.get_terreno()).to eq(8.90)
    expect(@lista_prueba.sort).to eq([@alimento,@alimento2])
    expect(@lista_prueba.select{|nutricion| nutricion.gei > 4}).to eq([@alimento2])
    expect(@lista_prueba.collect{|i| i.nombre}).to eq(["Huevos","Leche"])
  end
  end
end

RSpec.describe Plato do
  before :all do
    @alimentos = Listas.new()
    @gramos = Listas.new()
    @alimentos.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
    @alimentos.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
    @alimentos.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
    @alimentos.insert_head(Nutricion.new('Queso', 11.00, 41.00, 1.30, 25.00, 33.00))
    @gramos.insert_head(200)
    @gramos.insert_head(100)
    @gramos.insert_head(50)
    @gramos.insert_head(30)
      @plato1 = Plato.new("Desayuno",@alimentos,@gramos)
  end
  context "Metodos de la lista inicial de prueba " do
    it "Existe un nombre para el plato" do
      expect(@plato1.nombre).to eq("Desayuno")
    end
    it "Existe un conjunto de lista_alimentos" do
      expect(@plato1.lista_alimentos).not_to eq(nil)
    end
    it "Existe un conjunto de lista_gramos" do
      expect(@plato1.gramos).not_to eq(nil)
    end
    it "Existe un porcentaje de proteinas" do
      expect(@plato1.porcentaje_proteinas).to eq(11.1)
    end
    it "Existe un porcentaje de lipidos" do
      expect(@plato1.porcentaje_lipidos).to eq(27.2)
    end
    it "Existe un porcentaje de glucidos" do
      expect(@plato1.porcentaje_glucidos).to eq(27.3)
    end
    it "Existe un Valor Calorico Total" do
      expect(@plato1.get_vct).to eq(2384.2)
    end
    it "Existe un nombre para el plato" do
      expect(@plato1.to_s).to eq("Nombre del plato: Desayuno")
    end
end
end
RSpec.describe Plato_2 do
  before :all do
    @alimentos = Listas.new()
    @espanola = Listas.new()
    @vasca = Listas.new()
    @vegetaria = Listas.new()
    @vegetaliana = Listas.new()
    @locura = Listas.new()
    @gramos = Listas.new()
    @gramos_espanola = Listas.new()
    @gramos_vasca = Listas.new()
    @gramos_vegetaria = Listas.new()
    @gramos_vegetaliana = Listas.new()
    @gramos_locura = Listas.new()

    @alimentos.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
    @alimentos.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
    @alimentos.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
    @alimentos.insert_head(Nutricion.new('Queso', 11.00, 41.00, 1.30, 25.00, 33.00))
    @espanola.insert_head(Nutricion.new('Chocolate', 2.30,3.40,5.30,30.00,47.00))
    @espanola.insert_head(Nutricion.new('nuez', 0.30,7.90,20.00,54.00,21.00))
    @vasca.insert_head(Nutricion.new('Chocolate', 2.30, 3.40, 47.00, 5.30, 30.00))
    @vasca.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
    @vasca.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
    @vegetaria.insert_head(Nutricion.new('Queso', 11.00, 41.00, 1.30, 25.00, 33.00))
    @vegetaria.insert_head(Nutricion.new('Chocolate', 2.30, 3.40, 47.00, 5.30, 30.00))
    @vegetaria.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
    @vegetaria.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
    @vegetaria.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
    @vegetaliana.insert_head(Nutricion.new('Lentejas', 0.40, 3.40, 52.00, 23.50, 1.40))
    @vegetaliana.insert_head(Nutricion.new('Nuez', 0.30, 7.90, 21.00, 20.00, 54.00))
    @vegetaliana.insert_head(Nutricion.new('Cafe', 0.40, 0.30, 0.00, 0.10, 0.00))
    @vegetaliana.insert_head(Nutricion.new('Tofu', 2.00, 2.20, 1.90, 8.00, 4.80))
    @locura.insert_head(Nutricion.new('Leche', 3.20, 8.90, 4.80, 3.30, 3.20))
    @locura.insert_head(Nutricion.new('Huevos', 4.20, 5.70, 1.10, 13.00, 11.00))
    @locura.insert_head(Nutricion.new('Vaca', 50.00, 164.00, 0.00, 21.10, 3.10))
    @locura.insert_head(Nutricion.new('Cordero', 20.00, 185.00, 1.50, 17.60, 0.60))
    @gramos.insert_head(200)
    @gramos.insert_head(100)
    @gramos.insert_head(50)
    @gramos.insert_head(30)
    @gramos_espanola.insert_head(150)
    @gramos_espanola.insert_head(50)
    @gramos_vasca.insert_head(50)
    @gramos_vasca.insert_head(100)
    @gramos_vasca.insert_head(20)
    @gramos_vegetaria.insert_head(50)
    @gramos_vegetaria.insert_head(25)
    @gramos_vegetaria.insert_head(100)
    @gramos_vegetaria.insert_head(200)
    @gramos_vegetaria.insert_head(50)
    @gramos_vegetaliana.insert_head(100)
    @gramos_vegetaliana.insert_head(25)
    @gramos_vegetaliana.insert_head(25)
    @gramos_vegetaliana.insert_head(250)
    @gramos_locura.insert_head(200)
    @gramos_locura.insert_head(50)
    @gramos_locura.insert_head(200)
    @gramos_locura.insert_head(200)


    @plato1 = Plato_2.new("Desayuno",@alimentos,@gramos);
    @plato_espanol = Plato_2.new("Espanol",@espanola,@gramos_espanola);
    @plato_vasco = Plato_2.new("Vasco",@vasca,@gramos_vasca);
    @plato_vegetaria = Plato_2.new("Vegetaaria",@vegetaria,@gramos_vegetaria);
    @plato_vegetaliano = Plato_2.new("Vegetaliano",@vegetaliana,@gramos_vegetaliana);
    @plato_locura = Plato_2.new("Locura",@locura,@gramos_locura);


    @conjunto_platos = [@plato_espanol,@plato_vasco, @plato_vegetaliano];
    @conjunto_precios = [8.00, 9.00, 10.00];
  end
  context "Pruebas para la clase Plato_2, que contempla las emisiones y el terreno utiliazado" do
    it "Existen unas emisiones de gases de efecto invernadero" do
      expect(@plato1.geidiario).to eq(14.1)
    end
    it "Existen unas estimaciones de uso de terreno" do
      expect(@plato1.terreno).to eq(36.0)
    end
    it "Existen unas estimaciones de eficiencia energetica uso de terreno" do
      expect(@plato1.to_s).to eq("La eficiencia energetica del plato es: 2820.0")
    end
  end
  context "Pruebas para comprobar la informacion de un objeto" do
    it "prueba de is_a y kind_of de un Plato_2"do
      expect(@plato1.is_a?Plato_2).to eq(true)
      expect(@plato1.is_a?Plato).to eq(true)
      expect(@plato1.is_a?Object).to eq(true)
      expect(@plato1.is_a?BasicObject).to eq(true)

      expect(@plato1.kind_of?Plato_2).to eq(true)
      expect(@plato1.kind_of?Plato).to eq(true)
      expect(@plato1.kind_of?Object).to eq(true)
      expect(@plato1.kind_of?BasicObject).to eq(true)
    end
    it "prueba de instance_of de un Plato_2"do
      expect(@plato1.instance_of?Plato_2).to eq(true)
      expect(@plato1.instance_of?Plato).to eq(false)
      expect(@plato1.instance_of?Object).to eq(false)
      expect(@plato1.instance_of?BasicObject).to eq(false)
    end
  end

  context "Pruebas para el modulo comparable" do
    it "Funciona el operador <" do
      expect(@plato_vasco < @plato_espanol).to eq(true)
    end

    it "Funciona el operador <=" do
      expect(@plato_vasco < @plato_espanol).to eq(true)
    end

    it "Funciona el operador >" do
      expect(@plato_espanol> @plato_vasco).to eq(true)
    end

    it "Funciona el operador >=" do
      expect(@plato_espanol >= @plato_vasco).to eq(true)
    end

    it "Funciona el operador ==" do
      expect(@plato_locura == @plato_locura).to eq(true)
    end


    it "Funciona el operador <=>" do
      expect(@plato_vegetaria <=> @plato_vegetaliano).to eq(1)
      expect(@plato_vegetaliano <=> @plato_vegetaria).to eq(-1)
      expect(@plato_vegetaria <=> @plato_vegetaria).to eq(0)
    end

    it "Funciona el operador between" do
      expect(@plato_locura.eficiencia_energetica.between?(29000.0,30000.0)).to eq(true)
    end
    it "Pruebas metodos max,min del modulo enumerable" do
      expect(@plato_vegetaria.max.terreno()).to eq(3.40)
      expect(@plato_locura.min.terreno()).to eq(8.90)
      #expect(@plato_vasco.sort).to eq([])
      #expect(@plato_vegetaliano.select{|i| i.terreno > 4}).to eq([])
      #expect(@plato_espanol.collect{|i| i.nombre}).to eq([])
    end

    it "Prueba que calcula el elemento del array con la maxima huella" do
      expect(@conjunto_platos.max.huella_nutricional()).to eq(2)
    end

    it "Pruebas que calculan la huella teniendo en cuenta el precio" do
      expect(@conjunto_precios.collect{|i| i*@conjunto_platos.max.huella_nutricional()}). to eq([16.0, 18.0, 20.0])
    end
  end
end

RSpec.describe DSLPlato do
  before :all do
    vaca = Nutricion.new('Carne de vaca', 50.00,164.00,21.10,3.10,0.00)
    queso = Nutricion.new('Queso', 11.00,41.00,25.00,33.00,1.30)
    @plato_dsl = DSLPlato.new("Hamburguesa con Queso") do
      alimento :descripcion => vaca,
      :gramos => 300
      alimento :descripcion => queso,
      :gramos => 50
    end
  end
  it "Prueba para ver a que clase pertenece" do
    expect(@plato_dsl.is_a?DSLPlato).to eq(true)
  end

  it "Prueba para comprobar el formato" do
    expect(@plato_dsl.to_s).to eq("Hamburguesa con Queso\n=====================\n\nAlimentos: (Carne de vaca)(300 g), (Queso)(50 g)\n\n")
  end
end

RSpec.describe Menu do
  before :all do
    vaca = Nutricion.new('Carne de vaca', 50.00,164.00,21.10,3.10,0.00)
    queso = Nutricion.new('queso', 11.00,41.00,25.00,33.00,1.30)
    pollo = Nutricion.new('pollo', 5.70,7.10,20.60,5.60,0.00)
    cafe = Nutricion.new('cafe', 0.40,0.30,0.10,0.00,0.00)
    nuez = Nutricion.new('nuez', 0.30,7.90,20.00,54.00,21.00)
    chocolate = Nutricion.new('chocolate', 2.30,3.40,5.30,30.00,47.00)

    plato1 = DSLPlato.new("Hamburguesa con Queso") do
      alimento :descripcion => vaca,
      :gramos => 300
      alimento :descripcion => queso,
      :gramos => 50
    end
    plato2 = DSLPlato.new("Nuggets de pollo") do
      alimento :descripcion => pollo,
      :gramos => 200
    end
    plato3 = DSLPlato.new("Brownie de chocolate") do
      alimento :descripcion => chocolate,
      :gramos => 400
      alimento :descripcion => nuez,
      :gramos => 30
    end

    @menu = Menu.new("Menu del dia Hamburgueseria") do
      platos :nombre => plato1,
      :precio => 5
      platos :nombre => plato2,
      :precio => 3.5
      platos :nombre => plato3,
      :precio => 2
    end
  end

  it "Prueba para ver a que clase pertenece" do
    expect(@menu.is_a?Menu).to eq(true)
  end

  it "Prueba para comprobar el formato" do
    expect(@menu.to_s).to eq("Menu del dia Hamburgueseria\n===========================\nPlatos: (Hamburguesa con Queso)(5 €), (Nuggets de pollo)(3.5 €), (Brownie de chocolate)(2 €)\nPrecio total del menu: 10.5\n\nValor calorico total del menu: 35238.0\nValor de las emisiones de CO2 del menu: 176.2 \n")
  end

  it "Salida formateada" do
    puts @menu
  end
end
