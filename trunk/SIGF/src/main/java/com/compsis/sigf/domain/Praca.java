package com.compsis.sigf.domain;
import java.util.ArrayList;
import java.util.List;
/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class Praca extends DomainObject implements Replicable{
    private String nome;
    private int numeroPraca;
    private Concessionaria concessionaria;
    private ConfiguracaoPraca configuracao;
    private List<Pista> pistas;
    private List<PracaMeioPagamento> pracaMeiosPgto;
    private String cnpj, trafegoEstimado, distanciaCCA, localizacoes, descricao, sentido1, siglaSentido1, sentido2, siglaSentido2, prcSent1, prcSent2;
    
    public String getPrcSent1() {
		return prcSent1;
	}

	public void setPrcSent1(String prcSent1) {
		this.prcSent1 = prcSent1;
	}

	public String getPrcSent2() {
		return prcSent2;
	}

	public void setPrcSent2(String prcSent2) {
		this.prcSent2 = prcSent2;
	}

	public Praca(){
        configuracao = new ConfiguracaoPraca(this);
    }
    
    public String getDescription(){
        StringBuilder sb = new StringBuilder();
        sb.append("ID: ");
        sb.append(getId());
        sb.append("; ");
        if(nome!=null){
            sb.append("Nome: ");
            sb.append(nome);
            sb.append("; ");
        }
        if(trafegoEstimado!=null){
            sb.append("Trafego Estimado: ");
            sb.append(trafegoEstimado);
            sb.append("; ");
        }
        if(distanciaCCA!=null){
            sb.append("Distancia do CCA: ");
            sb.append(distanciaCCA);
            sb.append("; ");
        }
        if(descricao!=null){
            sb.append("Descricao: ");
            sb.append(descricao);
            sb.append("; ");
        }
        
        return sb.toString();
    }
    
    @Override
    public int hashCode(){
        if(cnpj!=null && nome!= null && descricao != null){
            return getId()+((cnpj.hashCode() * nome.hashCode())/descricao.hashCode());
        }else{
            return getId() + super.hashCode();
        }
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Praca other = (Praca) obj;
        if (this.getId() != other.getId()) {
            return false;
        }
        if ((this.nome == null) ? (other.nome != null) : !this.nome.equals(other.nome)) {
            return false;
        }
        if ((this.cnpj == null) ? (other.cnpj != null) : !this.cnpj.equals(other.cnpj)) {
            return false;
        }
        if ((this.trafegoEstimado == null) ? (other.trafegoEstimado != null) : !this.trafegoEstimado.equals(other.trafegoEstimado)) {
            return false;
        }
        if ((this.distanciaCCA == null) ? (other.distanciaCCA != null) : !this.distanciaCCA.equals(other.distanciaCCA)) {
            return false;
        }
        if ((this.descricao == null) ? (other.descricao != null) : !this.descricao.equals(other.descricao)) {
            return false;
        }
        if ((this.sentido1 == null) ? (other.sentido1 != null) : !this.sentido1.equals(other.sentido1)) {
            return false;
        }
        if ((this.siglaSentido1 == null) ? (other.siglaSentido1 != null) : !this.siglaSentido1.equals(other.siglaSentido1)) {
            return false;
        }
        if ((this.sentido2 == null) ? (other.sentido2 != null) : !this.sentido2.equals(other.sentido2)) {
            return false;
        }
        if ((this.siglaSentido2 == null) ? (other.siglaSentido2 != null) : !this.siglaSentido2.equals(other.siglaSentido2)) {
            return false;
        }
        return true;
    }
   
    /**
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    /**
     * @return the trafegoEstimado
     */
    public String getTrafegoEstimado() {
        return trafegoEstimado;
    }

    /**
     * @param trafegoEstimado the trafegoEstimado to set
     */
    public void setTrafegoEstimado(String trafegoEstimado) {
        this.trafegoEstimado = trafegoEstimado;
    }

    /**
     * @return the distanciaCCA
     */
    public String getDistanciaCCA() {
        return distanciaCCA;
    }

    /**
     * @param distanciaCCA the distanciaCCA to set
     */
    public void setDistanciaCCA(String distanciaCCA) {
        this.distanciaCCA = distanciaCCA;
    }

    /**
     * @return the localizacoes
     */
    public String getLocalizacoes() {
        return localizacoes;
    }

    /**
     * @param localizacoes the localizacoes to set
     */
    public void setLocalizacoes(String localizacoes) {
        this.localizacoes = localizacoes;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the sentido1
     */
    public String getSentido1() {
        return sentido1;
    }

    /**
     * @param sentido1 the sentido1 to set
     */
    public void setSentido1(String sentido1) {
        this.sentido1 = sentido1;
    }

    /**
     * @return the siglaSentido1
     */
    public String getSiglaSentido1() {
        return siglaSentido1;
    }

    /**
     * @param siglaSentido1 the siglaSentido1 to set
     */
    public void setSiglaSentido1(String siglaSentido1) {
        this.siglaSentido1 = siglaSentido1;
    }

    /**
     * @return the sentido2
     */
    public String getSentido2() {
        return sentido2;
    }

    /**
     * @param sentido2 the sentido2 to set
     */
    public void setSentido2(String sentido2) {
        this.sentido2 = sentido2;
    }

    /**
     * @return the siglaSentido2
     */
    public String getSiglaSentido2() {
        return siglaSentido2;
    }
    
    public String getSigla3(){
        return siglaSentido1+"/"+siglaSentido2;
    }

    /**
     * @param siglaSentido2 the siglaSentido2 to set
     */
    public void setSiglaSentido2(String siglaSentido2) {
        this.siglaSentido2 = siglaSentido2;
    }


    /**
     * @return the pistas
     */
    public List<Pista> getPistas() {
        return pistas;
    }

    /**
     * @param pistas the pistas to set
     */
    public void setPistas(List<Pista> pistas) {
        this.pistas = pistas;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the configuracao
     */
    public ConfiguracaoPraca getConfiguracao() {
        return configuracao;
    }

    /**
     * @param configuracao the configuracao to set
     */
    public void setConfiguracao(ConfiguracaoPraca configuracao) {
        this.configuracao = configuracao;
    }

    /**
     * @return the concessionaria
     */
    public Concessionaria getConcessionaria() {
        return concessionaria;
    }

    /**
     * @param concessionaria the concessionaria to set
     */
    public void setConcessionaria(Concessionaria concessionaria) {
        this.concessionaria = concessionaria;
    }

    @Override
    public Replicable replicate(Object o) {
        Praca p = new Praca();
        p.setId(null);p.setCnpj("0000000000");
        p.setConcessionaria((Concessionaria)o);
        p.setConfiguracao((ConfiguracaoPraca)configuracao.replicate(p));
        p.setDescricao(descricao);
        p.setDistanciaCCA(distanciaCCA);
        p.setLocalizacoes(localizacoes);
        p.setNome(nome);
        p.setSentido1(sentido1);
        p.setSentido2(sentido2);
        p.setSiglaSentido1(siglaSentido1);
        p.setSiglaSentido2(siglaSentido2);
        p.setTrafegoEstimado(trafegoEstimado);
        
        List<Pista> listP = new ArrayList<Pista>();
        for(Pista pt : pistas){
            if(pt!=null){
                listP.add((Pista)pt.replicate(p));
            }
        }
        p.setPistas(listP);
        return p;
    }

    /**
     * @return the numeroPraca
     */
    public int getNumeroPraca() {
        return numeroPraca;
    }

    /**
     * @param numeroPraca the numeroPraca to set
     */
    public void setNumeroPraca(int numeroPraca) {
        this.numeroPraca = numeroPraca;
    }

    /**
     * @return the pracaMeiosPgto
     */
    public List<PracaMeioPagamento> getPracaMeiosPgto() {
        return pracaMeiosPgto;
    }

    /**
     * @param pracaMeiosPgto the pracaMeiosPgto to set
     */
    public void setPracaMeiosPgto(List<PracaMeioPagamento> pracaMeiosPgto) {
        this.pracaMeiosPgto = pracaMeiosPgto;
    }
}
