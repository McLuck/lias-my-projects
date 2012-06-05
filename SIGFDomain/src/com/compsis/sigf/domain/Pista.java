
package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import br.com.compsis.sigf.util.IDUtils;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class Pista extends DomainObject implements Replicable, IOrigem{
    /*private Praca praca;*/
	private transient Localizacao localizacao;
    public Localizacao getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(Localizacao localizacao) {
		this.localizacao = localizacao;
	}

	private int idLocalizacao, tipo, numeroPista;
    private String nomeMaquina, ipMaquina, sentido, descricao;
    private List<Sentido> sentidos;
    
    public String getTipoStr(){
        return BASE.TIPOS.GET_TIPO_PISTA(tipo);
    }
    
    public String toString(){
    	Pista p = (Pista)replicate(null);
    	p.setLocalizacao(null);
		return new Gson().toJson(p, Pista.class);
	}
    
    @Override
    public int hashCode(){
        if(nomeMaquina!=null && sentido!=null){
            return (getId()+sentido.hashCode()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(ipMaquina!=null && sentido!=null){
            return (getId()+sentido.hashCode()+idLocalizacao+tipo)*ipMaquina.hashCode() / 256;
        }else if(nomeMaquina!= null && ipMaquina!=null){
            return (getId()+nomeMaquina.hashCode()+ipMaquina.hashCode()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(nomeMaquina!=null){
            return (getId()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(ipMaquina!=null){
            return (getId()+idLocalizacao+tipo)*ipMaquina.hashCode() / 256;
        }
        return (getId()+idLocalizacao+tipo);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pista other = (Pista) obj;
        if (this.getId() != other.getId()) {
            return false;
        }
        if (this.sentido != other.sentido) {
            return false;
        }
        if (this.idLocalizacao != other.idLocalizacao) {
            return false;
        }
        if (this.tipo != other.tipo) {
            return false;
        }
        if ((this.nomeMaquina == null) ? (other.nomeMaquina != null) : !this.nomeMaquina.equals(other.nomeMaquina)) {
            return false;
        }
        if ((this.ipMaquina == null) ? (other.ipMaquina != null) : !this.ipMaquina.equals(other.ipMaquina)) {
            return false;
        }
        return true;
    }
    
    private final Pista getThisInstanciaPista(){
    	return this;
    }
    
    /**
     * Retorna uma lista contendo IOrigem para <b>Pista Sentido</b>
     * @return
     */
    public List<IOrigem> getPistaSentidos(){
    	List<IOrigem> lista = new ArrayList<IOrigem>();
    	
    	for(final Sentido s : this.sentidos){
    		lista.add(new IOrigem() {
    			
    			public String toString(){
    				return new Gson().toJson(this);
    			}
				
				@Override
				public Integer getTipoPistaArrecadacao() {
					return Integer.valueOf(getThisInstanciaPista().getTipo());
				}
				
				@Override
				public Integer getTipoOrigem() {
					return Integer.valueOf(5);
				}
				
				@Override
				public Integer getSentidoOrigem() {
					return Integer.valueOf(s.getNumero());
				}
				
				@Override
				public Integer getPracaOrigem() {
					return Integer.valueOf(getThisInstanciaPista().getLocalizacao().getPraca().getNumeroPraca());
				}
				
				@Override
				public Integer getPistaOrigem() {
					return Integer.valueOf(getThisInstanciaPista().getNumeroPista());
				}
				
				@Override
				public Integer getNumeroCabine() {
					return Integer.valueOf(getThisInstanciaPista().getNumeroCabine());
				}
				
				@Override
				public Integer getLocalizacaoOrigem() {
					return Integer.valueOf(getThisInstanciaPista().getLocalizacao().getNumero());
				}
				
				@Override
				public Long getIdOrigemPai() {
					String idorigem = IDUtils.IdOrigem.getIdOrigem(getThisInstanciaPista());
					return idorigem!=null?Long.parseLong(idorigem):null;
				}
				
				@Override
				public Long getIdOrigem() {
					String idorigem = IDUtils.IdOrigem.getIdOrigem(getThisInstanciaPista(), s);
					return idorigem!=null?Long.parseLong(idorigem):null;
				}
				
				@Override
				public Integer getFlagOperacao() {
					return null;
				}
				
				@Override
				public String getDescricao() {
					String descricao = getThisInstanciaPista().getDescricao();
					descricao = descricao.concat(" ").concat(s.getSigla());
					return descricao;
				}
				
				@Override
				public Integer getAtiva() {
					return Integer.valueOf(1);
				}
			});
    	}
    	
    	return lista;
    }

    /**
     * @return the sentido
     */
    public String getSentido() {
        return sentido;
    }
    
    public int getNumeroSentido(){
    	return localizacao.getNumeroSentido(sentido);
    }

    /**
     * @param sentido the sentido to set
     */
    public void setSentido(String sentido) {
        this.sentido = sentido;
    }

    /**
     * @return the idLocalizacao
     */
    public int getIdLocalizacao() {
        return idLocalizacao;
    }

    /**
     * @param idLocalizacao the idLocalizacao to set
     */
    public void setIdLocalizacao(int idLocalizacao) {
        this.idLocalizacao = idLocalizacao;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the nomeMaquina
     */
    public String getNomeMaquina() {
        return nomeMaquina;
    }

    /**
     * @param nomeMaquina the nomeMaquina to set
     */
    public void setNomeMaquina(String nomeMaquina) {
        this.nomeMaquina = nomeMaquina;
    }

    /**
     * @return the ipMaquina
     */
    public String getIpMaquina() {
        return ipMaquina;
    }

    /**
     * @param ipMaquina the ipMaquina to set
     */
    public void setIpMaquina(String ipMaquina) {
        this.ipMaquina = ipMaquina;
    }

   /* *//**
     * @return the praca
     *//*
    public Praca getPraca() {
        return praca;
    }

    *//**
     * @param praca the praca to set
     *//*
    public void setPraca(Praca praca) {
        this.praca = praca;
    }*/

    @Override
    public Replicable replicate(Object o) {
        Pista p = new Pista();
        p.setId(null);
        p.setIdLocalizacao(idLocalizacao);
        p.setIpMaquina(ipMaquina);
        p.setNomeMaquina(nomeMaquina);
        /*p.setPraca((Praca)o);*/
        p.setLocalizacao((Localizacao)o);
        p.setSentido(sentido);
        
        p.setSentidos(new ArrayList<Sentido>());
        if(sentidos!=null){
        	for(Sentido s : sentidos){
            	p.getSentidos().add((Sentido)s.replicate(s.getLocalizacao()));
            }	
        }
        p.setTipo(tipo);
        return p;
    }

    /**
     * @return the numeroPista
     */
    public int getNumeroPista() {
        return numeroPista;
    }

    /**
     * @param numeroPista the numeroPista to set
     */
    public void setNumeroPista(int numeroPista) {
        this.numeroPista = numeroPista;
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

	@Override
	public Long getIdOrigem() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this);
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoOrigem() {
		return Integer.valueOf(4);
	}

	@Override
	public Integer getPracaOrigem() {
		return Integer.valueOf(this.getLocalizacao().getPraca().getNumeroPraca());
	}

	@Override
	public Integer getLocalizacaoOrigem() {
		return Integer.valueOf(this.getLocalizacao().getNumero());
	}

	@Override
	public Integer getPistaOrigem() {
		return Integer.valueOf(this.numeroPista);
	}

	@Override
	public Integer getSentidoOrigem() {
		return null;
	}

	@Override
	public Integer getNumeroCabine() {
		return Integer.valueOf(this.numeroPista);
	}

	@Override
	public Long getIdOrigemPai() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this.getLocalizacao());
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoPistaArrecadacao() {
		return Integer.valueOf(this.getTipo());
	}

	@Override
	public Integer getFlagOperacao() {
		return null;
	}

	@Override
	public Integer getAtiva() {
		return Integer.valueOf(1);
	}

	/**
	 * @return the sentidos
	 */
	public List<Sentido> getSentidos() {
		return sentidos;
	}

	/**
	 * @param sentidos the sentidos to set
	 */
	public void setSentidos(List<Sentido> sentidos) {
		this.sentidos = sentidos;
	}
}
