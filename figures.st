Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.
	! !

!Wielokat methodsFor: 'accessing'!

pole
    "podaje pole wielokąta"

    ^0!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! 
	
skaluj: liczba
    "skaluje boki wielokąta z podaną skalą"
    
    Transcript show: 'Przeskaluje boki figury: ', (nazwa asString), ' o liczbie ', (liczba asString); cr.
    wierzcholki doWithIndex: [ :wierzcholek :i |
        wierzcholki at: i put: (wierzcholek * liczba).
    ].
    self drukuj!
	
drukuj
    "wypisuje wierzchołki i pole wielokąta"
    
    Transcript show: 'Dana jest figura: ', (nazwa asString); cr.
    wierzcholki doWithIndex: [ :wierzcholek :i |
    Transcript show: (i asString), '. wierzcholek: ', (wierzcholek x asString), ', ', (wierzcholek y asString); cr.
    ].
    Transcript show: 'Pole:', (self pole asString); cr.
    Transcript cr; flush.
! !


Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.
	self drukuj! !


Wielokat subclass: #Szesciokat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Szesciokat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Szesciokat new) initialize: (((2*p)/(3*(3 sqrt))) sqrt)! !

!Szesciokat methodsFor: 'actions'!

pole
	"licz pole szesciokata"

	^3*(3 sqrt) / 2 * ((wierzcholki at: 2) x) squared! !

!Szesciokat methodsFor: 'initialize-release'!

initialize: bok
	"tworz szesciokat o podanym boku"
	super initialize: 6 name: 'Szesciokat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: (1.5 * bok)@((3 sqrt) * 0.5 * bok).
	wierzcholki at: 4 put: bok@((3 sqrt) * bok).
	wierzcholki at: 5 put: 0@((3 sqrt) * bok).
	wierzcholki at: 6 put: (-0.5 * bok)@((3 sqrt) * 0.5 * bok).
	self drukuj
    ! ! 
	
k := (Kwadrat new) initialize:2.
s := (Szesciokat new) initialize:2.

Transcript show: 'kwadrat pole 1';cr.
k1 := (Kwadrat new) initialize:1.

Transcript show: 'szesciokat pole 1';cr.
s1 := (Szesciokat new) initialize:(((2)/(3*(3 sqrt))) sqrt).

Transcript show: 'szesciokat 1 + kwadrat 1';cr.
s2 := s1 + k1.

Transcript show: 'kwadrat 1 + szesciokat 1';cr.
k2 := k1 + s1.

k skaluj:2.
s skaluj:3.
