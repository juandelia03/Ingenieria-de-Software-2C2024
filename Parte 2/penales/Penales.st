!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'jd 9/22/2024 23:45:29'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:34'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:52'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:47'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:41'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:36'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:34:29'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:42:08'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:06'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 18:39:22'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 9/24/2023 06:41:05'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #Penales!
Object subclass: #Arquero
	instanceVariableNames: 'fuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:19:48'!
fuerza
	^fuerza! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:19:40'!
fuerza: nuevaFuerza
	fuerza := nuevaFuerza! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:41:39'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs:unaFuerza
	^EligeDireccionAntes new initializeEligeDireccionAntesWithFuerza:unaFuerza.! !

!Arquero class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:41:21'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs:unaFuerza
	^Adelantado new initializeAdelantadoWithFuerza: unaFuerza.! !


!classDefinition: #Adelantado category: #Penales!
Arquero subclass: #Adelantado
	instanceVariableNames: 'puntaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Adelantado methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:19:06'!
initializeAdelantadoWithFuerza:unaFuerza
	puntaje := 0.
	fuerza := unaFuerza.! !

!Adelantado methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:55:23'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota ArqueroSeLanzaEnDirección:direccionArquero
	
	unaTandaDePenales delantero 
	tirar:unaTandaDePenales
	delanteroRemataConPlayeraEnDireccion:direccionPelota 
	AdelantadoSeLanzaEnDireccion:direccionArquero.! !


!Adelantado methodsFor: 'nil' stamp: 'jd 9/24/2024 13:04:07'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota ArqueroSeLanzaEnDirección:direccionArquero
	
	unaTandaDePenales delantero 
	tirar:unaTandaDePenales
	delanteroRemataConJabulaniEnDireccion:direccionPelota 
	AdelantadoSeLanzaEnDireccion:direccionArquero.

	
	! !


!classDefinition: #EligeDireccionAntes category: #Penales!
Arquero subclass: #EligeDireccionAntes
	instanceVariableNames: 'puntaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!EligeDireccionAntes methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:19:00'!
initializeEligeDireccionAntesWithFuerza:unaFuerza
	puntaje := 0.
	fuerza := unaFuerza.
! !

!EligeDireccionAntes methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:00:30'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota ArqueroSeLanzaEnDirección:direccionArquero
	
	unaTandaDePenales delantero 
	tirar:unaTandaDePenales 
	delanteroRemataConJabulaniEnDireccion:direccionPelota 
	EligeAntesSeLanzaEnDireccion:direccionArquero.

	
! !

!EligeDireccionAntes methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:02:34'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota ArqueroSeLanzaEnDirección:direccionArquero
	
	unaTandaDePenales arquero fuerza: (unaTandaDePenales arquero fuerza*2).
	unaTandaDePenales delantero tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota EligeAntesSeLanzaEnDireccion:direccionArquero

! !


!classDefinition: #Delantero category: #Penales!
Object subclass: #Delantero
	instanceVariableNames: 'fuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:15:45'!
fuerza
	^fuerza! !

!Delantero methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:37:37'!
fuerza:unaFuerza
	^fuerza:= unaFuerza.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:46:29'!
decideTirarAColocarSuFuerzaBaseEs: fuerza
	^DelanteroAColocar new initializeTirandoAColocarWithFuerza:fuerza.! !

!Delantero class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:46:36'!
decideTirarAMatarSuFuerzaBaseEs:unaFuerza
	^DelanteroAMatar new initializeTirandoAMatarWithFuerza: unaFuerza.! !


!classDefinition: #DelanteroAColocar category: #Penales!
Delantero subclass: #DelanteroAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!DelanteroAColocar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:46:13'!
initializeTirandoAColocarWithFuerza:unaFuerza
	puntaje := 0.
	fuerza:= unaFuerza*0.5.
	
	
	
	
	
! !

!DelanteroAColocar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:49:53'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota AdelantadoSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aColocarConJabulaniEnDireccion: direccionPelota ArqueroAdelantadoEnDireccion: direccionArquero.
! !

!DelanteroAColocar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:59:10'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota EligeAntesSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aColocarConJabulaniArqueroEligeAntes.
! !

!DelanteroAColocar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:53:33'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota AdelantadoSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aColocarConPlayeraArqueroAdelantadoEnDireccion: direccionPelota.
! !

!DelanteroAColocar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:01:48'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota EligeAntesSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aColocarConPlayeraArqueroEligeAntes.
! !


!classDefinition: #DelanteroAMatar category: #Penales!
Delantero subclass: #DelanteroAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!DelanteroAMatar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:46:09'!
initializeTirandoAMatarWithFuerza:unaFuerza
	puntaje := 0.
	fuerza:= unaFuerza.
	
	
	
	
	
! !

!DelanteroAMatar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:18:42'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota AdelantadoSeLanzaEnDireccion:direccionArquero
	^unaTandaDePenales  aMatarConJabulaniEnDireccion: direccionPelota ArqueroAdelantadoEnDireccion:direccionArquero.
	
	
	! !

