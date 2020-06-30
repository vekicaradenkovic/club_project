# aspproject

### Tema projekta - mini CMS za kreiranje Fudbalskih Klubova

Projekat je uradjen na temu mini CMF-sa za dodavanje fudbalskih klubova i njihovih clanova. Samo korisnici cms-a mogu da dodaju nove klubove i njihove clanove. Clanovi kluba mogu da budu igraci, direktor, pomocni treneri i sl., to su tkz. TeamMembers. Na osnovu TeamRole znamo da li je uneti korisnik igrac, trener i sl. Ukoliko je uneti clan igrac, dobice position number, u suprotnom, bice null. Za svakog clana tima mora da se unese iz koje zemlje dolazi, da li je trenutno aktivni clan ili bivsi ( Active - bool ). 

### Funkcionalnost


Da bi se obavila bilo kakva komanda na sajtu, prvo je potrebno kroz bazu dodati korisnika koji ce biti super admin i koji ce imati privilegije za Citanje svih Use Case-ova i dodavanje Use Case-eva korisnicima. To su komande 32 i 33.

Nakon toga, imamo rutu za logovanje, koja ce nam vratiti token pomocu kojeg se loguje ( TokenController ). Na swagger je dodata autorizacija kako bi mogli da se autorizujemo i izvrsavamo komande. 
Autorizacija je definisana na nivou korisnika i superadmin jedino dodeljuje privilegije po korisniku, komandom EfAddUseCaseToUserCommand. 

Dohvatanje svih podataka za svaki end point moguce je pretrazivati na osnovu razlicith parametara.Ukoliko se ne prosledi ni jedan od parametara, dohvatice se samo trenutno aktivni korisnici ( koji nisu obrisani, DeletedAt == null ).



### Struktura projekta

Projekat je izdeljen u zasbne celine ( projekte ). 
Imamo sledece celine : - domenski sloj, u kome nam se nalaze entiteti,
                       - zatim sloj poslovne logike ( Application ), 
                       - sloj implementacije poslovne logike ( Implementation ),
                       - sloj za skladistenje podataka i 
                       - klijenski sloj ( API )
Svaki API je obradjen pravilima za validaciju.

### Diagram baze podataka
![alt text](https://github.com/vekicaradenkovic/club_project/blob/master/database-diagram.png?raw=true)
