/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Nikola
 */
public class Korisnik {
    private int idKorisnika;
    private String ime;
    private String prezime;
    private String email;
    private String telefon;
    private String lozinka;
    private String tipKorisnika;

    public Korisnik(int idKorisnika, String ime, String prezime, String email, String telefon, String lozinka, String tipKorisnika) {
        this.idKorisnika = idKorisnika;
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.telefon = telefon;
        this.lozinka = lozinka;
        this.tipKorisnika = tipKorisnika;
    }

    public Korisnik() {
    }

    
    public int getIdKorisnika() {
        return idKorisnika;
    }

    public String getIme() {
        return ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public String getEmail() {
        return email;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getLozinka() {
        return lozinka;
    }

    public String getTipKorisnika() {
        return tipKorisnika;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public void setTipKorisnika(String tipKorisnika) {
        this.tipKorisnika = tipKorisnika;
    }
    
}