!DelanteroAMatar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:58:39'!
tirar:unaTandaDePenales delanteroRemataConJabulaniEnDireccion:direccionPelota EligeAntesSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aMatarConJabulaniEnDireccion: direccionPelota ArqueroEligeAntesEnDireccion: direccionArquero.
! !

!DelanteroAMatar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:53:55'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota AdelantadoSeLanzaEnDireccion:direccionArquero

	^unaTandaDePenales aMatarConPlayeraArqueroAdelantadoEnDireccion: direccionPelota.
! !

!DelanteroAMatar methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:01:18'!
tirar:unaTandaDePenales delanteroRemataConPlayeraEnDireccion:direccionPelota EligeAntesSeLanzaEnDireccion:direccionArquero
	
	^unaTandaDePenales aMatarConPlayeraEnDireccion: direccionPelota arqueroEligeAntesEnDireccion: direccionArquero.
! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 20:51:10'!
initializeWithType:aBallType
	type:= aBallType.
	
	
	
! !

!Pelota methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:38:17'!
type
	^type ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:11:05'!
jabulaniSudafricanaRapida
	^Jabulani new! !

!Pelota class methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:11:12'!
playeraLentaCostaAzul
	^Playera new! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'nil' stamp: 'jd 9/24/2024 12:30:13'!
tirar: unaTandaDePenales delanteroRemataAlArcoConDireccion:direccionPelota arqueroSeLanzaEnDirección:direccionArquero

"tirar:unaTandaDePenales delanteroRemataConJabulaniAlArcoConDireccion:direccionPelota ArqueroSeLanzaEnDirección:direccionArquero"
unaTandaDePenales arquero 
				tirar:unaTandaDePenales 
				delanteroRemataConJabulaniEnDireccion:direccionPelota  
				ArqueroSeLanzaEnDirección: direccionArquero. 
				
				
				

! !


!classDefinition: #Playera category: #Penales!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Playera methodsFor: 'nil' stamp: 'jd 9/24/2024 12:32:43'!
tirar: unaTandaDePenales delanteroRemataAlArcoConDireccion:direccionPelota arqueroSeLanzaEnDirección:direccionArquero

unaTandaDePenales arquero 
	tirar:unaTandaDePenales 
	delanteroRemataConPlayeraEnDireccion:direccionPelota 
	ArqueroSeLanzaEnDirección:direccionArquero.

! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'arquero delantero puntajeArquero puntajeDelantero posicionArquero varDireccionRemate varFuerzaResultanteDeTiro varFuerzaResultanteDeAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
aColocarConJabulaniArqueroEligeAntes
	arquero fuerza: arquero fuerza *1.5.
	self delanteroRemataEnDireccion: varDireccionRemate yElArqueroSeTiraEnDireccion: posicionArquero.
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
aColocarConJabulaniEnDireccion: direccionPelota ArqueroAdelantadoEnDireccion: direccionArquero
	self arqueroIgnoraAltura: direccionArquero.
	self delanteroRemataEnDireccion: varDireccionRemate yElArqueroSeTiraEnDireccion: posicionArquero.
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:38:32'!
aColocarConPlayeraArqueroAdelantadoEnDireccion: direccionPelota
	delantero fuerza: delantero fuerza*1.8.
	self golDelDelantero.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
aColocarConPlayeraArqueroEligeAntes
	delantero fuerza: delantero fuerza *0.8.					
	self delanteroRemataEnDireccion: varDireccionRemate yElArqueroSeTiraEnDireccion: posicionArquero! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:22:03'!
aMatarConJabulaniEnDireccion: direccionPelota ArqueroAdelantadoEnDireccion: direccionArquero
	self golDelDelantero.
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
aMatarConJabulaniEnDireccion: direccionPelota ArqueroEligeAntesEnDireccion: direccionArquero
	delantero fuerza: (delantero fuerza *1.2).
	self siLaPelotaVaAlAnguloBajaAlMedio: direccionPelota.
	self arqueroIgnoraAltura: direccionArquero. 
	self delanteroRemataEnDireccion: varDireccionRemate yElArqueroSeTiraEnDireccion: posicionArquero.
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:40:20'!
aMatarConPlayeraArqueroAdelantadoEnDireccion: direccionPelota

	(self alAngulo: direccionPelota) ifTrue:[
		self pelotaBajaAMediaAltura: direccionPelota					.
	]
	ifFalse:[
		self pelotaSeElevaDosPosiciones: direccionPelota.
	].
	self atajaElArquero: varDireccionRemate! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
aMatarConPlayeraEnDireccion: direccionPelota arqueroEligeAntesEnDireccion: direccionArquero
	(self alAngulo: direccionPelota) ifTrue:[
		self pelotaBajaAMediaAltura: direccionPelota					.
	]
	ifFalse:[
		self pelotaSeElevaDosPosiciones: direccionPelota.
	].
	self arqueroIgnoraElLadoDeLaDireccion: direccionPelota conDireccionOriginal: direccionArquero.
	self delanteroRemataEnDireccion: varDireccionRemate yElArqueroSeTiraEnDireccion: posicionArquero! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:32:09'!
