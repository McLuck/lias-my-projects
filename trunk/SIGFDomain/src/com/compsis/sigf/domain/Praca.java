package com.compsis.sigf.domain;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import br.com.compsis.sigf.util.IDUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class Praca extends DomainObject implements Replicable, IOrigem{

	private static final long serialVersionUID = 9220401698579800542L;
	private String nome;
    private int numeroPraca;
    private transient Concessionaria concessionaria;
    private ConfiguracaoPraca configuracao;
    private List<PracaMeioPagamento> pracaMeiosPgto;
    private List<Localizacao> localizacoes;
    private String cnpj, trafegoEstimado, distanciaCCA, descricao;

	public List<Localizacao> getLocalizacoes() {
		return localizacoes;
	}

	public void setLocalizacoes(List<Localizacao> localizacoes) {
		this.localizacoes = localizacoes;
	}
	
	public String toString(){
		Praca p = (Praca) replicate(null);
		p.setConcessionaria(null);
		Gson gson = new GsonBuilder().excludeFieldsWithModifiers(new int[]{Modifier.STATIC, Modifier.TRANSIENT, Modifier.VOLATILE}).create();
		return gson.toJson(p, Praca.class);
	}


	public Praca(){
        configuracao = new ConfiguracaoPraca(this);
    }
    
    public String getDescription(){
        StringBuilder sb = new StringBuilder();
        sb.append("<b>Codigo:</b> ");
        sb.append(getNumeroPraca());
        sb.append("; ");
        if(nome!=null){
            sb.append("<b>Nome:</b> ");
            sb.append(nome);
            sb.append("; ");
        }
        if(trafegoEstimado!=null){
            sb.append("<b>Trafego Estimado:</b> ");
            sb.append(trafegoEstimado);
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
        p.setNome(nome);
        /*p.setSentido1(sentido1);
        p.setSentido2(sentido2);
        p.setSiglaSentido1(siglaSentido1);
        p.setSiglaSentido2(siglaSentido2);*/
        
        p.setTrafegoEstimado(trafegoEstimado);
        
       /* List<Pista> listP = new ArrayList<Pista>();
        for(Pista pt : pistas){
            if(pt!=null){
                listP.add((Pista)pt.replicate(p));
            }
        }
        p.setPistas(listP);*/
        
        if(localizacoes!=null){
        	List<Localizacao> listaL = new ArrayList<Localizacao>();
        	for(Localizacao l : this.localizacoes){
        		listaL.add((Localizacao)l.replicate(p));
        	}
        	p.setLocalizacoes(listaL);
        }
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

	@Override
	public Long getIdOrigem() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this);
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoOrigem() {
		return Integer.valueOf(2);
	}

	@Override
	public Integer getPracaOrigem() {
		return Integer.valueOf(this.getNumeroPraca());
	}

	/**
	 * Praca vai com localizacao NULL 
	 */
	@Override
	public Integer getLocalizacaoOrigem() {
		return null;
	}

	/**
	 * Praca vai com Pista NULL
	 */
	@Override
	public Integer getPistaOrigem() {
		return null;
	}

	/**
	 * Praca vai com Sentido NULL
	 */
	@Override
	public Integer getSentidoOrigem() {
		return null;
	}

	/**
	 * Praca vai com Numero da Cabine NULL
	 */
	@Override
	public Integer getNumeroCabine() {
		return null;
	}

	@Override
	public Long getIdOrigemPai() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this.getConcessionaria());
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoPistaArrecadacao() {
		return null;
	}

	@Override
	public Integer getFlagOperacao() {
		return Integer.valueOf(1);
	}

	@Override
	public Integer getAtiva() {
		return Integer.valueOf(1);
	}
	
	private Dependencias dependencias;
	public Dependencias getDependencia(){
		if(dependencias==null){
			dependencias = new Dependencias();
		}
		return dependencias;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	public class Dependencias{
		public Dependencias(){
			montarDados();
		}
		private boolean inicializado = false;
		private List<Denominacao> denominacoes;
		private List<Pacote> pacotes;
		private List<Area> areas;
		private List<PacotesArea> pacotesDaArea;
		
		private Tabela get(Object obj, Field[] fields, Tabela t){
			t = (Tabela)t.replicate(null);
			for(Campo c : t.getCampos()){
				if(c.getNome().toLowerCase().trim().equals("datainsercao")){
					c.setValor("dbo.trunc_date(getDate())");
					continue;
				}
				for(Field f : fields){
					if(f.getName().toLowerCase().trim().equals(c.getNome().toLowerCase().trim())){
						f.setAccessible(true);
						try {
							c.setValor(f.get(obj));break;
						} catch (IllegalArgumentException e) {
							e.printStackTrace();
						} catch (IllegalAccessException e) {
							e.printStackTrace();
						}
					}
				}
			}
			return t;
		}
		
		public List<Tabela> getTabelasAreas(List<Area> areas, Tabela t){
			List<Tabela> lista = new ArrayList<Tabela>();
			Field[] fields = Area.class.getDeclaredFields();
			for(Area d : areas){
				lista.add(get(d,fields,t));
			}
			return lista;
		}
		
		public List<Tabela> getTabelasDenominacoes(List<Denominacao> denominacoes, Tabela t){
			List<Tabela> lista = new ArrayList<Tabela>();
			Field[] fields = Denominacao.class.getDeclaredFields();
			for(Denominacao d : denominacoes){
				lista.add(get(d,fields,t));
			}
			return lista;
		}
		
		public List<Tabela> getTabelasPacotes(List<Pacote> pacotes, Tabela t){
			List<Tabela> lista = new ArrayList<Tabela>();
			Field[] fields = Pacote.class.getDeclaredFields();
			for(Pacote d : pacotes){
				lista.add(get(d,fields,t));
			}
			return lista;
		}
		
		public List<Tabela> getTabelasPacotesDaArea(List<PacotesArea> pacotesAreas, Tabela t){
			List<Tabela> lista = new ArrayList<Tabela>();
			Field[] fields = PacotesArea.class.getDeclaredFields();
			for(PacotesArea d : pacotesAreas){
				lista.add(get(d,fields,t));
			}
			return lista;
		}
	
	
		/**
		 * @return the denominacoes
		 */
		public List<Denominacao> getDenominacoes() {
			return denominacoes;
		}


		/**
		 * @param denominacoes the denominacoes to set
		 */
		public void setDenominacoes(List<Denominacao> denominacoes) {
			this.denominacoes = denominacoes;
		}


		/**
		 * @return the pacotes
		 */
		public List<Pacote> getPacotes() {
			return pacotes;
		}


		/**
		 * @param pacotes the pacotes to set
		 */
		public void setPacotes(List<Pacote> pacotes) {
			this.pacotes = pacotes;
		}


		/**
		 * @return the areas
		 */
		public List<Area> getAreas() {
			return areas;
		}


		/**
		 * @param areas the areas to set
		 */
		public void setAreas(List<Area> areas) {
			this.areas = areas;
		}


		/**
		 * @return the pacotesDaArea
		 */
		public List<PacotesArea> getPacotesDaArea() {
			return pacotesDaArea;
		}


		/**
		 * @param pacotesDaArea the pacotesDaArea to set
		 */
		public void setPacotesDaArea(List<PacotesArea> pacotesDaArea) {
			this.pacotesDaArea = pacotesDaArea;
		}


		public void montarDados(){
			areas = new ArrayList<Praca.Area>();
			denominacoes = new ArrayList<Praca.Denominacao>();
			pacotes = new ArrayList<Praca.Pacote>();
			pacotesDaArea = new ArrayList<Praca.PacotesArea>();
			
			Area a = new Area();
			a.setAtivado(1);
			a.setDescricao("Cofre Forte");
			a.setGeramalotetransf(1);
			a.setIdarea(Area.getNextId(getConcessionaria().getId()));
			a.setIdorigem(getIdOrigem());
			a.setParticipacompactacao(1);
			a.setQuantidadecheque(0);
			a.setValorcheque(0);
			a.setValordinheiro(0);
			areas.add(a);

			a = new Area();
			a.setAtivado(1);//
			a.setDescricao("Armário Forte");
			a.setGeramalotetransf(1);
			a.setIdarea(Area.getNextId(getConcessionaria().getId()));//
			a.setIdorigem(getIdOrigem());//
			a.setParticipacompactacao(1);
			a.setQuantidadecheque(0);//
			a.setValorcheque(0);//
			a.setValordinheiro(0);//
			areas.add(a);
			
			a = new Area();
			a.setAtivado(1);//
			a.setDescricao("Fundo para Troca");
			a.setGeramalotetransf(1);
			a.setIdarea(Area.getNextId(getConcessionaria().getId()));//
			a.setIdorigem(getIdOrigem());//
			a.setParticipacompactacao(1);
			a.setQuantidadecheque(0);//
			a.setValorcheque(0);//
			a.setValordinheiro(0);//
			areas.add(a);
			
			a = new Area();
			a.setAtivado(1);//
			a.setDescricao("Fundo de Troco");
			a.setGeramalotetransf(0);
			a.setIdarea(Area.getNextId(getConcessionaria().getId()));//
			a.setIdorigem(getIdOrigem());//
			a.setParticipacompactacao(0);
			a.setQuantidadecheque(0);//
			a.setValorcheque(0);//
			a.setValordinheiro(0);//
			areas.add(a);
			
			a = new Area();
			a.setAtivado(1);//
			a.setDescricao("Arrecadação");
			a.setGeramalotetransf(1);
			a.setIdarea(Area.getNextId(getConcessionaria().getId()));//
			a.setIdorigem(getIdOrigem());//
			a.setParticipacompactacao(0);
			a.setQuantidadecheque(0);//
			a.setValorcheque(0);//
			a.setValordinheiro(0);//
			areas.add(a);
			
			Denominacao d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 0,01");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(0.01);
			denominacoes.add(d);
		
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 0,05");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(0.05);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 0,10");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(0.10);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 0,25");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(0.25);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 0,50");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(0.50);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 1,00 m");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(1.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 1,00 c");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(1.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 2,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(2.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 5,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(5.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 10,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(10.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 20,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(20.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 50,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(50.00);
			denominacoes.add(d);
			
			d = new Denominacao();
			d.setAtivado(1);
			d.setDescricao("R$ 100,00");
			d.setIddenominacao(Denominacao.getNextId(getConcessionaria().getId()));
			d.setIdorigem(getIdOrigem());
			d.setValor(100.00);
			denominacoes.add(d);
			
			
			for(Denominacao dn : denominacoes){
				Pacote p = new Pacote();
				p.setAtivado(1);
				p.setIdpacote(Pacote.getNextId(getConcessionaria().getId()));
				p.setDescricao(dn.getDescricao());
				p.setIddenominacao(dn.getIddenominacao());
				p.setIdorigem(getIdOrigem());
				p.setQuantidade(1);
				p.setValor(dn.getValor());
				pacotes.add(p);
			}
			
			for(Area ar : areas){
				for(Pacote pc : pacotes){
					PacotesArea pa = new PacotesArea();
					pa.setIdarea(ar.getIdarea());
					pa.setIdorigem(getIdOrigem());
					pa.setIdpacote(pc.getIdpacote());
					pa.setQuantidade(0);
					pacotesDaArea.add(pa);
				}
			}
			inicializado=true;
		}
	}
	
	
	public static class Denominacao{
		public final static String nomeTabela = "denominacao";
		private static final HashMap<Integer, Integer> idAreaPorConcessionaria = new HashMap<Integer, Integer>();
		public static Integer getNextId(Integer idConcessionaria){
			Integer next = Integer.valueOf(0);
			if(idAreaPorConcessionaria.containsKey(idConcessionaria)){
				next = idAreaPorConcessionaria.get(idConcessionaria);
				next++;
			}
			idAreaPorConcessionaria.put(idConcessionaria, next);
			return next;
		}
		private int iddenominacao,ativado;
		private double valor;
		/**
		 * @return the iddenominacao
		 */
		public int getIddenominacao() {
			return iddenominacao;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Denominacao [iddenominacao=" + iddenominacao + ", valor="
					+ valor + ", ativado=" + ativado + ", descricao="
					+ descricao + ", idorigem=" + idorigem + "]";
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + iddenominacao;
			result = prime * result
					+ ((idorigem == null) ? 0 : idorigem.hashCode());
			return result;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (!(obj instanceof Denominacao)) {
				return false;
			}
			Denominacao other = (Denominacao) obj;
			if (iddenominacao != other.iddenominacao) {
				return false;
			}
			if (idorigem == null) {
				if (other.idorigem != null) {
					return false;
				}
			} else if (!idorigem.equals(other.idorigem)) {
				return false;
			}
			return true;
		}
		/**
		 * @param iddenominacao the iddenominacao to set
		 */
		public void setIddenominacao(int iddenominacao) {
			this.iddenominacao = iddenominacao;
		}
		/**
		 * @return the valor
		 */
		public double getValor() {
			return valor;
		}
		/**
		 * @param valor the valor to set
		 */
		public void setValor(double valor) {
			this.valor = valor;
		}
		/**
		 * @return the ativado
		 */
		public int getAtivado() {
			return ativado;
		}
		/**
		 * @param ativado the ativado to set
		 */
		public void setAtivado(int ativado) {
			this.ativado = ativado;
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
		 * @return the idorigem
		 */
		public Long getIdorigem() {
			return idorigem;
		}
		/**
		 * @param idorigem the idorigem to set
		 */
		public void setIdorigem(Long idorigem) {
			this.idorigem = idorigem;
		}
		/**
		 * @return the nometabela
		 */
		public static String getNometabela() {
			return nomeTabela;
		}
		private String descricao;
		private Long idorigem;
    }
	
	public static class Area{
		private static final HashMap<Integer, Integer> idAreaPorConcessionaria = new HashMap<Integer, Integer>();
		public static Integer getNextId(Integer idConcessionaria){
			Integer next = Integer.valueOf(0);
			if(idAreaPorConcessionaria.containsKey(idConcessionaria)){
				next = idAreaPorConcessionaria.get(idConcessionaria);
				next++;
			}
			idAreaPorConcessionaria.put(idConcessionaria, next);
			return next;
		}
		private Tabela tabela;
		public void setTabela(Tabela t){
			this.tabela = t;
		}
		public Tabela getTabela(){
			return tabela;
		}
		public final static String nomeTabela = "area";
		private int idarea, quantidadecheque, valorcheque, participacompactacao,geramalotetransf,valordinheiro,ativado;
		private Long idorigem;
		private String descricao;
		/**
		 * @return the idarea
		 */
		public int getIdarea() {
			return idarea;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + idarea;
			result = prime * result
					+ ((idorigem == null) ? 0 : idorigem.hashCode());
			return result;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Area [idarea=" + idarea + ", quantidadecheque="
					+ quantidadecheque + ", valorcheque=" + valorcheque
					+ ", participacompactacao=" + participacompactacao
					+ ", geramalotetransf=" + geramalotetransf
					+ ", valordinheiro=" + valordinheiro + ", ativado="
					+ ativado + ", idorigem=" + idorigem + ", descricao="
					+ descricao + "]";
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (!(obj instanceof Area)) {
				return false;
			}
			Area other = (Area) obj;
			if (idarea != other.idarea) {
				return false;
			}
			if (idorigem == null) {
				if (other.idorigem != null) {
					return false;
				}
			} else if (!idorigem.equals(other.idorigem)) {
				return false;
			}
			return true;
		}
		/**
		 * @param idarea the idarea to set
		 */
		public void setIdarea(int idarea) {
			this.idarea = idarea;
		}
		/**
		 * @return the quantidadecheque
		 */
		public int getQuantidadecheque() {
			return quantidadecheque;
		}
		/**
		 * @param quantidadecheque the quantidadecheque to set
		 */
		public void setQuantidadecheque(int quantidadecheque) {
			this.quantidadecheque = quantidadecheque;
		}
		/**
		 * @return the valorcheque
		 */
		public int getValorcheque() {
			return valorcheque;
		}
		/**
		 * @param valorcheque the valorcheque to set
		 */
		public void setValorcheque(int valorcheque) {
			this.valorcheque = valorcheque;
		}
		/**
		 * @return the participacompactacao
		 */
		public int getParticipacompactacao() {
			return participacompactacao;
		}
		/**
		 * @param participacompactacao the participacompactacao to set
		 */
		public void setParticipacompactacao(int participacompactacao) {
			this.participacompactacao = participacompactacao;
		}
		/**
		 * @return the geramalotetransf
		 */
		public int getGeramalotetransf() {
			return geramalotetransf;
		}
		/**
		 * @param geramalotetransf the geramalotetransf to set
		 */
		public void setGeramalotetransf(int geramalotetransf) {
			this.geramalotetransf = geramalotetransf;
		}
		/**
		 * @return the valordinheiro
		 */
		public int getValordinheiro() {
			return valordinheiro;
		}
		/**
		 * @param valordinheiro the valordinheiro to set
		 */
		public void setValordinheiro(int valordinheiro) {
			this.valordinheiro = valordinheiro;
		}
		/**
		 * @return the ativado
		 */
		public int getAtivado() {
			return ativado;
		}
		/**
		 * @param ativado the ativado to set
		 */
		public void setAtivado(int ativado) {
			this.ativado = ativado;
		}
		/**
		 * @return the idorigem
		 */
		public Long getIdorigem() {
			return idorigem;
		}
		/**
		 * @param idorigem the idorigem to set
		 */
		public void setIdorigem(Long idorigem) {
			this.idorigem = idorigem;
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
		 * @return the nometabela
		 */
		public static String getNometabela() {
			return nomeTabela;
		}
	}
	
	public static class Pacote{
		private static final HashMap<Integer, Integer> idPacotePorConcessionaria = new HashMap<Integer, Integer>();
		public static Integer getNextId(Integer idConcessionaria){
			Integer next = Integer.valueOf(0);
			if(idPacotePorConcessionaria.containsKey(idConcessionaria)){
				next = idPacotePorConcessionaria.get(idConcessionaria);
				next++;
			}
			idPacotePorConcessionaria.put(idConcessionaria, next);
			return next;
		}
		private Tabela tabela;
		public void setTabela(Tabela t){
			this.tabela = t;
		}
		public Tabela getTabela(){
			return tabela;
		}
		public final static String nomeTabela = "pacote";
		private int idpacote,iddenominacao,quantidade,ativado;
		private double valor;
		/* (non-Javadoc)
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ativado;
			result = prime * result
					+ ((descricao == null) ? 0 : descricao.hashCode());
			result = prime * result + iddenominacao;
			result = prime * result
					+ ((idorigem == null) ? 0 : idorigem.hashCode());
			result = prime * result + idpacote;
			result = prime * result + quantidade;
			result = prime * result + (int)valor;
			return result;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (!(obj instanceof Pacote)) {
				return false;
			}
			Pacote other = (Pacote) obj;
			if (ativado != other.ativado) {
				return false;
			}
			if (descricao == null) {
				if (other.descricao != null) {
					return false;
				}
			} else if (!descricao.equals(other.descricao)) {
				return false;
			}
			if (iddenominacao != other.iddenominacao) {
				return false;
			}
			if (idorigem == null) {
				if (other.idorigem != null) {
					return false;
				}
			} else if (!idorigem.equals(other.idorigem)) {
				return false;
			}
			if (idpacote != other.idpacote) {
				return false;
			}
			if (quantidade != other.quantidade) {
				return false;
			}
			if (valor != other.valor) {
				return false;
			}
			return true;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Pacote [idpacote=" + idpacote + ", iddenominacao="
					+ iddenominacao + ", quantidade=" + quantidade + ", valor="
					+ valor + ", ativado=" + ativado + ", descricao="
					+ descricao + ", idorigem=" + idorigem + "]";
		}
		/**
		 * @return the idpacote
		 */
		public int getIdpacote() {
			return idpacote;
		}
		/**
		 * @param idpacote the idpacote to set
		 */
		public void setIdpacote(int idpacote) {
			this.idpacote = idpacote;
		}
		/**
		 * @return the iddenominacao
		 */
		public int getIddenominacao() {
			return iddenominacao;
		}
		/**
		 * @param iddenominacao the iddenominacao to set
		 */
		public void setIddenominacao(int iddenominacao) {
			this.iddenominacao = iddenominacao;
		}
		/**
		 * @return the quantidade
		 */
		public int getQuantidade() {
			return quantidade;
		}
		/**
		 * @param quantidade the quantidade to set
		 */
		public void setQuantidade(int quantidade) {
			this.quantidade = quantidade;
		}
		/**
		 * @return the valor
		 */
		public double getValor() {
			return valor;
		}
		/**
		 * @param valor the valor to set
		 */
		public void setValor(double valor) {
			this.valor = valor;
		}
		/**
		 * @return the ativado
		 */
		public int getAtivado() {
			return ativado;
		}
		/**
		 * @param ativado the ativado to set
		 */
		public void setAtivado(int ativado) {
			this.ativado = ativado;
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
		 * @return the idorigem
		 */
		public Long getIdorigem() {
			return idorigem;
		}
		/**
		 * @param idorigem the idorigem to set
		 */
		public void setIdorigem(Long idorigem) {
			this.idorigem = idorigem;
		}
		/**
		 * @return the nometabela
		 */
		public static String getNometabela() {
			return nomeTabela;
		}
		private String descricao;
		private Long idorigem;
	}
	
	public static class PacotesArea{
		private Tabela tabela;
		public void setTabela(Tabela t){
			this.tabela = t;
		}
		public Tabela getTabela(){
			return tabela;
		}
		private static final HashMap<Integer, Integer> idPacotesAreaPorConcessionaria = new HashMap<Integer, Integer>();
		public static Integer getNextId(Integer idConcessionaria){
			Integer next = Integer.valueOf(0);
			if(idPacotesAreaPorConcessionaria.containsKey(idConcessionaria)){
				next = idPacotesAreaPorConcessionaria.get(idConcessionaria);
				next++;
			}
			idPacotesAreaPorConcessionaria.put(idConcessionaria, next);
			return next;
		}
		public final static String nomeTabela = "pacotesdaarea";
		private int idarea, idpacote, quantidade;
		private Long idorigem;
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "PacotesArea [idarea=" + idarea + ", idpacote=" + idpacote
					+ ", quantidade=" + quantidade + ", idorigem=" + idorigem
					+ "]";
		}
		/**
		 * @return the idarea
		 */
		public int getIdarea() {
			return idarea;
		}
		/**
		 * @param idarea the idarea to set
		 */
		public void setIdarea(int idarea) {
			this.idarea = idarea;
		}
		/**
		 * @return the idpacote
		 */
		public int getIdpacote() {
			return idpacote;
		}
		/**
		 * @param idpacote the idpacote to set
		 */
		public void setIdpacote(int idpacote) {
			this.idpacote = idpacote;
		}
		/**
		 * @return the quantidade
		 */
		public int getQuantidade() {
			return quantidade;
		}
		/**
		 * @param quantidade the quantidade to set
		 */
		public void setQuantidade(int quantidade) {
			this.quantidade = quantidade;
		}
		/**
		 * @return the idorigem
		 */
		public Long getIdorigem() {
			return idorigem;
		}
		/**
		 * @param idorigem the idorigem to set
		 */
		public void setIdorigem(Long idorigem) {
			this.idorigem = idorigem;
		}
		/**
		 * @return the nometabela
		 */
		public static String getNometabela() {
			return nomeTabela;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + idarea;
			result = prime * result
					+ ((idorigem == null) ? 0 : idorigem.hashCode());
			result = prime * result + idpacote;
			return result;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (!(obj instanceof PacotesArea)) {
				return false;
			}
			PacotesArea other = (PacotesArea) obj;
			if (idarea != other.idarea) {
				return false;
			}
			if (idorigem == null) {
				if (other.idorigem != null) {
					return false;
				}
			} else if (!idorigem.equals(other.idorigem)) {
				return false;
			}
			if (idpacote != other.idpacote) {
				return false;
			}
			return true;
		}
	}
}
