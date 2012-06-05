package teste.json.main;


public class Teste1 {
	public static void main(String... ar) {
		/*Pessoa p = new Pessoa();
		p.setId(1);
		p.setFuncoes(new ArrayList<Funcao>());
		p.setNome("Lucas Israel");

		Funcao f = new Funcao();
		f.setId(1);
		f.setNome("Gerente");
		f.setPessoa(p);

		Funcao f2 = new Funcao();
		f2.setId(2);
		f2.setNome("Diretor");
		f2.setPessoa(p);

		Funcao f3 = new Funcao();
		f3.setId(3);
		f3.setNome("Gestor");
		f3.setPessoa(p);

		Funcao f4 = new Funcao();
		f4.setId(4);
		f4.setNome("Analista");
		f4.setPessoa(p);

		Funcao f5 = new Funcao();
		f5.setId(5);
		f5.setNome("Desenvolvedor");
		f5.setPessoa(p);

		Funcao f6 = new Funcao();
		f6.setId(6);
		f6.setNome("Estagiario");
		f6.setPessoa(p);

		
		 * p.getFuncoes().add(f); p.getFuncoes().add(f2);
		 * p.getFuncoes().add(f3); p.getFuncoes().add(f4);
		 * p.getFuncoes().add(f5); p.getFuncoes().add(f6);
		 

		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if ("nome".equals(name) || "id".equals(name)) {
					return false;
				}
				return true;
			}
		});

		JSONArray ja = JSONArray.fromObject(p.getFuncoes(), config);
		
//		ja.set(0, "aaData");

		// JSONObject json = JSONObject.fromObject(p.getFuncoes());
		String ii = ja.toString();
		System.out.println(ii);
//		ii = ii.replace("\"aaData\",", "\"aaData\":");
//		ii = ii.replace("[", "#[#");
//		ii = ii.replace("{", "[");
//		ii = ii.replace("#[#", "{");
//		ii = ii.replace("]", "#]#");
//		ii = ii.replace("}", "]");
//		ii = ii.replace("#]#", "}");
//		
//		System.out.println(ii);
//
//		List<Funcao> fcs = Fixjure.listOf(Funcao.class)
//				.from(JSONSource.newJsonString(ii)).create();
//		
//		for (Funcao fc : fcs) {
//			System.out.println("  -" + fc.getNome() + "(" + fc.getId() + ");");
//		}
*/	}
}
