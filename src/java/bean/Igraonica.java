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
public class Igraonica {
    private int idIgraonice;
    private String nazivIgraonice;
    private String adresaIgraonice;

    public Igraonica(int idIgraonice, String nazivIgraonice, String adresaIgraonice) {
        this.idIgraonice = idIgraonice;
        this.nazivIgraonice = nazivIgraonice;
        this.adresaIgraonice = adresaIgraonice;
    }
    
    public int getIdIgraonice() {
        return idIgraonice;
    }

    public String getNazivIgraonice() {
        return nazivIgraonice;
    }

    public String getAdresaIgraonice() {
        return adresaIgraonice;
    }

    public void setIdIgraonice(int idIgraonice) {
        this.idIgraonice = idIgraonice;
    }

    public void setNazivIgraonice(String nazivIgraonice) {
        this.nazivIgraonice = nazivIgraonice;
    }

    public void setAdresaIgraonice(String adresaIgraonice) {
        this.adresaIgraonice = adresaIgraonice;
    }
    
    
}
