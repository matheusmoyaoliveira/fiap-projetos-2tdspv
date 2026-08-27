import org.example.Apdex;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ApdexTest {

    @Test
    void apdexBom(){
        // Arrange
        Apdex apdex = new Apdex();

        // Act
        double resultado = Apdex.calcular(900, 10, 1000);

        // Assert
        Assertions.assertEquals(0.905, resultado,0.000);
    }
}
