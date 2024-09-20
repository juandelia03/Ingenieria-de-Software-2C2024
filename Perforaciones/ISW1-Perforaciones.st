!classDefinition: #TestDePerforación category: #'ISW1-Perforaciones'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:53'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:52'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:00'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-Perforaciones'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!CapaDeSuelo methodsFor: 'tipo' stamp: 'JD 9/12/2024 00:47:18'!
esArenoso
	^false! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'JD 9/12/2024 00:47:24'!
esConcreto
	^false! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'JD 9/12/2024 00:47:28'!
esTierra
	^false! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'JD 9/12/2024 11:21:08'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class)! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'JD 9/12/2024 00:47:37'!
hash

	"^tipo hash + resistencia hash"! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-Perforaciones'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'JD 9/12/2024 00:45:54'!
arenoso
	^SueloArenoso new
	"^self new initializeArenoso"! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'JD 9/12/2024 00:49:35'!
concretoConResistencia: resistencia 
	^SueloConcreto new initializeConcretoConResistencia: resistencia
	"^self new initializeConcretoConResistencia: resistencia "! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'JD 9/12/2024 01:04:00'!
tierra
	^SueloTierra  new
	"^self new initializeTierra"	! !


!classDefinition: #SueloArenoso category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #SueloArenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloArenoso methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:02:57'!
darGolpeDeTaladro: unTaladro
	unTaladro perforarArenoso.
! !

!SueloArenoso methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 00:44:36'!
esArenoso
	^true! !


!classDefinition: #SueloConcreto category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #SueloConcreto
	instanceVariableNames: 'resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 00:47:07'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:03:03'!
darGolpeDeTaladro:unTaladro
	unTaladro perforarConcreto.
! !

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 00:44:45'!
esConcreto
	^true! !

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 00:48:42'!
initializeConcretoConResistencia: resistenciaInicial 
	resistencia := resistenciaInicial.
! !

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:04:35'!
resistencia
	^resistencia.! !

!SueloConcreto methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:22:28'!
sinResistencia
	^resistencia = 0! !


!classDefinition: #SueloTierra category: #'ISW1-Perforaciones'!
CapaDeSuelo subclass: #SueloTierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloTierra methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:04:44'!
darGolpeDeTaladro: unTaladro
	unTaladro perforarTierra.
! !

!SueloTierra methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 00:44:53'!
esTierra 
	^true! !


!classDefinition: #Mecha category: #'ISW1-Perforaciones'!
Object subclass: #Mecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!classDefinition: #MechaDiamante category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaDiamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaDiamante methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:24:25'!
perforarArenoso: unTaladro
	unTaladro romperMecha . 			! !

!MechaDiamante methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:34:23'!
perforarConcreto:unTaladro
	unTaladro perforarCapaConResistencia

	! !

!MechaDiamante methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:02:39'!
perforarTierra:unTaladro
	unTaladro pasarAProximaCapa! !


!classDefinition: #MechaSoft category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaSoft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaSoft methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:24:49'!
perforarArenoso: unTaladro
	unTaladro pasarAProximaCapa! !

!MechaSoft methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:24:34'!
perforarConcreto: unTaladro
	unTaladro romperMecha. 
! !

!MechaSoft methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:04:58'!
perforarTierra: unTaladro
	unTaladro! !


!classDefinition: #MechaWidia category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaWidia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaWidia methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 12:05:12'!
perforarArenoso: unTaladro
	unTaladro pasarAProximaCapa! !

!MechaWidia methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:36:36'!
perforarConcreto:unTaladro
	unTaladro vecesQueGolpeoCapaActual = 3 ifTrue: [ unTaladro romperMecha].! !

!MechaWidia methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:35:58'!
perforarTierra: unTaladro
	unTaladro vecesQueGolpeoCapaActual = 2 ifTrue: [ ^unTaladro transformarCapaEnArenoso ].! !


!classDefinition: #SinMecha category: #'ISW1-Perforaciones'!
Mecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SinMecha methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:53:11'!
perforarArenoso: unTaladro
	unTaladro perforarSinMecha ! !

!SinMecha methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:53:20'!
perforarConcreto: unTaladro
	unTaladro perforarSinMecha ! !

!SinMecha methodsFor: 'as yet unclassified' stamp: 'JD 9/12/2024 11:53:26'!
perforarTierra: unTaladro
	unTaladro perforarSinMecha ! !


!classDefinition: #Perforadora category: #'ISW1-Perforaciones'!
Object subclass: #Perforadora
	instanceVariableNames: 'mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 12:05:42'!
darGolpeDeTaladro
	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	self capaDeSueloInmediata darGolpeDeTaladro: self.
	

	! !

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 12:00:14'!
perforarArenoso
	self mecha perforarArenoso: self! !

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 12:10:22'!
perforarCapaConResistencia
	self vecesQueGolpeoCapaActual even ifTrue: [ self capaDeSueloInmediata bajaUnDecimoDeResistencia]. 
	self capaDeSueloInmediata sinResistencia ifTrue: [ ^self transformarCapaEnArenoso]. ! !

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 12:02:21'!
perforarConcreto
	self mecha perforarConcreto: self! !

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 11:38:44'!
perforarSinMecha
	self error: 'No puede perforar'! !

!Perforadora methodsFor: 'perforar' stamp: 'JD 9/12/2024 12:03:56'!
perforarTierra
	self mecha perforarTierra: self! !


!Perforadora methodsFor: 'cambiar capa' stamp: 'JD 9/12/2024 12:07:57'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	"no se ni para que esta este if"
	capasDeSueloDebajo ifEmpty: [^self].! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'JD 9/12/2024 11:39:31'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst:  SueloArenoso new;
			yourself! !


!Perforadora methodsFor: 'initialization' stamp: 'JD 9/12/2024 11:45:19'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente
	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	mechaPuesta := SinMecha new.! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'JD 9/12/2024 00:17:32'!
capasDeSueloDebajo
	^capasDeSueloDebajo ! !

!Perforadora methodsFor: 'accessing' stamp: 'JD 9/12/2024 11:41:44'!
conMechaRota
	^mechaPuesta = #Rota! !

!Perforadora methodsFor: 'accessing' stamp: 'JD 9/12/2024 11:40:00'!
mecha
	^mechaPuesta ! !

!Perforadora methodsFor: 'accessing' stamp: 'JD 9/12/2024 11:41:00'!
sinMecha
	^mechaPuesta = #SinMecha! !

!Perforadora methodsFor: 'accessing' stamp: 'JD 9/12/2024 00:04:35'!
vecesQueGolpeoCapaActual
	^vecesQueGolpeoCapaActual! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'JD 9/12/2024 11:40:32'!
ponerMechaDiamante
	mechaPuesta := MechaDiamante new.
! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'JD 9/12/2024 11:40:35'!
ponerMechaSoft
	mechaPuesta := MechaSoft new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'JD 9/12/2024 11:40:37'!
ponerMechaWidia
	mechaPuesta := MechaWidia new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'JD 9/12/2024 11:24:09'!
romperMecha
	mechaPuesta := #Rota.
	self error: 'Se rompió'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-Perforaciones'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !
