import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import java.io.FileInputStream;
import java.io.InputStream;

public class Calc {
    public static void main(String[] args) throws Exception {
        String inputFile = null;
        if (args.length > 0) inputFile = args[0];
        InputStream is = System.in;
        if (inputFile != null) is = new FileInputStream(inputFile);
        
        // Leer entrada
        CharStream input = CharStreams.fromStream(is);
        ExpresionesLexer lexer = new ExpresionesLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ExpresionesParser parser = new ExpresionesParser(tokens);
        
        // Generar árbol de análisis
        ParseTree tree = parser.prog();

        // Evaluar
        EvalVisitor eval = new EvalVisitor();
        eval.visit(tree);
    }
}