alAngulo:unaDireccion
	^(self vaAUnCostado: unaDireccion) and:[self noVaAMediaAltura: unaDireccion ].
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionPelota arqueroSeLanzaEnDirección: direccionArquero
	posicionArquero := direccionArquero.
	varDireccionRemate :=direccionPelota.
	"validar"
	(self fueraDelArco:direccionPelota) ifTrue:[^self error:'La pelota debe dirigirse a coordenadas válidas'].
	(self fueraDelArco: direccionArquero ) ifTrue:[^self error:	'El arquero debe lanzarse a coordenadas válidas'].	

	^pelota tirar:self  delanteroRemataAlArcoConDireccion:direccionPelota  arqueroSeLanzaEnDirección:direccionArquero 
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:04:17'!
arquero
	^arquero! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
arqueroIgnoraAltura: direccionArquero

	^ posicionArquero := direccionArquero x@varDireccionRemate y! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:42:55'!
arqueroIgnoraElLadoDeLaDireccion: direccionPelota conDireccionOriginal: direccionArquero

	^ posicionArquero  := (direccionPelota x)@(direccionArquero y)! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 11:16:31'!
atajaElArquero: direccionPelota

	puntajeArquero  := puntajeArquero +1.
	varDireccionRemate  := direccionPelota.
	varFuerzaResultanteDeTiro := delantero fuerza.
	varFuerzaResultanteDeAtajada := arquero fuerza! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 21:37:09'!
componenteFueraDelArco:unaComponente
	^unaComponente > 2 or:[unaComponente <0].! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:02:36'!
delantero
	^delantero! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 11:42:55'!
delanteroRemataEnDireccion: direccionPelota yElArqueroSeTiraEnDireccion: direccionArquero
	direccionPelota y >2 ifTrue:[^self atajaElArquero: direccionPelota ].
	^ (direccionPelota  ~= direccionArquero) ifTrue:[
		self golDelDelantero.
		]
	"caso mismo lado"
	ifFalse:[
		self eligenMismoLado: direccionPelota
		]! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 11:43:03'!
eligenMismoLado: direccionPelota

	^ delantero fuerza > arquero fuerza ifTrue:[
				self golDelDelantero.

			] ifFalse:[
				self atajaElArquero: direccionPelota.
			]! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 21:08:20'!
fueraDelArco:posicion
	^(self posicionInvalidaVerticalmente:posicion) | (self posicionInvalidaHorizontalmente:posicion)! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 11:42:29'!
golDelDelantero

	puntajeDelantero := puntajeDelantero +1.
	varFuerzaResultanteDeTiro := delantero fuerza.
	varFuerzaResultanteDeAtajada := arquero fuerza! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:30:43'!
noVaAMediaAltura: unaDireccion
	^unaDireccion y = 0 or:[unaDireccion y =2].
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:39:50'!
pelotaBajaAMediaAltura: direccionPelota

	^ varDireccionRemate := (direccionPelota x)@1! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:40:20'!
pelotaSeElevaDosPosiciones: direccionPelota

	^ varDireccionRemate :=(direccionPelota x)@(direccionPelota y+2)! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 21:13:27'!
posicionInvalidaHorizontalmente:unaPosicion
	^self componenteFueraDelArco: (unaPosicion x).
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 21:13:18'!
posicionInvalidaVerticalmente:unaPosicion
	^self componenteFueraDelArco: (unaPosicion y).
! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 21:28:14'!
puntajeDeArquero
	^puntajeArquero ! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:42:01'!
puntajeDeDelantero
	^puntajeDelantero ! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 14:39:50'!
siLaPelotaVaAlAnguloBajaAlMedio: direccionPelota

	^ (self alAngulo: direccionPelota) ifTrue:[
		self pelotaBajaAMediaAltura: direccionPelota					.
	]! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 13:30:07'!
vaAUnCostado:unaDireccion
	^unaDireccion x = 0 or: [unaDireccion x=2].! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/24/2024 12:08:00'!
varDireccionRemate:unaDireccion
	varDireccionRemate  := unaDireccion.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:12:27'!
varDireccionRemateResultante
	^varDireccionRemate.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:35:59'!
varFuerzaResultanteDeAtajada
	^varFuerzaResultanteDeAtajada.! !

!Penales methodsFor: 'as yet unclassified' stamp: 'jd 9/22/2024 23:22:05'!
varFuerzaResultanteDeTiro
	^varFuerzaResultanteDeTiro ! !


!Penales methodsFor: 'initialization' stamp: 'jd 9/24/2024 14:36:44'!
initializeConDelantero:unDelantero yArquero:unArquero.
	puntajeArquero :=0.
	puntajeDelantero := 0.
	delantero  := unDelantero.
	arquero := unArquero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'jd 9/22/2024 21:27:26'!
conDelantero: unDelantero yArquero: unArquero.
	^Penales new initializeConDelantero:unDelantero yArquero:unArquero.! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !
