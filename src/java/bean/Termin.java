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
public class Termin {
    private int idTermina;
    private String datum;
    private String vreme;
    private String tipProslave;
    private int cena;
    private int idIgraonice;

    public Termin(int idTermina, String datum, String vreme, String tipProslave, int cena, int idIgraonice) {
        this.idTermina = idTermina;
        this.datum = datum;
        this.vreme = vreme;
        this.tipProslave = tipProslave;
        this.cena = cena;
        this.idIgraonice = idIgraonice;
    }

    public String getTipProslave() {
        return tipProslave;
    }

    public void setTipProslave(String tipProslave) {
        this.tipProslave = tipProslave;
    }


    public int getIdTermina() {
        return idTermina;
    }

    public void setIdTermina(int idTermina) {
        this.idTermina = idTermina;
    }

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }

    public String getVreme() {
        return vreme;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }

    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public int getIdIgraonice() {
        return idIgraonice;
    }

    public void setIdIgraonice(int idIgraonice) {
        this.idIgraonice = idIgraonice;
    }
    
    
}
