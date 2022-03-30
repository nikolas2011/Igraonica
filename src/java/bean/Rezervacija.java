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
public class Rezervacija {
    private int idRezervacije;
    private String datum;
    private String vreme;
    private String tipProslave;
    private int cena;
    private int idKorisnika;
    private int idTermina;

    public Rezervacija(int idRezervacije, String datum, String vreme, String tipProslave, int cena, int idKorisnika, int idTermina) {
        this.idRezervacije = idRezervacije;
        this.datum = datum;
        this.vreme = vreme;
        this.tipProslave = tipProslave;
        this.cena = cena;
        this.idKorisnika = idKorisnika;
        this.idTermina = idTermina;
    }

    public int getIdRezervacije() {
        return idRezervacije;
    }

    public String getDatum() {
        return datum;
    }

    public String getVreme() {
        return vreme;
    }

    public String getTipProslave() {
        return tipProslave;
    }

    public int getCena() {
        return cena;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public int getIdTermina() {
        return idTermina;
    }

    public void setIdRezervacije(int idRezervacije) {
        this.idRezervacije = idRezervacije;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }

    public void setTipProslave(String tipProslave) {
        this.tipProslave = tipProslave;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public void setIdTermina(int idTermina) {
        this.idTermina = idTermina;
    }
    
    
}
