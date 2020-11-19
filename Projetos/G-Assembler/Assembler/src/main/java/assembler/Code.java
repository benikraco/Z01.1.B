/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

public class Code {

    public static String dest(String[] mnemnonic) {
        public static String dest(String[] mnemnonic) {
            String reg = "";
            if (mnemnonic.length == 2) {
                switch (mnemnonic[1]) {
                    case "%A":
                        return "0001";
                    case "%D":
                        return "0010";
                    case "(%A)":
                        return "0100";
                    default:
                        return "0000";
                }
            } else if (mnemnonic.length == 3) {
                reg = mnemnonic[1] + mnemnonic[2];
                switch (reg) {
                    case "%D%A":
                    case "%A%D":
                        return "0011";
                    case "(%A)%A":
                    case "%A(%A)":
                        return "0101";
                    case "(%A)%D":
                    case "%D(%A)":
                        return "0110";
                    default:
                        return "0000";
                }
            } else if (mnemnonic.length >= 3) {
                reg = mnemnonic[1] + mnemnonic[2] + mnemnonic[3];
                switch (reg) {
                    case "(%A)%A%D":
                    case "(%A)%D%A":
                    case "%A(%A)%D":
                    case "%D(%A)%A":
                    case "%A%D(%A)":
                    case "%D%A(%A)":
                        return "0111";
                    default:
                        return "0000";
                }
            }
        }
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

