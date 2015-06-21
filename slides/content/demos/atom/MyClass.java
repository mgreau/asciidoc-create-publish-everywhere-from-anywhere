import static org.asciidoctor.Asciidoctor.Factory.create;
import org.asciidoctor.Asciidoctor; //<1>

public class MyClass {

  public void convertToHTML() {

     Asciidoctor asciidoctor = create();
     String html = asciidoctor.convert(  
          "Writing AsciiDoc is _easy_!",
         new HashMap<String, Object>());
     System.out.println(html);
  }
}
