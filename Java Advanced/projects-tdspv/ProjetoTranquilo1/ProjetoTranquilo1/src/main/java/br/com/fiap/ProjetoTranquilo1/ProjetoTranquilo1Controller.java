package br.com.fiap.ProjetoTranquilo1;

import org.springframework.web.bind.annotation.*;

@RestController
public class ProjetoTranquilo1Controller {

    @RequestMapping("/Tranquis")
    public String index() {
        return "<h1>******** TRANQUILO ********</h1>";
    }

    @RequestMapping("/cadastro/{nome}")
    public String dizernome(@PathVariable String nome) {
        return "Olá, meu nome é " + nome;
    }

    @RequestMapping("/info")
    public String apresentar(@RequestParam("nome") String nome, @RequestParam("idade") int idade) {
        return "<h1>Olá pessoal, meu nome é " + nome + " e eu tenho " + idade + " anos</h1>";
    }

    @PostMapping("/postar")
    public String postar() {
        return "Objeto postado com sucesso";
    }
}
