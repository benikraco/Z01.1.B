/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

public class Code {

    public static String dest(String[] mnemnonic) {
        /* TODO: implementar */
    	return "";
    }

    public static String comp(String[] mnemnonic) {
        /* TODO: implementar */
    	return "";
    }

    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]){
            case "jg"  : return "001";
            case "je"  : return "010";
            case "jge"  : return "011";
            case "jl"  : return "100";
            case "jne"  : return "101";
            case "jle"  : return "110";
            case "jmp"  : return "111";
            default    : return "000";
        }
    }

    public static String toBinary(String symbol) {
        String binValue = Integer.toBinaryString(Integer.parseInt(symbol));
        int length = binValue.length();
        StringBuilder zeroes = new StringBuilder();
        String zero = "0";
        int difference = 15 - length;
        while (difference >= 0){
            zeroes.append(zero);
            difference -= 1;
        }
        return zeroes+binValue;
    }

}

